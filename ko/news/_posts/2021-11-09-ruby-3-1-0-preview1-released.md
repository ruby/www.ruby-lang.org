---
layout: news_post
title: "Ruby 3.1.0 Preview 1 릴리스"
author: "naruse"
translator: "yous"
date: 2021-11-09 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다.

## YJIT: 새로운 실험 인프로세스 JIT 컴파일러


Ruby 3.1은 Shopify에서 개발한 새로운 인프로세스 JIT 컴파일러인 YJIT를 포함합니다.

[Ruby 2.6이 2018년도에 MJIT를 발표](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/)한 뒤, 성능은 굉장히 향상되었으며 [작년에 드디어 Ruby3x3](https://www.ruby-lang.org/ko/news/2020/12/25/ruby-3-0-0-released/)을 달성했습니다. 하지만 Optcarrot이 인상적인 속도 향상을 보여줬음에도 JIT는 실제 세계의 비즈니스 애플리케이션들에 도움을 주지는 못했습니다.

최근에 Shopify는 자사 Rails 애플리케이션 속도를 높이기 위해 Ruby에 많은 기여를 했습니다. YJIT는 중요한 기여로, Rails 애플리케이션의 성능 향상을 목표로 합니다.

MJIT가 메서드 기반의 JIT 컴파일러고 외부 C 컴파일러를 이용하는 반면, YJIT는 기본 블록 버전 관리를 이용하며 JIT 컴파일러를 포함합니다. 게으른 기본 블록 버전 관리(Lazy Basic Block Versioning, LBBV)를 통해 우선 메서드의 시작 부분을 컴파일하고 인자와 변수의 타입이 동적으로 결정되면 점진적으로 나머지 부분을 컴파일합니다. 자세한 설명은 [YJIT: CRuby를 위한 기본 블록 버전 관리 JIT 컴파일러](https://dl.acm.org/doi/10.1145/3486606.3486781)를 참고하세요.

이 기술을 이용하여, YJIT는 대부분의 현실 세계 소프트웨어에 빠른 준비 시간과 성능 향상을 가져다주어 railsbench에서는 최대 22%, liquid-render에서는 최대 39%의 성능 향상이 이루어졌습니다.

<!-- 試す人向けのお知らせ -->

YJIT는 아직 실험적인 기능이기 때문에 기본적으로는 비활성화되어 있습니다. 만약 사용하고 싶다면 `--yjit` 명령어 옵션을 통해 활성화할 수 있습니다. 그리고 아직은 x86-64 플랫폼의 macOS 및 Linux로만 한정되어 있습니다.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: 새로운 디버거

새로운 디버거인 [debug.gem](https://github.com/ruby/debug)이 포함됩니다. debug.gem은 빠른 디버거 구현체로 원격 디버깅, REPL 색상, IDE(VSCode) 통합 등의 다양한 기능을 제공합니다. `lib/debug.rb` 표준 라이브러리를 대체합니다.

## error_highlight: 백트레이스에서의 세밀한 에러 위치

빌트인 gem인 error_highlight가 도입되었습니다. 백트레이스에 세밀한 에러 위치를 추가합니다.

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

이 gem은 기본적으로 활성화되어 있습니다. `--disable-error_highlight` 명령어 옵션을 통해 비활성화할 수 있습니다. 자세한 설명은 [error_highlight 저장소](https://github.com/ruby/error_highlight)를 참고하세요.

## Irb 개선

다음 프리뷰에서 설명될 예정입니다.

## 다른 주목할 만한 새로운 기능

### 언어

* 해시 리터럴과 키워드 인자의 값을 생략할 수 있습니다. [[Feature #14579]](https://bugs.ruby-lang.org/issues/14579)
  * `{x:, y:}`는 `{x: x, y: y}`의 편의 문법입니다.
  * `foo(x:, y:)`는 `foo(x: x, y: y)`의 편의 문법입니다.

* 패턴 매칭에서 핀 연산자(`^`)에 표현식을 사용할 수 있습니다. [[Feature #17411]](https://bugs.ruby-lang.org/issues/17411)

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```


### RBS

RBS는 Ruby 프로그램의 구조를 설명하기 위한 언어입니다. 자세한 설명은 [RBS 저장소](https://github.com/ruby/rbs)를 참고하세요.

Ruby 3.0.0 이후의 변경 사항:

* `rbs collection`이 gem들의 RBS를 관리하기 위해 도입되었습니다. ([문서](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* 빌트인 및 표준 라이브러리의 많은 시그니처가 추가되거나 갱신되었습니다.
* 다수의 버그 수정과 성능 향상도 포함합니다.

더 많은 정보는 [CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md)를 참고하세요.

### TypeProf

TypeProf는 Ruby를 위한 정적 타입 분석기입니다. 타입을 기술하지 않은 Ruby 코드로부터 RBS의 프로토타입을 생성합니다. 자세한 내용은 [문서](https://github.com/ruby/typeprof/blob/master/doc/doc.md)를 참고하세요.

Ruby 3.0.0 이후의 변경 사항:

* [실험적인 IDE 지원](https://github.com/ruby/typeprof/blob/master/doc/ide.md)이 구현되었습니다.
* 다수의 버그 수정과 성능 향상을 포함합니다.

## 성능 향상

* MJIT
  * Rails와 같은 작업량을 위하여 `--jit-max-cache`의 기본값이 100에서 10000으로 변경되었습니다.
    JIT 컴파일러는 더 이상 1000개의 명령어보다 긴 메서드의 컴파일을 건너뛰지 않습니다.
  * Rails의 Zeitwerk를 지원하기 위해, 클래스 이벤트의 TracePoint가 활성화되었을
    때 JIT된 코드를 더 이상 취소하지 않습니다.

## 그 외 3.0 이후 주목할 만한 변화

* 한 줄 패턴 매칭(예: `ary => [x, y, z]`)은 더 이상 실험적이지 않습니다.
* 다중 대입의 평가 순서가 살짝 변경되었습니다. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux`는 Ruby 3.0에서 `baz`, `qux`, `foo`, `bar` 순으로 평가되었습니다. Ruby 3.1에선 `foo`, `bar`, `baz`, `qux` 순으로 평가됩니다.
* 변수 너비 할당: 문자열 (실험적) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

### 표준 라이브러리 업데이트

* 다음 표준 라이브러리가 업데이트되었습니다.
  * RubyGems
  * Bundler
  * RDoc 6.4.0
  * ReLine
  * JSON 2.6.0
  * Psych 4.0.2
  * FileUtils 1.6.0
  * Fiddle
  * StringIO 3.0.1
  * IO::Console 0.5.9
  * IO::Wait 0.2.0
  * CSV
  * Etc 1.3.0
  * Date 3.2.0
  * Zlib 2.1.1
  * StringScanner
  * IpAddr
  * Logger 1.4.4
  * OStruct 0.5.0
  * Irb
  * Racc 1.6.0
  * Delegate 0.2.0
  * Benchmark 0.2.0
  * CGI 0.3.0
  * Readline(C-ext) 0.1.3
  * Timeout 0.2.0
  * YAML 0.2.0
  * URI 0.11.0
  * OpenSSL
  * DidYouMean
  * Weakref 0.1.1
  * Tempfile 0.1.2
  * TmpDir 0.1.2
  * English 0.7.1
  * Net::Protocol 0.1.2
  * Net::Http 0.2.0
  * BigDecimal
  * OptionParser 0.2.0
  * Set
  * Find 0.1.1
  * Rinda 0.1.1
  * Erb
  * NKF 0.1.1
  * Base64 0.1.1
  * OpenUri 0.2.0
  * SecureRandom 0.1.1
  * Resolv 0.2.1
  * Resolv::Replace 0.1.0
  * Time 0.2.0
  * PP 0.2.1
  * Prettyprint 0.1.1
  * Drb 2.1.0
  * Pathname 0.2.0
  * Digest 3.1.0.pre2
  * Un 0.2.0
* 다음 내장 gem이 업데이트되었습니다.
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* 다음 기본 gem은 이제 내장 gem입니다.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})를
확인해주세요.

이러한 변경 사항에 따라, Ruby 3.0.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)가
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
