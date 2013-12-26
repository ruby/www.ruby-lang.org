---
layout: news_post
title: "루비 2.1.0이 릴리즈되었습니다"
author: "nurse"
translator: "SeungKyun Nam"
date: 2013-12-25 16:00:00 UTC
lang: en
---

루비 2.1.0의 릴리즈를 발표하게 되어 기쁩니다.

루비 2.1은 심한 비호환성 없이도 속도향상을 포함한 많은 향상이 있었습니다.

사용해 보십시오!

## 다운로드

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2)
  * SIZE:   12007442 bytes
  * MD5:    1546eeb763ac7754365664be763a1e8f
  * SHA256: 1d3f4ad5f619ec15229206b6667586dcec7cc986672c8fbb8558161ecf07e277
* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz)
  * SIZE:   15076389 bytes
  * MD5:    9e6386d53f5200a3e7069107405b93f7
  * SHA256: 3538ec1f6af96ed9deb04e0965274528162726cc9ba3625dcf23648df872d09d
* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip)
  * SIZE:   16603067 bytes
  * MD5:    2fc3a80b56da81b906a9bb6fc7ca8399
  * SHA256: d40d7bfb39ca2e462dea61dcbbcf33426b60e6e553335c3afb39b4d827a6891c

## 2.0부터의 변경점들

주목할만한 변경점들은 다음과 같습니다:

* VM (메서드 캐시)
* RGenGC (ko1의 [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73) 과 [RubyConf 2013 presentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf)을 읽어보십시오)
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 문법 변경점
  * Decimal/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def의 return value [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * GMP 사용 [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 과 RubyGems 2.2.0
* "literal".freeze 최적화 [#9042](https://bugs.ruby-lang.org/issues/9042)
* Exception#cause 추가 [#8257](https://bugs.ruby-lang.org/issues/8257)
* BigDecimal, JSON, NKF, Rake, RubyGems, 과 RDoc 등의 라이브러리 업데이트
* curses 제거 [#8584](https://bugs.ruby-lang.org/issues/8584)

보다 상세한 변경점들은 다음을 읽어 보십시오: [NEWS in Ruby repository](https://github.com/ruby/ruby/blob/v2_1_0/NEWS).