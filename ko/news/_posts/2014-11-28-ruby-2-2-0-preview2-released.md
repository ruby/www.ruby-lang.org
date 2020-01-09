---
layout: news_post
title: "루비 2.2.0-preview2 릴리스"
author: "naruse"
translator: "marocchino"
date: 2014-11-28 09:00:00 +0000
lang: ko
---

루비 2.2.0-preview2가 릴리스 되었습니다.

루비 2.2.0-preview2는 루비 2.2.0의 두번째 프리뷰입니다.
점점 더 커지는 다양한 요구들 충족하기 위한 많은 새로운 기능과
개선들이 포함됩니다.

예를 들어, 심볼 GC는 심볼을 가비지 컬렉션할 수 있게 합니다.
루비 2.2 이전에는 GC가 심볼을 수집하지 않았기에 이 변경은
심볼의 메모리 사용 량을 줄이게 됩니다. 레일즈 5.0부터는
심볼 GC가 필요하게 되고, 이는 오직 루비 2.2 이후에서만 지원하게
됩니다. (자세한 내용은 [레일즈의 블로그 포스트](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)에서
확인하세요.)

또한, 새로운 증가형(Incremental) GC는 가비지 컬렉션의 중지 시간을 줄여줍니다. 이 또한
레일즈 앱의 운용에 도움이 됩니다.

메모리 관리에 관련된 또 다른 기능으로 jemalloc을 사용할 수 있는 configure.in
옵션의 추가입니다.
[기능 #9113](https://bugs.ruby-lang.org/issues/9113)
이는 실험적인 기능이며, 기본값으로 비활성화됩니다.
좀 더 많은 사용 사례와 성능 데이터가 필요합니다만.
이점이 명확해지면, 이 기능은 기본값으로 활성화 될 것입니다.

또 다른 이슈는 [system()과 spawn()에서 vfork(2) 사용(일본어)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)입니다.
이는 큰 프로세스에서 외부 명령을 많이 사용할 경우 큰 속도향상을 가져올 것으로
기대됩니다.
하지만 vfork(2)는 위험한 시스템 콜입니다.
사용사례와 성능 데이터의 수집으로 이 변경이 가져올 이점이 어느 정도인지 알고
싶습니다.

루비 2.2.0-preview2를 시험해보고 즐겨주세요. 그리고 당신의 경험을 알려주세요!

## 2.1이후의 주목할 만한 변경점

* [증가형 GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [심볼 GC](https://bugs.ruby-lang.org/issues/9634) ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [기능 #9113](https://bugs.ruby-lang.org/issues/9113)
* 코어 라이브러리:
  * 유니코드 7.0 지원 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * 새로운 메서드:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* 포함된 라이브러리:
  * 업데이트 Psych 2.0.6
  * 업데이트 Rake 10.4.0
  * 업데이트 RDoc 4.2.0.alpha (21b241a)
  * 업데이트 RubyGems 2.4.4+ (2f6e42e)
  * rubygems 2.4.4+ (2f6e42e)
  * 업데이트 test-unit 3.0.7 (저장소에서는 지워지지만 tarball에는 포함됩니다)
  * 업데이트 minitest 5.4.3 (저장소에서는 지워지지만 tarball에는 포함됩니다)
  * mathn을 비추천(Deprecate)으로 변경
* C API
  * 비추천 상태의 API들을 제거

자세한 내용은 [루비 저장소의 NEWS(작성중)](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS)를 보세요.

이러한 변경으로 1239 파일이 변경되고 98343 줄이 증가(+), 61858 줄이
감소(-)하였습니다.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.bz2>
  * SIZE:   12505279 bytes
  * MD5:    d7abace25a8ffe861cb2807bef1c58a6
  * SHA256: 9e49583f3fad3888fefc85b719fdb210a88ef54d80f9eac439b7ca4232fa7f0b
  * SHA512: c654d4c047f9463a5fb81eaea0fa5ab7bf316962bc7fb0fb356861e6336ce8ce2162c7779d8b27f72d7bc0e9604b5e5af2910abcb0b0a1f197b3138eaddfd4a5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.gz>
  * SIZE:   15505521 bytes
  * MD5:    bde388d6f10012a92d5dc36196fd6755
  * SHA256: dfcef7b01bd3acb41da6689993ac8dd30e2ecd4fd14bc1a833f46188a9fe2614
  * SHA512: e2d316a679c15c021e40b0f9b7810b319c6a5e771a9b869fda35b6745aecac881bbb05d62192893799816a8673e05c8f17713f10ccdec077f546483608ab85c1
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.xz>
  * SIZE:   9649216 bytes
  * MD5:    0d582e28b92ce9d1456e40fb8d821422
  * SHA256: d14d1fa045263fa242a515d7b9e8c485bf8a9ee9d9d3012dc2b6add0f3a370c6
  * SHA512: 4a8a75ab21b2bd43db4a22d9c63f189f3c7805d575d662b07a4ddc25aa5b156b0c23053d8c48eecf23d5e22f1ea7131467f1cdc48f9ae0a83214b4cd46b08491
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.zip>
  * SIZE:   17239396 bytes
  * MD5:    d94160c214016863932c25cc1ac6ff90
  * SHA256: 88d6c73ee1a4f5fe1f8ad37fe1f56c1ca50622f1338c20b9d46bbb5c2cd94040
  * SHA512: 0a021d31f54c47c5c3901ef6f2ab02a1bfb5cc698f971978c1e16b1aeda78fdadec0c1cdd48af1c8784b8f72ad00d35cf2433d78e20d4447fa0630e02b4e3917

##  릴리스 코멘트

* [2.2.0 알려진 이슈](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

릴리스 일정과 다른 정보는 밑의 링크를 참조하세요.

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
