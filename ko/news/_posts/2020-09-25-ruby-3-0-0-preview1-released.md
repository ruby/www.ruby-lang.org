---
layout: news_post
title: "루비 3.0.0 Preview 1 릴리스"
author: "naruse"
translator: "shia"
date: 2020-09-25 00:00:00 +0000
lang: ko
---

루비 3.0.0-preview1 릴리스를 알리게 되어 기쁩니다.

이는 많은 새 기능과 성능 향상을 포함하고 있습니다.

## RBS

RBS는 루비 프로그램의 타입을 기술하기 위한 언어입니다.
RBS를 지원하기 위한 타입 프로파일러와 다른 도구들을 포함하는 타입 검사기는 RBS 정의를 통해 루비 프로그램을 더 잘 이해합니다.

클래스나 모듈에 정의된 메서드, 인스턴스 변수와 타입, 상속이나 믹스인 관계에 대한 정의를 작성할 수 있습니다.
RBS의 목표는 루비 프로그램에서 흔히 보이는 패턴을 지원하는 것과 유니언 타입, 메서드 오버로딩, 제네릭을 포함하는 고급 타입을 지원하는 것입니다. 또한 *인터페이스 타입*을 이용해 덕타이핑을 지원합니다.

루비 3.0은 RBS로 작성된 타입 정의를 해석하고 처리하는 `rbs` 젬을 포함합니다.

다음은 RBS의 작은 예시입니다.

``` rbs
module ChatApp
  VERSION: String

  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|`는 유니언 타입을 의미합니다. 여기에서는 `User` 또는 `Bot`이라는 의미입니다.

    def initialize: (String) -> void

    def post: (String, from: User | Bot) -> Message   # 메서드 오버로딩이 지원됩니다.
            | (File, from: User | Bot) -> Message
  end
end
```

더 자세한 내용은 [rbs 젬의 README](https://github.com/ruby/rbs)를 확인하세요.

## Ractor (실험적)

Ractor는 스레드 안전에 대한 걱정이 없는 병렬 실행을 제공하기 위해 설계된 액터 모델과 비슷한 동시 실행 추상화 모델입니다.

여러 개의 ractor를 만들고 병렬로 실행할 수 있습니다. Ractor는 일반 객체를 공유할 수 없기 때문에 스레드 안전한 병렬 프로그램을 만들 수 있습니다.
ractor 간의 통신은 메시지 넘기기를 통해서 지원됩니다.

객체 공유를 제한하기 위해, Ractor는 루비 문법에 여러 제한을 추가했습니다(여러 개의 ractor를 사용하지 않는다면 차이는 없습니다).

명세와 구현은 아직 완성되지 않았으므로 앞으로 변경될 수 있습니다. 그러므로 이 기능은 실험적으로 제공되며 Ractor가 생성되면 실험적 기능을 사용하고 있다는 경고를 표시합니다.

다음은 `prime?`을 2개의 ractor를 통해 계산하는 프로그램입니다. 이는 2개 이상의 코어를 사용하는 경우, 순차적으로 실행하는 프로그램보다 약 2배 빠릅니다.

``` ruby
require 'prime'

# r1, r2에 보낸 정수들로 'n.prime?'을 병렬 실행
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# 매개 변수를 송신
r1.send 2**61 - 1
r2.send 2**61 + 15

# r1, r2의 실행 결과 대기
p r1.take #=> true
p r2.take #=> true
```

더 자세한 내용은 [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md)를 확인하세요.

## 스케줄러 (실험적)

블로킹 명령에 끼어들 수 있는 `Thread#scheduler`가 도입됩니다.
이는 기존에 존재하는 코드를 변경하지 않고 가벼운 동시성을 지원할 수 있게 합니다.

현재 지원되는 클래스와 메서드는 다음과 같습니다.

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write`와 관련 메서드(예: `#wait_readable`, `#gets`, `#puts` 등).
- `IO#select`는 *지원되지 않습니다*.

현재 동시성을 위한 기점은 `Fiber.schedule{...}`입니다만, 이는 루비 3의 릴리스 때 변경될 가능성이 있습니다.

현재 [`Async::Scheduler`](https://github.com/socketry/async/pull/56)의 테스트 스케줄러가 이용 가능합니다.
자세한 내용은 [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md)를 확인하세요. [Feature #16786]

**주의**: 이 기능은 매우 실험적입니다. 이름과 기능 모두 다음 프리뷰 릴리스에서 변경될 수 있습니다.

## 그 이외의 주목할 만한 기능

* 오른쪽으로 값을 할당하는 명령이 추가됩니다.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* `end` 없는 메서드 정의가 추가됩니다.

  ``` ruby
  def square(x) = x * x
  ```

* 검색 패턴이 추가됩니다.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* `Hash#except`가 내장됩니다.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* 메모리 뷰가 실험적인 기능으로 추가됩니다.

    * 이는 숫자 배열이나 비트맵 이미지와 같은 메모리 공간을 확장 라이브러리 간에 교환하기 위한 새로운 C-API 집합입니다. 확장 라이브러리는 모양, 요소의 형식 등으로 구성된 메모리 공간의 메타 정보를 공유할 수 있습니다. 이러한 메타 정보를 사용하여 확장 라이브러리는 다차원 배열을 적절하게 공유할 수 있습니다. 이 기능은 파이썬의 버퍼 프로토콜을 참고하여 설계되었습니다.

## 성능 향상

* MJIT에 많은 개선이 추가되었습니다. 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)를 확인하세요.

## 그 이외의 2.7 이후로 주목할 만한 변경

* 키워드 인자가 다른 인자들로부터 분리됩니다.
  * 원칙적으로 루비 2.7에서 경고를 출력하는 코드는 동작하지 않습니다. 자세한 내용은 [문서](https://www.ruby-lang.org/ko/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)를 확인하세요.
  * 한편, 인자를 전달할 때 앞쪽 인자를 사용할 수 있습니다.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* `$SAFE` 기능이 완전히 제거됩니다. 이 값은 이제 일반 전역 변수입니다.

* 루비 2.5에서 백트레이스의 순서가 역순이 되었습니다만, 이를 취소합니다. 이제 백트레이스는 루비 2.4와 동일하게 동작합니다. 예외가 발생한 곳의 에러 메시지와 줄 번호가 가장 먼저 출력되며, 이를 호출한 곳의 정보가 그 뒤에 출력됩니다.

* 표준 라이브러리를 업데이트했습니다.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* 다음 라이브러리들은 이제 기본으로 포함되지 않습니다.
  각 기능이 필요한 경우에는 해당하는 젬을 설치해주세요.
  * net-telnet
  * xmlrpc

* 기본 젬이 내장 젬으로 승격됩니다.
  * rexml
  * rss

* 표준 라이브러리가 기본 젬으로 승격됩니다. 다음 기본 젬들이 rubygems.org에서 배포 중입니다.
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)를 확인해주세요.

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

이러한 변경사항에 따라, 루비 2.7.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)가 이루어졌습니다!

루비 3.0.0-preview1을 사용해보시고, 피드백을 보내주세요!

## 다운로드

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## 3.0.0-preview2 예고

정적 타입 분석 기능을 위한 ["타입 프로파일러"](https://github.com/mame/ruby-type-profiler)를 포함할 예정입니다. 계속 지켜봐주세요!

## 루비는

루비는 1993년에 Matz(마츠모토 유키히로)가 처음 개발했고, 현재는 오픈 소스로서 개발되고 있습니다. 이는 여러 플랫폼에서 동작하며, 특히 웹 개발에서 전 세계적으로 이용되고 있습니다.
