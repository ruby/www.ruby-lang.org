---
layout: news_post
title: "루비 2.6.0-rc1 릴리스"
author: "naruse"
translator: "shia"
date: 2018-12-06 00:00:00 +0000
lang: ko
---

루비 2.6.0-rc1의 릴리스를 알리게 되어 기쁩니다.

루비 2.6.0-rc1은 루비 2.6.0의 첫 번째 릴리스 후보입니다.
이는 다음과 같은 여러 새 기능과 기능 향상을 포함합니다.

## JIT

루비 2.6은 JIT(Just-in-time) 컴파일러의 첫 구현체를 포함합니다.

JIT 컴파일러는 루비 프로그램의 실행 성능을 향상시키는 것이 목적입니다.
다른 언어의 일반적인 JIT 컴파일러와는 다르게, 루비의 JIT 컴파일러는 C 코드를 디스크에 출력한 뒤, 일반적인 C 컴파일러 프로세스를 사용해 네이티브 코드를 생성하도록 합니다.
[Vladimir Makarov가 작성한 MJIT 구조](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)를 참고하세요.

JIT 컴파일을 사용하려면 `--jit` 옵션을 커맨드라인이나 `$RUBYOPT` 환경 변수에 지정합니다.
`--jit-verbose=1`을 지정하면 실행 중인 JIT 컴파일의 기본적인 정보를 출력합니다. 다른 옵션에 대해서는 `ruby --help`를 확인하세요.

이번 JIT 릴리스의 주 목적은 2.6 릴리스 전에 각 플랫폼에서 잘 동작하는지, 보안상의 문제가 발생하는지 미리 확인하는 것입니다.
현재 JIT 컴파일러는 루비가 gcc나 clang, Microsoft VC++로 빌드되었으며, 해당 컴파일러가 런타임에서 사용 가능한 경우에만 이용할 수 있습니다. 그 이외에는 아직 이용할 수 없습니다.

2.6.0-rc1에서는 Optcarrot이라는 CPU 성능을 요구하는 벤치마크에서 1.7배의 성능 향상을 이루었습니다(다음을 참조: https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208). Rails 애플리케이션 같은 메모리를 요구하는 작업에서도 성능을 향상시킬 것입니다.

새로운 루비의 성능을 기대해주세요.

## RubyVM::AbstractSyntaxTree [Experimental]

루비 2.6에는 `RubyVM::AbstractSyntaxTree` 모듈이 도입되었습니다.

이 모듈에는 문자열을 파싱하여 AST(추상구문트리)의 노드를 돌려주는 `parse` 메서드, 파일을 파싱하여 AST의 노드를 돌려주는 `parse_file` 메서드가 들어있습니다.
`RubyVM::AbstractSyntaxTree::Node`도 도입되었습니다. 이 클래스의 인스턴스로부터 위치정보나 자식 노드를 얻을 수 있습니다. 이 기능은 실험적으로 포함되었으며, AST 노드의 구조는 호환성을 보장하지 않습니다.

## 새로운 기능

* `Kernel#yield_self`의 별칭으로 `then`이 추가되었습니다. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `rescue`가 없는 `else`가 문법 에러가 됩니다. [EXPERIMENTAL]

* ASCII 이외의 대문자로 시작하는 상수를 정의할 수 있게 됩니다. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* 종료 지정이 없는 범위 연산자. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  종료 지정이 없는 범위 연산자 `(1..)`가 추가됩니다. 이는 끝이 없는 것처럼 취급됩니다. 다음은 전형적인 사용 예시입니다.

      ary[1..]                          # ary[1..-1]와 동치
      (1..).each {|index| ... }         # 1로 시작하는 무한 루프
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* `Binding#source_location`을 추가했습니다. [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  이 메서드는 `binding`의 소스 코드 상의 위치를 `__FILE__`과 `__LINE__`을 가지는 배열로 돌려줍니다. `Kernel#eval`이 `binding`의 소스 코드의 위치를 무시하도록 변경할 예정입니다. [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352) 그러므로 지금까지 사용하던 `eval("[__FILE__, __LINE__]", binding)`로 같은 정보를 획득할 수 없게 됩니다. 앞으로는 `Kernel#eval`보다는 새로운 `Binding#source_location` 메서드를 사용하게 될 것입니다.

* `Kernal#system`이 실패했을 경우 `false`를 돌려주는 대신, 에러를 던지도록 하는 `:exception` 옵션을 추가했습니다. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* `Coverage`의 oneshot_lines 모드를 추가했습니다. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)
  * 이 모드는 '각 줄이 몇 번 실행되었는지' 대신 '각 줄이 한 번 이상 실행되었는지'를 확인합니다. 각 줄의 훅은 최대 1회만 실행되며, 실행된 후에는 플래그를 제거하기 때문에 오버헤드 없이 실행됩니다.
  * `Coverage.start`에 `:oneshot_lines` 키워드 인수가 추가됩니다.
  * `Coverage.result`에 `:stop`과 `:clear` 키워드 인수가 추가됩니다. 만약 `clear`가 참이라면, 이는 카운터를 0으로 초기화합니다. 만약 `stop`이 참이라면 커버리지 측정을 비활성화합니다.
  * 주어진 소스 코드로부터 'stub'을 생성하는 간단한 헬퍼 함수인 `Coverage.line_stub`을 추가합니다.

* `FileUtils#cp_lr`.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## 성능 향상

* `Proc#call`이 더 이상 `$SAFE`를 고려하지 않아도 되어 속도가 빨라졌습니다.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  `Proc#call`을 대량으로 호출하는 `lc_fizzbuzz` 벤치마크가 1.4배 빨라졌습니다.
  [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* `block`이 블록 파라미터인 경우의 `block.call`이 빨라졌습니다. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  루비 2.5에서는 블록 넘기기의 성능이 향상되었습니다만 [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045),
  추가로 2.6에서는 넘겨진 블록의 호출이 개선되었습니다.
  간단한 벤치마크에서 2.6배의 성능 향상을 확인했습니다.

* Transient Heap(theap)이 도입되었습니다. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)
  theap은 특정 클래스(Array, Hash, Object, Struct)가 가리키는 짧은 생애를
  가지는 메모리 객체들을 관리합니다. 예를 들어 작고 짧게 생존하는 Hash 객체의 생성이
  2배 빨라집니다. rdoc 벤치마크에서 6-7%의 성능 향상을 확인했습니다.

## 2.5 이후 주목할 만한 변경

* `$SAFE`가 프로세스 전역 변수로 취급되며, `0` 이외의 값을 설정한 후에 `0`으로 되돌리는 것이 가능해집니다. [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* `ERB.new`에 `safe_level`을 넘기는 기능이 제거될 예정입니다. 또한 `trim_mode`와 `eoutvar`는 키워드 변수로 변경됩니다. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* 유니코드 지원 버전이 11로 갱신되었습니다. 이는 루비 2.6의 TEENY 릴리스에서 12와 12.1로 갱신될 예정입니다.

* RubyGems 3.0.0.beta3를 병합했습니다. `--ri`와 `--rdoc` 옵션이 제거되었습니다. 대신에 `--document`와 `--no-document`를 사용해주세요.

* [Bundler](https://github.com/bundler/bundler)를 기본 젬으로 병합했습니다.

[NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc1/NEWS)나
[커밋 로그](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)에서
더 자세한 설명을 확인할 수 있습니다.

이러한 변경 사항에 따라, 루비 2.5.0 이후로
[파일 6376개 수정, 227364줄 추가(+), 51599줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)가
이루어졌습니다!

루비 2.6.0-rc1을 즐겨보세요!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.gz>

      SIZE:   16823448 bytes
      SHA1:   889db7731fd43f6dbf7f31ffdb0a29bba1a8d356
      SHA256: 6d6183639ed9c02320d7132e97c65489a39e24d8b55fc4ed35ac53d1189cb61d
      SHA512: ad101adee5c43f3645561e73970f15d4e9141f707da69a92e224575c665949e18ca53389e5315fca2ea3934d77967a59e304353cde4a915537e7c4e4ee20be73

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.zip>

      SIZE:   20737499 bytes
      SHA1:   457e39aee1978da5e42af42a6ad230421544aa07
      SHA256: 2bcdf468de499e4d6983d60d63dcc883f4c54fdc05a08a54eb93d315477bc4cc
      SHA512: 0842fae8a199f6c1e76f5d775edbf468e18a54f0419324eb73595e0268c728c71733371d71dc2fa342105dbc487987ca5556948a9ef067276a7b5f552462802a

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.bz2>

      SIZE:   14607078 bytes
      SHA1:   269fe9d414d7731e4a63959fadffe5c50c08ce0e
      SHA256: b4e9c0e8801946e9f0baba30948955f4341e9e04f363c206b7bd774208053eb5
      SHA512: cbd6281b2aab6fbce3f699c1ab57e5423304dca7a547a0b3cd4e8e980326dc7b85b2ca2bfaf3f3a648d40f4222fdf1740d81d422790ee7ae1ba1ed33eb11e3e8

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.xz>

      SIZE:   11851908 bytes
      SHA1:   3b93fdf1c5bd969ab4fe0a8176a6cf64e4597e6e
      SHA256: 21d9d54c20e45ccacecf8bea4dfccd05edc52479c776381ae98ef6a7b4afa739
      SHA512: 3d93d8d80e4900e8b3a27f904ed60581cebc6c55f4ab7acafc81e95001f92f3ea4ddec2da6169b1ed5e0146f7b7c35c1c13b3243955d5825c72170834fe933f3
