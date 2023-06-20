---
layout: news_post
title: "루비 2.4.0-preview3 릴리스"
author: "naruse"
translator: "shia"
date: 2016-11-09 09:00:00 +0000
lang: ko
---

루비 2.4.0-preview3의 릴리스를 알리게 되어 기쁘게 생각합니다.

루비 2.4.0-preview3은 루비 2.4.0의 세 번째 프리뷰입니다.
이 프리뷰는 커뮤니티의 반응을 살펴보기 위해 릴리스되었습니다.
기능에서 혼란을 느낀다면 부담없이 [피드백](https://github.com/ruby/ruby/wiki/How-To-Report)을 보내주세요.

## [Vladimir Makarov의 해시 테이블 개선을 도입](https://bugs.ruby-lang.org/issues/12142)

해시 테이블(st_table)의 내부 구조를 삽입순 배열에 개방 주소법을 도입하는 개선이 이루어졌습니다.
이 개선에 대해서는 많은 사람들의 토론이 있었으며, 특히 Yura Sokolov의 공헌이 컸습니다.

## Binding#irb: `binding.pry`처럼 REPL 세션 시작하기

디버깅 중에 `p`를 사용하여 변수의 값을 확인하는 경우가 잦습니다.
[pry](https://github.com/pry/pry)를 사용하면 애플리케이션에 `binding.pry`를 추가하면 해당 위치에서 REPL을 실행해 줍니다.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)는 irb에서도 `binding.irb`를 통해 같은 동작을 하는 기능을 추가합니다.

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

루비 2.4.0-preview3으로 즐겁게 프로그램을 작성해보세요.
그리고 여러분이 [느낀 점을 알려주세요](https://github.com/ruby/ruby/wiki/How-To-Report)!

## 2.3 이후의 주목할 만한 변경

* OpenSSL 1.1.0을 지원합니다.
* stdlib에서 ext/tk가 제거됩니다. [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* stdlib에서 XMLRPC가 제거됩니다. [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

자세한 내용은 [뉴스](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS)와
[변경기록](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)을
참고하세요.

이러한 변경사항에 따라, 루비 2.3.0 이후로
[파일 2470개 수정, 283051줄 추가(+), 64902줄 삭제(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)가 이루어졌습니다.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      SIZE:   12615328 bytes
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      SIZE:   15758023 bytes
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      SIZE:   9957596 bytes
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      SIZE:   17579012 bytes
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## 릴리스 코멘트

릴리스 일정과 다른 정보는 밑의 링크를 참조하세요.

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
