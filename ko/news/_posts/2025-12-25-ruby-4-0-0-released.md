---
layout: news_post
title: "Ruby 4.0.0 릴리스"
author: "naruse"
translator: "Kim Dongjin"
date: 2025-12-25 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다.
Ruby 4.0은 Ruby::Box와 "ZJIT"를 도입하고, 많은 개선을 추가합니다.

## Ruby Box

정의에 대한 분리를 제공하는 새로운 (실험적) 기능입니다. Ruby Box는 환경 변수로 `RUBY_BOX=1`을 지정하여 활성화할 수 있습니다. 클래스 이름은 `Ruby::Box`입니다.

Box 내에서 로드된 정의는 해당 Box 내에 격리된 상태가 됩니다. Ruby Box가 격리할 수 있는 정의로는 기존 클래스에 대한 몽키 패치, 전역 변수나 클래스 변수 조작, 클래스나 모듈 정의, 그리고 .rb 파일이나 확장 라이브러리로 구현된 라이브러리들이 있습니다.

Ruby Box의 주요 유스케이스로는 다음과 같은 것들이 예상됩니다:

* 테스트를 위해 특정 동작을 덮어쓰는 몽키 패치가 필요한 테스트 케이스를 Box 내에서 격리하여 실행하는 것
* 웹 애플리케이션을 Box 내에서 실행하여 Blue-Green 배포를 프로세스 내에서, 애플리케이션 서버 상에서 실행하는 것
* 웹 애플리케이션을 Box 내에서 실행하여 의존성 업데이트 시 등에 일정 기간 병렬로 실행하고 Ruby 코드를 통해 응답 등을 검증하는 것
* (아직 미설계인) "패키지 API"와 같은 새로운 고수준 API를 만들기 위한 저수준 API로서의 기능을 제공하는 것

"Ruby Box"의 자세한 내용은 다음 문서를 참조하세요: [Ruby::Box](https://docs.ruby-lang.org/en/master/Ruby/Box.html).
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT는 YJIT의 차세대로 개발된 새로운 just-in-time(JIT) 컴파일러입니다. ZJIT 지원을 포함하여 Ruby를 빌드하려면 Rust 1.85.0 이상이 필요하며, --zjit를 지정하면 ZJIT가 활성화됩니다.

우리가 Ruby를 위한 새로운 컴파일러를 개발하는 이유는 성능 상한선을 높이고(더 큰 컴파일 단위 크기와 SSA IR을 도입), 더 일반적인 설계인 메서드 컴파일러로 만들어 외부의 기여를 촉진하고 싶기 때문입니다. 자세한 내용은 [블로그 게시물](https://railsatscale.com/2025-12-24-launch-zjit/)을 참조하세요.
<!-- 이 블로그 게시물은 2025-12-24 9:00am UTC에 자동 공개됩니다. -->

ZJIT는 일반적인 Ruby 인터프리터보다 빠르지만, 아직 YJIT만큼 빠르지는 않습니다. ZJIT를 꼭 시도해 보시길 바라지만, 현시점에서는 프로덕션 환경 배포는 삼가는 것이 좋을 수 있습니다. Ruby 4.1의 ZJIT를 기대해 주세요.

## Ractor 개선

Ruby에서 쉽게 병렬 처리를 수행하기 위한 Ractor에 많은 개선이 있었습니다. 먼저 `Ractor::Port`라는 클래스를 추가하여 메시지 송수신에 대한 문제를 해결했습니다([블로그 게시물](https://product.st.inc/entry/2025/06/24/110606)). 또한 `Ractor.shareable_proc`을 통해 Proc을 Ractor 간에 공유하기 쉽게 만들었습니다.

성능 측면에서는 많은 데이터 구조를 개선하여 글로벌 락에 대한 경합이 크게 감소하고 병렬 처리 성능이 향상되었습니다. 또한 Ractor 간에 공유하는 데이터를 줄임으로써 병렬 실행 시 CPU 캐시 충돌을 줄였습니다.

Ruby 3.0에서 실험적 기능으로 도입되었지만, 내년쯤에는 실험적 상태를 해제하고 싶습니다.

## 언어 변경

* `**nil`이 `nil.to_hash`를 호출하지 않는 것과 마찬가지로, `*nil`은 더 이상 `nil.to_a`를 호출하지 않습니다. [[Feature #21047]]

* 줄 시작 부분에 있는 논리 이항 연산자(`||`, `&&`, `and`, `or`)는 유연한 점(fluent dot)처럼 이전 줄을 이어갑니다. 다음 두 코드는 동일합니다.

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    기존 작성법:

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    ```ruby
    if condition1 &&
       condition2
      ...
    end
    ```

    [[Feature #20925]]

## 코어 클래스 변경

주의: 주목할 만한 클래스 변경만을 포함합니다.

* Array

    * `array.reverse_each.find`보다 효율적인 대안으로 `Array#rfind`가 추가되었습니다. [[Feature #21678]]
    * `Enumerable#find`를 더 효율적으로 실행하는 `Array#find`가 추가되었습니다. [[Feature #21678]]
* Binding

    * `Binding#local_variables`는 더 이상 번호가 매겨진 매개변수를 포함하지 않습니다. 또한, `Binding#local_variable_get`과 `Binding#local_variable_set`은 번호가 매겨진 매개변수를 처리하지 않습니다. [[Bug #21049]]

    * 번호 매개변수 및 "it" 매개변수에 액세스하기 위해 `Binding#implicit_parameters`, `Binding#implicit_parameter_get`, `Binding#implicit_parameter_defined?`가 추가되었습니다. [[Bug #21049]]

* Enumerator

    * `Enumerator.produce`는 이제 선택적 키워드 인자 `size`를 받습니다. 크기에는 정수, `Float::INFINITY`, 람다와 같은 호출 가능한 객체, 또는 알 수 없음을 나타내는 `nil`을 지정할 수 있습니다. 생략 시에는 `Float::INFINITY`입니다.

        ```ruby
        # 무한 열거자
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # 크기가 알려진/계산 가능한 유한 열거자
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* ErrorHighlight

    * `ArgumentError`가 발생했을 때 메서드 호출 측(caller)과 메서드 정의 측(callee) 양쪽의 코드 스니펫을 표시합니다. [[Feature #21543]]

      ```
      test.rb:1:in 'Object#add': wrong number of arguments (given 1, expected 2) (ArgumentError)

          caller: test.rb:3
          | add(1)
            ^^^
          callee: test.rb:1
          | def add(x, y) = x + y
                ^^^
              from test.rb:3:in '<main>'
      ```

* Fiber

    * `Kernel#raise`와 유사한 `Fiber#raise(cause:)` 인자 지원이 도입되었습니다. [[Feature #21360]]

* Fiber::Scheduler

    * 주어진 예외로 fiber를 인터럽트하기 위한 `Fiber::Scheduler#fiber_interrupt`가 도입되었습니다. 초기 사용 사례는 IO 작업이 닫힐 때 블로킹 IO 작업을 기다리는 fiber를 인터럽트하는 것입니다. [[Feature #21166]]

    * 시그널 예외가 무효일 때도 스케줄러가 처리를 계속할 수 있도록 `Fiber::Scheduler#yield`가 추가되었습니다. [[Bug #21633]]

    * 비동기 `IO#close`용 `Fiber::Scheduler#io_close` 훅이 재도입되었습니다.

    * IO 쓰기 버퍼를 플러시할 때 `Fiber::Scheduler#io_write`를 호출합니다. [[Bug #21789]]

* File

    * 커널과 파일 시스템에서 지원하는 경우, `File::Stat#birthtime`이 statx 시스템 콜을 통해 Linux에서 사용 가능합니다. [[Feature #21205]]

* IO

    * `IO.select`는 타임아웃 인자로 `Float::INFINITY`를 허용합니다. [[Feature #20610]]

    * 폐기 예정이었던, 선행 `|`를 사용한 `IO` 클래스 메서드의 프로세스 생성 기능이 제거되었습니다. [[Feature #19630]]

* Kernel

    * `Kernel#inspect`는 이제 `#instance_variables_to_inspect` 메서드의 존재 여부를 확인하여, `#inspect` 문자열에 표시되는 인스턴스 변수를 제어할 수 있습니다.

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

    * 폐기 예정이었던, 선행 `|`를 사용한 `Kernel#open`의 프로세스 생성 기능이 제거되었습니다. [[Feature #19630]]

* Math

    * `Math.log1p`와 `Math.expm1`이 추가되었습니다. [[Feature #21527]]

* Pathname

    * Pathname이 기본 gem에서 Ruby의 코어 클래스로 승격되었습니다. [[Feature #17473]]

* Proc

    * `Proc#parameters`는 이제 선택적 익명 매개변수를 `[:opt, nil]` 대신 `[:opt]`로 표시하여, 익명 매개변수가 필수인 경우와 일관된 출력을 제공합니다. [[Bug #20974]]

* Ractor

    * Ractor 간 통신을 위한 새로운 동기화 메커니즘으로 `Ractor::Port` 클래스가 추가되었습니다. [[Feature #21262]]

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
        * `Ractor::Port#send`(또는 `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        그 결과, `Ractor.yield`와 `Ractor#take`가 제거되었습니다.

    * Ractor의 종료를 기다리기 위해 `Ractor#join`과 `Ractor#value`가 추가되었습니다. 이들은 `Thread#join` 및 `Thread#value`와 유사합니다.

    * `Ractor#join`을 내부적으로 구현하는 데 사용되는 저수준 인터페이스로 `Ractor#monitor`와 `Ractor#unmonitor`가 추가되었습니다.

    * `Ractor.select`는 이제 Ractor와 Port만 받습니다. Ractor가 주어지면, Ractor가 종료될 때 반환됩니다.

    * `Ractor#default_port`가 추가되었습니다. 각 `Ractor`는 `Ractor.send`, `Ractor.receive`에서 사용하는 기본 포트를 가집니다.

    * `Ractor#close_incoming`과 `Ractor#close_outgoing`이 제거되었습니다.

    * 공유 가능한 Proc 또는 lambda를 만들기 위해 `Ractor.shareable_proc`과 `Ractor.shareable_lambda`가 도입되었습니다. [[Feature #21550]] [[Feature #21557]]

* Range

    * `Range#to_set`과 `Enumerator#to_set`은 이제 끝이 없는 범위 문제를 방지하기 위해 크기 검사를 수행합니다. [[Bug #21654]]

    * `Range#overlap?`은 이제 무한한(경계가 없는) 범위를 올바르게 처리합니다. [[Bug #21185]]

    * 시작이 없는 정수 범위에서 `Range#max` 동작이 수정되었습니다. [[Bug #21174]] [[Bug #21175]]

* Ruby

    * Ruby 관련 상수를 포함하는 새로운 최상위 모듈 `Ruby`가 정의되었습니다. 이 모듈은 Ruby 3.4에서 예약되었으며 이제 공식적으로 정의되었습니다. [[Feature #20884]]

* Ruby::Box

    * 정의에 대한 분리를 제공하는 새로운 (실험적) 기능입니다. "Ruby Box"에 대한 자세한 내용은 [doc/language/box.md](doc/language/box.md)를 참조하세요. [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set`은 이제 코어 클래스이며, 더 이상 자동 로드되는 표준 라이브러리 클래스가 아닙니다. [[Feature #21216]]

    * `Set#inspect`은 이제 `Set[]` 구문을 사용하여 `eval`에 적합한 문자열을 반환합니다 (예: `#<Set: {1, 2, 3}>` 대신 `Set[1, 2, 3]`). 이는 Array, Hash와 같은 다른 코어 컬렉션 클래스와 일관성을 유지합니다. [[Feature #21389]]

    * `Set#to_set`과 `Enumerable#to_set`에 인자를 전달하는 것은 폐기 예정 상태가 되었습니다. [[Feature #21390]]

* Socket

    * `Socket.tcp`와 `TCPSocket.new`는 초기 연결에 대한 타임아웃을 지정하기 위해 `open_timeout` 키워드 인자를 허용합니다. [[Feature #21347]]
    * `TCPSocket.new`에서 사용자 지정 타임아웃이 발생한 경우, 상황에 따라 `Errno::ETIMEDOUT` 또는 `IO::TimeoutError`가 발생할 수 있었지만, 이제는 일관되게 `IO::TimeoutError`를 발생시킵니다(단, `Socket.tcp`에서는 유사한 상황에서 `Errno::ETIMEDOUT`이 될 수 있으며, OS 레벨의 타임아웃에서는 어느 경우든 `Errno::ETIMEDOUT`이 발생할 수 있습니다).

* String

    * 유니코드 17.0.0 및 이모지 버전 17.0으로 업데이트합니다. [[Feature #19908]][[Feature #20724]][[Feature #21275]] (Regexp에도 적용됩니다)

    * `String#strip`, `strip!`, `lstrip`, `lstrip!`, `rstrip`, `rstrip!`이 `*selectors` 인자를 허용하도록 확장되었습니다. [[Feature #21552]]

* Thread

    * `Kernel#raise`와 유사한 `Thread#raise(cause:)` 인자 지원이 도입되었습니다. [[Feature #21360]]

## Stdlib 변경

주목할 만한 기능 변경인 표준 라이브러리 변경만을 나열합니다.

다른 변경 사항은 아래 섹션에 나열되어 있습니다. Ruby 3.4.0 이후 번들된 버전의 릴리스 히스토리가 GitHub 릴리스에 있는 경우 함께 나열했습니다.

다음 번들 gem이 기본 gem에서 승격되었습니다.

* ostruct 0.6.3
  * 0.6.1 to [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]
* pstore 0.2.0
  * 0.1.4 to [v0.2.0][pstore-v0.2.0]
* benchmark 0.5.0
  * 0.4.0 to [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]
* logger 1.7.0
  * 1.6.4 to [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]
* rdoc 7.0.2
  * 6.14.0 to [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0], [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1], [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1], [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]
* win32ole 1.9.2
  * 1.9.1 to [v1.9.2][win32ole-v1.9.2]
* irb 1.16.0
  * 1.14.3 to [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2], [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]
* reline 0.6.3
  * 0.6.0 to [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6 to [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]

다음 기본 gem이 추가되었습니다.

* win32-registry 0.1.2

다음 기본 gem이 업데이트되었습니다.

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1 to [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]
* delegate 0.6.1
  * 0.4.0 to [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0], [v0.6.1][delegate-v0.6.1]
* digest 3.2.1
  * 3.2.0 to [v3.2.1][digest-v3.2.1]
* english 0.8.1
  * 0.8.0 to [v0.8.1][english-v0.8.1]
* erb 6.0.1
  * 4.0.4 to [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0], [v6.0.1][erb-v6.0.1]
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0 to [v1.3.0][fcntl-v1.3.0]
* fileutils 1.8.0
  * 1.7.3 to [v1.8.0][fileutils-v1.8.0]
* forwardable 1.4.0
  * 1.3.3 to [v1.4.0][forwardable-v1.4.0]
* io-console 0.8.2
  * 0.8.1 to [v0.8.2][io-console-v0.8.2]
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2 to [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1], [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1 to [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1], [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1], [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0], [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0], [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0], [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1], [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0], [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]
* net-http 0.9.1
  * 0.6.0 to [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0], [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]
* openssl 4.0.0
  * 3.3.1 to [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]
* optparse 0.8.1
  * 0.6.0 to [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0], [v0.8.1][optparse-v0.8.1]
* pp 0.6.3
  * 0.6.2 to [v0.6.3][pp-v0.6.3]
* prism 1.7.0
  * 1.5.2 to [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]
* psych 5.3.1
  * 5.2.2 to [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4], [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0], [v5.3.1][psych-v5.3.1]
* resolv 0.7.0
  * 0.6.2 to [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]
* stringio 3.2.0
  * 3.1.2 to [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4], [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7], [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]
* strscan 3.1.6
  * 3.1.2 to [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4], [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]
* time 0.4.2
  * 0.4.1 to [v0.4.2][time-v0.4.2]
* timeout 0.6.0
  * 0.4.3 to [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0], [v0.6.0][timeout-v0.6.0]
* uri 1.1.1
  * 1.0.4 to [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]
* weakref 0.1.4
  * 0.1.3 to [v0.1.4][weakref-v0.1.4]
* zlib 3.2.2
  * 3.2.1 to [v3.2.2][zlib-v3.2.2]

다음 번들 gem이 업데이트되었습니다.

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5 to [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]
* rake 13.3.1
  * 13.2.1 to [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]
* test-unit 3.7.5
  * 3.6.7 to [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9], [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2], [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1 to [0.3.2][rss-0.3.2]
* net-ftp 0.3.9
  * 0.3.8 to [v0.3.9][net-ftp-v0.3.9]
* net-imap 0.6.2
  * 0.5.8 to [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10], [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12], [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0], [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]
* net-smtp 0.5.1
  * 0.5.0 to [v0.5.1][net-smtp-v0.5.1]
* matrix 0.4.3
  * 0.4.2 to [v0.4.3][matrix-v0.4.3]
* prime 0.1.4
  * 0.1.3 to [v0.1.4][prime-v0.1.4]
* rbs 3.10.0
  * 3.8.0 to [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1], [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2], [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2], [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5], [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2], [v3.10.0][rbs-v3.10.0]
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0 to [v1.11.1][debug-v1.11.1]
* base64 0.3.0
  * 0.2.0 to [v0.3.0][base64-v0.3.0]
* bigdecimal 4.0.1
  * 3.1.8 to [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1], [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3], [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1], [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]
* drb 2.2.3
  * 2.2.1 to [v2.2.3][drb-v2.2.3]
* syslog 0.3.0
  * 0.2.0 to [v0.3.0][syslog-v0.3.0]
* csv 3.3.5
  * 3.3.2 to [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4], [v3.3.5][csv-v3.3.5]
* repl_type_completor 0.1.12


### RubyGems와 Bundler

RubyGems와 Bundler는 Version 4가 동봉되어 있습니다. 자세한 내용은 다음 링크를 참조하세요.

* [Upgrading to RubyGems/Bundler 4 - RubyGems Blog](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## 지원 플랫폼

* Windows

    * 14.0보다 오래된 MSVC 버전(_MSC_VER 1900) 지원이 중단되었습니다. 이는 Visual Studio 2015 이상이 필요함을 의미합니다.

## 호환성 문제

* `Ractor::Port` 추가로 인해 다음 메서드가 Ractor에서 제거되었습니다.

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoing`

    [[Feature #21262]]

* `ObjectSpace._id2ref`가 폐기 예정 상태가 되었습니다. [[Feature #15408]]

* `Process::Status#&`와 `Process::Status#>>`가 제거되었습니다. Ruby 3.3에서 폐기 예정 상태가 되었습니다. [[Bug #19868]]

* `rb_path_check`가 제거되었습니다. 이 함수는 Ruby 2.7에서 제거된 `$SAFE` 경로 검사에 사용되었었으며, 이미 폐기 예정이었습니다. [[Feature #20971]]

* "wrong number of arguments"의 `ArgumentError` 백트레이스에 수신자의 클래스/모듈명이 포함됩니다(예: `bar`가 아닌 `Foo#bar`). [[Bug #21698]]

* 백트레이스에 `internal` 프레임이 표시되지 않습니다. C 구현 메서드도 다른 C 구현과 마찬가지로 Ruby 소스 파일 상에 있는 것처럼 표시됩니다. [[Bug #20968]]

  변경 전:
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  변경 후:
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

## 표준 라이브러리 호환성 문제

* CGI 라이브러리가 기본 gem에서 제거되었습니다. 이제 다음 메서드를 위한 `cgi/escape`만 제공합니다.

    * `CGI.escape`와 `CGI.unescape`
    * `CGI.escapeHTML`과 `CGI.unescapeHTML`
    * `CGI.escapeURIComponent`와 `CGI.unescapeURIComponent`
    * `CGI.escapeElement`와 `CGI.unescapeElement`

    [[Feature #21258]]

* `Set`이 표준 라이브러리에서 코어 클래스로 이동함에 따라, `set/sorted_set.rb`가 제거되었고, `SortedSet`은 더 이상 자동 로드되는 상수가 아닙니다. `SortedSet`을 사용하려면 `sorted_set` gem을 설치하고 `require 'sorted_set'`을 통해 이용해주세요. [[Feature #21287]]



* Net::HTTP

    * 본문(body)을 가진 요청(예: POST, PUT)에서 Content-Type 헤더가 명시적으로 설정되지 않은 경우 기본적으로 application/x-www-form-urlencoded를 자동 설정하는 동작이 제거되었습니다. 애플리케이션이 이 자동 설정에 의존하고 있었다면, 이제 Content-Type 헤더 없이 요청이 전송되며 특정 서버와의 호환성이 손실될 수 있습니다. [[GH-net-http #205]]

## C API 변경

* IO

    * `rb_thread_fd_close`는 폐기 예정 상태가 되었으며 이제 아무 작업도 하지 않습니다. C 확장에서 Ruby 코드로 파일 디스크립터를 노출해야 하는 경우, `RUBY_IO_MODE_EXTERNAL`을 사용하여 `IO` 인스턴스를 만들고 `rb_io_close(io)`를 사용하여 닫으세요(이렇게 하면 `IO` 인스턴스의 모든 대기 중인 작업도 인터럽트하고 대기합니다). 파일 디스크립터를 직접 닫으면 대기 중인 작업을 인터럽트하지 않으며, 정의되지 않은 동작이 발생할 수 있습니다. 다시 말해, 두 개의 `IO` 객체가 같은 파일 디스크립터를 공유하는 경우, 하나를 닫아도 다른 하나에는 영향을 미치지 않습니다. [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl`은 이제 GVL 유무에 관계없이 작동합니다. 이를 통해 gem은 `ruby_thread_has_gvl_p` 확인을 피할 수 있습니다. 그래도 GVL에 대해서는 여전히 주의해주세요. [[Feature #20750]]

* Set

    * `Set`에 대한 C API가 추가되었습니다. 다음 메서드가 지원됩니다. [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## 구현 개선

* `Class#new`(예: `Object.new`)가 전반적으로 고속화되었으며, 특히 키워드 인수를 전달할 때 효과적입니다. YJIT와 ZJIT에도 적용됩니다. [[Feature #21254]]
* 크기 풀이 다른 GC 힙을 독립적으로 성장시켜, 일부 풀에만 장수명 객체가 있는 경우 메모리 사용량을 줄입니다.
* 큰 객체 페이지에서의 GC 스윕이 고속화되었습니다.
* "Generic ivar" 객체(String, Array, `TypedData` 등)는 새로운 내부 "fields" 객체를 사용하여 인스턴스 변수 액세스를 고속화합니다.
* GC는 내부 `id2ref` 테이블을 첫 사용 시까지 보유하지 않도록 하여 `object_id` 할당과 GC 스윕을 고속화합니다.
* Class / Module 객체에서의 `object_id`와 `hash`가 고속화되었습니다.
* 더 큰 Bignum 정수도 가변 폭 할당을 통해 임베디드 상태로 유지할 수 있게 되었습니다.
* `Random`, `Enumerator::Product`, `Enumerator::Chain`, `Addrinfo`, `StringScanner` 및 일부 내부 객체가 쓰기 배리어로 보호되어 GC 오버헤드를 줄입니다.

### Ractor

Ractor를 더 안정적이고, 성능이 좋고, 사용하기 쉽게 만들기 위해 많은 작업이 진행되었습니다. 이러한 개선으로 Ractor 구현이 실험적 상태를 벗어나는 데 더 가까워졌습니다.

* 성능 개선
    * 얼린 문자열과 심볼 테이블은 내부적으로 잠금 없는 해시 셋 사용 [[Feature #21268]]
    * 메서드 캐시 조회는 대부분의 경우 잠금을 회피
    * 클래스(및 geniv) 인스턴스 변수 접근이 더 빠르고 잠금을 회피
    * Ractor별 카운터를 사용하여 객체 할당 중 CPU 캐시 경합을 회피
    * 스레드 로컬 카운터를 사용하여 xmalloc/xfree에서 CPU 캐시 경합을 회피
    * `object_id`는 대부분의 경우 잠금을 회피
* 버그 수정 및 안정성
    * Ractor와 Thread를 결합할 때 발생할 수 있는 데드락 수정
    * Ractor에서 require 및 autoload 관련 문제 수정
    * Ractor 간 인코딩/트랜스코딩 문제 수정
    * GC 작업 및 메서드 무효화의 경쟁 조건 수정
    * Ractor 시작 후 프로세스 fork 관련 문제 수정
    * Ractor 환경에서 GC의 할당 카운트가 정확해짐
    * GC 후 TracePoint가 동작하지 않는 문제 수정 [[Bug #19112]]

## JIT

* ZJIT
    * [실험적 메서드 기반 JIT 컴파일러](https://docs.ruby-lang.org/en/master/jit/zjit_md.html)가 도입되었습니다. `--zjit` 지원을 활성화하려면 Rust 1.85.0 이상으로 Ruby를 빌드하세요.
    * Ruby 4.0.0 기준, ZJIT는 인터프리터보다 빠르지만 아직 YJIT만큼 빠르지는 않습니다. ZJIT 실험을 권장하지만, 아직 프로덕션 배포는 권장하지 않습니다.
    * Ruby 4.1에서 ZJIT를 YJIT보다 빠르게 만들고 프로덕션에 사용할 수 있게 만드는 것이 목표입니다.
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit`는 기본 빌드에서 더 이상 작동하지 않습니다. `--yjit-stats`에서 활성화하려면 `configure`에서 `--enable-yjit=stats`를 사용하세요.
        * 기본 통계에 `invalidate_everything`이 추가되었습니다. TracePoint에 의해 모든 코드가 무효화될 때 증가합니다.
    * `RubyVM::YJIT.enable`에 `mem_size:`와 `call_threshold:` 옵션이 추가되었습니다.
* RJIT
    * `--rjit`가 제거되었습니다. 서드파티 JIT API의 구현을 [ruby/rjit](https://github.com/ruby/rjit) 저장소로 이동할 예정입니다.


자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
또는 [커밋 로그](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})를
참조하세요.

이러한 변경사항에 따라, Ruby 3.4.0 이후로 [파일 {{ release.stats.files_changed }}개 변경, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)가
이루어졌습니다!

메리 크리스마스, 새해 복 많이 받으시고, Happy Hacking with Ruby 4.0!

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

Ruby는 1993년에 Matz(마츠모토 유키히로)가 처음 개발했고, 현재는 오픈 소스로 개발되고 있습니다. 여러 플랫폼에서 동작하며, 전 세계적으로 특히 웹 개발에 사용됩니다.

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]:     https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]:     https://bugs.ruby-lang.org/issues/20968
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
[Feature #21254]: https://bugs.ruby-lang.org/issues/21254
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21268]: https://bugs.ruby-lang.org/issues/21268
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
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]:     https://bugs.ruby-lang.org/issues/21633
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]:     https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]:     https://bugs.ruby-lang.org/issues/21789
[GH-net-http #205]: https://github.com/ruby/net-http/issues/205
[ostruct-v0.6.2]: https://github.com/ruby/ostruct/releases/tag/v0.6.2
[ostruct-v0.6.3]: https://github.com/ruby/ostruct/releases/tag/v0.6.3
[pstore-v0.2.0]: https://github.com/ruby/pstore/releases/tag/v0.2.0
[benchmark-v0.4.1]: https://github.com/ruby/benchmark/releases/tag/v0.4.1
[benchmark-v0.5.0]: https://github.com/ruby/benchmark/releases/tag/v0.5.0
[logger-v1.6.5]: https://github.com/ruby/logger/releases/tag/v1.6.5
[logger-v1.6.6]: https://github.com/ruby/logger/releases/tag/v1.6.6
[logger-v1.7.0]: https://github.com/ruby/logger/releases/tag/v1.7.0
[rdoc-v6.14.1]: https://github.com/ruby/rdoc/releases/tag/v6.14.1
[rdoc-v6.14.2]: https://github.com/ruby/rdoc/releases/tag/v6.14.2
[rdoc-v6.15.0]: https://github.com/ruby/rdoc/releases/tag/v6.15.0
[rdoc-v6.15.1]: https://github.com/ruby/rdoc/releases/tag/v6.15.1
[rdoc-v6.16.0]: https://github.com/ruby/rdoc/releases/tag/v6.16.0
[rdoc-v6.16.1]: https://github.com/ruby/rdoc/releases/tag/v6.16.1
[rdoc-v6.17.0]: https://github.com/ruby/rdoc/releases/tag/v6.17.0
[rdoc-v7.0.0]: https://github.com/ruby/rdoc/releases/tag/v7.0.0
[rdoc-v7.0.1]: https://github.com/ruby/rdoc/releases/tag/v7.0.1
[rdoc-v7.0.2]: https://github.com/ruby/rdoc/releases/tag/v7.0.2
[rdoc-v7.0.3]: https://github.com/ruby/rdoc/releases/tag/v7.0.3
[win32ole-v1.9.2]: https://github.com/ruby/win32ole/releases/tag/v1.9.2
[irb-v1.15.0]: https://github.com/ruby/irb/releases/tag/v1.15.0
[irb-v1.15.1]: https://github.com/ruby/irb/releases/tag/v1.15.1
[irb-v1.15.2]: https://github.com/ruby/irb/releases/tag/v1.15.2
[irb-v1.15.3]: https://github.com/ruby/irb/releases/tag/v1.15.3
[irb-v1.16.0]: https://github.com/ruby/irb/releases/tag/v1.16.0
[reline-v0.6.1]: https://github.com/ruby/reline/releases/tag/v0.6.1
[reline-v0.6.2]: https://github.com/ruby/reline/releases/tag/v0.6.2
[reline-v0.6.3]: https://github.com/ruby/reline/releases/tag/v0.6.3
[fiddle-v1.1.7]: https://github.com/ruby/fiddle/releases/tag/v1.1.7
[fiddle-v1.1.8]: https://github.com/ruby/fiddle/releases/tag/v1.1.8
[date-v3.5.0]: https://github.com/ruby/date/releases/tag/v3.5.0
[date-v3.5.1]: https://github.com/ruby/date/releases/tag/v3.5.1
[delegate-v0.5.0]: https://github.com/ruby/delegate/releases/tag/v0.5.0
[delegate-v0.6.0]: https://github.com/ruby/delegate/releases/tag/v0.6.0
[delegate-v0.6.1]: https://github.com/ruby/delegate/releases/tag/v0.6.1
[digest-v3.2.1]: https://github.com/ruby/digest/releases/tag/v3.2.1
[english-v0.8.1]: https://github.com/ruby/english/releases/tag/v0.8.1
[erb-v5.1.2]: https://github.com/ruby/erb/releases/tag/v5.1.2
[erb-v5.1.3]: https://github.com/ruby/erb/releases/tag/v5.1.3
[erb-v6.0.0]: https://github.com/ruby/erb/releases/tag/v6.0.0
[erb-v6.0.1]: https://github.com/ruby/erb/releases/tag/v6.0.1
[fcntl-v1.3.0]: https://github.com/ruby/fcntl/releases/tag/v1.3.0
[fileutils-v1.8.0]: https://github.com/ruby/fileutils/releases/tag/v1.8.0
[forwardable-v1.4.0]: https://github.com/ruby/forwardable/releases/tag/v1.4.0
[io-console-v0.8.2]: https://github.com/ruby/io-console/releases/tag/v0.8.2
[io-wait-v0.3.3]: https://github.com/ruby/io-wait/releases/tag/v0.3.3
[io-wait-v0.3.5.test1]: https://github.com/ruby/io-wait/releases/tag/v0.3.5.test1
[io-wait-v0.3.5]: https://github.com/ruby/io-wait/releases/tag/v0.3.5
[io-wait-v0.3.6]: https://github.com/ruby/io-wait/releases/tag/v0.3.6
[io-wait-v0.4.0]: https://github.com/ruby/io-wait/releases/tag/v0.4.0
[json-v2.10.0]: https://github.com/ruby/json/releases/tag/v2.10.0
[json-v2.10.1]: https://github.com/ruby/json/releases/tag/v2.10.1
[json-v2.10.2]: https://github.com/ruby/json/releases/tag/v2.10.2
[json-v2.11.0]: https://github.com/ruby/json/releases/tag/v2.11.0
[json-v2.11.1]: https://github.com/ruby/json/releases/tag/v2.11.1
[json-v2.11.2]: https://github.com/ruby/json/releases/tag/v2.11.2
[json-v2.11.3]: https://github.com/ruby/json/releases/tag/v2.11.3
[json-v2.12.0]: https://github.com/ruby/json/releases/tag/v2.12.0
[json-v2.12.1]: https://github.com/ruby/json/releases/tag/v2.12.1
[json-v2.12.2]: https://github.com/ruby/json/releases/tag/v2.12.2
[json-v2.13.0]: https://github.com/ruby/json/releases/tag/v2.13.0
[json-v2.13.1]: https://github.com/ruby/json/releases/tag/v2.13.1
[json-v2.13.2]: https://github.com/ruby/json/releases/tag/v2.13.2
[json-v2.14.0]: https://github.com/ruby/json/releases/tag/v2.14.0
[json-v2.14.1]: https://github.com/ruby/json/releases/tag/v2.14.1
[json-v2.15.0]: https://github.com/ruby/json/releases/tag/v2.15.0
[json-v2.15.1]: https://github.com/ruby/json/releases/tag/v2.15.1
[json-v2.15.2]: https://github.com/ruby/json/releases/tag/v2.15.2
[json-v2.16.0]: https://github.com/ruby/json/releases/tag/v2.16.0
[json-v2.17.0]: https://github.com/ruby/json/releases/tag/v2.17.0
[json-v2.17.1]: https://github.com/ruby/json/releases/tag/v2.17.1
[json-v2.18.0]: https://github.com/ruby/json/releases/tag/v2.18.0
[net-http-v0.7.0]: https://github.com/ruby/net-http/releases/tag/v0.7.0
[net-http-v0.8.0]: https://github.com/ruby/net-http/releases/tag/v0.8.0
[net-http-v0.9.0]: https://github.com/ruby/net-http/releases/tag/v0.9.0
[net-http-v0.9.1]: https://github.com/ruby/net-http/releases/tag/v0.9.1
[openssl-v3.3.2]: https://github.com/ruby/openssl/releases/tag/v3.3.2
[openssl-v4.0.0]: https://github.com/ruby/openssl/releases/tag/v4.0.0
[optparse-v0.7.0]: https://github.com/ruby/optparse/releases/tag/v0.7.0
[optparse-v0.8.0]: https://github.com/ruby/optparse/releases/tag/v0.8.0
[optparse-v0.8.1]: https://github.com/ruby/optparse/releases/tag/v0.8.1
[pp-v0.6.3]: https://github.com/ruby/pp/releases/tag/v0.6.3
[prism-v1.6.0]: https://github.com/ruby/prism/releases/tag/v1.6.0
[prism-v1.7.0]: https://github.com/ruby/prism/releases/tag/v1.7.0
[psych-v5.2.3]: https://github.com/ruby/psych/releases/tag/v5.2.3
[psych-v5.2.4]: https://github.com/ruby/psych/releases/tag/v5.2.4
[psych-v5.2.5]: https://github.com/ruby/psych/releases/tag/v5.2.5
[psych-v5.2.6]: https://github.com/ruby/psych/releases/tag/v5.2.6
[psych-v5.3.0]: https://github.com/ruby/psych/releases/tag/v5.3.0
[psych-v5.3.1]: https://github.com/ruby/psych/releases/tag/v5.3.1
[resolv-v0.6.3]: https://github.com/ruby/resolv/releases/tag/v0.6.3
[resolv-v0.7.0]: https://github.com/ruby/resolv/releases/tag/v0.7.0
[stringio-v3.1.3]: https://github.com/ruby/stringio/releases/tag/v3.1.3
[stringio-v3.1.4]: https://github.com/ruby/stringio/releases/tag/v3.1.4
[stringio-v3.1.5]: https://github.com/ruby/stringio/releases/tag/v3.1.5
[stringio-v3.1.6]: https://github.com/ruby/stringio/releases/tag/v3.1.6
[stringio-v3.1.7]: https://github.com/ruby/stringio/releases/tag/v3.1.7
[stringio-v3.1.8]: https://github.com/ruby/stringio/releases/tag/v3.1.8
[stringio-v3.1.9]: https://github.com/ruby/stringio/releases/tag/v3.1.9
[stringio-v3.2.0]: https://github.com/ruby/stringio/releases/tag/v3.2.0
[strscan-v3.1.3]: https://github.com/ruby/strscan/releases/tag/v3.1.3
[strscan-v3.1.4]: https://github.com/ruby/strscan/releases/tag/v3.1.4
[strscan-v3.1.5]: https://github.com/ruby/strscan/releases/tag/v3.1.5
[strscan-v3.1.6]: https://github.com/ruby/strscan/releases/tag/v3.1.6
[time-v0.4.2]: https://github.com/ruby/time/releases/tag/v0.4.2
[timeout-v0.4.4]: https://github.com/ruby/timeout/releases/tag/v0.4.4
[timeout-v0.5.0]: https://github.com/ruby/timeout/releases/tag/v0.5.0
[timeout-v0.6.0]: https://github.com/ruby/timeout/releases/tag/v0.6.0
[uri-v1.1.0]: https://github.com/ruby/uri/releases/tag/v1.1.0
[uri-v1.1.1]: https://github.com/ruby/uri/releases/tag/v1.1.1
[weakref-v0.1.4]: https://github.com/ruby/weakref/releases/tag/v0.1.4
[zlib-v3.2.2]: https://github.com/ruby/zlib/releases/tag/v3.2.2
[power_assert-v3.0.0]: https://github.com/ruby/power_assert/releases/tag/v3.0.0
[power_assert-v3.0.1]: https://github.com/ruby/power_assert/releases/tag/v3.0.1
[rake-v13.3.0]: https://github.com/ruby/rake/releases/tag/v13.3.0
[rake-v13.3.1]: https://github.com/ruby/rake/releases/tag/v13.3.1
[test-unit-3.6.8]: https://github.com/test-unit/test-unit/releases/tag/3.6.8
[test-unit-3.6.9]: https://github.com/test-unit/test-unit/releases/tag/3.6.9
[test-unit-3.7.0]: https://github.com/test-unit/test-unit/releases/tag/3.7.0
[test-unit-3.7.1]: https://github.com/test-unit/test-unit/releases/tag/3.7.1
[test-unit-3.7.2]: https://github.com/test-unit/test-unit/releases/tag/3.7.2
[test-unit-3.7.3]: https://github.com/test-unit/test-unit/releases/tag/3.7.3
[test-unit-3.7.4]: https://github.com/test-unit/test-unit/releases/tag/3.7.4
[test-unit-3.7.5]: https://github.com/test-unit/test-unit/releases/tag/3.7.5
[rss-0.3.2]: https://github.com/ruby/rss/releases/tag/0.3.2
[net-ftp-v0.3.9]: https://github.com/ruby/net-ftp/releases/tag/v0.3.9
[net-imap-v0.5.9]: https://github.com/ruby/net-imap/releases/tag/v0.5.9
[net-imap-v0.5.10]: https://github.com/ruby/net-imap/releases/tag/v0.5.10
[net-imap-v0.5.11]: https://github.com/ruby/net-imap/releases/tag/v0.5.11
[net-imap-v0.5.12]: https://github.com/ruby/net-imap/releases/tag/v0.5.12
[net-imap-v0.5.13]: https://github.com/ruby/net-imap/releases/tag/v0.5.13
[net-imap-v0.6.0]: https://github.com/ruby/net-imap/releases/tag/v0.6.0
[net-imap-v0.6.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.1
[net-imap-v0.6.2]: https://github.com/ruby/net-imap/releases/tag/v0.6.2
[net-smtp-v0.5.1]: https://github.com/ruby/net-smtp/releases/tag/v0.5.1
[matrix-v0.4.3]: https://github.com/ruby/matrix/releases/tag/v0.4.3
[prime-v0.1.4]: https://github.com/ruby/prime/releases/tag/v0.1.4
[rbs-v3.8.1]: https://github.com/ruby/rbs/releases/tag/v3.8.1
[rbs-v3.9.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.dev.1
[rbs-v3.9.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.1
[rbs-v3.9.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.2
[rbs-v3.9.0]: https://github.com/ruby/rbs/releases/tag/v3.9.0
[rbs-v3.9.1]: https://github.com/ruby/rbs/releases/tag/v3.9.1
[rbs-v3.9.2]: https://github.com/ruby/rbs/releases/tag/v3.9.2
[rbs-v3.9.3]: https://github.com/ruby/rbs/releases/tag/v3.9.3
[rbs-v3.9.4]: https://github.com/ruby/rbs/releases/tag/v3.9.4
[rbs-v3.9.5]: https://github.com/ruby/rbs/releases/tag/v3.9.5
[rbs-v3.10.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.1
[rbs-v3.10.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.2
[rbs-v3.10.0]: https://github.com/ruby/rbs/releases/tag/v3.10.0
[debug-v1.11.1]: https://github.com/ruby/debug/releases/tag/v1.11.1
[base64-v0.3.0]: https://github.com/ruby/base64/releases/tag/v0.3.0
[bigdecimal-v3.2.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.0
[bigdecimal-v3.2.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.1
[bigdecimal-v3.2.2]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.2
[bigdecimal-v3.2.3]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.3
[bigdecimal-v3.3.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.0
[bigdecimal-v3.3.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.1
[bigdecimal-v4.0.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.0
[bigdecimal-v4.0.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.1
[drb-v2.2.3]: https://github.com/ruby/drb/releases/tag/v2.2.3
[syslog-v0.3.0]: https://github.com/ruby/syslog/releases/tag/v0.3.0
[csv-v3.3.3]: https://github.com/ruby/csv/releases/tag/v3.3.3
[csv-v3.3.4]: https://github.com/ruby/csv/releases/tag/v3.3.4
[csv-v3.3.5]: https://github.com/ruby/csv/releases/tag/v3.3.5
