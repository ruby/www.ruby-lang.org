---
layout: news_post
title: "루비 2.4.0-preview2 릴리스"
author: "naruse"
translator: "shia"
date: 2016-09-08 09:00:00 +0000
lang: ko
---

루비 2.4.0-preview2의 릴리스를 알리게 되어 기쁘게 생각합니다.

루비 2.4.0-preview2은 루비 2.4.0의 두 번째 프리뷰입니다.
이 프리뷰는 커뮤니티의 반응을 살펴보기 위해 릴리스되었습니다.
기능에서 혼란을 느낀다면 부담없이 [피드백](https://github.com/ruby/ruby/wiki/How-To-Report)을 보내주세요.

## [Fixnum과 Bignum을 Integer로 통합](https://bugs.ruby-lang.org/issues/12005)

[ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)에서는
Integer 클래스의 세부에 관해서 기술하고 있지 않아,
루비에서는 2개의 정수 클래스(Fixnum과 Bignum)를 가지고 있습니다.
루비 2.4에서는 이들이 Integer로 통합됩니다.
Fixnum이나 Bignum에 영향을 주는 모든 C 확장이 변경되어야 합니다.

[이 티켓](https://bugs.ruby-lang.org/issues/12005)과 [akr의 슬라이드](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf)를 참고하세요.


## [String에서 유니코드 대/소문자 대응 지원](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)`는 이제
ASCII 대/소문자 대응 대신에 유니코드 대/소문자 대응을 지원합니다.

## 성능 개선

루비 2.4는 다음의 언어 변경을 포함한 성능 개선이 있습니다.

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max`와 `[x, y].min`은 특정 조건에서 임시 배열을 생성하지 않도록
최적화되었습니다.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

`Regexp#match?`가 추가되었으며, 이는 후방 참조 객체를 생성하거나
`$~`을 변경하지 않음으로써 객체 할당을 줄이며 정규 표현식을 매칭합니다.

### 그 외의 성능 향상

* [인스턴스 변수 접근 속도 향상](https://bugs.ruby-lang.org/issues/12274)

## 디버깅

### [Thread#report_on_exception과 Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

루비는 다른 스레드에서 명시적으로 접근하지 않는 이상 스레드에서의 예외를 무시합니다.
`report_on_exception = true`를 사용하면,
처리되지 않은 예외 때문에 스레드가 사망하는 경우, 알림을 받을 수 있게 됩니다.

`report_on_exception`의 기본값으로 무엇을 사용하면 좋을지,
그리고 스레드가 조인되지 않은 채 GC 되었을 때 알려주는 report-on-GC에 대한 피드백을 보내주세요.

### [스레드 교착상태 탐지가 이제 백트레이스와 의존성 정보를 함께 보여주게 됩니다](https://bugs.ruby-lang.org/issues/8214)

루비는 대기 중인 스레드의 교착상태를 탐지할 수 있었지만,
디버깅을 위한 충분한 정보가 리포트에 포함되지 않았습니다.
루비 2.4의 교착상태 탐지는 스레드의 백트레이스와 의존하고 있는 스레드에 대한 정보를 보여주게 됩니다.

루비 2.4.0-preview2로 즐겁게 프로그램을 작성해보세요.
그리고 여러분이 [느낀 점을 알려주세요](https://github.com/ruby/ruby/wiki/How-To-Report)!

## 2.3 이후의 주목할 만한 변경

* OpenSSL 1.1.0을 지원합니다.
* stdlib에서 ext/tk가 제거됩니다. [Feature #8539](https://bugs.ruby-lang.org/issues/8539)

자세한 내용은 [뉴스](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)와
[변경기록](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)을
참고하세요.

이러한 변경사항에 따라, 루비 2.3.0 이후로
[파일 2353개 수정, 289057줄 추가(+), 73847줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)가 이루어졌습니다.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## 릴리스 코멘트

릴리스 일정과 다른 정보는 밑의 링크를 참조하세요.

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
