---
layout: news_post
title: "루비 2.6.0-preview2 릴리스"
author: "naruse"
translator: "shia"
date: 2018-05-31 00:00:00 +0000
lang: ko
---

루비 2.6.0-preview2 릴리스를 알리게 되어 기쁩니다.

루비 2.6.0-preview2는 루비 2.6.0의 두 번째 프리뷰입니다.
이 프리뷰는 JIT이라는 중요한 새 기능을 포함하고 있기 때문에 평소보다 빠르게 릴리스됩니다.
그 일부를 아래에서 소개합니다.

## JIT

루비 2.6은 JIT(Just-in-time) 컴파일러의 첫 구현체를 포함합니다.

JIP 컴파일러는 루비 프로그램의 실행 성능을 향상시키는 것이 목적입니다.
다른 언어의 일반적인 JIT 컴파일러와는 다르게, 루비의 JIT 컴파일러는 C 코드를 디스크에 출력한 뒤, 일반적인 C 컴파일러 프로세스를 사용해 네이티브 코드를 생성하도록 합니다.
다음을 참고하세요. [Vladimir Makarov가 작성한 MJIT 구조](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

JIT 컴파일을 사용하려면 `--jit` 옵션을 커맨드라인이나 `$RUBYOPT` 환경 변수에 지정합니다. `--jit-verbose=1`을 지정하면 실행 중인 JIT 컴파일의 기본적인 정보를 출력합니다. 다른 옵션에 대해서는 `ruby --help`를 확인하세요.

이번 JIT 릴리스의 주 목적은 2.6 릴리스 전에 각 플랫폼에서 잘 동작하는지, 보안상의 문제가 발생하는지 미리 확인하는 것입니다.
현재 JIT 컴파일러는 루비가 gcc나 clang로 빌드되었으며, 해당 컴파일러가 런타임에서 사용 가능한 경우에만 이용할 수 있습니다. 그 이외에는 아직 이용할 수 없습니다.

2.6.0-preview2에서는 JIT를 이용하기 위한 기반을 추가하고 매우 적은 최적화만이 구현되어 있습니다. 이 릴리스에 대해서 간단한 벤치마크를 이용하여 잠재적인 성능 향상을 확인할 수 있습니다만, Rails 애플리케이션과 같은 대규모 프로그램에서 루비 JIT 컴파일러의 최종적인 성능을 측정할만한 단계는 아닙니다.

앞으로 루비의 성능을 한 단계 향상시켜줄 것으로 기대되고 있는 메서드 인라인화를 구현할 예정입니다.
또한 지원 환경을 늘려나갈 계획이며, 그 첫 번째로는 Visual Studio를 지원하는 것입니다.

새로운 루비의 성능을 기대해주세요.

## RubyVM::AST [Experimental]

루비 2.6에는 `RubyVM::AST` 모듈이 도입되었습니다.

이 모듈에은 문자열을 파싱하여 AST(추상구문트리)의 Node를 돌려주는 `parse` 메서드, 파일을 파싱하는 `parse_file` 메서드가 들어있습니다.

`RubyVM::AST::Node`도 도입되었습니다. 이 클래스의 인스턴스로부터 위치정보나 자식 노드를 얻을 수 있습니다. 이 기능은 실험적으로 포함되었으며, AST 노드의 구조는 호환성을 보장하지 않습니다.

## 새로운 기능

* `Kernel#yield_self`의 별칭으로 `then`이 추가되었습니다. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `rescue`가 없는 `else`가 문법 에러가 됩니다. [EXPERIMENTAL]

* ASCII 이외의 대문자로 시작하는 상수를 정의할 수 있게 됩니다. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* 종료 지정이 없는 범위 연산자. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  종료 지정이 없는 범위 연산자, `(1..)`가 추가됩니다. 이는 끝이 없는 것처럼 취급됩니다. 다음은 전형적인 사용 예시입니다.

      ary[1..]                          # ary[1..-1]와 동치
      (1..).each {|index| ... }         # 1로 시작하는 무한 루프
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* `Binding#source_location`을 추가했습니다. [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)
  * 이 메서드는 `binding`의 소스 코드 상의 위치를 `__FILE__`과 `__LINE__`을 가지는 배열로 돌려줍니다. 지금까지는 `eval("[__FILE__, __LINE__]", binding)`을 사용하여 같은 정보를 획득할 수 있었습니다만, `Kernel#eval`이 `binding`의 소스 코드의 위치를 무시하도록 변경할 예정입니다. [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352) 그러므로 앞으로는 `Kernel#eval`보다는 이 새로운 메서드를 사용해야 합니다.

* `Kernal#system`이 실패했을 경우 `false`를 돌려주는 대신, 에러를 던지도록 하는 `:exception` 옵션을 추가했습니다. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

## 성능 향상

* `Proc#call`이 더 이상 `$SAFE`를 고려하지 않아도 되어 속도가 빨라졌습니다. [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  `Proc#call`을 대량으로 호출하는 `lc_fizzbuzz` 벤치마크가 1.4배 빨라졌습니다. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* `block`이 블록 파라미터인 경우의 `block.call`이 빨라졌습니다. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  루비 2.5에서는 블록 넘기기의 성능이 향상되었습니다만 [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045),
  추가로 2.6에서는 넘겨진 블록의 호출이 개선되었습니다.
  간단한 벤치마크에서 2.6배의 성능 향상을 확인했습니다.

## 2.5 이후 주목할 만한 변경

* `$SAFE`가 프로세스 전역 변수로 취급되며, `0` 이외의 값을 설정한 후에 `0`으로 되돌리는 것이 가능해집니다. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* `ERB.new`에 `safe_level`을 넘기는 기능이 제거 예정이 되었습니다. 또한 `trim_mode`와 `eoutvar`는 키워드 변수로 변경됩니다. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* RubyGems 3.0.0.beta1을 병합했습니다.

자세한 내용은 [뉴스](https://github.com/ruby/ruby/blob/v2_6_0_preview2/NEWS)와
[커밋 로그](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)를 참고하세요.

이러한 변경사항에 따라,
루비 2.5.0 이후 [파일 4999개 수정, 45744줄 추가(+), 30885줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
하였습니다!

여러분도 루비 2.6.0-preview2와 함께 즐거운 프로그래밍하세요!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.gz>

      SIZE:   16170732 bytes
      SHA1:   6867b00e81af0b70fcb6f1aa7fc22d89d48a7d12
      SHA256: ee15ab35f17c942b1f41bd792f2494f639affff6e03babf44708b72fdbb6de34
      SHA512: 95c5a277785dfeb3006503e1b9ccccefdf6ce29669d4576f0191ee6986ba0e3567fbbed18a8d2b1f147d637434e4a3a4fdf47d84995e10ad4a354950e9092690

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.zip>

      SIZE:   19850776 bytes
      SHA1:   eba80a09b552ce3142fd571ff5867a13736d170e
      SHA256: 97fc187b90570fce110d22803a319ab04e68700692b2b6b4e9961886f1a931e5
      SHA512: d5501819635bda64ac3dc717815652b692302b44a7cdf4c08edfa5cb9ec7f79a70fffc534879b316a4a9584825ed3c0948667beae2d7c313de58583931b981f4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.bz2>

      SIZE:   14209461 bytes
      SHA1:   a9b1b4f359601b94b3f5b77115fcbf3790ff69cd
      SHA256: d8ede03d5ad3abd9d2c81cf0ad17a41d22b747c003cc16fd59befb2aaf48f0b2
      SHA512: 3872227e9b1c97c206d19bf1e6ce15a38ee15a26c431b4436605dea67affcf16372358984df76b35e7abaa902c15c16f533ac7af47e3031dea9451bbe459b693

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.xz>

      SIZE:   11525372 bytes
      SHA1:   e795abe1a4f828b3d851f7148b4bf6c9d9a7e7fd
      SHA256: 00ddfb5e33dee24469dd0b203597f7ecee66522ebb496f620f5815372ea2d3ec
      SHA512: bef3e90e97d6e58889cd500c591c579b728ca5833022b690182c0bf4d661e437b3a2ca33470dac35fcf693897819b9d7f500c0f71b707e2fcdcb0644028f2c03
