---
layout: news_post
title: "Ruby 4.1.0-preview1 릴리스"
author: "naruse"
translator: "shia"
date: 2026-10-12 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "4.1.0-preview1" | first %}
Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다.
Ruby 4.1은 Ractor 로컬 GC, YJIT의 Windows 지원, autoload_relative를 도입하고,
많은 개선을 추가합니다.

## Ractor 개선

Ractor를 더 안정적이고, 빠르고, 사용하기 쉽게 만들기 위해 많은 작업이 이루어졌습니다. 이러한 개선으로 Ractor 구현이 실험적 단계를 벗어나는 데 한 걸음 더 가까워졌습니다.

* 기본 GC가 이제 **Ractor별로** 동작합니다. 각 Ractor는 다른 Ractor를 멈추지 않고
  자신의 스레드에서 자신의 힙을 회수하며, stop-the-world
  수집은 정말 필요할 때만 실행됩니다(명시적인 전체 `GC.start`,
  공유 가능 객체의 증가, 종료된 Ractor의 힙 회수). 할당이 많은
  Ractor 프로그램도 이제 fork한 프로세스처럼 확장됩니다.

* 여러 Ractor가 실행 중일 때 `GC.start(global: false)`를 사용하면 Ractor 로컬 GC를
   강제로 실행할 수 있습니다. 기본적으로 `GC.start`는 이전처럼 전역 GC(모든 Ractor)를
   실행합니다. 이는 `GC.start(global: true)`로도 실행할 수 있습니다. `global`
   키워드 인수는 Ractor가 하나만 실행 중일 때는 아무런 효과가 없습니다.

  눈에 보이는 동작 변경:

  * `Ractor#value`는 값을 한 번만 반환합니다. 두 번째 호출은
    `Ractor::Error`를 발생시킵니다.
  * `GC.disable`/`GC.enable`은 프로세스 전체 스위치에 대한 Ractor별
    보류로 동작합니다. 한 Ractor의 `GC.enable`이 더 이상 다른 Ractor의
    `GC.disable`을 덮어쓰지 않습니다.
  * `ObjectSpace.each_object`는 호출한 Ractor 자신의 객체와
    다른 Ractor의 공유 가능 객체를 열거합니다(`ObjectSpace.dump_all`은 여전히
    모든 것을 다룹니다).
  * 다른 Ractor의 객체에 대해 `ObjectSpace.define_finalizer`를 호출하면
    `Ractor::IsolationError`가 발생합니다.

* `Ractor#monitor`는 이제 Ractor와 그 Ractor에 일어난 일을 담은 배열
  `[ractor, :exited]` 또는 `[ractor, :aborted]`를 보냅니다. 이전에는
  Symbol `:exited` 또는 `:aborted`만 보냈습니다. 이제 여러 Ractor가 하나의
  포트에 보고해도 수신 측에서 어떤 Ractor가 끝났는지 알 수 있습니다. 배열은
  수신하는 Ractor에서 만들어지므로, 많은 Ractor를 감시해도 공유 가능 객체가
  남지 않습니다.

      r = Ractor.new { :ok }
      r.monitor(port = Ractor::Port.new)
      port.receive #=> [r, :exited]

  따라서 하나의 포트로 그룹 전체를 감시할 수 있으며, 슈퍼바이저에게
  필요한 것은 이것뿐입니다.

      workers.each { |r| r.monitor port }

      until workers.empty?
        r, status = port.receive
        workers.delete(r)
        workers << restart(r) if status == :aborted
      end

## 언어 변경

* refinement 메서드에서 `super`로 호출된 모듈 메서드 안의 `super`가
  이제 올바르게 동작합니다.
  [[Feature #22309]]

* `Module#clone`과 `Module#dup`은 더 이상 복사된 메서드의 렉시컬 스코프를
  다시 쓰지 않습니다. 상수와 클래스 변수는 기존 클래스를 통해 해석되며,
  이는 상속이나 믹스인과 일관됩니다.
  [[Feature #21981]]

* 모듈 안의 `alias`와 `Module#alias_method`는 원래 메서드가 그 모듈이나 조상의
  메서드가 아니고 `Object`로의 폴백을 통해서만 발견되는 경우
  폐기 예정 경고를 출력합니다. 이 폴백은 Ruby 4.3에서
  제거될 예정이며, 그런 별칭은 `NameError`를 발생시키게 됩니다.
  [[Bug #22276]]

* `alias`와 `Module#alias_method`는 원래 메서드가 prepend된 모듈에 정의되어 있을 때
  폐기 예정 경고를 출력합니다. 이 동작은 Ruby 4.3에서
  제거될 예정이며, 별칭 탐색은 원본 클래스(prepend된 모듈 다음)에서
  시작하게 됩니다.
  [[Bug #22273]]

## 코어 클래스 변경

주의: 주목할 만한 클래스 변경만을 포함합니다.

* C API

    * `rb_nogvl`의 플래그로 `RB_NOGVL_PENDING_INTR_FAIL`이 추가되었습니다.
      현재 스레드에 대기 중인 인터럽트(`Thread.handle_interrupt`로 마스크된
      인터럽트 포함)가 있으면, `rb_nogvl`은 블로킹 영역에 들어가지 않고
      (주어진 함수도 호출하지 않고) `0`을 반환합니다.
      기존의 건너뛰기 경로와 마찬가지로, 함수가 호출되지 않았으므로
      `errno`는 `0`입니다.
    * `RHASH_TBL`은 폐기 예정입니다.  [[Feature #22232]]

* Array

    * `Array#pack`이 부호 없는/부호 있는 LEB128 인코딩 정수를 위한
      새 포맷 `R`과 `r`을 받습니다. [[Feature #21785]]
    * `Array#pack`이 현재 오프셋을 바이트 경계나 다른 지시자의 ABI 정렬에
      맞추는 새 포맷 `x!`와 `@!`를
      받습니다. [[Feature #22185]]

* Dir

    * `Dir.glob`이 디렉터리 심볼릭 링크를 따라가는 재귀 매칭을 위한 `***/`를
      지원합니다. 조상 디렉터리로의 링크에서는 멈춥니다.
      [[Feature #17548]]

* ENV

    * `ENV.fetch_values`가 추가되었습니다. 주어진 이름들에 대한 값의 배열을
      반환하며, 블록이 주어지지 않으면 없는 이름에 대해 `KeyError`를
      발생시킵니다. [[Feature #21781]]

* Fiber::Scheduler

    * 이제 `fiber_interrupt` 훅이 필수입니다. 이를 구현하지 않은 스케줄러는
      더 이상 `Fiber.set_scheduler`로 설치할 수 없습니다.

* GC

    * `GC.stat`이 `scope: :ractor`(기본값), `scope: :local`
      (`:ractor`의 동의어), `scope: :global`을 받습니다.
      기본 GC에서 전역 스코프는 stop-the-world 스냅숏을 요청하지 않고,
      파괴된 객체 공간의 이력을 포함하여 Ractor 전체에 걸친 누적 수집 횟수와
      측정된 마킹/스위핑 CPU 시간을 보고합니다.
      스코프를 지정하지 않은 `GC.stat`, `GC.count`, `GC.total_time`은
      현재 Ractor 기준 동작을 유지합니다.
    * `GC.stat`이 새 키 `:global_gc_count`를 보고합니다. 현재 Ractor가
      시작한 stop-the-world 전역 가비지 컬렉션 사이클의 횟수입니다.
      각 전역 수집은 정확히 하나의 Ractor에 귀속되므로,
      값을 Ractor 전체에 대해 합산할 수 있습니다. `GC.stat(:global_gc_count,
      scope: :global)`은 종료된 Ractor의 횟수를 포함한
      프로세스 전체 합계를 보고합니다.
    * 전역 가비지 컬렉션은 `:major_gc_count`에 포함되지 않습니다.
      두 스코프 모두에서 `:count`는 `:minor_gc_count`, `:major_gc_count`,
      `:global_gc_count`의 합과 같습니다. 다른 Ractor의 객체 공간이
      존재하거나(종료되었지만 아직 흡수되지 않은 Ractor가 남긴 것 포함),
      마지막 전역 수집 이후 흡수된 것이 있으면,
      `GC.start`는 기본적으로 전역 수집을 실행하므로
      `:major_gc_count`가 아니라 `:global_gc_count`가 증가합니다. 로컬 major 수집을
      하려면 `global: false`를 넘기세요.
    * 전역 컴팩션은 더 이상 스칼라 GC 시간 통계에서 겹치는 CPU 구간을
      중복 계산하지 않습니다. 프로파일러의 벽시계 시간 구간은 변경되지 않습니다.

* Hash

    * `Hash.ruby2_keywords_hash?`와 `Hash.ruby2_keywords_hash`는
      폐기 예정이며 Ruby 4.5에서 제거될 예정입니다. [[Feature #22205]]

* Integer

    * `Integer#bit_count`가 추가되었습니다. 음이 아닌 정수의 이진 표현에서
      `1`인 비트의 개수(population count)를 반환합니다.
      [[Feature #20163]]

* IO::Buffer

    * `read`, `write`, `pread`, `pwrite`는 이제 `(offset, length)`를 사용해
      한 번의 IO 작업을 수행합니다. `length`는 최대 전송 크기입니다. 짧은
      전송은 그대로 반환됩니다.

    * 대응하는 파이버 스케줄러 훅은 더 이상 실험적이지 않으며,
      이제 같은 `(offset, length)` 인수 순서와 단일 작업
      시맨틱을 사용합니다.

* Kernel

    * `Kernel#autoload_relative`와 `Module#autoload_relative`가 추가되었습니다.
      이 메서드들은 `autoload`처럼 동작하지만, `require_relative`와 비슷하게
      메서드를 호출한 파일을 기준으로 파일 경로를 해석합니다.
      이로써 절대 경로를 하드코딩하거나 `$LOAD_PATH`를 조작하지 않고도
      같은 디렉터리의 파일에서 상수를 쉽게 autoload할 수 있습니다.
      [[Feature #15330]]

* MatchData

    * `MatchData#integer_at`이 추가되었습니다. 매치된 부분 문자열을 정수로
      변환하여 그 결과를 반환합니다.  [[Feature #21932]]

* Module

    * `Module#descendants`가 추가되었습니다. 리시버를 조상으로 가지는
      클래스와 모듈의 배열을 반환합니다.  [[Feature #9779]]
    * `Module#ruby2_keywords`와 최상위 `ruby2_keywords`는
      폐기 예정이며 Ruby 4.4에서 제거될 예정입니다.  [[Feature #22205]]
    * `Module#method_defined?`가 private 메서드도 매치하기 위한
      세 번째 선택 인수를 받습니다.  [[Feature #22297]]

* ObjectSpace

    * `ObjectSpace._id2ref`가 제거되었습니다.  [[Feature #22135]]

* Proc

    * `Proc#refined`가 추가되었습니다. 리시버처럼 동작하되, 주어진 모듈로
      활성화된 refinement가 본문 안에서 유효한 새 `Proc`을 반환합니다.
      원래 `Proc`에는 영향을 주지 않습니다.
      [[Feature #22097]]
    * `Proc#ruby2_keywords`는 폐기 예정이며 Ruby 4.4에서 제거될 예정입니다.
      [[Feature #22205]]

* Range

    * `Range#clamp`가 추가되었습니다. 시작 값과 끝 값을 주어진 범위로
      제한한 새 `Range` 인스턴스를 반환합니다. [[Feature #22175]]

* Regexp

    * 리터럴뿐만 아니라 모든 `Regexp` 인스턴스가 이제 얼려집니다.
      호환성을 위해 `Regexp`의 서브클래스는 얼려지지 않습니다.
      [[Feature #8948]]

* Set

    * 폐기 예정이었던 동작인, `Set#to_set`, `Range#to_set`,
      `Enumerable#to_set`이 인수를 받는 동작이 제거되었습니다.  [[Feature #21390]]

* String

    * `String#unpack`과 `String#unpack1`이 부호 없는/부호 있는 LEB128 인코딩 정수를 위한
      새 포맷 `R`과 `r`을 받습니다. [[Feature #21785]]
    * `String#unpack`과 `String#unpack1`이 현재 오프셋을 반환하는
      새 포맷 `^`를 받습니다. LEB128 같은 가변 길이 포맷과 함께
      사용할 때 유용합니다. [[Feature #21796]]
    * `String#unpack`과 `String#unpack1`이 현재 오프셋을 바이트 경계나
      다른 지시자의 ABI 정렬에 맞추는 새 포맷 `x!`와
      `@!`를 받습니다. [[Feature #22185]]
    * 기본 비트 연산이 추가되었습니다. `String#bit_get`, `String#bit_set?`,
      `String#bit_set`, `String#bit_clear`, `String#bit_flip`,
      `String#bit_count`는 개별 비트를 다루고, `String#bitwise_not`,
      `String#bitwise_and`, `String#bitwise_or`, `String#bitwise_xor`
      (및 각각의 `!` 버전)는 문자열 전체를 다룹니다. [[Feature #22118]]
    * `String#tr`이 여러 문자 치환을 위해 Hash를 받습니다.
      [[Feature #22238]]

* Symbol

    * `Symbol#to_s`가 이제 얼린 문자열을 반환합니다. [[Feature #22137]]

* Thread

    * `Thread#thread_variable_set`으로 `nil`을 대입하면 이제
      스레드 로컬 변수가 삭제됩니다. [[Feature #19333]]

* Thread::Backtrace::Location

    * `Thread::Backtrace::Location#source_range`가 추가되었습니다. 프레임과 연관된
      Ruby 표현식에 대한 `Ruby::SourceRange`를 반환합니다.

## 표준 라이브러리 변경

* Psych

    * 실험적인 libfyaml 백엔드가 추가되었습니다. psych를
      `--enable-libfyaml`로 빌드했을 때만 활성화되며, 그 외에는
      기본 libyaml 백엔드가 그대로 유지됩니다. Windows에서는
      지원되지 않습니다.  [[GH-psych #805]]

* Ruby::Prism

    * `Ruby::Prism`이 추가되었습니다. 인터프리터에 내장된 prism 파서로,
      실행 중인 프로그램을 파싱한 바로 그 파서이며,
      prism gem과는 독립적입니다. autoload됩니다.
      `Method#syntax_tree` 등이 이 파서의 노드를 반환합니다. API는
      Ruby 마이너 버전 간에 변경될 수 있으므로, 실행 중인 인터프리터의 파서가
      필요한 경우가 아니라면 `prism` gem을 사용하세요.  [[Bug #22379]]

### 다음 번들 gem이 추가되었습니다.


주목할 만한 기능 변경인 표준 라이브러리 변경만을 나열합니다.

그 밖의 변경 사항은 다음 섹션에 나열되어 있습니다. 또한 GitHub 릴리스가 있는 경우,
이전 번들 버전인 Ruby 4.0.0 이후의 릴리스 이력도
함께 나열했습니다.

### 다음 번들 gem이 기본 gem에서 승격되었습니다.

* prism 1.9.0
* tsort 0.2.0
* win32-registry 0.1.2

### 다음 번들 gem이 제거되었습니다.

* net-ftp 0.3.9
* net-pop 0.1.2

이 gem들은 여전히 rubygems.org에서 받을 수 있으며
`gem install`로 설치할 수 있습니다.  [[Feature #21835]]

### 다음 기본 gem이 추가되었습니다.

### 다음 기본 gem이 갱신되었습니다.

* RubyGems 4.1.0.beta2
  * 4.0.3 to [v4.0.4][RubyGems-v4.0.4], [v4.0.5][RubyGems-v4.0.5], [v4.0.6][RubyGems-v4.0.6], [v4.0.7][RubyGems-v4.0.7], [v4.0.8][RubyGems-v4.0.8], [v4.0.9][RubyGems-v4.0.9], [v4.0.10][RubyGems-v4.0.10], [v4.0.11][RubyGems-v4.0.11], [v4.0.12][RubyGems-v4.0.12], [v4.0.13][RubyGems-v4.0.13], [v4.0.14][RubyGems-v4.0.14], [v4.0.15][RubyGems-v4.0.15], [v4.0.16][RubyGems-v4.0.16], [v4.0.17][RubyGems-v4.0.17], [v4.0.18][RubyGems-v4.0.18], [v4.0.19][RubyGems-v4.0.19], [v4.0.20][RubyGems-v4.0.20], [v4.0.21][RubyGems-v4.0.21], [v4.0.22][RubyGems-v4.0.22], [v4.1.0.beta1][RubyGems-v4.1.0.beta1], [v4.1.0.beta2][RubyGems-v4.1.0.beta2]
* bundler 4.1.0.beta2
  * 4.0.3 to [v4.0.4][bundler-v4.0.4], [v4.0.5][bundler-v4.0.5], [v4.0.6][bundler-v4.0.6], [v4.0.7][bundler-v4.0.7], [v4.0.8][bundler-v4.0.8], [v4.0.9][bundler-v4.0.9], [v4.0.10][bundler-v4.0.10], [v4.0.11][bundler-v4.0.11], [v4.0.12][bundler-v4.0.12], [v4.0.13][bundler-v4.0.13], [v4.0.14][bundler-v4.0.14], [v4.0.15][bundler-v4.0.15], [v4.0.16][bundler-v4.0.16], [v4.0.17][bundler-v4.0.17]
* date 3.6.0
  * 3.5.1 to [v3.6.0][date-v3.6.0]
* delegate 0.7.0
  * 0.6.1 to [v0.7.0][delegate-v0.7.0]
* digest 3.3.0
  * 3.2.1 to [v3.3.0][digest-v3.3.0]
* erb 6.1.0
  * 6.0.1 to [v6.0.1.1][erb-v6.0.1.1], [v6.0.2][erb-v6.0.2], [v6.0.3][erb-v6.0.3], [v6.0.4][erb-v6.0.4], [v6.0.5][erb-v6.0.5], [v6.0.6][erb-v6.0.6], [v6.0.7][erb-v6.0.7]
* error_highlight 0.7.2
* etc 1.5.0
  * 1.4.6 to [v1.5.0][etc-v1.5.0]
* fileutils 1.8.1
  * 1.8.0 to [v1.8.1][fileutils-v1.8.1]
* io-console 0.9.4
  * 0.8.2 to [v0.9.0][io-console-v0.9.0], [v0.9.1][io-console-v0.9.1], [v0.9.2][io-console-v0.9.2], [v0.9.3][io-console-v0.9.3], [v0.9.4][io-console-v0.9.4]
* io-wait 999.999.999
* ipaddr 1.2.9
  * 1.2.8 to [v1.2.9][ipaddr-v1.2.9]
* json 3.0.2
  * 2.18.0 to [v2.18.1][json-v2.18.1], [v2.19.0][json-v2.19.0], [v2.19.1][json-v2.19.1], [v2.19.2][json-v2.19.2], [v2.19.3][json-v2.19.3], [v2.19.4][json-v2.19.4], [v2.19.5][json-v2.19.5], [v2.19.6][json-v2.19.6], [v2.19.7][json-v2.19.7], [v2.19.8][json-v2.19.8], [v2.19.9][json-v2.19.9], [v2.20.0][json-v2.20.0], [v2.21.0][json-v2.21.0], [v2.21.2][json-v2.21.2], [v3.0.0.rc1][json-v3.0.0.rc1], [v3.0.0][json-v3.0.0]
* net-http 0.10.0
  * 0.9.1 to [v0.10.0][net-http-v0.10.0]
* net-protocol 0.4.0
  * 0.2.2 to [v0.3.0][net-protocol-v0.3.0], [v0.4.0][net-protocol-v0.4.0]
* open3 0.3.0
  * 0.2.1 to [v0.3.0][open3-v0.3.0]
* openssl 4.0.2
  * 4.0.0 to [v4.0.1][openssl-v4.0.1], [v4.0.2][openssl-v4.0.2]
* pp 0.6.4
  * 0.6.3 to [v0.6.4][pp-v0.6.4]
* prettyprint 0.2.1
  * 0.2.0 to [v0.2.1][prettyprint-v0.2.1]
* psych 5.5.0
  * 5.3.1 to [v5.4.0][psych-v5.4.0], [v5.5.0][psych-v5.5.0]
* resolv 0.8.1
  * 0.7.0 to [v0.7.1][resolv-v0.7.1], [v0.7.2][resolv-v0.7.2], [v0.8.0][resolv-v0.8.0], [v0.8.1][resolv-v0.8.1]
* stringio 3.2.1.dev
* strscan 3.1.9.dev
  * 3.1.6 to [v3.1.7][strscan-v3.1.7], [v3.1.8][strscan-v3.1.8]
* syntax_suggest 3.0.0
* tempfile 0.3.2
  * 0.3.1 to [v0.3.2][tempfile-v0.3.2]
* time 0.5.0
  * 0.4.2 to [v0.5.0][time-v0.5.0]
* timeout 0.6.1
  * 0.6.0 to [v0.6.1][timeout-v0.6.1]
* tmpdir 0.3.2
  * 0.3.1 to [v0.3.2][tmpdir-v0.3.2]
* uri 1.1.2
  * 1.1.1 to [v1.1.2][uri-v1.1.2]
* zlib 3.2.4
  * 3.2.2 to [v3.2.3][zlib-v3.2.3], [v3.2.4][zlib-v3.2.4]

### 다음 번들 gem이 갱신되었습니다.

* minitest 6.0.6
* power_assert 3.1.0
  * 3.0.1 to [v3.1.0][power_assert-v3.1.0]
* rake 13.4.2
  * 13.3.1 to [v13.4.0][rake-v13.4.0], [v13.4.1][rake-v13.4.1], [v13.4.2][rake-v13.4.2]
* test-unit 3.7.8
  * 3.7.5 to [3.7.6][test-unit-3.7.6], [3.7.7][test-unit-3.7.7], [3.7.8][test-unit-3.7.8]
* rss 0.3.3
  * 0.3.2 to [0.3.3][rss-0.3.3]
* net-imap 0.6.7
  * 0.6.2 to [v0.6.3][net-imap-v0.6.3], [v0.6.4][net-imap-v0.6.4], [v0.6.4.1][net-imap-v0.6.4.1], [v0.6.5][net-imap-v0.6.5], [v0.6.6][net-imap-v0.6.6], [v0.6.7][net-imap-v0.6.7]
* net-smtp 0.5.2
  * 0.5.1 to [v0.5.2][net-smtp-v0.5.2]
* rbs 4.2.0
  * 3.10.0 to [v3.10.1][rbs-v3.10.1], [v3.10.2][rbs-v3.10.2], [v3.10.3][rbs-v3.10.3], [v3.10.4][rbs-v3.10.4], [v4.0.0.dev.1][rbs-v4.0.0.dev.1], [v4.0.0.dev.2][rbs-v4.0.0.dev.2], [v4.0.0.dev.3][rbs-v4.0.0.dev.3], [v4.0.0.dev.4][rbs-v4.0.0.dev.4], [v4.0.0.dev.5][rbs-v4.0.0.dev.5], [v4.0.0][rbs-v4.0.0], [v4.0.1.dev.1][rbs-v4.0.1.dev.1], [v4.0.1.dev.2][rbs-v4.0.1.dev.2], [v4.0.1][rbs-v4.0.1], [v4.0.2][rbs-v4.0.2], [v4.0.3][rbs-v4.0.3], [v4.1.0.pre.1][rbs-v4.1.0.pre.1], [v4.1.0.pre.2][rbs-v4.1.0.pre.2], [v4.1.0][rbs-v4.1.0], [v4.1.1.pre.1][rbs-v4.1.1.pre.1], [v4.1.1][rbs-v4.1.1], [v4.1.2][rbs-v4.1.2], [v4.1.3][rbs-v4.1.3], [v4.2.0.pre.1][rbs-v4.2.0.pre.1], [v4.2.0][rbs-v4.2.0]
* typeprof 0.33.2
* mutex_m 0.3.0
* bigdecimal 4.1.3
  * 4.0.1 to [v4.1.0][bigdecimal-v4.1.0], [v4.1.1][bigdecimal-v4.1.1], [v4.1.2][bigdecimal-v4.1.2], [v4.1.3][bigdecimal-v4.1.3]
* resolv-replace 0.2.0
  * 0.1.1 to [v0.2.0][resolv-replace-v0.2.0]
* nkf 0.3.0
  * 0.2.0 to [v0.3.0][nkf-v0.3.0]
* syslog 0.4.0
  * 0.3.0 to [v0.4.0][syslog-v0.4.0]
* csv 3.3.6
  * 3.3.5 to [v3.3.6][csv-v3.3.6]
* repl_type_completor 0.1.16
  * 0.1.12 to [v0.1.13][repl_type_completor-v0.1.13], [v0.1.14][repl_type_completor-v0.1.14], [v0.1.15][repl_type_completor-v0.1.15], [v0.1.16][repl_type_completor-v0.1.16]
* pstore 0.2.1
  * 0.2.0 to [v0.2.1][pstore-v0.2.1]
* rdoc 8.1.0
  * 7.0.3 to [v7.0.4][rdoc-v7.0.4], [v7.1.0][rdoc-v7.1.0], [v7.2.0][rdoc-v7.2.0], [v8.0.0][rdoc-v8.0.0], [v8.1.0][rdoc-v8.1.0]
* win32ole 1.9.3
  * 1.9.2 to [v1.9.3][win32ole-v1.9.3]
* irb 1.18.0
  * 1.16.0 to [v1.17.0][irb-v1.17.0], [v1.18.0][irb-v1.18.0]
* reline 0.7.0
  * 0.6.3 to [v0.7.0][reline-v0.7.0]

### RubyGems와 Bundler

Ruby 4.1은 RubyGems와 Bundler 버전 4를 포함합니다. 자세한 내용은 다음 링크를 참조하세요.

## 지원 플랫폼

* 다음 플랫폼에 대한 지원 코드가 제거되었습니다. 해당
  벤더나 배포자가 지원을 종료했고, Ruby를 테스트할 환경이 없으며,
  플랫폼 메인테이너도 없습니다.

    * AmigaOS
    * AtheOS
    * BSD/OS (BSDi)
    * ESIX
    * EWS-UX (NEC EWS4800)
    * a.out 바이너리를 사용하는 FreeBSD, NetBSD, OpenBSD
    * GNU/kFreeBSD
    * GNU/kOpenSolaris
    * HI-UX/MPP
    * HP 9000 Series 300의 HP-UX
    * Interix (Windows Services for UNIX)
    * IRIX
    * MirOS BSD
    * NeXTSTEP, OpenStep, Rhapsody
    * OSF/1 (Tru64 UNIX)
    * QNX Neutrino
    * SunOS 4 (Solaris, 즉 SunOS 5는 영향을 받지 않습니다)
    * System V Release 4
    * UNICOS/mp (Cray X1)
    * UX/PDS

* 다음 오래된 버전에 대한 지원 코드가 제거되었습니다.

    * Cygwin 1.3 이하
    * Solaris 9 이하
    * Linux 2.6.23 이하 (RHEL 5)

* Windows 10 1703 이상에서는 260자보다 긴 경로를 사용하기 위해 더 이상
  `LongPathsEnabled` 레지스트리 값이 필요하지 않습니다. 이는 libruby를 임베드한
  프로그램을 포함하여, 인터프리터를 실행하는 모든 프로세스에 적용됩니다. 경로의
  각 구성 요소는 여전히 255자로 제한되며, 자식 프로세스는 여전히
  `MAX_PATH`로 제한된 현재 디렉터리에서 시작합니다. [[Bug #18947]]

* MSVC로 Ruby를 빌드하려면 이제 Visual Studio 2017 버전 15.8
  (`_MSC_VER` 1915) 이상이 필요합니다.

* MSVC로 빌드한 Ruby는 이제 Windows 10 버전 1809(빌드 17763)
  또는 Windows Server 2019 이상이 필요합니다. 그 이전의 Windows 10 릴리스와 Windows
  Server 2016은 더 이상 지원되지 않습니다.

* macOS의 Ruby는 이제 Mac OS X 10.6 이상이 필요합니다. Mac OS X 10.5와
  PowerPC Mac은 더 이상 지원되지 않습니다.

## 호환성 문제

* 클래스나 모듈은 이제 그것을 만든 Ractor, 즉 *소유자*만 수정할 수 있습니다.
  메서드 정의, 제거, 정의 취소, `alias`, 가시성
  변경, `include`/`prepend`, `Module#refine`, 상수 정의나 제거,
  `autoload` 등록, 클래스 자신의 인스턴스 변수와 클래스 변수 쓰기,
  `Module#freeze`, `Module#set_temporary_name`은 다른 Ractor에서
  `Ractor::IsolationError`를 발생시킵니다. 읽기는 변경되지 않습니다. 부팅 시나 메인
  Ractor가 정의한 모든 것은 `require`한 라이브러리를 포함해 메인 Ractor가 소유하므로,
  메인이 아닌 Ractor는 더 이상 이를 몽키 패치할 수 없습니다. 또한 다른 클래스에
  상수를 정의하는 것이 금지되므로, 최상위 클래스나 모듈 이름도
  정의할 수 없습니다. 그 대신 Ractor는 자신이 만든 클래스를
  공유 불가능한 상수, 인스턴스 변수, 클래스 변수 값을 포함해
  완전히 사용할 수 있으며,
  이는 이전에는 메인 Ractor조차 할 수 없던 일입니다.
  doc/language/ractor.md를 참조하세요. [[Feature #22226]]

* `Kernel#at_exit`와 `END {}`는 이제 메인이 아닌 Ractor에서 호출되면
  `Ractor::IsolationError`를 발생시킵니다. 이전에는 등록된 핸들러가 프로세스 종료 시
  메인 Ractor에서 실행되어 혼란스러웠습니다. [[Feature #22139]]

* `Ractor.make_shareable`은 이제 `IO` 객체에 대해 `Ractor::Error`를 발생시키고,
  `Ractor.shareable?`은 `false`를 반환합니다. 얼린 `IO`는 공유 가능했지만,
  거의 모든 메서드가 `FrozenError`를 발생시키고 `rb_io_t`의 멤버를 통해
  여전히 공유 불가능한 객체를 참조할 수 있었습니다.

* `Random.urandom`은 이제 `Random#bytes`와 마찬가지로 `long`에 담기에 너무 큰
  모든 크기에 대해 `RangeError`를 발생시킵니다. 이전에는 `unsigned long`에 들어가는 크기라면
  `ArgumentError`를 발생시켰습니다. [[Feature #22400]]

* `Struct#[]`와 `Struct#[]=`는 이제 `long`에 들어가는 모든 범위 밖의
  Integer 인덱스에 대해 `IndexError`를 발생시킵니다. 이전에는 `int` 범위를 넘는 인덱스에 대해
  `RangeError`를 발생시켰습니다. [[Feature #22400]]

## 표준 라이브러리 호환성 문제

* prism이 이제 번들 gem입니다. Bundler 환경에서 `require "prism"`을 하려면 Gemfile에
  prism이 필요합니다. 실행 중인 인터프리터의 파서가 필요하면
  `Ruby::Prism`을 사용하세요.  [[Bug #22379]]

* Windows에서 `Etc.getlogin`은 이제 프로세스 시작 시 `USER` 또는 `USERNAME`
  환경 변수나 `GetUserName()`으로 결정된 로그인 이름을
  반환합니다. 이전에는 이후의 `ENV['USER']` 변경을 따라갔습니다.

* Socket

    * Windows에서 연결이 거부되거나 도달할 수 없으면, 이제 전체 `connect_timeout`이
      지난 뒤에 `Errno::ETIMEDOUT`을 발생시키는 대신 Winsock이 보고하는 즉시
      해당하는 `Errno` 클래스를 발생시킵니다. 그곳에서 `Errno::ETIMEDOUT`을
      rescue하던 코드는 실제 에러를 rescue해야 합니다.

    * Windows에서 `BasicSocket#getsockopt(:SOCKET, :ERROR)`는 이제 다른 플랫폼과
      마찬가지로 WinSock의 원시 에러 코드 대신 errno를
      보고합니다. 이를 `WSAE*` 값과 비교하던 코드는 대신 해당하는
      `Errno::*::Errno`와 비교해야 합니다.

    [[Bug #18661]]

## C API 변경

### 임베디드 TypedData

* `RUBY_TYPED_EMBEDDABLE` 플래그가 이제 공개 및 문서화되어 C 확장에서 사용할 수 있습니다.
  C 구조체를 Ruby 객체 슬롯에 직접 할당할 수 있게 해 주며, 포인터 추적을 줄이고
  경우에 따라 메모리 사용량도 줄여 줍니다.
  자세한 내용은 C 확장 문서를 참조하세요. [[Feature #21853]]

* 이전 메모리 크기를 받는, C23에서 영감을 받은 새 할당자 함수가 추가되었습니다.
  이를 통해 Ruby GC가 메모리 사용량을 더 잘 추적하여 휴리스틱을 개선할 수 있습니다.
  또한 C23 `free_sized`를 지원하는 시스템 할당자의 성능도 향상됩니다.

  다만, 이 함수들에 잘못된 크기를 넘기는 것은 정의되지 않은 동작이며
  크래시나 메모리 누수를 일으킬 수 있다는 점에 유의해야 합니다.

  - `ruby_xfree_sized(void *ptr, size_t size)`
  - `ruby_xrealloc_sized(void *ptr, size_t newsiz, size_t oldsiz)`
  - `ruby_xrealloc2_sized(void *ptr, size_t newelems, size_t newsiz, size_t oldelems)`

  [[Feature #21861]]

### Ractor 단위 GC 주소 등록

* `rb_gc_register_address`와 `rb_global_variable`은 이제 호출한 Ractor에
  주소를 등록하며, 저장된 객체는 그 Ractor의 GC만 마킹합니다.

  어떤 Ractor든 주소를 등록할 수 있지만, 그 주소를 통해 저장하는 값은
  특수 상수, 공유 가능 객체, 또는 등록한 Ractor가 소유한 공유 불가능 객체여야
  합니다. 다른 Ractor의 공유 불가능 객체를 저장하면, 주소가 아직 참조하고 있는데도
  객체가 해제될 수 있습니다(use-after-free).

  주소가 프로세스 수명을 가진다면(정적 VALUE), 메인 Ractor에서 등록하거나
  저장하는 값을 공유 가능하게 유지하세요.

  등록한 Ractor가 `Ractor#value`로 join되면, 남은 등록은
  join한 Ractor로 이동합니다. 그렇지 않으면 종료된 Ractor가 회수될 때
  메인 Ractor로 이동합니다.

  [[Feature #22277]]

### 길이와 인덱스를 위한 타입

* String, Array, MatchData의 길이와 인덱스를 위한 타입으로 `rb_len_t`와 `rb_ulen_t`가
  추가되었으며, 함께 `LEN2NUM`, `NUM2LEN`, `ULEN2NUM`,
  `rb_len2int`, `PRIdLEN`과 그 계열, `RB_LEN_MAX`, `RB_LEN_MIN`,
  `RB_ULEN_MAX`, `SIZEOF_RB_LEN_T`, `HAVE_RB_LEN_T`가 추가되었습니다. `RbConfig::SIZEOF["rb_len_t"]`로
  extconf.rb에서 크기를 알 수 있습니다. 현재는 모든 플랫폼에서 `long`이며,
  `RSTRING_LEN`이나 `rb_range_beg_len`처럼 이러한 길이를 다루는
  C API가 이 타입을 사용합니다. 이후 변경에서 mswin에서는 64비트가 될 예정이므로,
  확장 라이브러리는 이러한 길이를 `rb_len_t`로 유지해야 합니다. [[Feature #22400]]

* 길이를 `long`으로 유지하는 확장 라이브러리를 위해, `rb_len_t`를 `long`으로 변환하는
  `rb_len2long`이 추가되었습니다. 값이 들어가지 않으면 새로운 `rb_out_of_long`을 통해
  `RangeError`를 발생시킵니다. [[Feature #22400]]

### 제거된 API

오랫동안 폐기 예정이었던 다음 API가 제거되었습니다.
[[Feature #21768]]

* 오래된 postponed job 함수,
* 타입 없는 데이터 객체 타입/함수,
* 데이터 객체를 할당하는 오래된 API,
* taintedness/trustedness 열거형/매크로,
* `rb_gc_force_recycle` 함수,
* `rb_iterate` 함수,
* 그리고 내부용 일부 함수와 상수.

## 구현 개선

- 기본 가비지 컬렉터가 프리리스트 할당자에서 범프 포인터 할당자로 전환되었습니다. [[PR #17201]]

- error_highlight, did_you_mean, syntax_suggest gem이 이제 인터프리터
  부팅 시가 아니라 처음 에러를 표시할 때 지연 로드되어,
  시작 시간이 줄었습니다. `Process.warmup`은 이를
  미리 로드하므로, pre-fork 서버는 해당 코드를
  copy-on-write 공유 메모리에 유지할 수 있습니다.  [[Feature #21951]]

### M:N 스레드 스케줄러

* 스케줄러가 대기자 수와 Ractor 수에 맞춰 확장됩니다. 이전에는
  리스트를 순회하거나 모두에 대해 하나의 락을 잡았습니다.

  * 시간 제한 대기는 선형 탐색으로 삽입되던 마감 시간순 정렬 리스트 대신
    계층형 타이머 휠에 놓입니다.
  * fd는 매 대기 전에 추가되고 매 깨어남 후에 제거되는 대신,
    대기 사이에도 백엔드에 등록된 상태로 유지됩니다.
  * io-wait 관리 정보는 모든 fd에 걸쳐 하나의 락으로 직렬화되는 대신
    fd별로 샤딩됩니다.
  * fd에 대한 시간 제한 대기는 대기마다 네이티브 스레드 전환 비용이 들던
    블로킹 영역으로 가는 대신 스케줄러를 이용합니다.
  * 컨텍스트 스위치와 공유 풀에서 나가거나 다시 들어가는 일에 더 이상
    스케줄러의 전역 락이 필요하지 않습니다.

* `RUBY_MN_THREADS` 환경 변수는 이제 M:N 스케줄링을 전혀 쓰지 않는 것부터
  모두 쓰는 것까지 설정할 수 있습니다. `-1`이 새로 추가되었습니다. Ractor의 스레드는
  스케줄러가 추가된 이래 M:N이었고, 이를 끌 방법이 없었습니다. `0`과 `1`은
  변경되지 않았습니다.

  | | 메인 스레드 | 메인 Ractor의 다른 스레드 | Ractor의 스레드 |
  |---|---|---|---|
  | `-1` | 1:1 | 1:1 | 1:1 |
  | `0` 또는 미설정 | 1:1 | 1:1 | M:N |
  | `1` | 1:1 | M:N | M:N |
  | `2` | M:N | M:N | M:N |

* `RUBY_MN_THREADS=2`가 새로 추가되었습니다. 메인 스레드는 자신만의 네이티브 스레드에서
  깨어나는 대신 다른 M:N 스레드처럼 재개되며, 전자는 한 자릿수 이상
  비용이 더 듭니다. 메인 스레드가 작업을 주도할 때 효과가 있고,
  다른 스레드를 시작하고 기다리기만 하는 경우에는 효과가 없습니다.

  이 경우 메인 스레드는 더 이상 하나의 OS 스레드에 묶이지 않으며, 이는
  M:N 스케줄러가 이미 다른 모든 스레드에 대해 의미하던 것입니다.

  * OS 스레드별로 상태를 유지하는 C 확장은
    `rb_thread_lock_native_thread()`를 호출해야 합니다.
  * 프로세스의 초기 스레드에서 실행되어야 하는 것은 고정(pinning)을 해도
    전혀 동작하지 않습니다. macOS AppKit과 CFRunLoop, 그리고 Ruby를 임베드하고
    자신의 메인 루프로 돌아가는 호스트가 그렇습니다.

* M:N 스레드의 경우 더 이상 Ruby 스레드에서 OS 스레드 이름을 설정하지 않습니다.
  하나의 네이티브 스레드가 수명 동안 많은 Ruby 스레드를 실행하기 때문입니다. `Thread#name=`은
  같은 이유로 이미 생략되고 있었습니다.

## JIT

### YJIT

* YJIT가 이제 x64 CPU의 Windows(mswin)를 지원합니다.
  `win32\configure.bat --enable-yjit`로 설정하세요. `x86_64-pc-windows-msvc`
  타깃을 지원하는 `rustc`가 필요합니다. 릴리스 빌드만 지원되며,
  MinGW는 지원되지 않습니다.  [[Feature #18439]]

자세한 내용은 [NEWS](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html)
또는 [커밋 로그](https://github.com/ruby/ruby/compare/v4_0_0...{{ release.tag }})를
참조하세요.

이러한 변경 사항에 따라, Ruby 4.0.0 이후로 [파일 {{ release.stats.files_changed }}개 변경, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v4_0_0...{{ release.tag }}#file_bucket)가
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

[Bug #18661]: https://bugs.ruby-lang.org/issues/18661
[Bug #18947]: https://bugs.ruby-lang.org/issues/18947
[Bug #22273]: https://bugs.ruby-lang.org/issues/22273
[Bug #22276]: https://bugs.ruby-lang.org/issues/22276
[Bug #22379]: https://bugs.ruby-lang.org/issues/22379
[Feature #8948]: https://bugs.ruby-lang.org/issues/8948
[Feature #9779]: https://bugs.ruby-lang.org/issues/9779
[Feature #15330]: https://bugs.ruby-lang.org/issues/15330
[Feature #17548]: https://bugs.ruby-lang.org/issues/17548
[Feature #18439]: https://bugs.ruby-lang.org/issues/18439
[Feature #20163]: https://bugs.ruby-lang.org/issues/20163
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21768]: https://bugs.ruby-lang.org/issues/21768
[Feature #21781]: https://bugs.ruby-lang.org/issues/21781
[Feature #21785]: https://bugs.ruby-lang.org/issues/21785
[Feature #21796]: https://bugs.ruby-lang.org/issues/21796
[Feature #21835]: https://bugs.ruby-lang.org/issues/21835
[Feature #21853]: https://bugs.ruby-lang.org/issues/21853
[Feature #21861]: https://bugs.ruby-lang.org/issues/21861
[Feature #21932]: https://bugs.ruby-lang.org/issues/21932
[Feature #21951]: https://bugs.ruby-lang.org/issues/21951
[Feature #21981]: https://bugs.ruby-lang.org/issues/21981
[Feature #22097]: https://bugs.ruby-lang.org/issues/22097
[Feature #22118]: https://bugs.ruby-lang.org/issues/22118
[Feature #22135]: https://bugs.ruby-lang.org/issues/22135
[Feature #22137]: https://bugs.ruby-lang.org/issues/22137
[Feature #22139]: https://bugs.ruby-lang.org/issues/22139
[Feature #22175]: https://bugs.ruby-lang.org/issues/22175
[Feature #22185]: https://bugs.ruby-lang.org/issues/22185
[Feature #22205]: https://bugs.ruby-lang.org/issues/22205
[Feature #22226]: https://bugs.ruby-lang.org/issues/22226
[Feature #22232]: https://bugs.ruby-lang.org/issues/22232
[Feature #22238]: https://bugs.ruby-lang.org/issues/22238
[Feature #22297]: https://bugs.ruby-lang.org/issues/22297
[Feature #22309]: https://bugs.ruby-lang.org/issues/22309
[Feature #22400]: https://bugs.ruby-lang.org/issues/22400
[PR #17201]: https://github.com/ruby/ruby/pull/17201
[GH-psych #805]: https://github.com/ruby/psych/pull/805
[RubyGems-v4.0.4]: https://github.com/rubygems/rubygems/releases/tag/v4.0.4
[RubyGems-v4.0.5]: https://github.com/rubygems/rubygems/releases/tag/v4.0.5
[RubyGems-v4.0.6]: https://github.com/rubygems/rubygems/releases/tag/v4.0.6
[RubyGems-v4.0.7]: https://github.com/rubygems/rubygems/releases/tag/v4.0.7
[RubyGems-v4.0.8]: https://github.com/rubygems/rubygems/releases/tag/v4.0.8
[RubyGems-v4.0.9]: https://github.com/rubygems/rubygems/releases/tag/v4.0.9
[RubyGems-v4.0.10]: https://github.com/rubygems/rubygems/releases/tag/v4.0.10
[RubyGems-v4.0.11]: https://github.com/rubygems/rubygems/releases/tag/v4.0.11
[RubyGems-v4.0.12]: https://github.com/rubygems/rubygems/releases/tag/v4.0.12
[RubyGems-v4.0.13]: https://github.com/rubygems/rubygems/releases/tag/v4.0.13
[RubyGems-v4.0.14]: https://github.com/rubygems/rubygems/releases/tag/v4.0.14
[RubyGems-v4.0.15]: https://github.com/rubygems/rubygems/releases/tag/v4.0.15
[RubyGems-v4.0.16]: https://github.com/rubygems/rubygems/releases/tag/v4.0.16
[RubyGems-v4.0.17]: https://github.com/rubygems/rubygems/releases/tag/v4.0.17
[RubyGems-v4.0.18]: https://github.com/rubygems/rubygems/releases/tag/v4.0.18
[RubyGems-v4.0.19]: https://github.com/rubygems/rubygems/releases/tag/v4.0.19
[RubyGems-v4.0.20]: https://github.com/rubygems/rubygems/releases/tag/v4.0.20
[RubyGems-v4.0.21]: https://github.com/rubygems/rubygems/releases/tag/v4.0.21
[RubyGems-v4.0.22]: https://github.com/rubygems/rubygems/releases/tag/v4.0.22
[RubyGems-v4.1.0.beta1]: https://github.com/rubygems/rubygems/releases/tag/v4.1.0.beta1
[RubyGems-v4.1.0.beta2]: https://github.com/rubygems/rubygems/releases/tag/v4.1.0.beta2
[bundler-v4.0.4]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.4
[bundler-v4.0.5]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.5
[bundler-v4.0.6]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.6
[bundler-v4.0.7]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.7
[bundler-v4.0.8]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.8
[bundler-v4.0.9]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.9
[bundler-v4.0.10]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.10
[bundler-v4.0.11]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.11
[bundler-v4.0.12]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.12
[bundler-v4.0.13]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.13
[bundler-v4.0.14]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.14
[bundler-v4.0.15]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.15
[bundler-v4.0.16]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.16
[bundler-v4.0.17]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.17
[date-v3.6.0]: https://github.com/ruby/date/releases/tag/v3.6.0
[delegate-v0.7.0]: https://github.com/ruby/delegate/releases/tag/v0.7.0
[digest-v3.3.0]: https://github.com/ruby/digest/releases/tag/v3.3.0
[erb-v6.0.1.1]: https://github.com/ruby/erb/releases/tag/v6.0.1.1
[erb-v6.0.2]: https://github.com/ruby/erb/releases/tag/v6.0.2
[erb-v6.0.3]: https://github.com/ruby/erb/releases/tag/v6.0.3
[erb-v6.0.4]: https://github.com/ruby/erb/releases/tag/v6.0.4
[erb-v6.0.5]: https://github.com/ruby/erb/releases/tag/v6.0.5
[erb-v6.0.6]: https://github.com/ruby/erb/releases/tag/v6.0.6
[erb-v6.0.7]: https://github.com/ruby/erb/releases/tag/v6.0.7
[etc-v1.5.0]: https://github.com/ruby/etc/releases/tag/v1.5.0
[fileutils-v1.8.1]: https://github.com/ruby/fileutils/releases/tag/v1.8.1
[io-console-v0.9.0]: https://github.com/ruby/io-console/releases/tag/v0.9.0
[io-console-v0.9.1]: https://github.com/ruby/io-console/releases/tag/v0.9.1
[io-console-v0.9.2]: https://github.com/ruby/io-console/releases/tag/v0.9.2
[io-console-v0.9.3]: https://github.com/ruby/io-console/releases/tag/v0.9.3
[io-console-v0.9.4]: https://github.com/ruby/io-console/releases/tag/v0.9.4
[ipaddr-v1.2.9]: https://github.com/ruby/ipaddr/releases/tag/v1.2.9
[json-v2.18.1]: https://github.com/ruby/json/releases/tag/v2.18.1
[json-v2.19.0]: https://github.com/ruby/json/releases/tag/v2.19.0
[json-v2.19.1]: https://github.com/ruby/json/releases/tag/v2.19.1
[json-v2.19.2]: https://github.com/ruby/json/releases/tag/v2.19.2
[json-v2.19.3]: https://github.com/ruby/json/releases/tag/v2.19.3
[json-v2.19.4]: https://github.com/ruby/json/releases/tag/v2.19.4
[json-v2.19.5]: https://github.com/ruby/json/releases/tag/v2.19.5
[json-v2.19.6]: https://github.com/ruby/json/releases/tag/v2.19.6
[json-v2.19.7]: https://github.com/ruby/json/releases/tag/v2.19.7
[json-v2.19.8]: https://github.com/ruby/json/releases/tag/v2.19.8
[json-v2.19.9]: https://github.com/ruby/json/releases/tag/v2.19.9
[json-v2.20.0]: https://github.com/ruby/json/releases/tag/v2.20.0
[json-v2.21.0]: https://github.com/ruby/json/releases/tag/v2.21.0
[json-v2.21.2]: https://github.com/ruby/json/releases/tag/v2.21.2
[json-v3.0.0.rc1]: https://github.com/ruby/json/releases/tag/v3.0.0.rc1
[json-v3.0.0]: https://github.com/ruby/json/releases/tag/v3.0.0
[net-http-v0.10.0]: https://github.com/ruby/net-http/releases/tag/v0.10.0
[net-protocol-v0.3.0]: https://github.com/ruby/net-protocol/releases/tag/v0.3.0
[net-protocol-v0.4.0]: https://github.com/ruby/net-protocol/releases/tag/v0.4.0
[open3-v0.3.0]: https://github.com/ruby/open3/releases/tag/v0.3.0
[openssl-v4.0.1]: https://github.com/ruby/openssl/releases/tag/v4.0.1
[openssl-v4.0.2]: https://github.com/ruby/openssl/releases/tag/v4.0.2
[pp-v0.6.4]: https://github.com/ruby/pp/releases/tag/v0.6.4
[prettyprint-v0.2.1]: https://github.com/ruby/prettyprint/releases/tag/v0.2.1
[psych-v5.4.0]: https://github.com/ruby/psych/releases/tag/v5.4.0
[psych-v5.5.0]: https://github.com/ruby/psych/releases/tag/v5.5.0
[resolv-v0.7.1]: https://github.com/ruby/resolv/releases/tag/v0.7.1
[resolv-v0.7.2]: https://github.com/ruby/resolv/releases/tag/v0.7.2
[resolv-v0.8.0]: https://github.com/ruby/resolv/releases/tag/v0.8.0
[resolv-v0.8.1]: https://github.com/ruby/resolv/releases/tag/v0.8.1
[strscan-v3.1.7]: https://github.com/ruby/strscan/releases/tag/v3.1.7
[strscan-v3.1.8]: https://github.com/ruby/strscan/releases/tag/v3.1.8
[tempfile-v0.3.2]: https://github.com/ruby/tempfile/releases/tag/v0.3.2
[time-v0.5.0]: https://github.com/ruby/time/releases/tag/v0.5.0
[timeout-v0.6.1]: https://github.com/ruby/timeout/releases/tag/v0.6.1
[tmpdir-v0.3.2]: https://github.com/ruby/tmpdir/releases/tag/v0.3.2
[uri-v1.1.2]: https://github.com/ruby/uri/releases/tag/v1.1.2
[zlib-v3.2.3]: https://github.com/ruby/zlib/releases/tag/v3.2.3
[zlib-v3.2.4]: https://github.com/ruby/zlib/releases/tag/v3.2.4
[power_assert-v3.1.0]: https://github.com/ruby/power_assert/releases/tag/v3.1.0
[rake-v13.4.0]: https://github.com/ruby/rake/releases/tag/v13.4.0
[rake-v13.4.1]: https://github.com/ruby/rake/releases/tag/v13.4.1
[rake-v13.4.2]: https://github.com/ruby/rake/releases/tag/v13.4.2
[test-unit-3.7.6]: https://github.com/test-unit/test-unit/releases/tag/3.7.6
[test-unit-3.7.7]: https://github.com/test-unit/test-unit/releases/tag/3.7.7
[test-unit-3.7.8]: https://github.com/test-unit/test-unit/releases/tag/3.7.8
[rss-0.3.3]: https://github.com/ruby/rss/releases/tag/0.3.3
[net-imap-v0.6.3]: https://github.com/ruby/net-imap/releases/tag/v0.6.3
[net-imap-v0.6.4]: https://github.com/ruby/net-imap/releases/tag/v0.6.4
[net-imap-v0.6.4.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.4.1
[net-imap-v0.6.5]: https://github.com/ruby/net-imap/releases/tag/v0.6.5
[net-imap-v0.6.6]: https://github.com/ruby/net-imap/releases/tag/v0.6.6
[net-imap-v0.6.7]: https://github.com/ruby/net-imap/releases/tag/v0.6.7
[net-smtp-v0.5.2]: https://github.com/ruby/net-smtp/releases/tag/v0.5.2
[rbs-v3.10.1]: https://github.com/ruby/rbs/releases/tag/v3.10.1
[rbs-v3.10.2]: https://github.com/ruby/rbs/releases/tag/v3.10.2
[rbs-v3.10.3]: https://github.com/ruby/rbs/releases/tag/v3.10.3
[rbs-v3.10.4]: https://github.com/ruby/rbs/releases/tag/v3.10.4
[rbs-v4.0.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.1
[rbs-v4.0.0.dev.2]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.2
[rbs-v4.0.0.dev.3]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.3
[rbs-v4.0.0.dev.4]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.4
[rbs-v4.0.0.dev.5]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.5
[rbs-v4.0.0]: https://github.com/ruby/rbs/releases/tag/v4.0.0
[rbs-v4.0.1.dev.1]: https://github.com/ruby/rbs/releases/tag/v4.0.1.dev.1
[rbs-v4.0.1.dev.2]: https://github.com/ruby/rbs/releases/tag/v4.0.1.dev.2
[rbs-v4.0.1]: https://github.com/ruby/rbs/releases/tag/v4.0.1
[rbs-v4.0.2]: https://github.com/ruby/rbs/releases/tag/v4.0.2
[rbs-v4.0.3]: https://github.com/ruby/rbs/releases/tag/v4.0.3
[rbs-v4.1.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.1.0.pre.1
[rbs-v4.1.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v4.1.0.pre.2
[rbs-v4.1.0]: https://github.com/ruby/rbs/releases/tag/v4.1.0
[rbs-v4.1.1.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.1.1.pre.1
[rbs-v4.1.1]: https://github.com/ruby/rbs/releases/tag/v4.1.1
[rbs-v4.1.2]: https://github.com/ruby/rbs/releases/tag/v4.1.2
[rbs-v4.1.3]: https://github.com/ruby/rbs/releases/tag/v4.1.3
[rbs-v4.2.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.2.0.pre.1
[rbs-v4.2.0]: https://github.com/ruby/rbs/releases/tag/v4.2.0
[bigdecimal-v4.1.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.0
[bigdecimal-v4.1.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.1
[bigdecimal-v4.1.2]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.2
[bigdecimal-v4.1.3]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.3
[resolv-replace-v0.2.0]: https://github.com/ruby/resolv-replace/releases/tag/v0.2.0
[nkf-v0.3.0]: https://github.com/ruby/nkf/releases/tag/v0.3.0
[syslog-v0.4.0]: https://github.com/ruby/syslog/releases/tag/v0.4.0
[csv-v3.3.6]: https://github.com/ruby/csv/releases/tag/v3.3.6
[repl_type_completor-v0.1.13]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.13
[repl_type_completor-v0.1.14]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.14
[repl_type_completor-v0.1.15]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.15
[repl_type_completor-v0.1.16]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.16
[pstore-v0.2.1]: https://github.com/ruby/pstore/releases/tag/v0.2.1
[rdoc-v7.0.4]: https://github.com/ruby/rdoc/releases/tag/v7.0.4
[rdoc-v7.1.0]: https://github.com/ruby/rdoc/releases/tag/v7.1.0
[rdoc-v7.2.0]: https://github.com/ruby/rdoc/releases/tag/v7.2.0
[rdoc-v8.0.0]: https://github.com/ruby/rdoc/releases/tag/v8.0.0
[rdoc-v8.1.0]: https://github.com/ruby/rdoc/releases/tag/v8.1.0
[win32ole-v1.9.3]: https://github.com/ruby/win32ole/releases/tag/v1.9.3
[irb-v1.17.0]: https://github.com/ruby/irb/releases/tag/v1.17.0
[irb-v1.18.0]: https://github.com/ruby/irb/releases/tag/v1.18.0
[reline-v0.7.0]: https://github.com/ruby/reline/releases/tag/v0.7.0
