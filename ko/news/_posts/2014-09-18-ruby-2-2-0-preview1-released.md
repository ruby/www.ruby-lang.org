---
layout: news_post
title: "루비 2.2.0-preview1 릴리스"
author: "naruse"
translator: "marocchino"
date: 2014-09-18 09:00:00 +0000
lang: ko
---

루비 2.2.0-preview1을 릴리스 했습니다.

루비 2.2.0-preview1은 루비 2.2.0의 첫번째 프리뷰 릴리스입니다.
점점 더 커지는 다양한 요구들 충족하기 위한 많은 새로운 기능과
개선들이 포함됩니다.

예를 들어 심볼 GC는 심볼을 가비지 컬렉션 할 수 있게 했습니다.
2.2 이전에는 심볼은 GC의 대상이 아니었기 때문에 이 수정은 심볼의 메모리 사용량을 경감시킵니다.
레일즈 5.0에서는 심볼 GC가 요구될 것입니다. 이 기능은 루비 2.2나
이상의 버전에서만 지원됩니다. (자세한내용은 [레일즈 블로그의 포스트](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)를 참조하세요)

또 새 증가형(Incremental) GC가 가비지 컬렉션의 대기 시간을 감소시킵니다.
이는 레일즈 앱 실행에 도움이 될 것입니다.

루비 2.2.0-preview1과 프로그래밍을 즐기세요!

## 2.1 이후의 주목할 만한 변경

* [증가형 GC](https://bugs.ruby-lang.org/issues/10137)
* [심볼 GC](https://bugs.ruby-lang.org/issues/9634)
* 코어 라이브러리:
  * Unicode 7.0 지원 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * 새로운 메서드:
    * Enumerable#slice_after
    * Float#next_float, Float#prev_float
    * File.birthtime, File#birthtime
* 포함된 라이브러리:
  * Update Psych 2.0.6
  * Update Rake 10.3.2+ (e47d0239)
  * Update RDoc 4.2.0.alpha (21b241a)
  * Update RubyGems 2.4.1+ (713ab65)
  * Update test-unit 3.0.1 (저장소에서는 지워지지만 tarball에는 포함됩니다)
  * Update minitest 5.4.1 (저장소에서는 지워지지만 tarball에는 포함됩니다)
  * mathn을 비추천(Deprecate)으로 변경
* C API
  * 비추천 상태인 API들을 삭제함

자세한 정보는 [루비 저장소의 NEWS(작업 중)](https://github.com/ruby/ruby/blob/v2_2_0_preview1/NEWS)를 확인해 주세요.

이 변경으로 1239 파일이 변경되었으며, 98343 줄이 추가(+)되고, 61858이 삭제(-)되었습니다.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.bz2>
  * SIZE:   12385780 bytes
  * MD5:    767b132eec3e70b14afe5884a7a767b1
  * SHA256: a3614c389de06b1636d8b919f2cd07e85311486bda2cb226a5549657a3610af5
  * SHA512: 2f1190f5d8cd1fa9962d1ff416dae97759d032a96801d77bc6b10136eba59dde1a554ff8c0c2d9ce0d3c1361d4dd12ad573b1266fd53b90ab238d8ce39e6b862
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.gz>
  * SIZE:   15419211 bytes
  * MD5:    f78fc9ec907fe622822abf3aa839c1b4
  * SHA256: 7a49493d148a38eff9ab13e88601686985cadf2de86276ae796f5443deab3abb
  * SHA512: 34381eee1d31cc1dad87e6d57ba71153c4db034b697cf7f0010fa432bb037e8eef5a90936a658f8f07b9b1eaa18f0b5c02ea113c78f39061514724373622a3b5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.xz>
  * SIZE:   9617132 bytes
  * MD5:    96cde140b3211780d58b36af023143d5
  * SHA256: 7ed01a518b8c4d65bfb887cf6e0809977c88abeb5bb70c9fe8df754966820411
  * SHA512: 1241fd9a6e583544576177f372e245845b9df1427104b595963e37d7348a7d1c5558c6f6bf6ca5f1856d0d4a8f4a54a8948d4b6d78fb7943d6c7458691f34f6d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.zip>
  * SIZE:   17161678 bytes
  * MD5:    df34e9d6a447b21a4e7fa261d51bb881
  * SHA256: 2fa6c0cbddd1566a8658e16a34b6ae2f9eda2a8eeee4113561b3948d066f44a0
  * SHA512: 615b35c0a0bc408b28af9d9220ccd1658c718c7657ae7ad3f8318d38850bec760b1738c43454986b105857a7ffc2fea95294b964e5ea26a915d6fd9d510351b7

## 릴리스 코멘트

* [2.2.0 알려진 이슈](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

릴리스 일정과 다른 정보는 밑의 링크에서도 보실 수 있습니다.

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
