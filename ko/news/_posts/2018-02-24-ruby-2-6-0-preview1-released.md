---
layout: news_post
title: "루비 2.6.0-preview1 릴리스"
author: "naruse"
translator: "shia"
date: 2018-02-24 00:00:00 +0000
lang: ko
---

루비 2.6.0-preview1 릴리스를 알리게 되어 기쁩니다.

루비 2.6.0-preview1은 루비 2.6.0의 첫번째 프리뷰입니다.
이 프리뷰는 JIT이라는 중요한 새 기능을 포함하고 있기 때문에 평소보다 빠르게 릴리스됩니다.

## JIT

루비 2.6은 JIT(Just-in-time) 컴파일러의 첫 구현체를 포함합니다.

JIP 컴파일러는 루비 프로그램의 실행 성능을 향상시키는 것이 목적입니다.
다른 언어의 일반적인 JIT 컴파일러와는 다르게, 루비의 JIT 컴파일러는 C 코드를 디스크에 출력한 뒤, 일반적인 C 컴파일러 프로세스를 사용해 네이티브 코드를 생성하도록 합니다.
다음을 참고하세요. [Vladimir Makarov가 작성한 MJIT 구조](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

JIT 컴파일을 사용하려면 `--jit` 옵션을 커맨드라인이나 `$RUBYOPT` 환경 변수에 지정합니다. `--jit-verbose=1`을 지정하면 실행 중인 JIT 컴파일의 기본적인 정보를 출력합니다. 다른 옵션에 대해서는 `ruby --help`를 확인하세요.

이번 JIT 릴리스의 주 목적은 2.6 릴리스 전에 각 플랫폼에서 잘 동작하는지, 보안상의 문제가 발생하는지 미리 확인하는 것입니다.
현재 JIT 컴파일러는 루비가 gcc나 clang로 빌드되었으며, 해당 컴파일러가 런타임에서 사용 가능한 경우에만 이용할 수 있습니다. 그 이외에는 아직 이용할 수 없습니다.

2.6.0-preview1에서는 JIT를 이용하기 위한 기반을 추가하고 매우 적은 최적화만이 구현되어 있습니다. 이 릴리스에 대해서 간단한 벤치마크를 이용하여 잠재적인 성능 향상을 확인할 수 있습니다만, Rails 애플리케이션과 같은 대규모 프로그램에서 루비 JIT 컴파일러의 최종적인 성능을 측정할만한 단계는 아닙니다.

앞으로 루비의 성능을 한 단계 향상시켜줄 것으로 기대되고 있는 메서드 인라인화를 구현할 예정입니다.
또한 지원 환경을 늘려나갈 계획이며, 그 첫 번째로는 Visual Studio를 지원하는 것입니다.

새로운 루비의 성능을 기대해주세요.

## 새로운 기능

* `Random.bytes`를 추가했습니다. [Feature #4938]
* `Binding#source_location`을 추가했습니다. [Feature #14230]

  이 메서드는 `binding`의 소스 코드 상의 위치를 `__FILE__`과 `__LINE__`을 가지는 배열로 돌려줍니다. 지금까지는 `eval("[__FILE__, __LINE__]", binding)`을 사용하여 같은 정보를 획득할 수 있었습니다만, `Kernel#eval`이 `binding`의 소스 코드의 위치를 무시하도록 변경할 예정입니다 [Bug #4352]. 그러므로 앞으로는 `Kernel#eval`보다는 이 새로운 메서드를 사용해야 합니다.

* `Kernal#system`이 실패했을 경우 `false`를 돌려주는 대신, 에러를 던지도록 하는 `:exception` 옵션을 추가. [Feature #14386]

## 성능 향상

* `Proc#call`이 더 이상 `$SAFE`를 고려하지 않아도 되어 속도가 빨라졌습니다. [Feature #14318]

  `Proc#call`을 대량으로 호출하는 `lc_fizzbuzz` 벤치마크가 1.4배 빨라졌습니다. [Bug #10212]

* `block`이 블록 파라미터인 경우의 `block.call`이 빨라졌습니다. [Feature #14330]

  루비 2.5에서는 블록 넘기기의 성능이 향상되었습니다만 [Feature #14045],
  추가로 2.6에서는 넘겨진 블록의 호출이 개선되었습니다.
  간단한 벤치마크에서 2.6배의 성능 향상을 확인했습니다.

## 2.5 이후 주목할 만한 변경

* `$SAFE`가 프로세스 전역 변수로 취급되며, `0` 이외의 값을 설정한 후에 `0`으로 되돌리는 것이 가능해집니다. [Feature #14250]

* `ERB.new`에 `safe_level`을 넘기는 기능이 제거 예정이 되었습니다. 또한 `trim_mode`와 `eoutvar`는 키워드 변수로 변경됩니다. [Feature #14256]

* RubyGems 2.7.6을 병합했습니다.

자세한 내용은 [뉴스](https://github.com/ruby/ruby/blob/v2_6_0_preview1/NEWS)와
[커밋 로그](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)를 참고하세요.

이러한 변경사항에 따라,
루비 2.5.0 이후 [파일 1115개 수정, 23023줄 추가(+), 14748줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
하였습니다!

2월 24일 오늘은 루비의 25번째 생일입니다.
루비에게 생일 축하를 해주시고, 루비 2.6.0-preview1을 즐겨주시기 바랍니다!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.gz>

      SIZE:   16082501 bytes
      SHA1:   94b4a2f5f992dc9855364284e9c64316bf129c90
      SHA256: 2023c42676d9237481e1a97157d5e2ecc10db5e320d5b9cf872ec1d293265d61
      SHA512: 004696c4f087333ba7cb2285418dcce70f399966ae8fed817aab9759fd2d75beb088c4aeb294fcd4260112e8422f490cd4dbdfce402d73f96bb679b8bb3e1607

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.zip>

      SIZE:   19807007 bytes
      SHA1:   24d76f67bf913348eca783a2ecf6f3faf37299ae
      SHA256: 6c883927e80430cf07f2d90728d6c2c71164223f378a48ebf964d3b66319f623
      SHA512: 1e7f318cec1b7875fd9891df671078de7585b556695a2a85708483ddcacfd6e0b63b70ec2535e92ff981b4f72063721ed552df49688e066666fcd7ae520ae667

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.bz2>

      SIZE:   14104578 bytes
      SHA1:   9f0fb79643a4673a839b0c8496eccc6e1dbd022d
      SHA256: 8bd6c373df6ee009441270a8b4f86413d101b8f88e8051c55ef62abffadce462
      SHA512: d9cb270529a97670d54f43a0236fab072714e715c39277dab70b7a1843ec818e6700e47e1384c7256f9e0ae41ab2c0b768a0de38a5ecf4f4fff5da6ef5ad4944

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.xz>

      SIZE:   11423984 bytes
      SHA1:   bbbc89d760cdaadbca3cbff587295864edeff0af
      SHA256: 1d99139116e4e245ce543edb137b2a8873c26e9f0bde88d8cee6789617cc8d0e
      SHA512: d12ff29778d8d940344619881b4d8247c2fb6b44ac2b2dbddb7078828e893cfac9a5a95b5588f0afdbed52bdb6dea95cff1b9ce3ad47dfa62209e97dab8810b6
