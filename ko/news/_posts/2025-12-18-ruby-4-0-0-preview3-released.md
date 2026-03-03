---
layout: news_post
title: "Ruby 4.0.0 preview3 릴리스"
author: "naruse"
translator: "Yonghyun Kim"
date: 2025-12-18 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview3" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다.
Ruby 4.0은 Ruby::Box와 "ZJIT"를 도입하고, 많은 개선을 추가합니다.

## Ruby::Box

정의에 대한 분리를 제공하는 새로운 (실험적) 기능입니다.
"Ruby Box"에 대한 자세한 내용은 [doc/language/box.md](https://docs.ruby-lang.org/en/4.0/language/box_md.html)를 참조하세요.
[[Feature #21311]] [[Misc #21385]]

## 언어 변경

* `**nil`이 `nil.to_hash`를 호출하지 않는 것과 마찬가지로, `*nil`은 더 이상
  `nil.to_a`를 호출하지 않습니다. [[Feature #21047]]

* 줄 시작 부분에 있는 논리 이항 연산자(`||`, `&&`, `and`, `or`)는
  유연한 점(fluent dot)처럼 이전 줄을 이어갑니다.
  다음 두 코드는 동일합니다.

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    [[Feature #20925]]

## 코어 클래스 변경

주의: 주목할 만한 클래스 변경만을 포함합니다.

* Kernel

    * `Kernel#inspect`는 이제 `#instance_variables_to_inspect` 메서드의 존재 여부를 확인하여,
      `#inspect` 문자열에 표시되는 인스턴스 변수를 제어할 수 있습니다.

        ```ruby
        class DatabaseConfig
          def initialize(host, user, password)
            @host = host
            @user = user
            @password = password
          end

          private def instance_variables_to_inspect = [:@host, :@user]
        end

        conf = DatabaseConfig.new("localhost", "root", "hunter2")
        conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
        ```

        [[Feature #21219]]

    * 폐기 예정이었던, 선행 `|`를 사용한 `Kernel#open`의 프로세스 생성 기능이 제거되었습니다.
      [[Feature #19630]]

* Binding

    * `Binding#local_variables`는 더 이상 번호가 매겨진 매개변수를 포함하지 않습니다.
      또한, `Binding#local_variable_get`과 `Binding#local_variable_set`은 번호가 매겨진 매개변수를
      처리하지 않습니다. [[Bug #21049]]

* File

    * 커널과 파일 시스템에서 지원하는 경우, `File::Stat#birthtime`이 statx 시스템 콜을 통해
      Linux에서 사용 가능합니다.
      [[Feature #21205]]

* IO

    * `IO.select`는 타임아웃 인자로 `Float::INFINITY`를 허용합니다.
      [[Feature #20610]]

    * 폐기 예정이었던, 선행 `|`를 사용한 `IO` 클래스 메서드의 프로세스 생성 기능이 제거되었습니다.
      [[Feature #19630]]

* Math

    * `Math.log1p`와 `Math.expm1`이 추가되었습니다. [[Feature #21527]]

* Method

    * `Method#source_location`, `Proc#source_location`,
      `UnboundMethod#source_location`은 이제 5개의 요소를 가진 확장된 위치
      정보를 반환합니다. `[path, start_line, start_column,
      end_line, end_column]`. 이전의 2개 요소 형식 `[path, line]`은 결과에 `.take(2)`를
      호출하여 얻을 수 있습니다.
      [[Feature #6012]]

* Proc

    * `Proc#parameters`는 이제 선택적 익명 매개변수를 `[:opt, nil]` 대신
      `[:opt]`로 표시하여, 익명 매개변수가 필수인 경우와
      일관된 출력을 제공합니다. [[Bug #20974]]

* Ractor

    * Ractor 간 통신을 위한 새로운 동기화 메커니즘으로 `Ractor::Port` 클래스가 추가되었습니다.
      [[Feature #21262]]

        ```ruby
        port1 = Ractor::Port.new
        port2 = Ractor::Port.new
        Ractor.new port1, port2 do |port1, port2|
          port1 << 1
          port2 << 11
          port1 << 2
          port2 << 12
        end
        2.times{ p port1.receive } #=> 1, 2
        2.times{ p port2.receive } #=> 11, 12
        ```

        `Ractor::Port`는 다음 메서드를 제공합니다.

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (또는 `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        그 결과, `Ractor.yield`와 `Ractor#take`가 제거되었습니다.

    * Ractor의 종료를 기다리기 위해
      `Ractor#join`과 `Ractor#value`가 추가되었습니다.
      이들은 `Thread#join` 및 `Thread#value`와 유사합니다.

    * `Ractor#join`을 내부적으로 구현하는 데 사용되는 저수준 인터페이스로
      `Ractor#monitor`와 `Ractor#unmonitor`가 추가되었습니다.

    * `Ractor.select`는 이제 Ractor와 Port만 받습니다. Ractor가 주어지면,
      Ractor가 종료될 때 반환됩니다.

    * `Ractor#default_port`가 추가되었습니다. 각 `Ractor`는 `Ractor.send`, `Ractor.receive`에서
      사용하는 기본 포트를 가집니다.

    * `Ractor#close_incoming`과 `Ractor#close_outgoing`이 제거되었습니다.

    * 공유 가능한 Proc 또는 lambda를 만들기 위해
      `Ractor.shareable_proc`과 `Ractor.shareable_lambda`가 도입되었습니다.
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set`과 `Enumerator#to_set`은 이제 끝이 없는 범위 문제를 방지하기 위해
      크기 검사를 수행합니다. [[Bug #21654]]

    * `Range#overlap?`은 이제 무한한(경계가 없는) 범위를 올바르게 처리합니다.
      [[Bug #21185]]

    * 시작이 없는 정수 범위에서 `Range#max` 동작이 수정되었습니다.
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Ruby 관련 상수를 포함하는 새로운 최상위 모듈 `Ruby`가 정의되었습니다.
      이 모듈은 Ruby 3.4에서 예약되었으며 이제 공식적으로 정의되었습니다.
      [[Feature #20884]]

* Ruby::Box

    * 정의에 대한 분리를 제공하는 새로운 (실험적) 기능입니다.
      "Ruby Box"에 대한 자세한 내용은 [doc/language/box.md](https://docs.ruby-lang.org/en/4.0/language/box_md.html)를 참조하세요.
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set`은 이제 코어 클래스이며, 더 이상 자동 로드되는 표준 라이브러리 클래스가 아닙니다.
      [[Feature #21216]]

    * `Set#inspect`은 이제 `Set[]` 구문을 사용하여 `eval`에 적합한 문자열을 반환합니다
      (예: `#<Set: {1, 2, 3}>` 대신 `Set[1, 2, 3]`).
      이는 Array, Hash와 같은
      다른 코어 컬렉션 클래스와 일관성을 유지합니다. [[Feature #21389]]

    * `Set#to_set`과 `Enumerable#to_set`에 인자를 전달하는 것은 폐기 예정 상태가 되었습니다.
      [[Feature #21390]]

* Socket

    * `Socket.tcp`와 `TCPSocket.new`는 초기 연결에 대한 타임아웃을 지정하기 위해
      `open_timeout` 키워드 인자를 허용합니다. [[Feature #21347]]

* String

    * 유니코드 17.0.0 및 이모지 버전 17.0으로 업데이트합니다.
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] (Regexp에도 적용됩니다)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip`, `rstrip!`이
       `*selectors` 인자를 허용하도록 확장되었습니다. [[Feature #21552]]

* Thread

    * `Kernel#raise`와 유사한 `Thread#raise(cause:)` 인자 지원이 도입되었습니다.
      [[Feature #21360]]

* Fiber

    * `Kernel#raise`와 유사한 `Fiber#raise(cause:)` 인자 지원이 도입되었습니다.
      [[Feature #21360]]

* Fiber::Scheduler

    * 주어진 예외로 fiber를 인터럽트하기 위한 `Fiber::Scheduler#fiber_interrupt`가 도입되었습니다.
      초기 사용 사례는 IO 작업이 닫힐 때 블로킹 IO 작업을 기다리는
      fiber를 인터럽트하는 것입니다.
      [[Feature #21166]]

* Pathname

    * Pathname이 기본 gem에서 Ruby의 코어 클래스로 승격되었습니다.
      [[Feature #17473]]

## 표준 라이브러리 변경

다음 번들 gem이 기본 gem에서 승격되었습니다.

* ostruct 0.6.3
* pstore 0.2.0
* benchmark 0.5.0
* logger 1.7.0
* rdoc 6.17.0
* win32ole 1.9.2
* irb 1.16.0
* reline 0.6.3
* readline 0.0.4
* fiddle 1.1.8

주목할 만한 기능 변경인 표준 라이브러리 변경만을 나열합니다.

다른 변경 사항은 아래 섹션에 나열되어 있습니다. Ruby 3.3.0 이후 번들된 버전의
릴리스 히스토리가 GitHub 릴리스에 있는 경우 함께
나열했습니다.

다음 기본 gem이 추가되었습니다.

* win32-registry 0.1.2

다음 기본 gem이 업데이트되었습니다.

* RubyGems 4.0.2
* bundler 4.0.2
* date 3.5.1
* digest 3.2.1
* english 0.8.1
* erb 6.0.1
* etc 1.4.6
* fcntl 1.3.0
* fileutils 1.8.0
* forwardable 1.4.0
* io-console 0.8.2
* io-nonblock 0.3.2
* io-wait 0.4.0
* ipaddr 1.2.8
* json 2.18.0
* net-http 0.9.1
* openssl 4.0.0
* optparse 0.8.1
* pp 0.6.3
* prism 1.6.0
* psych 5.3.1
* resolv 0.7.0
* stringio 3.2.0
* strscan 3.1.6
* time 0.4.2
* timeout 0.6.0
* uri 1.1.1
* weakref 0.1.4
* zlib 3.2.2

다음 번들 gem이 업데이트되었습니다.

* minitest 5.27.0
* power_assert 3.0.1
* rake 13.3.1
* test-unit 3.7.3
* rexml 3.4.4
* net-ftp 0.3.9
* net-imap 0.6.1
* net-smtp 0.5.1
* matrix 0.4.3
* prime 0.1.4
* rbs 3.10.0.pre.2
* typeprof 0.31.0
* debug 1.11.0
* base64 0.3.0
* bigdecimal 4.0.1
* drb 2.2.3
* syslog 0.3.0
* csv 3.3.5
* repl_type_completor 0.1.12

## 지원 플랫폼

* Windows

    * 14.0보다 오래된 MSVC 버전(_MSC_VER 1900) 지원이 중단되었습니다.
      이는 Visual Studio 2015 이상이 필요함을 의미합니다.

## 호환성 문제

* `Ractor::Port` 추가로 인해 다음 메서드가 Ractor에서 제거되었습니다.

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoging`

    [[Feature #21262]]

* `ObjectSpace._id2ref`가 폐기 예정 상태가 되었습니다. [[Feature #15408]]

* `Process::Status#&`와 `Process::Status#>>`가 제거되었습니다.
  Ruby 3.3에서 폐기 예정 상태가 되었습니다. [[Bug #19868]]

* `rb_path_check`가 제거되었습니다. 이 함수는 Ruby 2.7에서 제거된
  `$SAFE` 경로 검사에 사용되었으며,
  이미 폐기 예정이었습니다.
  [[Feature #20971]]

## 표준 라이브러리 호환성 문제

* CGI 라이브러리가 기본 gem에서 제거되었습니다. 이제 다음 메서드를 위한
  `cgi/escape`만 제공합니다.

    * `CGI.escape`와 `CGI.unescape`
    * `CGI.escapeHTML`과 `CGI.unescapeHTML`
    * `CGI.escapeURIComponent`와 `CGI.unescapeURIComponent`
    * `CGI.escapeElement`와 `CGI.unescapeElement`

    [[Feature #21258]]

* `Set`이 표준 라이브러리에서 코어 클래스로 이동함에 따라, `set/sorted_set.rb`가
  제거되었고, `SortedSet`은 더 이상 자동 로드되는 상수가 아닙니다. `SortedSet`을 사용하려면
  `sorted_set` gem을 설치하고 `require 'sorted_set'`을 통해 이용해주세요.
  [[Feature #21287]]

## C API 변경

* IO

    * `rb_thread_fd_close`는 폐기 예정 상태가 되었으며 이제 아무 작업도 하지 않습니다.
      C 확장에서 Ruby 코드로 파일 디스크립터를 노출해야 하는 경우,
      `RUBY_IO_MODE_EXTERNAL`을 사용하여 `IO` 인스턴스를 만들고 `rb_io_close(io)`를 사용하여
      닫으세요(이렇게 하면 `IO` 인스턴스의 모든 대기 중인 작업도 인터럽트하고 대기합니다).
      파일 디스크립터를 직접 닫으면 대기 중인 작업을 인터럽트하지 않으며,
      정의되지 않은 동작이 발생할 수 있습니다. 다시 말해, 두 개의 `IO` 객체가
      같은 파일 디스크립터를 공유하는 경우, 하나를 닫아도 다른 하나에는 영향을 미치지 않습니다.
      [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl`은 이제 GVL 유무에 관계없이 작동합니다.
      이를 통해 gem은 `ruby_thread_has_gvl_p` 확인을 피할 수 있습니다.
      그래도 GVL에 대해서는 여전히 주의해주세요. [[Feature #20750]]

* Set

    * `Set`에 대한 C API가 추가되었습니다. 다음 메서드가 지원됩니다.
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## 구현 개선

### Ractor

Ractor를 더 안정적이고, 성능이 좋고, 사용하기 쉽게 만들기 위해 많은 작업이 진행되었습니다. 이러한 개선으로 Ractor 구현이 실험적 상태를 벗어나는 데 더 가까워졌습니다.

* 성능 개선
    * 얼린 문자열과 심볼 테이블은 내부적으로 잠금 없는 해시 셋 사용
    * 메서드 캐시 조회는 대부분의 경우 잠금을 회피
    * 클래스 및 geniv 인스턴스 변수 접근이 더 빠르고 잠금을 회피
    * 객체 할당 중 캐시 경합을 회피
    * `object_id`는 대부분의 경우 잠금을 회피
* 버그 수정 및 안정성
    * Ractor와 Thread를 결합할 때 발생할 수 있는 데드락 수정
    * Ractor에서 require 및 autoload 관련 문제 수정
    * Ractor 간 인코딩/트랜스코딩 문제 수정
    * GC 작업 및 메서드 무효화의 경쟁 조건 수정
    * Ractor 시작 후 프로세스 fork 관련 문제 수정

## JIT

* ZJIT
    * [실험적 메서드 기반 JIT 컴파일러](https://docs.ruby-lang.org/en/master/jit/zjit_md.html)가 도입되었습니다.
      `--zjit` 지원을 활성화하려면 Rust 1.85.0 이상으로 Ruby를 빌드하세요.
    * Ruby 4.0.0 기준, ZJIT는 인터프리터보다 빠르지만 아직 YJIT만큼 빠르지는 않습니다.
      ZJIT 실험을 권장하지만, 아직 프로덕션 배포는 권장하지 않습니다.
    * Ruby 4.1에서 ZJIT를 YJIT보다 빠르게 만들고 프로덕션에 사용할 수 있게 만드는 것이 목표입니다.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit`는 기본 빌드에서 더 이상 작동하지 않습니다.
          `--yjit-stats`에서 활성화하려면 `configure`에서 `--enable-yjit=stats`를 사용하세요.
        * 기본 통계에 `invalidate_everything`이 추가되었습니다.
          TracePoint에 의해 모든 코드가 무효화될 때 증가합니다.
    * `RubyVM::YJIT.enable`에 `mem_size:`와 `call_threshold:` 옵션이 추가되었습니다.
* RJIT
    * `--rjit`가 제거되었습니다. 서드파티 JIT API의 구현을
      [ruby/rjit](https://github.com/ruby/rjit) 저장소로 이동할 예정입니다.

## 기타 변경

자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
또는 [커밋 로그](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})를
참조하세요.

이러한 변경사항에 따라, Ruby 3.4.0 이후로 [파일 {{ release.stats.files_changed }}개 변경, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)가
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

Ruby는 1993년에 Matz(마츠모토 유키히로)가 처음 개발했고,
현재는 오픈 소스로 개발되고 있습니다. 여러 플랫폼에서 동작하며,
전 세계적으로 특히 웹 개발에 사용됩니다.

[Feature #6012]: https://bugs.ruby-lang.org/issues/6012
[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]:     https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]:     https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]:     https://bugs.ruby-lang.org/issues/21174
[Bug #21175]:     https://bugs.ruby-lang.org/issues/21175
[Bug #21185]:     https://bugs.ruby-lang.org/issues/21185
[Feature #21205]: https://bugs.ruby-lang.org/issues/21205
[Feature #21216]: https://bugs.ruby-lang.org/issues/21216
[Feature #21219]: https://bugs.ruby-lang.org/issues/21219
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21262]: https://bugs.ruby-lang.org/issues/21262
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
[Feature #21287]: https://bugs.ruby-lang.org/issues/21287
[Feature #21311]: https://bugs.ruby-lang.org/issues/21311
[Feature #21347]: https://bugs.ruby-lang.org/issues/21347
[Feature #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
