---
layout: news_post
title: "Ruby 3.0.0 Preview 2 릴리스"
author: "naruse"
translator: "yous"
date: 2020-12-08 00:00:00 +0000
lang: ko
---

Ruby 3.0.0-preview2 릴리스를 알리게 되어 기쁩니다.

이번 버전은 많은 새 기능과 성능 향상을 포함하고 있습니다.

## 정적 분석

### RBS

RBS는 Ruby 프로그램의 타입을 기술하기 위한 언어입니다.

TypeProf와 다른 도구들을 포함해서, RBS를 지원하는 타입 검사기는 RBS 정의를 통해 Ruby 프로그램을 더 잘 이해합니다.

클래스나 모듈에 정의된 메서드, 인스턴스 변수와 타입, 상속이나 믹스인 관계에 대한 정의를 작성할 수 있습니다.

RBS의 목표는 Ruby 프로그램에서 흔히 보이는 패턴을 지원하는 것과 유니언 타입, 메서드 오버로딩, 제네릭을 포함하는 고급 타입을 지원하는 것입니다. 또한 _인터페이스 타입_을 이용해 덕타이핑을 지원합니다.

Ruby 3.0은 RBS로 작성된 타입 정의를 해석하고 처리하는 `rbs` gem을 포함합니다.
다음은 클래스, 모듈, 상수 정의를 포함하는 RBS의 작은 예시입니다.

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|`는 유니언 타입을 의미합니다. 여기에서는 `User` 또는 `Bot`이라는 의미입니다.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # 메서드 오버로딩을 지원합니다.
            | (File, from: User | Bot) -> Message
  end
end
```

더 자세한 내용은 [rbs gem의 README](https://github.com/ruby/rbs)를 확인하세요.

### TypeProf

TypeProf는 Ruby 패키지에 포함된 타입 분석 도구입니다.

지금의 TypeProf는 타입 추론 도구 역할을 합니다.

TypeProf는 타입 어노테이션이 없는 일반적인 Ruby 코드를 읽어서, 어떤 메서드가 정의되어 있고 어떻게 사용되는지 분석하고, RBS 형식으로 타입 시그니처의 프로토타입을 생성합니다.

다음은 TypeProf의 간단한 데모입니다.

예제 입력입니다.

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

예제 출력입니다.

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

입력을 "test.rb"에 저장하고 "typeprof test.rb" 커맨드를 통해 TypeProf를 실행할 수 있습니다.

[TypeProf를 온라인에서 사용](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=)해볼 수도 있습니다. (TypeProf를 서버 쪽에서 실행하는 거라서, 잠시 동작하지 않을 수도 있습니다!)

더 자세한 내용은 [문서](https://github.com/ruby/typeprof/blob/master/doc/doc.md)와 [데모](https://github.com/ruby/typeprof/blob/master/doc/demo.md)를 확인하세요.

TypeProf는 실험적이고 아직 완성되지 않았습니다. Ruby 언어의 일부만 지원되고, 타입 오류 감지 기능은 제한적입니다. 하지만 언어 기능의 지원 범위, 분석 성능, 사용성이 빠르게 개선되고 있는 중입니다. 어떤 종류의 피드백이든 환영합니다.

## Ractor (실험적)
Ractor는 스레드 안전에 대한 걱정이 없는 병렬 실행을 제공하기 위해 설계된 액터 모델과 비슷한 동시 실행 추상화 모델입니다.

여러 개의 Ractor를 만들고 병렬로 실행할 수 있습니다. Ractor는 일반 객체를 공유할 수 없기 때문에 스레드 안전한 병렬 프로그램을 만들 수 있습니다. Ractor 간의 통신은 메시지 넘기기를 통해서 지원됩니다.

객체 공유를 제한하기 위해, Ractor는 Ruby 문법에 여러 제한을 추가했습니다(여러 개의 Ractor를 사용하지 않는다면 제한은 없습니다).

명세와 구현은 아직 완성되지 않았으므로 앞으로 변경될 수 있습니다. 그러므로 이 기능은 실험적으로 제공되며 처음 `Ractor.new`를 실행하면 "실험적 기능"이라는 경고를 표시합니다.

다음은 2개의 Ractor를 통해 `n.prime?`(`n`은 상대적으로 큰 정수)을 계산하는 작은 프로그램입니다. 병렬 컴퓨터에서 순차적으로 실행하는 프로그램보다 약 2배 빠르다는 걸 확인할 수 있습니다.

``` ruby
require 'prime'
# r1, r2에 보낸 정수들로 n.prime?을 병렬 실행
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end
# 파라미터를 송신
r1.send 2**61 - 1
r2.send 2**61 + 15
# expr1, expr2의 실행 결과 대기
p r1.take #=> true
p r2.take #=> true
```

더 자세한 내용은 [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md)를 확인하세요.

## Fiber 스케줄러

블로킹 작업에 끼어들 수 있는 `Fiber#scheduler`가 도입됩니다. 이는 기존에 존재하는 코드를 변경하지 않고 가벼운 동시성을 지원할 수 있게 합니다. 어떻게 동작하는지 궁금하다면 ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc)을 보세요.

현재 지원되는 클래스와 메서드는 다음과 같습니다.

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write`와 관련 메서드(예: `#wait_readable`, `#gets`, `#puts` 등).
- `IO#select`는 *지원되지 않습니다*.
(Async gem에 대해 링크와 함께 설명하기). 이 예제는 몇 가지 HTTP 요청을 동시에 수행합니다.
(다음을 설명하기:)
1. async는 외부 gem이다.
2. async는 다음 새 기능을 사용한다.

``` ruby
require 'async'
require 'net/http'
require 'uri'
Async do
  ["ruby", "python", "c"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

## 그 이외의 주목할 만한 기능

* 한 줄 패턴 매칭이 `in` 대신 `=>`를 사용합니다.
    ``` ruby
    # 버전 3.0
    {a: 0, b: 1} => {a:}
    p a # => 0
    # 버전 2.7
    {a: 0, b: 1} in {a:}
    p a # => 0
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
* end 없는 메서드 정의가 추가됩니다.
    ``` ruby
    def square(x) = x * x
    ```
* `Hash#except`가 내장됩니다.
    ``` ruby
    h = { a: 1, b: 2, c: 3 }
    p h.except(:a) #=> {:b=>2, :c=>3}
    ```
* 메모리 뷰가 실험적인 기능으로 추가됩니다.
    * 이는 숫자 배열이나 비트맵 이미지와 같은 메모리 공간을 확장 라이브러리 간에 교환하기 위한 새로운 C-API 집합입니다. 확장 라이브러리는 모양, 요소의 형식 등으로 구성된 메모리 공간의 메타데이터를 공유할 수 있습니다. 이러한 메타데이터를 사용하여 확장 라이브러리는 다차원 배열을 적절하게 공유할 수 있습니다. 이 기능은 Python의 버퍼 프로토콜을 참고하여 설계되었습니다.

## 성능 향상

* MJIT에 많은 개선이 추가되었습니다. 자세한 내용은 NEWS를 확인하세요.
* IRB에 긴 코드를 붙여 넣는 속도가 Ruby 2.7.0에 포함된 버전보다 53배 빨라졌습니다. 예를 들어, [이 샘플 코드](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b)를 붙여 넣는 데 드는 시간이 11.7초에서 0.22초로 줄어들었습니다.

## 그 이외의 2.7 이후로 주목할 만한 변경

* 키워드 인자가 다른 인자들로부터 분리됩니다.
  * 원칙적으로 Ruby 2.7에서 경고를 출력하는 코드는 동작하지 않습니다. 자세한 내용은 [문서](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)를 확인하세요.
  * 한편, 인자를 전달할 때 앞쪽 인자를 사용할 수 있습니다.
    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```
* `$SAFE` 기능이 완전히 제거됩니다. 이 값은 이제 일반 전역 변수입니다.
* Ruby 2.5에서 백트레이스의 순서가 역순이 되었습니다만, 이를 취소합니다. 이제 백트레이스는 Ruby 2.4처럼 동작합니다. 예외가 발생한 곳의 오류 메시지와 줄 번호가 가장 먼저 출력되며, 이를 호출한 곳의 정보가 그 뒤에 출력됩니다.
* 표준 라이브러리를 업데이트했습니다.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5
* 다음 라이브러리는 이제 기본으로 포함되지 않습니다.
  각 기능이 필요한 경우에는 해당하는 gem을 설치해주세요.
  * net-telnet
  * xmlrpc
* 다음 기본 gem은 이제 내장 gem이 됩니다.
  * rexml
  * rss
* 다음 표준 라이브러리가 기본 gem이 되고, rubygems.org에 배포됩니다.
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

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview2/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview2)를
확인해주세요.

{% assign release = site.data.releases | where: "version", "3.0.0-preview2" | first %}

이러한 변경사항에 따라, Ruby 2.7.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0)가
이루어졌습니다!

Ruby 3.0.0-preview2를 사용해보시고, 피드백을 보내주세요!

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
