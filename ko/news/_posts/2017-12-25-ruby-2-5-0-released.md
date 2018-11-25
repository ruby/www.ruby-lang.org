---
layout: news_post
title: "루비 2.5.0 릴리스"
author: "naruse"
translator: "shia"
date: 2017-12-25 00:00:00 +0000
lang: ko
---

루비 2.5.0의 릴리스를 알리게 되어 기쁩니다.

루비 2.5.0은 루비 2.5의 첫 번째 릴리스입니다.
이는 다음과 같은 여러 새 기능과 기능 향상을 포함합니다.

## 새 기능

- `rescue`/`else`/`ensure`가 do/end 블록 내부에서도 직접 사용할 수 있게 됩니다. [[Feature #12906]](https://bugs.ruby-lang.org/issues/12906)
- `yield_self`가 추가되었습니다. 해당 컨텍스트에 주어진 블록을 넘깁니다. `tab`과는 다르게, 블록의 실행 결과를 반환합니다. [[Feature #6721]](https://bugs.ruby-lang.org/issues/6721)
- 분기 커버리지와 메서드 커버리지 측정을 지원합니다.
  분기 커버리지는 분기가 실행되었는지 아닌지를 나타냅니다. 또한 메서드 커버리지는 메서드가 호출되었는지 아닌지 측정합니다. 이 기능들을 이용하여 테스트 스위트를 실행하여 어떤 분기, 메서드가 실행되었는지를 알 수 있게 되므로, 테스트 스위트의 커버리지를 좀 더 엄밀하게 평가할 수 있습니다. [[Feature #13901]](https://bugs.ruby-lang.org/issues/13901)
- Hash#slice [[Feature #8499]](https://bugs.ruby-lang.org/issues/8499)와 Hash#transform_keys [[Feature #13583]](https://bugs.ruby-lang.org/issues/13583)가 추가됩니다.
- Struct.new로 키워드 인수를 받는 클래스를 생성할 수 있습니다. [[Feature #11925]](https://bugs.ruby-lang.org/issues/11925)
- Enumerable#any?, all?, none?, one?이 패턴 인수를 받게 됩니다. [[Feature #11286]](https://bugs.ruby-lang.org/issues/11286)
- 최상위 상수 탐색을 더 이상 지원하지 않습니다. [[Feature #11547]](https://bugs.ruby-lang.org/issues/11547)
- 많은 사랑을 받고 있는 라이브러리중 하나인 pp.rb가 이제 자동으로 로딩됩니다. 이제 더 이상 `require "pp"`를 쓸 필요가 없습니다. [[Feature #14123]](https://bugs.ruby-lang.org/issues/14123)
- 백트레이스와 에러 메시지가 역순(오래된 호출이 위, 최신의 호출이 아래)으로 표시됩니다. 이에 따라, 긴 백트레이스가 터미널(TTY)에 표시되는 경우, 에러를 야기한 라인의 정보가 마지막에 표시되므로 발견하기 쉬워집니다. 또한, 이 역순 표시는 터미널에 직접 출력되는 경우에만 적용됩니다. [[Feature #8661]](https://bugs.ruby-lang.org/issues/8661) [experimental]

## 성능 개선

- 전체 바이트 코드(instruction sequences)에서 `trace` 명령이 제거되어 성능이 5-10% 향상됩니다.
  `trace` 명령은 `TracePoint`를 지원하기 위해서 삽입되었습니다만, 대부분의 경우, `TracePoint`는 사용되지 않기 때문에 쓸모 없는 오버헤드였습니다. 이 대신 동적으로 갱신하는 방식을 사용하게 됩니다. 자세한 설명은 [[Feature #14104]](https://bugs.ruby-lang.org/issues/14104)를 확인하세요.
- 블록 매개변수에 의한 블록 패스(예: `def foo(&b); bar(&b); end`)가 '지연 Proc 할당'을 통해 루비 2.4보다 약 3배 빨라집니다. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
- Mutex가 작고 빠르게 재작성되었습니다. [[Feature #13517]](https://bugs.ruby-lang.org/issues/13517)
- ERB는 루비 2.4와 비교하여 2배 빠른 속도로 템플릿으로부터 코드를 생성합니다.
- `Array#concat`, `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+` 등의 내장 메서드의 속도가 향상되었습니다.
- IO.copy_stream이 복사 오프로드를 위해서 copy_file_range(2)를 사용합니다. [[Feature #13867]](https://bugs.ruby-lang.org/issues/13867)

## 2.4 이후로 눈에 띄는 변경점

- SecureRandom은 이제 OpenSSL보다 OS가 제공하는 난수 소스를 우선합니다. [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
- cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr, scanf, sdbm, stringio, strscan, webrick, zlib이 표준 라이브러리에서 기본 gem으로 변경됩니다.
- [Onigmo](https://github.com/k-takata/Onigmo/)가 6.1.3으로 갱신되었습니다.
  - 이는 [비포함 연산자](https://github.com/k-takata/Onigmo/issues/87)를 추가합니다.
  - 또한 [루비 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/)도 이 변경을 포함합니다.
- Psych가 3.0.2로 갱신되었습니다.
- RubyGems가 2.7.3으로 갱신되었습니다.
- RDoc이 6.0.1으로 갱신되었습니다.
  - [IRB 기반이었던 문법 해석기가 Ripper 기반으로 변경되었습니다](https://github.com/ruby/rdoc/pull/512). 이는 문서 생성 속도를 크게 향상시킵니다.
  - 근 수년동안 쌓였던 버그들이 수정됩니다.
  - 최근 루비에 추가된 새로운 문법이 지원됩니다.
- 유니코드 지원 버전이 10.0.0으로 갱신되었습니다.
- `Thread.report_on_exception`의 기본값이 true로 변경됩니다. 이 변경은 멀티 스레드 프로그램을 디버깅하기 쉽도록 해줍니다. [[Feature #14143]](https://bugs.ruby-lang.org/issues/14143)
- IO#write가 여러 인수를 받을 수 있게 됩니다. [[Feature #9323]](https://bugs.ruby-lang.org/issues/9323)

[NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)나 [커밋 로그](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)에서
더 자세한 설명을 확인할 수 있습니다.

이러한 변경 사항에 따라, 루비 2.4.0 이후로
[파일 6158개 수정, 348484줄 추가(+), 82747줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)가
이루어졌습니다!

메리 크리스마스, 행복한 휴일 보내시고, 루비 2.5와 함께 즐거운 프로그래밍 하세요!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
