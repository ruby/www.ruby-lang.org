---
layout: news_post
title: "루비 2.6.0 릴리스"
author: "naruse"
translator: "shia"
date: 2018-12-25 00:00:00 +0000
lang: ko
---

루비 2.6.0의 릴리스를 알리게 되어 기쁩니다.

이는 여러 새 기능과 기능 향상을 포함하며, 주목할 만한 것은 아래와 같습니다.

 * 새로운 JIT 컴파일러.
 * `RubyVM::AbstractSyntaxTree` 모듈.

## JIT [Experimental]

루비 2.6은 JIT(Just-in-time) 컴파일러의 첫 구현체를 포함합니다.

JIT 컴파일러는 루비 프로그램의 실행 성능을 향상시키는 것이 목적입니다. 다른 언어의 일반적인 JIT 컴파일러와는 다르게, 루비의 JIT 컴파일러는 C 코드를 디스크에 출력한 뒤, 일반적인 C 컴파일러 프로세스를 사용해 네이티브 코드를 생성하도록 합니다. [Vladimir Makarov가 작성한 MJIT 구조](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization)를 참고하세요.

JIT 컴파일을 사용하려면 `--jit` 옵션을 커맨드라인이나 `$RUBYOPT` 환경 변수에 지정합니다. `--jit-verbose=1`을 지정하면 실행 중인 JIT 컴파일의 추가적인 정보를 출력합니다. 다른 옵션에 대해서는 `ruby --help`나 [문서](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage)를 확인하세요.

현재 JIT 컴파일러는 루비가 gcc나 clang, Microsoft VC++로 빌드되었으며, 해당 컴파일러가 런타임에서 사용 가능한 경우에만 이용할 수 있습니다.

2.6.0에서는 [Optcarrot](https://github.com/mame/optcarrot)이라는 CPU 성능을 요구하는 벤치마크에서 루비 2.5에 비해 [1.7배의 성능 향상](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208)을 이루었습니다. 하지만 여전히 실험적인 기능이며 Rails 애플리케이션 같은 메모리를 요구하는 작업에서는 이득이 없을 수도 있습니다. 더 자세한 설명은 [Ruby 2.6 JIT - Progress and Future](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf)(영문)를 참고하세요.

새로운 루비의 성능을 기대해주세요.

## `RubyVM::AbstractSyntaxTree` [Experimental]

루비 2.6에는 `RubyVM::AbstractSyntaxTree` 모듈이 도입되었습니다. **이 모듈의 하위 호환성은 보장되지 않습니다**.

이 모듈에는 문자열을 파싱하여 AST(추상구문트리)의 노드를 돌려주는 `parse` 메서드, 파일을 파싱하여 AST의 노드를 돌려주는 `parse_file` 메서드가 들어있습니다.

`RubyVM::AbstractSyntaxTree::Node`도 도입되었습니다. 이 클래스의 인스턴스로부터 위치정보나 자식 노드를 얻을 수 있습니다. 이 기능은 실험적입니다.

## 주목할 만한 새로운 기능

* `Kernel#yield_self`의 별칭으로 `then`이 추가되었습니다. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* ASCII 이외의 대문자로 시작하는 상수를 정의할 수 있게 됩니다. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* 종료 지정이 없는 범위 연산자가 추가됩니다. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  종료 지정이 없는 범위 연산자 `(1..)`가 추가됩니다. 이는 끝이 없는 것처럼 취급됩니다. 다음은 전형적인 사용 예시입니다.

      ary[1..]                          # ary[1..-1]와 동치
      (1..).each {|index| ... }         # 1로 시작하는 무한 루프
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* `Enumerable#chain`과 `Enumerator#+`가 추가되었습니다. [[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* 함수 결합 연산자인 `<<`와 `>>`가 `Proc`과 `Method`에 추가되었습니다. [[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; identical to f(g(3))
      (f >> g).call(3) # -> 15; identical to g(f(3))

* `Binding#source_location`을 추가했습니다. [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  이 메서드는 `binding`의 소스 코드 상의 위치를 `__FILE__`과 `__LINE__`을 가지는 배열로 돌려줍니다. `Kernel#eval`이 `binding`의 소스 코드의 위치를 무시하도록 변경할 예정입니다. [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352) 그러므로 지금까지 사용하던 `eval("[__FILE__, __LINE__]", binding)`로 같은 정보를 획득할 수 없게 됩니다. 앞으로는 `Kernel#eval`보다는 새로운 `Binding#source_location` 메서드를 사용하게 될 것입니다.

* `Kernal#system`이 실패했을 경우 `false`를 돌려주는 대신, 에러를 던지도록 하는 `:exception` 옵션을 추가했습니다. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* `Coverage`의 oneshot_lines 모드를 추가했습니다. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * 이 모드는 '각 줄이 몇 번 실행되었는지' 대신 '각 줄이 한 번 이상 실행되었는지'를 확인합니다. 각 줄의 훅은 최대 1회만 실행되며, 실행된 후에는 플래그를 제거하기 때문에 오버헤드 없이 실행됩니다.
  * `Coverage.start`에 `:oneshot_lines` 키워드 인수가 추가됩니다.
  * `Coverage.result`에 `:stop`과 `:clear` 키워드 인수가 추가됩니다. 만약 `clear`가 참이라면, 이는 카운터를 0으로 초기화합니다. 만약 `stop`이 참이라면 커버리지 측정을 비활성화합니다.
  * 주어진 소스 코드로부터 'stub'을 생성하는 간단한 헬퍼 함수인 `Coverage.line_stub`을 추가합니다.

* `FileUtils#cp_lr`을 추가했습니다. 이는 `cp_r`처럼 동작하지만, 복사를 하는 대신 링크를 생성합니다. [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## 성능 향상

* `Proc#call`이 더 이상 `$SAFE`를 고려하지 않아도 되어 속도가 빨라졌습니다.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  `Proc#call`을 대량으로 호출하는 `lc_fizzbuzz` 벤치마크가 1.4배 빨라졌습니다. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* `block`이 블록 파라미터인 경우의 `block.call`이 빨라졌습니다. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  루비 2.5에서 개선된 블록 넘기기 기능을 포함하여, 루비 2.6에서는 블록 평가가 간단한 벤치마크에서 2.6배 빨라졌습니다. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

* Transient Heap(`theap`)이 도입되었습니다. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  `theap`은 특정 클래스(`Array`, `Hash`, `Object`, `Struct`)가 가리키는 짧은 생애를 가지는 메모리 객체들을 관리합니다. 예를 들어 작고 짧게 생존하는 Hash 객체의 생성이 2배 빨라집니다. rdoc 벤치마크에서 6-7%의 성능 향상을 확인했습니다.

* Fiber의 컨텍스트 변경 속도를 현저하게 향상시키는 코루틴의 네이티브 구현체(`arm32`, `arm64`, `ppc64le`, `win32`, `win64`, `x86`, `amd64`)가 추가되었습니다. [[Feature #14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield`와 `Fiber#resume`은 64비트 리눅스에서 5배 빨라집니다. Fiber를 빈번하게 사용하는 프로그램에서는 전체적으로 5%의 성능 향상을 기대할 수 있습니다.

## 2.5 이후 주목할 만한 변경

* `$SAFE`가 프로세스 전역 변수로 취급되며, `0` 이외의 값을 설정한 후에 `0`으로 되돌리는 것이 가능해집니다. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* `ERB.new`에 `safe_level`을 넘기는 기능이 제거될 예정입니다. 또한 `trim_mode`와 `eoutvar`는 키워드 변수로 변경됩니다. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* 유니코드 지원 버전이 11로 갱신되었습니다. 이는 루비 2.6의 TEENY 릴리스에서 12와 12.1로 갱신될 예정입니다. 이는 [새 일본 연호](http://blog.unicode.org/2018/09/new-japanese-era.html)(영문)에 대한 지원을 포함합니다.

* RubyGems 3.0.1을 병합했습니다. `--ri`와 `--rdoc` 옵션이 제거되었습니다. 대신에 `--document`와 `--no-document`를 사용해주세요.

* [Bundler](https://github.com/bundler/bundler)를 기본 젬으로 병합했습니다.

* `rescue`가 없는 `else`가 문법 에러가 됩니다. [EXPERIMENTAL] [[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

[NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS)나 [커밋 로그](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)에서 더 자세한 설명을 확인할 수 있습니다.

이러한 변경 사항에 따라, 루비 2.5.0 이후로 [파일 6437개 수정, 231471줄 추가(+), 98498줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)가 이루어졌습니다!

메리 크리스마스, 행복한 휴일 보내시고, 루비 2.6과 함께 즐거운 프로그래밍 하세요!

## 알려진 문제점

_(이 문단은 2019년 1월 28일에 추가되었습니다.)_

* [`Net::Protocol::BufferedIO#write`로 긴 멀티바이트 문자열을 전송할 때 `NoMethodError` 에러가 발생하는 문제](https://bugs.ruby-lang.org/issues/15468)

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
