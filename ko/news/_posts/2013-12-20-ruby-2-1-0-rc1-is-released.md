---
layout: news_post
title: "루비 2.1.0-rc1 릴리즈되었습니다"
author: "zzak"
translator: "SeungKyun Nam"
date: 2013-12-20 16:53:05 UTC
lang: en
---

루비 2.1.0-rc1의 릴리즈를 발표하게 되어 기쁩니다.
최종 릴리즈가 계획된 2013-12-25 이전에 루비 2.1의 최신 기능들을 테스트해 주시기 바랍니다.

## preview 2로부터의 주목할만한 변경점들

* curses를 제거함 [#8584](https://bugs.ruby-lang.org/issues/8584)

다른 변경점들은, [NEWS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS)를 읽어보십시오.

## 다운로드

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2)
  * SIZE:   11394226 bytes
  * MD5:    cae095b90349b5b0f7026060cc3dd2c5
  * SHA256: af828bc0fe6aee5ffad0f8f10b48ee25964f54d5118570937ac7cf1c1df0edd3
* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz)
  * SIZE:   14450990 bytes
  * MD5:    a16561f64d78a902fab08693a300df98
  * SHA256: 1b467f13be6d3b3648a4de76b34b748781fe4f504a19c08ffa348c75dd62635e
* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip)
  * SIZE:   16107702 bytes
  * MD5:    b6cdc0e63185b4aeb268bdf6ebd4de9f
  * SHA256: 4d6a256b73b79f5b64182e1f55db3e61042bbe0166a45917e69c1b4e47247276

## 2.0 부터의 변경점들

주목할 만한 변경점들은 다음과 같습니다:

* VM (메서드 캐시)
* RGenGC (ko1의 [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73)과 [RubyConf 2013 presentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf)을 보십시오)
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* 문법의 변경점들
  * Decimal/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def의 return value [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * GMP 사용 [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 과 RubyGems 2.2.0
* "literal".freeze 최적화 [#9042](https://bugs.ruby-lang.org/issues/9042)
* Exception#cause 추가 [#8257](https://bugs.ruby-lang.org/issues/8257)
* BigDecimal, JSON, NKF, Rake, RubyGems, 과 RDoc 등 라이브러리 업데이트
* curses 제거 [#8584](https://bugs.ruby-lang.org/issues/8584)

변경점에 대한 보다 상세한 내용은 다음을 읽어보십시오: [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

ko1이 toruby에서 루비 2.1의 새로운 기능들에 대해 언급했습니다: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase)가 자신의 블로그 포스트에 멋진 요약을 작성하였습니다: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## 릴리즈 코멘트

알려진 이슈들은 다음과 같습니다:

<https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102>

또한 릴리즈 계획과 기타 정보는 다음 글을 읽어보십시오:

<https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering210>
