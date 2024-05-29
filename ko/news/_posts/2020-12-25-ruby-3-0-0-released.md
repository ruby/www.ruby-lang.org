---
layout: news_post
title: "Ruby 3.0.0 릴리스"
author: "naruse"
translator: "yous"
date: 2020-12-25 00:00:00 +0000
lang: ko
---

Ruby 3.0.0 릴리스를 알리게 되어 기쁩니다. 우리는 2015년부터 성능, 동시성, 타입 기능을 목표로 한 Ruby 3을 위해 열심히 개발해 왔습니다. 특히 성능 부분에서, Matz 씨는 "Ruby3는 Ruby2보다 3배 더 빠를 것"이라고 해 [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3)으로 알려지기도 했습니다.

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

NES의 게임 에뮬레이션 작업을 통해 싱글 스레드 성능을 측정한 [optcarrot 벤치마크](https://github.com/mame/optcarrot)를 보면, Ruby 2.0보다 3배 더 빠른 성능을 달성했습니다! <details>이 벤치마크는 [https://github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark)에 표기된 환경에서 측정되었습니다. [8c510e4095 커밋](https://github.com/ruby/ruby/commit/8c510e4095)이 Ruby 3.0 코드로 사용되었습니다. 환경과 벤치마크에 따라 3배 빠르지 않을 수도 있습니다.</details>

Ruby 3.0.0의 목표는 다음 항목을 통해 다루고 있습니다.
* 성능
  * MJIT
* 동시성
  * Ractor
  * Fiber 스케줄러
* 타입 (정적 분석)
  * RBS
  * TypeProf

위의 성능 향상과 함께, Ruby 3.0에 몇 가지 새 기능이 도입됩니다.

## 성능

> 제가 콘퍼런스 키노트에서 처음 "Ruby3x3"을 선언했을 때, 코어 팀 구성원을 포함한 많은 사람들은 "Matz 씨는 허풍쟁이"라고 느꼈습니다. 사실 저도 그렇게 느꼈어요. 하지만 우리는 해냈습니다. (일부 벤치마크에서) Ruby3.0을 Ruby2.0보다 세 배 빠르게 만드는 데 성공한 코어 팀이 자랑스럽습니다. -- Matz

### MJIT

MJIT의 많은 개선이 추가되었습니다. 자세한 내용은 NEWS를 확인하세요.

Ruby 3.0에서 JIT는 게임([Optcarrot](https://github.com/mame/optcarrot)), AI([Rubykon](https://github.com/benchmark-driver)), 적은 메서드를 여러 번 호출하는 데 대부분의 시간을 사용하는 애플리케이션 등의 제한적인 작업 성능을 향상시킵니다.

Ruby 3.0이 [JIT이 적용된 코드 크기를 현저히 줄였지만](https://twitter.com/k0kubun/status/1256142302608650244), Rails와 같은 작업에 대해서는 아직 준비되지 않았습니다. 굉장히 많은 메서드에 시간을 사용하는 Rails의 경우 JIT으로 인해 명령어 캐시 미스가 더 악화됩니다. 이 문제에 대한 추후 개선은 Ruby 3.1 소식을 기다려주세요.

## 동시성 / 병렬성

> 지금은 멀티코어 시대입니다. 동시성은 아주 중요합니다. Ruby는 Ractor, Async Fiber와 함께 진정한 동시성 언어가 될 것입니다. --- Matz

### Ractor (실험적)

Ractor는 스레드 안전에 대한 걱정이 없는 병렬 실행을 제공하기 위해 설계된 액터 모델과 비슷한 동시 실행 추상화 모델입니다.

여러 개의 Ractor를 만들고 병렬로 실행할 수 있습니다. Ractor는 일반 객체를 공유할 수 없기 때문에 스레드 안전한 병렬 프로그램을 만들 수 있습니다. Ractor 간의 통신은 메시지 넘기기를 통해서 지원됩니다.

객체 공유를 제한하기 위해, Ractor는 Ruby 문법에 여러 제한을 추가했습니다(여러 개의 Ractor를 사용하지 않는다면 제한은 없습니다).

명세와 구현은 아직 완성되지 않았으므로 앞으로 변경될 수 있습니다. 그러므로 이 기능은 실험적으로 제공되며 처음 `Ractor.new`를 실행하면 "실험적 기능"이라는 경고를 표시합니다.

다음은 유명한 벤치마크 tak 함수([Tak (function) - Wikipedia](https://en.wikipedia.org/wiki/Tak_(function)))의 실행 시간을 측정하는 작은 프로그램입니다. 4번 순차적으로 실행하거나, Ractor를 통해 4번 병렬로 실행합니다.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # 순차적 버전
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # 병렬 버전
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

이 결과는 Ubuntu 20.04, Intel(R) Core(TM) i7-6700(4 코어, 8 하드웨어 스레드)에서 측정되었습니다. 이는 병렬 버전이 순차적 버전보다 3.87배 빠르다는 것을 보여줍니다.

더 자세한 내용은 [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html)를 확인하세요.

### Fiber 스케줄러

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

이 예제 프로그램은 HTTP 요청 몇 개를 동시에 수행합니다.

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

이 코드는 이벤트 루프를 지원하는 [async](https://github.com/socketry/async)를 사용합니다. 이 이벤트 루프는 `Net::HTTP`를 논블로킹 작업으로 만들기 위해 `Fiber#scheduler` 훅을 사용합니다. Ruby의 논블로킹 실행을 제공하기 위해 다른 gem도 이 인터페이스를 사용할 수 있습니다. 그리고 이러한 gem은 논블로킹 훅을 지원하는 Ruby의 다른 구현체(예: JRuby, TruffleRuby)와도 호환됩니다.

## 정적 분석

> 2010년대는 정적 타입 프로그래밍 언어의 시대였습니다. Ruby는 추상 해석을 통해, 타입 선언 없이 정적 타입 체크를 하여 미래를 추구합니다. RBS와 TypeProf는 미래를 향한 첫걸음입니다. 다음 단계도 기대해주세요. --- Matz

### RBS

RBS는 Ruby 프로그램의 타입을 기술하기 위한 언어입니다.

TypeProf와 다른 도구들을 포함해서, RBS를 지원하는 타입 검사기는 RBS 정의를 통해 Ruby 프로그램을 더 잘 이해합니다.

클래스나 모듈에 정의된 메서드, 인스턴스 변수와 타입, 상속이나 믹스인 관계에 대한 정의를 작성할 수 있습니다.

RBS의 목표는 Ruby 프로그램에서 흔히 보이는 패턴을 지원하는 것과 유니언 타입, 메서드 오버로딩, 제네릭을 포함하는 고급 타입을 작성할 수 있도록 하는 것입니다. 또한 _인터페이스 타입_을 이용해 덕타이핑을 지원합니다.

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

더 자세한 내용은 [TypeProf 문서](https://github.com/ruby/typeprof/blob/master/doc/doc.md)와 [데모](https://github.com/ruby/typeprof/blob/master/doc/demo.md)를 확인하세요.

TypeProf는 실험적이고 아직 완성되지 않았습니다. Ruby 언어의 일부만 지원되고, 타입 오류 감지 기능은 제한적입니다. 하지만 언어 기능의 지원 범위, 분석 성능, 사용성이 빠르게 개선되고 있는 중입니다. 어떤 종류의 피드백이든 환영합니다.

## 그 이외의 주목할 만한 기능

* 한 줄 패턴 매칭을 재설계했습니다. (실험적)

    * `=>`가 추가됩니다. 오른 방향 대입처럼 사용할 수 있습니다.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in`이 `true` 또는 `false`를 반환하도록 변경됩니다.

      ```ruby
      # 버전 3.0
      0 in 1 #=> false

      # 버전 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* 검색 패턴이 추가됩니다. (실험적)

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

* IRB에 긴 코드를 붙여 넣는 속도가 Ruby 2.7.0에 포함된 버전보다 53배 빨라졌습니다. 예를 들어, [이 샘플 코드](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b)를 붙여 넣는 데 드는 시간이 11.7초에서 0.22초로 줄어들었습니다.


<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* IRB에 `measure` 커맨드가 추가되었습니다. 간단한 실행 시간 측정이 가능합니다.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## 그 이외의 2.7 이후로 주목할 만한 변경

* 키워드 인자가 다른 인자들로부터 분리됩니다.
  * 원칙적으로 Ruby 2.7에서 경고를 출력하는 코드는 동작하지 않습니다. 자세한 내용은 [이 문서](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)를 확인하세요.
  * 한편, 인자를 전달할 때 앞쪽 인자를 사용할 수 있습니다.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* 패턴 매칭(`case`/`in`)은 이제 실험적이지 않습니다.
  * 더 자세한 내용은 [패턴 매칭 문서](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html)를 확인하세요.
* `$SAFE` 기능이 완전히 제거됩니다. 이 값은 이제 일반 전역 변수입니다.
* Ruby 2.5에서 백트레이스의 순서가 역순이 되었습니다만, 이를 취소합니다. 이제 백트레이스는 Ruby 2.4처럼 동작합니다. 예외가 발생한 곳의 오류 메시지와 줄 번호가 가장 먼저 출력되며, 이를 호출한 곳의 정보가 그 뒤에 출력됩니다.
* 표준 라이브러리를 업데이트했습니다.
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * 등
* 다음 라이브러리는 이제 내장 gem이나 표준 라이브러리가 아닙니다.
  각 기능이 필요한 경우에는 해당하는 gem을 설치해주세요.
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc
* 다음 기본 gem은 이제 내장 gem이 됩니다.
  * rexml
  * rss
* 다음 표준 라이브러리가 기본 gem이 되고, rubygems.org에 배포됩니다.
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }})를
확인해주세요.

이러한 변경사항에 따라, Ruby 2.7.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)가
이루어졌습니다!

> Ruby3.0은 마일스톤입니다. 언어는 진화했고, 호환성은 유지했습니다. 이게 끝이 아닙니다. Ruby는 계속 진보하고, 더 대단해질 것입니다. 기대해주세요! --- Matz

메리 크리스마스, 해피 홀리데이, Ruby 3.0과 함께 프로그래밍을 즐겨보세요!

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
