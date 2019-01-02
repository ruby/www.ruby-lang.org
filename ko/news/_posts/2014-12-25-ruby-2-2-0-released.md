---
layout: news_post
title: "루비 2.2.0 릴리스"
author: "naruse"
translator: "marocchino"
date: 2014-12-25 09:00:00 +0000
lang: ko
---

루비 2.2.0이 릴리스 되었습니다.

루비 2.2에는 점점 더 커지는 다양한 요구들 충족하기 위한 많은
새로운 기능과 개선들이 포함됩니다.

예를 들어, 심볼 GC는 심볼을 가비지 컬렉션할 수 있게 합니다.
루비 2.2 이전에는 GC가 심볼을 수집하지 않았기에 이 변경은
심볼의 메모리 사용량을 줄이게 됩니다. 레일즈 5.0부터는
심볼 GC가 필요하게 되고, 이는 오직 루비 2.2 이후에서만 지원하게
됩니다. (자세한 내용은 [레일즈 4.2 릴리스 포스트](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/)에서
확인하세요.)

또한, 새로운 증가형(Incremental) GC는 가비지 컬렉션의 중지
시간을 줄여줍니다. 이 또한 레일즈 앱의 운용에 도움이 됩니다.
[레일즈 블로그](http://weblog.rubyonrails.org/)에 언급된
최신 개발방법은 레일즈 5.0에서 증가형 GC뿐만 아니라 심볼 GC의
이점을 살리자고 제안하고 있습니다.

메모리 관리에 관련된 또다른 기능으로 jemalloc을 사용할 수 있는 configure.in
옵션의 추가입니다.
[기능 #9113](https://bugs.ruby-lang.org/issues/9113)
이는 실험적인 기능이며, 기본값으로 비활성화됩니다.
좀 더 많은 사용 사례와 성능 데이터가 필요합니다만.
이점이 명확해지면, 이 기능은 기본값으로 활성화 될 것입니다.

system()과 spawn()에서 vfork(2)의 사용도 실험적 지원도 추가됩니다.
자세한 내용은 [타나카씨의 블로그(일본어)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)에서
확인하세요. 이는 큰 프로세스가 여러 번 외부 명령을 실행 할 때
잠재적으로 엄청난 속도 향상을 가져올 수 있습니다. 하지만
vfork(2)는 아직 잘 알려지지 않은 위험할 수도 있는 시스템 콜입니다.
사용사례와 성능 데이터의 수집으로 이 변경이 가져올 이점이 어느
정도인지 알고 싶습니다.

루비 2.2.0을 시험해보고 즐겨주세요. 그리고 당신의 경험을 알려주세요!

## 2.1 이후의 주목할 만한 변경점

* [증가형 GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [심볼 GC](https://bugs.ruby-lang.org/issues/9634) ([RubyKaigi 2014의 프레젠테이션](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [기능 #9113](https://bugs.ruby-lang.org/issues/9113)
* 코어 라이브러리:
  * 유니코드 7.0 지원 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * 새로운 메서드:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* 포함된 라이브러리:
  * 업데이트 Psych 2.0.8
  * 업데이트 Rake 10.4.2
  * 업데이트 RDoc 4.2.0
  * 업데이트 RubyGems 2.4.5
  * 업데이트 test-unit 3.0.8 (저장소에서는 제거했지만 tarball에는 포함)
  * Update minitest 5.4.3 (저장소에서는 제거했지만 tarball에는 포함)
  * mathn을 비추천(Deprecate)으로 변경
* C API
  * 비추천 상태의 API들을 제거

자세한 내용은 [루비 저장소의 NEWS](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)를 보세요.

이러한 변경으로 2.1.0과 비교하여 1557 파일이 변경되고 125039 줄이 증가(+), 74376 줄이
감소(-)하였습니다.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
