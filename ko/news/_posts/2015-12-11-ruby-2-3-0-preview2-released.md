---
layout: news_post
title: "루비 2.3.0-preview2 릴리스"
author: "naruse"
translator: "marocchino"
date: 2015-12-11 14:00:00 +0000
lang: ko
---

루비 2.3.0-preview2가 릴리스되었습니다.

루비 2.3.0-preview2는 루비 2.3.0의 두 번째 프리뷰입니다.
많은 새로운 기능과 개선을 포함합니다.

[프로즌 스트링 리터럴
프라그마](https://bugs.ruby-lang.org/issues/11473)를 도입합니다.
루비 2.1에서 `"str".freeze`를 최적화하여 객체 할당을 줄였습니다.
루비 2.3은 매직 코멘트와 커맨드 라인 옵션을 새로 도입하여
소스 파일의 모든 스트링 리터럴을 프리즈(freeze)합니다.
그리고 디버깅할 때, `--debug=frozen-string-literal` 옵션을 사용하면
`"can't modify frozen String"` (프로즌 스트링을 수정할 수 없음) 에러가 발생하는
객체를 생성한 위치를 알려줍니다.

C#, 그루비, 스위프트 언어에 이미 있는 [세이프 내비게이션
연산자](https://bugs.ruby-lang.org/issues/11537)([외견 때문에 외톨이
연산자라고도 함](https://instagram.com/p/-M9l6mRPLR/)) `&.`를 도입하여
`obj&.foo`처럼 `nil`을 간편하게 처리합니다. `Array#dig`와 `Hash#dig`도
추가되었습니다.

[did_you_mean 젬이 포합됩니다.](https://bugs.ruby-lang.org/issues/11252)
did_you_mean 젬은 간편한 디버깅을 위해 `NameError`와 `NoMethodError`에 대해
추천 목록을 보여줍니다.

[RubyVM::InstructionSequence#to_binary와
.load_from_binary](https://bugs.ruby-lang.org/issues/11788)가 실험적인 기능으로
도입되었습니다. 이 기능으로 ISeq(바이트코드) 전처리 시스템을 만들 수 있습니다.

루비 2.3에는 많은 성능 향상이 포함됩니다.
예를 들어, [Proc#call 최적화](https://bugs.ruby-lang.org/issues/11569),
[메서드 엔트리 데이터 구조 재고](https://bugs.ruby-lang.org/issues/11278),
[테이블 데이터 구조 도입](https://bugs.ruby-lang.org/issues/11420),
객체 할당과 메서드 호출 코드의 머신 코드 레벨 튜닝과 그 밖의 수많은 최적화가
이루어져 있습니다.

루비 2.3.0-preview2를 시험하고 즐겁게 프로그래밍 해보세요. 그리고 지식을
공유해주세요!

## 2.2 이후의 주목할 만한 변경

자세한 내용은 [뉴스](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS)와
[변경기록](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)을
참고하세요.

이 변경으로 루비 2.2.0 이후 [1097 파일이 변경되었으며, 97466 줄이 추가(+)되고,
58685 줄이 삭제(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2)
되었습니다!

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## 릴리스 코멘트

릴리스 일정과 다른 정보는 밑의 링크를 참조하세요.

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
