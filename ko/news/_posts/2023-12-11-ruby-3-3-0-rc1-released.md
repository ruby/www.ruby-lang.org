---
layout: news_post
title: "Ruby 3.3.0-rc1 릴리스"
author: "naruse"
translator: "shia"
date: 2023-12-11 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.3.0-rc1" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다. Ruby 3.3은 Prism이라는 이름의 새 파서를 추가하고, 파서 생성기로 Lrama를 사용하며, RJIT으로 명명된 새로운 순수 Ruby JIT 컴파일러를 추가하고, 특히 YJIT에서 많은 성능 향상이 있습니다.

RC1 릴리스 이후로 ABI의 하위호환성을 깨트리는 변경은 가급적 피할 것입니다. 그래야 한다면, 릴리스 노트에서 해당 내용을 발표할 예정입니다.

## Prism

* [Prism 파서](https://github.com/ruby/prism)를 기본 gem에 추가했습니다.
    * Prism은 Ruby 언어를 위한 이식 가능하고, 에러 내성이 있으며 유지 보수 가능한 재귀 하향 파서입니다.
* Prism은 프로덕션 환경에서 사용할 준비가 되어있으며 활발하게 유지보수되고 있으므로 Ripper 대신 이용할 수 있습니다.
    * Prism 사용 방법에 대한 [광범위한 문서](https://ruby.github.io/prism/)가 있습니다.
    * Prism은 CRuby에서 내부적으로 사용하는 C 라이브러리이자 Ruby 코드를 구문 분석해야 하는 모든 도구에서 사용할 수 있는 Ruby gem입니다.
    * Prism API에서 주목할 만한 메서드는 다음과 같습니다.
        * `Prism.parse(source)`는 ParseResult의 일부로 AST를 반환합니다.
        * `Prism.dump(source)`는 문자열로 직렬화된 AST를 반환합니다.
        * `Prism.parse_comments(source)`는 주석을 반환합니다.
* 기여에 관심이 있다면 [Prism 저장소](https://github.com/ruby/prism)에서 직접 풀 리퀘스트나 이슈를 만들 수 있습니다.

## Bison을 Lrama로 대체

* Bison 대신 [Lrama LALR 파서 생성기](https://github.com/yui-knk/lrama)를 사용하도록 변경했습니다. [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * 관심이 있다면 [Ruby 파서의 미래 비전](https://rubykaigi.org/2023/presentations/spikeolaf.html)을 참고하세요.
  * 유지보수성을 위해 Lrama 내부 구문 분석기가 Racc에서 생성한 LR 구문 분석기로 대체되었습니다.
  * 매개변수화 규칙 `(?, *, +)`를 지원하며, Ruby의 parse.y에서 사용될 예정입니다.

## RJIT

* 순수 Ruby JIT 컴파일러 RJIT을 도입하고 MJIT을 대체했습니다.
  * RJIT은 Unix 플랫폼에서 x86-64 아키텍처만 지원합니다.
  * MJIT과 달리 런타임에 C 컴파일러가 필요하지 않습니다.
* RJIT은 실험 목적으로 존재합니다.
  * 프로덕션 환경에서는 YJIT을 계속 사용해야 합니다.
* Ruby용 JIT 개발에 관심이 있다면 [RubyKaigi 2023 3일 차에 있었던 k0kubun의 발표](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)를 확인하세요.

## YJIT

* 3.2 버전 대비 주요 성능 개선 사항
  * 스플랫과 나머지 인자 지원이 개선되었습니다.
  * 가상 머신의 스택 연산을 위해 레지스터가 할당됩니다.
  * 선택적 인수가 포함된 더 많은 호출이 컴파일됩니다.
  * 예외 처리기도 컴파일됩니다.
  * 클래스의 인스턴스 변수가 가지는 객체 형상의 조합이 매우 복잡한 경우에도
    컴파일되기 전의 바이트 코드로 전환되지 않습니다.
  * 지원되지 않는 호출 타입은 이제 컴파일되기 전의 바이트 코드로 전환되지 않습니다.
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===`은 특별히 최적화되었습니다.
  * 이제 optcarrot에서 인터프리터보다 3배 이상 빠릅니다!
* 3.2보다 메모리 사용량이 크게 개선되었습니다.
    * 컴파일된 코드의 메타데이터가 훨씬 적은 메모리를 사용합니다.
    * ARM64에서 더 작은 코드를 생성합니다.
* 3.2보다 컴파일 속도가 약간 개선되었습니다.
* 실행 시간에 YJIT을 활성화할 수 있는 `RubyVM::YJIT.enable`이 추가됩니다.
  * 실행 명령의 인수나 환경 변수의 변경 없이 YJIT을 실행할 수 있습니다.
  * 애플리케이션 부팅이 완료된 후에 YJIT를 활성화하는 데에도 사용할 수 있습니다.
    부팅 시 YJIT를 비활성화한 상태에서 다른 YJIT 옵션을 사용하려는 경우 `--yjit-disable`을 사용할 수 있습니다.
* 코드 GC는 이제 비활성화된 상태로 시작하며, `--yjit-exec-mem-size`를 새 코드 컴파일을 멈추는
  최대 상한으로 취급합니다.
  * unicorn과 포크를 사용하는 서버에서 더 나은 쓰기 시 복사 동작을 생성할 수 있습니다.
  * 코드 GC로 인한 급격한 성능 하락이 사라집니다.
  * 필요하다면 `--yjit-code-gc`로 코드 GC를 활성화할 수 있습니다.
* `--yjit-stats`로부터 생성된 `ratio_in_yjit` 통계는 릴리스 빌드에서도 이용 가능하며,
  대부분의 통계에 접근하는 데 특수한 통계나 개발 빌드는 더 이상 필요하지 않습니다.
* 종료 추적 옵션이 이제 샘플링을 지원합니다.
  * `--trace-exits-sample-rate=N`
* Linux perf로 프로파일링을 용이하게 할 수 있도록 `--yjit-perf`가 추가됩니다.
* 보다 철저한 테스트와 여러 버그 수정


### M:N 스레드 스케쥴러

* M:N 스레드 스케쥴러가 추가됩니다. [[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M개의 Ruby 스레드를 N개의 네이티브 스레드(OS 스레드)로 관리하므로 스레드의 생성, 관리 비용이 절감됩니다.
  * C 확장 호환성에 문제가 발생할 가능성이 있으므로, 주 Ractor에서의 기본 설정은 비활성입니다.
      * `RUBY_MN_THREADS=1` 환경 변수를 사용해 주 Ractor에서 M:N 스레드를 활성화할 수 있습니다.
      * M:N 스레드는 주 Ractor가 아닌 Ractor에서 활성화되어 있습니다.
  * `RUBY_MAX_CPU=n` 환경 변수는 `N`(네이티브 스레드의 최대 개수)의 최댓값을 지정합니다. 기본값은 8입니다.
      * 하나의 Ractor에서는 하나의 Ruby 스레드만 실행 가능하므로 실제로 사용되는 네이티브 스레드의 개수는 `RUBY_MAX_CPU`에서 지정한 숫자나 실행 중인 Ractor의 개수보다 작습니다. 그러므로 (대다수를 차지하는) 단일 Ractor 애플리케이션에서는 하나의 네이티브 스레드를 사용합니다.
      * 블로킹 동작을 처리하기 위해, `N`개 이상의 네이티브 스레드가 사용될 수 있습니다.

## 그 이외의 주목할 만한 새 기능



### 언어


## 성능 향상

* `defined?(@ivar)`가 객체 형상에 맞게 최적화됩니다.
* `Socket.getaddrinfo`와 같은 이름 해결을 (POSIX 스레드가 사용 가능한 환경에서) 중단할 수 있게 됩니다. [Feature #19965](https://bugs.ruby-lang.org/issues/19965)
  * 이를 위해, getaddrinfo나 getnameinfo를 호출할 때마다 POSIX 스레드를 생성합니다. 이 영향으로 이름 해결에 약간의 오버헤드가 발생합니다(실험에서는 약 2.5배). 대부분의 애플리케이션에서 이름 해결의 오버헤드가 문제가 될 것이라고는 생각하지 않습니다만, 만약 그러한 현상을 확인하거나, 이 변경으로 인한 의도치 않은 영향을 발견했다면 부디 알려주세요.
* 가비지 컬렉터의 몇몇 성능 향상
  * 오래된 객체가 참조하는 어린 객체는 이제 즉시 오래된 객체로 마킹되지 않습니다.
    이 동작은 메이저 GC의 빈도를 상당히 낮춰줍니다.
    [[Feature #19678]](https://bugs.ruby-lang.org/issues/19678)
  * 메이져 GC를 야기하는 보호받지 않은 객체의 숫자를 제어하는
    새로운 변수 `REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO`가 추가되었습니다.
    기본값은 `0.01` (1%)입니다. 이는 메이저 GC의 빈도를 상당히 낮춰줍니다.
    [[Feature #19571]](https://bugs.ruby-lang.org/issues/19571)
  * `Time`, `Enumerator`, `MatchData`, `Method`, `File::Stat`, `BigDecimal` 등의
    주요 타입에 부족했던 쓰기 보호가 구현되었습니다.
    이는 마이너 GC에 걸리는 시간과 메이저 GC 빈도를 상당히 줄여줍니다.
  * `Hash`, `Time`, `Thread::Backtrace`, `Thread::Backtrace::Location`,
    `File::Stat`, `Method` 등의 대부분의 주요 클래스는 이제 가변 폭 할당을 사용합니다.
    이는 해당 클래스의 할당 및 할당 해제 속도를 빠르게 만들며, 메모리 사용량과
    힙 파편화를 줄여줍니다.
  * 가비지 컬렉터에 약한 참조가 추가됩니다. [Feature #19783](https://bugs.ruby-lang.org/issues/19783)


## 그 이외의 3.2 이후로 주목할 만한 변경

### IRB

IRB에 여러 개선 사항이 추가됩니다. 다음과 같은 내용이 포함됩니다.

- 고급 `irb:rdbg` 통합 기능은 `pry-byebug`와 동등한 디버깅 경험을 제공합니다. ([문서](https://github.com/ruby/irb#debugging-with-irb)).
- `ls`와 `show_source`, `show_cmds`와 같은 명령어에서 페이징을 지원합니다.
- `ls`, `show_source` 명령에서 더 정확하고 유용한 정보를 제공합니다.
- 타입 분석을 사용하는 실험적인 자동 완성 기능을 제공합니다. ([문서](https://github.com/ruby/irb#type-based-completion)).
- Reline::Face 클래스의 도입으로 자동완성 다이얼로그의 글씨 색과 스타일이 변경 가능합니다. ([문서](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))

또한, IRB는 광범위한 리팩토링을 거쳤으며, 향후 개선이 용이하도록 많은 버그 수정이 이루어졌습니다.

## 호환성 문제

주의: 기능 버그 수정은 포함되어 있지 않습니다.

* 블록에서 매개변수 없이 `it`을 호출하는 기능은 삭제 예정입니다.
  Ruby 3.4부터 `it`은 첫 번째 블록 인수를 가리킵니다.
  [Feature #18980](https://bugs.ruby-lang.org/issues/18980)

### 삭제된 상수

폐기 예정이었던 상수가 삭제됩니다.



### 삭제된 메서드

폐기 예정이었던 메서드가 삭제됩니다.

### 삭제된 환경 변수

폐기 예정이었던 환경 변수가 삭제됩니다.

* 환경 변수 `RUBY_GC_HEAP_INIT_SLOTS`는 폐기 예정이었으며 아무 효과도 없습니다. 대신 환경 변수 `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS`를 사용해 주세요. [Feature #19785](https://bugs.ruby-lang.org/issues/19785)

## Stdlib 호환성 문제

### `ext/readline` 폐기

* 우리는 `ext/readline` API와 호환되는 순수 Ruby 구현인 `reline`을 가지고 있습니다. 앞으로는 `reline`에 의존할 것입니다. `ext/readline`을 사용해야 하는 경우, `gem install readline-ext`를 사용하여 rubygems.org를 통해 `ext/readline`을 설치할 수 있습니다.
* 이제 더 이상 `libreadline` 또는 `libedit`과 같은 라이브러리를 설치할 필요가 없습니다.

## C API 변경

### 갱신된 C API

다음 API가 갱신됩니다.



### 삭제된 C API

다음 폐기 예정인 API가 삭제됩니다.



## 표준 라이브러리 갱신

사용자가 미래의 Ruby 버전에서 내장될 예정의 gem을 직접 불러올 때 RubyGems와 Bundler가 경고 문구를 출력합니다.

다음 라이브러리가 대상입니다.
  * abbrev
  * base64
  * bigdecimal
  * csv
  * drb
  * getoptlong
  * mutex_m
  * nkf
  * observer
  * racc
  * resolv-replace
  * rinda
  * syslog

다음 기본 gem이 추가되었습니다.

* prism 0.15.1

다음 기본 gem이 갱신되었습니다.

* RubyGems 3.5.0.dev
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.0.dev
* cgi 0.4.0
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* etc 1.4.3.dev.1
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.6.1.dev
* irb 1.8.3
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.0
* open3 0.2.0
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.1.1
* rdoc 6.6.0
* reline 0.3.9
* rinda 0.2.0
* securerandom 0.3.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* tempfile 0.2.0
* time 0.3.0
* timeout 0.4.1
* tmpdir 0.2.0
* tsort 0.2.0
* un 0.3.0
* uri 0.13.0
* weakref 0.1.3
* win32ole 1.8.10
* yaml 0.3.0
* zlib 3.1.0

다음 기본 gem이 내장됩니다.

* racc 1.7.3

다음 내장 gem이 갱신됩니다.

* minitest 5.20.0
* rake 13.1.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-imap 0.4.4
* net-smtp 0.4.0
* rbs 3.2.2
* typeprof 0.21.8
* debug 1.8.0

기본 gem 또는 내장 gem에 대한 자세한 내용은 [Logger](https://github.com/ruby/logger/releases)와 같은
GitHub 릴리스 또는 변경 로그에서 확인하세요.

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})를
확인해 주세요.

이러한 변경사항에 따라, Ruby 3.2.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)가
이루어졌습니다!


## 다운로드

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby는

Ruby는 1993년에 Matz(마츠모토 유키히로) 씨가 처음 개발했고,
현재는 오픈 소스로서 개발되고 있습니다. 여러 플랫폼에서 동작하며,
특히 웹 개발에서 전 세계적으로 이용되고 있습니다.
