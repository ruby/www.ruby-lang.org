---
layout: news_post
title: "루비 2.2.0-rc1 릴리스"
author: "naruse"
translator: "marocchino"
date: 2014-12-18 09:00:00 +0000
lang: ko
---

루비 2.2.0-rc1이 릴리스 되었습니다.
RC1 이후의 모든 수정은 버그 픽스로 한정됩니다.
루비 2.2.0 최종 릴리스는 2014년 12월 25일로 예정되어있습니다.

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

메모리 관리에 관련된 또 다른 기능으로 jemalloc을 사용할 수 있는 configure.in
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

루비 2.2.0-rc1을 시험해보고 즐겨주세요. 그리고 당신의 경험을 알려주세요!

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
  * 업데이트 Psych 2.0.8
  * 업데이트 Rake 10.4.0
  * 업데이트 RDoc 4.2.0.alpha (21b241a)
  * 업데이트 RubyGems 2.4.5
  * 업데이트 test-unit 3.0.8 (저장소에서는 제거했지만 tarball에는 포함)
  * 업데이트 minitest 5.4.3 (저장소에서는 제거했지만 tarball에는 포함)
  * mathn을 비추천(Deprecate)으로 변경
* C API
  * 비추천 상태의 API들을 제거

자세한 내용은 [루비 저장소의 NEWS(작성중)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS)를 보세요.

이러한 변경으로 2.1.0과 비교하여 1548 파일이 변경되고 123658 줄이 증가(+), 74306 줄이
감소(-)하였습니다.

## 다운로드

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## 릴리스 코멘트

* [2.2.0 알려진 이슈](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

릴리스 일정과 다른 정보는 밑의 링크를 참조하세요.

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
