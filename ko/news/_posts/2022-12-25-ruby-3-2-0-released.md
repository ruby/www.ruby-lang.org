---
layout: news_post
title: "Ruby 3.2.0 릴리스"
author: "shia"
translator:
date: 2022-12-25 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

Ruby {{ release.version }} 릴리스를 알리게 되어 기쁩니다. Ruby 3.2는 많은 기능과 성능 향상을 포함하고 있습니다.


## WASI 기반 웹어셈블리 지원

WASI에 기반해 웹어셈블리를 지원하는 첫 이식판입니다. 이를 통해 CRuby 바이너리는 웹 브라우저, 서버리스 엣지 환경, 그 이외의 웹어셈블리/WASI를 사용 가능한 환경에서 동작할 수 있습니다. 현재 이 이식판은 스레드 API를 사용하지 않는 기본적인 테스트와 부트스트랩 테스트 스위트를 통과합니다.

![](https://i.imgur.com/opCgKy2.png)

### 배경

[웹어셈블리(Wasm)](https://webassembly.org/)는 본래 웹 브라우저에서 프로그램을 안전하고 빠르게 실행하기 위해서 만들어졌습니다. 하지만 그 목적 중 하나인 프로그램을 다양한 환경에서 안전하고 효율적으로 실행하는 것은 웹뿐만이 아니라 일반적인 애플리케이션도 바라던 것입니다.

[WASI(The WebAssembly System Interface)](https://wasi.dev/)는 이러한 용도를 위해 설계되었습니다. 이러한 애플리케이션은 운영체제와 통신해야 합니다만, 웹어셈블리는 시스템 인터페이스를 가지지 않는 가상 머신 위에서 동작합니다. WASI는 이 인터페이스를 표준화합니다.

Ruby의 웹어셈블리/WASI 지원은 이러한 프로젝트들을 활용하기 위함입니다. 이를 통해 Ruby 개발자들이 약속한 플랫폼에서 움직이는 애플리케이션을 작성할 수 있습니다.

### 사용 예시

이는 개발자가 웹어셈블리 환경에서 CRuby를 활용할 수 있도록 돕습니다. 하나의 예로, [TryRuby playground](https://try.ruby-lang.org/playground/)의 CRuby 지원이 있습니다. 이제 CRuby를 웹 브라우저 상에서 직접 사용해볼 수 있습니다.

### 기술적인 부분

현재 WASI와 웹어셈블리 자체에는 Fiber, 예외 처리, GC를 구현하기 위한 일부 기능이 부족합니다. 이는 여전히 개발중이라는 점도 있지만, 보안 때문이기도 합니다. 그래서 CRuby는 사용자 공간에서의 실행을 제어하기 위한 바이너리 변환 기술인 Asyncify를 사용해 그 차이를 메꿉니다.

나아가서 Ruby 앱을 간단하게 단일 .wasm 파일로 패키징할 수 있도록 [WASI 상에 VFS](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)를 구현했습니다. 이는 Ruby 앱의 배포를 쉽게 해줄 것입니다.

### 관련 링크

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)


## 실용화 단계인 YJIT

![](https://i.imgur.com/X9ulfac.png)

* YJIT은 이제 정식 기능입니다.
    * 1년 이상의 기간에 실제 환경의 부하로 테스트되었으며, 안정적임이 증명되었습니다.
* YJIT은 x86-64와 arm64/aarch64 CPU에서 움직이는 Linux, MacOS, BSD와 같은 UNIX 환경을 지원합니다.
    * 이번 릴리스는 Apple M1/M2, AWS Graviton, Raspberry Pi 4등을 추가로 지원합니다.
* YJIT을 빌드하기 위해서는 Rst 1.58.0 이상을 요구합니다. [[Feature #18481]]
    * CRuby를 YJIT과 함께 빌드하기 위해서는 `./configure` 스크립트를 실행하기 전에 1.58.0 이상의 `rustc`를 설치해주세요.
    * 문제에 빠진 경우에는 YJIT 팀에 연락해주세요.
* YJIT 3.2 릴리스는 3.1보다 빠르며, 메모리 오버헤드는 약 1/3이 되었습니다.
    * [yjit-bench](https://github.com/Shopify/yjit-bench)에서 YJIT을 사용하면 그렇지 않은 Ruby 인터프리터보다 41% 빠릅니다.
    * JIT 코드의 물리 메모리는 지연되어 할당됩니다. Ruby 3.1과는 다르게,
      `--yjit-exec-mem-size`는 JIT 코드에 의해서 실제로 최적화될 때까지
      물리 메모리 페이지에 할당되지 않기 때문에 Ruby 프로세스의 RSS는
      최소화됩니다.
    * JIT 코드로 인한 메모리 소비가 `--yjit-exec-mem-size`에 도달했을 때
      모든 코드 페이지를 해방하는 코드 GC를 도입했습니다.
    * `RubyVM::YJIT.runtime_stats`는 기존의 `inline_code_size`, `outlined_code_size`에
      더해 코드 GC 정보인 `code_gc_count`, `live_page_count`, `freed_page_count`,
      `freed_code_size`를 반환합니다.
* `RubyVM::YJIT.runtime_stats`가 제공하는 통계 정보가 이번 릴리스부터 이용가능합니다.
    * 통계 정보를 계산하고 얻기 위해서는 Ruby를 `--yjit-stats`와 함께 실행하세요(약간의 실행시간 오버헤드가 발생합니다).
* YJIT은 Object shape를 이용해 최적화합니다. [[Feature #18776]]
* 정수를 유효화하는 단위를 작게하여 새 정수를 정의할 때 더 적은 코드를 무효화합니다. [[Feature #18589]]
* `--yjit-exec-mem-size`의 기본값이 64(MiB)로 변경됩니다.
* `--yjit-call-threshold`의 기본값이 30으로 변경됩니다.

## ReDoS에 대한 정규표현식 개선

정규표현식 일치는 기대와는 다르게 시간이 오래 걸리는 경우가 있습니다. 신뢰할 수 없는 입력에 대해서 비효율적일 가능성이 있는 정규표현식을 일치시키고 있다면, 공격자는 이를 이용해 효율적으로 서비스 거부 공격(이를 정규표현식 DoS, 또는 ReDoS라고 부릅니다)이 가능합니다.

ReDoS의 위협을 현저하게 완화할 수 있는 2개의 개선을 도입했습니다.

### 개선된 정규표현식 일치 알고리즘

Ruby 3.2부터 정규표현식 일치 알고리즘이 메모이제이션 기술에 의해 매우 개선됩니다.

```
# Ruby 3.1에서 10초가 걸리지만, Ruby 3.2에서는 0.003초가 걸립니다.

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

이 개선된 알고리즘은 대부분의 정규표현식 일치(실험에서는 약 90%)가 선형 시간으로 완료됩니다.

이 최적화는 각 일치마다 입력의 길이에 비례하여 메모리를 소비할 수 있습니다. 이 메모리 확보는 필요할 때까지 발생하지 않으며, 일반적인 정규표현식 일치는 입력 길이에 비해 최대 10배 소비할 뿐이므로, 실상황에서 문제는 없을 것이라고 예상합니다. 만약 실제 애플리케이션에서 정규표현식 일치로 인한 메모리 부족이 발생하는 경우에는 보고해주세요.

기능 제안 티켓은 <https://bugs.ruby-lang.org/issues/19104>입니다.

### 정규표현식 타임아웃

위에서 설명한 최적화는 고급 기능(e.g. 역참조나 전후방탐색)이나 매우 큰 고정 회수 반복을 포함하는 정규표현식에서는 적용할 수 없습니다. 이러한 경우를 위한 방법으로, 정규표현식 일치에 타임아웃 기능이 추가되었습니다.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

`Regexp.timeout`은 전역 설정임에 주의하세요. 일부의 특수한 정규표현식에 대해서만 다른 타임아웃 설정을 사용하고 싶다면, `Regexp.new` 의 `timeout` 키워드를 사용할 수 있습니다.

```ruby
Regexp.timeout = 1.0

# 이 정규표현식은 타임아웃 설정이 없습니다.
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # 타임아웃이 발생하지 않습니다.
```

기능 제안 티켓은 <https://bugs.ruby-lang.org/issues/17837>입니다.

## 그 이외의 주목할 만한 새 기능

### SyntaxSuggest

* `syntax_suggest`(구 `dead_end`)의 기능이 Ruby에 통합됩니다. 이는 `end`가 빠져있거나, 하나 더 있을 때 발생하는 에러의 위치를 찾고 개발에 집중할 수 있도록 돕습니다. 예를 들어 다음과 같은 에러를 찾아줍니다.

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
  ```

  [[Feature #18159]]


### ErrorHighlight

* TypeError와 ArgumentError의 인수를 가리킬 수 있습니다.

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

### 언어

* 익명 나머지 인수, 익명 나머지 키워드 인수가 파라미터로서뿐만 아니라,
  인수로서도 사용할 수 있게 됩니다. [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* 1개의 인수와 나머지를 키워드로 받는 프록은 인수를 자동으로 전개하지
  않습니다. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* 정수 대입에서의 정수 평가 순서가 단일 대입시의 평가 순서와
  일관성을 가지게 됩니다. 다음 코드의 경우,

    ```ruby
    foo::BAR = baz
    ```

  `foo`는 이제 `baz`보다 먼저 호출됩니다. 마찬가지로 정수의 다중 대입에서도
  왼쪽에서 오른쪽으로 평가됩니다. 다음 코드의 경우,

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  아래와 같은 순서로 평가됩니다.

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* 검색 패턴은 이제 정식 기능입니다.
  [[Feature #18585]]

* Methods taking a rest parameter (like `*args`) and wishing to delegate keyword
  arguments through `foo(*args)` must now be marked with `ruby2_keywords`
  (if not already the case). In other words, all methods wishing to delegate
  keyword arguments through `*args` must now be marked with `ruby2_keywords`,
  with no exception. This will make it easier to transition to other ways of
  delegation once a library can require Ruby 3+. Previously, the `ruby2_keywords`
  flag was kept if the receiving method took `*args`, but this was a bug and an
  inconsistency. A good technique to find potentially missing `ruby2_keywords`
  is to run the test suite, find the last method which must
  receive keyword arguments for each place where the test suite fails, and use `puts nil, caller, nil` there. Then check that each
  method/block on the call chain which must delegate keywords is correctly marked
  with `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Accidentally worked without ruby2_keywords in Ruby 2.7-3.1, ruby2_keywords
    # needed in 3.2+. Just like (*args, **kwargs) or (...) would be needed on
    # both #foo and #bar when migrating away from ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## 성능 향상

### MJIT

* MJIT 컴파일러는 `ruby_vm/mjit/compiler`라는 이름으로 Ruby를 사용해 재구현되었습니다.
* MJIT 컴파일러는 MJIT 워커에 의해 실행된 네이티브 스레드 대신
  포크된 프로세스에서 실행됩니다. [[Feature #18968]]
    * 이 영향으로 Microsoft Visual Studio (MSWIN)이 더이상 지원되지 않습니다.
* MinGW는 더이상 지원되지 않습니다. [[Feature #18824]]
* `--mjit-min-calls`를 `--mjit-call-threshold`로 변경했습니다.
* `--mjit-max-cache`의 기본값을 10000에서 100으로 되돌렸습니다.

### PubGrub

* Bundler 2.4는 [Molinillo](https://github.com/CocoaPods/Molinillo) 대신에 [PubGrub](https://github.com/jhawthorn/pub_grub) 의존해결기를 사용합니다.
  * PubGrub은 Dart 프로그래밍 언어의 `pub` 패키지 매니저에서 사용하고 있는 차세대 의존성 해결 알고리즘입니다.
  * 이 변경으로 지금과는 다른 해결 결과를 얻을 수 있습니다. 그런 경우에는 [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)에 보고해주세요.

* RubyGems는 Ruby 3.2에서도 Molinillo를 그대로 사용합니다. 미래에 PubGrub으로 변경할 계획입니다.

## 3.1 이후로 주목할 만한 변경

* Data
    * 단순하며 변경불가능한 값 객체를 표현하기 위한 새 주요 클래스입니다.
      이 클래스는 Struct와 비슷하며, 부분적으로 구현을 공유하고 있습니다만,
      더 간결하며 한정적인 API를 제공합니다. [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * `Hash#shift`는 이제 해시가 비어있다면
      기본 값이나 기본 프록을 호출한 결과 값을 반환하는 대신
      언제나 nil을 반환합니다. [[Bug #16908]]

* MatchData
    * `MatchData#byteoffset`이 추가되었습니다. [[Feature #13110]]

* Module
    * `Module.used_refinements`가 추가되었습니다. [[Feature #14332]]
    * `Module#refinements`가 추가되었습니다. [[Feature #12737]]
    * `Module#const_added`가 추가되었습니다. [[Feature #17881]]

* Proc
    * `Proc#dup`은 서브클래스의 인스턴스를 반환합니다. [[Bug #17545]]
    * `Proc#parameters`는 이제 람다 키워드를 받습니다. [[Feature #15357]]

* Refinement
    * `Refinement#refined_class`가 추가되었습니다. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * `parse`, `parse_file`, `of`에 `error_tolerant` 옵션이 추가되었습니다. [[Feature #19013]]
      이 옵션을 사용하면,
        1. SyntaxError가 발생하지 않습니다
        2. 올바르지 않은 입력에 대해서도 AST가 반환됩니다
        3. 파서가 입력의 마지막에 도달했지만 `end`가 부족한 상태일 경우, 부족한 `end`를 추가합니다.
        4. 들여쓰기를 참고해 `end`를 키워드로 취급합니다.

        ```ruby
        # error_tolerant 옵션을 사용하지 않은 경우
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # error_tolerant 옵션을 사용한 경우
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` 는 들여쓰기를 참고해 키워드로 취급됩니다
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * `parse`, `parse_file`, `of`에 `keep_tokens` 옵션이 추가되었습니다. [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set은 이제 `require "set"`할 필요 없이 사용 가능한 내장 클래스입니다. [[Feature #16989]]
      현재는 `Set` 상수를 사용하거나 `Enumerable#to_set`을 호출하면 자동으로 로드됩니다.

* String
    * `String#byteindex`와 `String#byterindex`가 추가되었습니다. [[Feature #13110]]
    * 유니코드 버전이 15.0.0, 에모지 버전이 15.0으로 갱신되었습니다. [[Feature #18037]]
      (이는 정규표현식에도 적용됩니다)
    * `String#bytesplice`가 추가되었습니다. [[Feature #18598]]

* Struct
    * `keyword_init: true` 없이 `Struct.new`에 키워드 인수를 넘겨
      Struct 클래스를 초기화할 수 있습니다. [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # From Ruby 3.2, the following code also works without keyword_init: true.
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

## 호환성 문제

주의: 기능 개선, 버그 수정은 포함되어 있지 않습니다.

### 삭제된 정수

폐기 예정이었던 정수가 삭제됩니다.

* `Fixnum` and `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### 삭제된 메소드

폐기 예정이었던 메소드가 삭제됩니다.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Stdlib 호환성 문제

### 서드파티 소스 코드의 동봉을 폐기

* `libyaml`, `libffi`와 같은 서드파티 라이브러리의 소스 코드를 더이상 포함하지 않습니다.

    * libyaml의 소스 코드는 psych로부터 제거되었습니다. Ubuntu/Debian 환경에서는 `libyaml-dev`가 필요합니다. 패키지 이름은 각 환경별로 다를 수 있습니다.

    * 동봉된 libffi 소스 코드도 `fiddle`로부터 제거되었습니다.

* Psych와 fiddle이 특정 버전의 libyaml과 libffi 소스코드와 함께 정적 빌드를 할 수 있게 됩니다. 다음과 같이 psych를 libyml-0.2.5와 함께 빌드할 수 있습니다.

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    그리고 다음과 같이 fiddle를 libffi-3.4.4와 함께 빌드할 수 있습니다.

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## C API 변경

### 갱신된 C API

다음 API가 갱신됩니다.

* PRNG 갱신
  * `rb_random_interface_t`가 갱신되어 새 버전이 되었습니다.
    이 인터페이스를 구버전으로 사용하고 있다면 새 인터페이스를 사용해야합니다.
    또한 `init_int32` 함수를 정의할 필요가 있습니다.

### 삭제된 C API

다음 폐기 예정인 API가 삭제됩니다.

* `rb_cData` 변수.
* "taintedness"와 "trustedness" 함수. [[Feature #16131]]

## 표준 라이브러리 갱신

* Bundler

    * Rust 확장을 사용하는 젬을 위한 젬 생성 명령에 --ext=rust 옵션을 추가했습니다.
      [[GH-rubygems-6149]]
    * Git 저장소 클론이 빨라집니다. [[GH-rubygems-4475]]

* RubyGems

    * Cargo 빌더를 위한 mswin 지원이 추가됩니다. [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape`가 `CGI.escapeHTML`보다 빨라졌습니다.
        * 이스케이프가 필요한 문자열이 없는 경우, String 객체를 생성하지 않습니다.
        * 인수가 String 객체일 경우, `#to_s` 메소드를 호출하지 않습니다.
        * `ERB::Util.html_escape`의 별명으로 `ERB::Escape.html_escape`가 추가됩니다.
          더이상 Rails에서 몽키패치를 할 필요가 없습니다.

* IRB

    * debug.gem 통합 명령이 추가됩니다. `debug`, `break`, `catch`,
      `next`, `delete`, `step`, `continue`, `finish`, `backtrace`, `info`
        * 이 명령들은 Gemfile에 `gem "debug"`가 없어도 동작합니다.
        * [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb)를 참고하세요.
    * Pry와 비슷한 명령과 기능이 추가됩니다.
        * `edit`와 `show_cmds`(Pry의 `help`)가 추가됩니다.
        * `ls` 명령이 출력을 필터링하기 위한 `-g`, `-G` 옵션이 추가됩니다.
        * `show_source`의 별명으로 `$`가 추가되었으며, 이제 인수를 이스케이프하지 않아도 됩니다.
        * `whereami`의 별명으로 `@`가 추가됩니다.

*   다음 기본 젬이 갱신되었습니다.

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   다음 내장 젬이 갱신되었습니다.

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

기본 젬과 내정 젬의 상세한 설명은 [logger의 GitHub 릴리스](https://github.com/ruby/logger/releases)와 같은 GitHub 릴리스 또는 Changelog를 참조해주세요.

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})를
확인해주세요.

이러한 변경사항에 따라, Ruby 3.1.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
가 이루어졌습니다!

메리 크리스마스, 해피 홀리데이, 그리고 Ruby 3.2과 함께 프로그래밍을 즐겨보세요!

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

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
