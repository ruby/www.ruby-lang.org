---
layout: news_post
title: "루비 2.1.0 릴리스"
author: "nurse"
translator: "marocchino"
date: 2013-12-25 16:00:00 +0000
lang: ko
---

루비 2.1.0이 릴리스 되었습니다.

루비 2.1은 심각한 비호환없이 속도향상을 포함한 많은 개선이 있었습니다.

한번 시험해 보세요.

## 다운로드

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2)
  * SIZE:   12007442 bytes
  * MD5:    1546eeb763ac7754365664be763a1e8f
  * SHA256: 1d3f4ad5f619ec15229206b6667586dcec7cc986672c8fbb8558161ecf07e277
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz)
  * SIZE:   15076389 bytes
  * MD5:    9e6386d53f5200a3e7069107405b93f7
  * SHA256: 3538ec1f6af96ed9deb04e0965274528162726cc9ba3625dcf23648df872d09d
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip)
  * SIZE:   16603067 bytes
  * MD5:    2fc3a80b56da81b906a9bb6fc7ca8399
  * SHA256: d40d7bfb39ca2e462dea61dcbbcf33426b60e6e553335c3afb39b4d827a6891c

## 2.0 이후의 변경점

주목할 만한 변화는 아래와 같습니다.

* VM (메서드 캐시)
* RGenGC (ko1의 [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73)과 [RubyConf 2013 presentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf)을 참조하십시오)
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 문법 변화
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def의 return value [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * GMP 사용 [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0과 RubyGems 2.2.0
* "literal".freeze의 최적화 [#9042](https://bugs.ruby-lang.org/issues/9042)
* Exception#cause의 추가 [#8257](https://bugs.ruby-lang.org/issues/8257)
* BigDecimal, JSON, NKF, Rake, RubyGems, RDoc 등의 라이브러리 업데이트
* curses의 제거 [#8584](https://bugs.ruby-lang.org/issues/8584)

보다 자세한 내용은 [루비 저장소의 NEWS](https://github.com/ruby/ruby/blob/v2_1_0/NEWS)를 참조하여 주십시오.
