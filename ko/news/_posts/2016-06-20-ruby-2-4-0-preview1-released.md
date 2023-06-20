---
layout: news_post
title: "루비 2.4.0-preview1 릴리스"
author: "naruse"
translator: "shia"
date: 2016-06-20 09:00:00 +0000
lang: ko
---

루비 2.4.0-preview1의 릴리스를 알리게 되어 기쁘게 생각합니다.

루비 2.4.0-preview1은 루비 2.4.0의 첫 번째 프리뷰입니다.
이 프리뷰는 많은 새 기능과 개선들을 포함하고 있어서
이례적으로 이르게 릴리스 되었습니다.
아직 기능이 확정되지 않았으니, 자유롭게
[피드백](https://github.com/ruby/ruby/wiki/How-To-Report)을 보내주세요.

## [Fixnum과 Bignum을 Integer로 통합](https://bugs.ruby-lang.org/issues/12005)

[ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)에서는
Integer 클래스의 세부에 관해서 기술하고 있지 않아,
CRuby에서는 2개의 정수 클래스(Fixnum과 Bignum)를 가지고 있습니다.
루비 2.4에서는 이들이 Integer로 통합됩니다.

## [String에서 유니코드 대/소문자 대응 지원](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)`는 이제
ASCII 대/소문자 대응 대신에 유니코드 대/소문자 대응을 지원합니다.

## 성능 개선

루비 2.4는 다음의 언어 변경을 포함한 성능 개선이 있습니다.

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max`와 `[x, y].min`은 특정 조건에서 임시 배열을 생성하지 않도록
최적화되었습니다.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

`Regexp#match?`가 추가되었으며, 이는 후방 참조 객체를 생성하지 않고
`$~`을 변경하여 객체 할당을 줄이며 정규 표현식을 매칭합니다.

### 그 외의 성능 향상

* [인스턴스 변수 접근 속도 향상](https://bugs.ruby-lang.org/issues/12274)

## 디버깅

### [Thread#report_on_exception과 Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

루비는 다른 스레드에서 명시적으로 접근하지 않는 이상 스레드에서의 예외를 무시합니다.
`report_on_exception = true`를 사용하면,
처리되지 않은 예외 때문에 스레드가 사망하는 경우, 알림을 받을 수 있게 됩니다.

`report_on_exception`의 기본값으로 무엇을 사용하면 좋을지,
그리고 report-on-GC에 대한 피드백을 보내주세요.

### [스레드 교착상태 탐지가 이제 백트레이스와 의존성 정보를 함께 보여주게 됩니다](https://bugs.ruby-lang.org/issues/8214)

루비는 대기 중인 스레드의 교착상태를 탐지할 수 있었지만,
디버깅을 위한 충분한 정보가 리포트에 포함되지 않았습니다.
루비 2.4의 교착상태 탐지는 스레드의 백트레이스와 의존하고 있는 스레드에 대한 정보를 보여주게 됩니다.

루비 2.4.0-preview1로 즐겁게 프로그램을 작성해보세요.
그리고 여러분의 [느낀 점을 알려주세요](https://github.com/ruby/ruby/wiki/How-To-Report)!

## 2.3 이후의 주목할 만한 변경

자세한 내용은 [뉴스](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)와
[변경기록](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)을
참고하세요.

이러한 변경사항에 따라, 루비 2.3.0 이후로
[파일 1140개 수정, 33126줄 추가(+), 50993줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)가 이루어졌습니다.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## 릴리스 코멘트

릴리스 일정과 다른 정보는 밑의 링크를 참조하세요.

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
