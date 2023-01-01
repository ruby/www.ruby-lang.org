---
layout: news_post
title: "Ruby 3.2.0 Preview 3 릴리스"
author: "naruse"
translator: "shia"
date: 2022-11-11 00:00:00 +0000
lang: ko
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview3" | first %}

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

현재 WASI와 웹어셈블리 자체에는 Fiber, 예외 처리, GC를 구현하기 위한 일부 기능이 부족합니다. 이는 여전히 개발 중이라는 점도 있지만, 보안 때문이기도 합니다. 그래서 CRuby는 사용자 공간에서의 실행을 제어하기 위한 바이너리 변환 기술인 Asyncify를 사용해 그 차이를 메꿉니다.

나아가서 Ruby 앱을 간단하게 단일 .wasm 파일로 패키징할 수 있도록 [WASI 상에 VFS](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)를 구현했습니다. 이는 Ruby 앱의 배포를 쉽게 해줄 것입니다.

### 관련 링크

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## ReDoS에 대한 정규표현식 개선

정규표현식 일치는 기대와는 다르게 시간이 오래 걸리는 경우가 있습니다. 신뢰할 수 없는 입력에 대해서 비효율적일 가능성이 있는 정규표현식을 일치시키고 있다면, 공격자는 이를 이용해 효율적으로 서비스 거부 공격(이를 정규표현식 DoS, 또는 ReDoS라고 부릅니다)이 가능합니다.

ReDoS의 위협을 현저하게 완화할 수 있는 2개의 개선을 도입했습니다.

### 개선된 정규표현식 일치 알고리즘

Ruby 3.2부터 정규표현식 일치 알고리즘이 메모이제이션 기술에 의해 매우 개선됩니다.

```
# Ruby 3.1에서 10초가 걸리지만, Ruby 3.2에서는 0.003초가 걸립니다.

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

이 개선된 알고리즘은 대부분의 정규표현식 일치(실험에서는 약 90%)가 선형 시간으로 완료됩니다.

(Preview 사용자에게: 이 최적화는 각 일치마다 입력의 길이에 비례하여 메모리를 소비할 수 있습니다. 이 메모리 확보는 필요할 때까지 발생하지 않으며, 일반적인 정규표현식 일치는 입력 길이에 비해 최대 10배 소비할 뿐이므로, 실상황에서 문제는 없을 것이라고 예상합니다. 만약 실제 애플리케이션에서 정규표현식 일치로 인한 메모리 부족이 발생하는 경우에는 보고해주세요.)

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

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

기능 제안 티켓은 <https://bugs.ruby-lang.org/issues/17837>입니다.

## 그 이외의 주목할 만한 새 기능

### 서드파티 소스 코드를 더 이상 내장하지 않음

* `libyaml`, `libffi`와 같은 서드파티 라이브러리의 소스 코드를 더 이상 포함하지 않습니다.

    * libyaml의 소스 코드는 psych로부터 제거되었습니다. Ubuntu/Debian 환경에서는 `libyaml-dev`가 필요합니다. 패키지 이름은 각 환경별로 다를 수 있습니다.

    * 동봉된 libffi 소스 코드도 `fiddle`로부터 제거되었습니다.

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

* 1개의 위치 인수와 나머지를 키워드로 받는 프록은 인수를 자동으로 전개하지
  않습니다. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* 상수 대입에서의 상수 평가 순서가 단일 속성 대입 시의 평가 순서와
  일관성을 가지게 됩니다. 다음 코드의 경우,

    ```ruby
    foo::BAR = baz
    ```

  `foo`는 이제 `baz`보다 먼저 호출됩니다. 마찬가지로 상수의 다중 대입에서도
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

* `*args`와 같은 나머지 파라미터를 받는 메서드에서 `foo(*args)`를 통해 키워드 인수를
  위임하고 싶은 경우, 반드시 `ruby2_keywords`를 사용해야 합니다. 다르게 말하면,
  `*args`를 사용해 키워드 인수를 위임하고 싶은 모든 메서드는 예외 없이
  `ruby2_keywords`를 사용해야 합니다. 이 변경으로 라이브러리가 Ruby 3 이상을
  요구하게 되었을 때 다른 위임 방식으로의 마이그레이션이 간단해집니다.
  지금까지 메서드가 `*args`를 넘겨받았을 때, `ruby2_keywords` 플래그가 유지되었습니다만,
  이는 의도치 않은 동작이었으며, 일관성이 없었습니다. 빠져있었던 `ruby2_keywords`를
  찾아내기 위한 좋은 방법 중 한 가지로 테스트를 실행한 뒤, 실패하는 각각의 테스트에서
  키워드 인수를 받는 마지막 메서드를 찾고, 그곳에서 `puts nil, caller, nil`를 사용하세요.
  그리고 나서 호출 체인의 각 메서드/블록이 키워드를 위임할 때 `ruby2_keywords`를
  올바르게 사용하고 있는지 확인하세요. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # 의도치 않게 Ruby 2.7-3.1에서 ruby2_keywords 없이 동작했습니다만,
    # Ruby 3.2+에서는 ruby2_keywords가 필요합니다. ruby2_keywords를 사용하지 않는 경우,
    # #foo, #bar 양쪽에 (*args, **kwargs)나 (...)이 필요합니다.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## 성능 향상

### YJIT

* arm64, aarch64 상의 UNIX 환경을 지원합니다.
* YJIT 빌드하기 위해서는 Rust 1.58.1 이상을 요구합니다. [[Feature #18481]]

## 3.1 이후로 주목할 만한 변경

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

* Set
    * Set은 이제 `require "set"`할 필요 없이 사용 가능한 내장 클래스입니다. [[Feature #16989]]
      현재는 `Set` 상수를 사용하거나 `Enumerable#to_set`을 호출하면 자동으로 로드됩니다.

* String
    * `String#byteindex`와 `String#byterindex`가 추가되었습니다. [[Feature #13110]]
    * 유니코드 버전이 14.0.0, 에모지 버전이 14.0으로 갱신되었습니다. [[Feature #18037]]
      (이는 정규표현식에도 적용됩니다)
    * `String#bytesplice`가 추가되었습니다. [[Feature #18598]]

* Struct
    * `keyword_init: true` 없이 `Struct.new`에 키워드 인수를 넘겨
      Struct 클래스를 초기화할 수 있습니다. [[Feature #16806]]

## 호환성 문제

주의: 기능 버그 수정은 포함되어 있지 않습니다.

### 삭제된 상수

폐기 예정이었던 상수가 삭제됩니다.

* `Fixnum`, `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### 삭제된 메서드

폐기 예정이었던 메서드가 삭제됩니다.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Stdlib 호환성 문제

* `Psych`는 더 이상 `libyaml` 소스 코드를 포함하지 않습니다.
  이용자는 패키지 매니저를 사용해서 스스로 `libyaml` 라이브러리를 설치해야합니다. [[Feature #18571]]

## C API 변경

### 갱신된 C API

다음 API가 갱신됩니다.

* PRNG 갱신
  * `rb_random_interface_t`가 갱신되어 이제 버전을 가집니다.
    이 인터페이스를 구버전으로 사용하고 있다면 새 인터페이스를 사용해야 합니다.
    또한 `init_int32` 함수를 정의할 필요가 있습니다.

### 삭제된 C API

다음 폐기 예정인 API가 삭제됩니다.

* `rb_cData` 변수.
* "taintedness"와 "trustedness" 함수. [[Feature #16131]]

### 표준 라이브러리 갱신

* SyntaxSuggest

  * `syntax_suggest`(구 `dead_end`)의 기능이 Ruby에 통합됩니다.
    [[Feature #18159]]

* ErrorHighlight
  * TypeError와 ArgumentError가 발생한 인수를 가리킵니다.

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

*   다음 기본 gem이 갱신되었습니다.
    * RubyGems 3.4.0.dev
    * bigdecimal 3.1.2
    * bundler 2.4.0.dev
    * cgi 0.3.2
    * date 3.2.3
    * error_highlight 0.4.0
    * etc 1.4.0
    * io-console 0.5.11
    * io-nonblock 0.1.1
    * io-wait 0.3.0.pre
    * ipaddr 1.2.4
    * json 2.6.2
    * logger 1.5.1
    * net-http 0.2.2
    * net-protocol 0.1.3
    * ostruct 0.5.5
    * psych 5.0.0.dev
    * reline 0.3.1
    * securerandom 0.2.0
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 0.0.1
    * timeout 0.3.0
*   다음 내장 gem이 갱신되었습니다.
    * minitest 5.16.3
    * net-imap 0.2.3
    * rbs 2.6.0
    * typeprof 0.21.3
    * debug 1.6.2
*   다음 기본 gem은 이제 내장 gem이 되었습니다.

더 자세한 내용은 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)나
[커밋 로그](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})를
확인해 주세요.

이러한 변경사항에 따라, Ruby 3.1.0 이후로 [파일 {{ release.stats.files_changed }}개 수정, {{ release.stats.insertions }}줄 추가(+), {{ release.stats.deletions }}줄 삭제(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)가
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



[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18037]: https://bugs.ruby-lang.org/issues/18037
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
[Bug #19100]:     https://bugs.ruby-lang.org/issues/19100
[Feature #19013]: https://bugs.ruby-lang.org/issues/19013
