---
layout: news_post
title: "Ruby 2.1.0-rc1 is released"
author: "nurse"
translator:
date: 2013-12-20 16:53:05 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.1.0-rc1.
Please test the new features in Ruby 2.1 before the final release scheduled on 2013-12-25!

## Notable changes since preview 2

* remove curses [#8584](https://bugs.ruby-lang.org/issues/8584)

for other changes, see [NEWS](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

## Download

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.bz2)
  * SIZE:   11394226 bytes
  * MD5:    cae095b90349b5b0f7026060cc3dd2c5
  * SHA256: af828bc0fe6aee5ffad0f8f10b48ee25964f54d5118570937ac7cf1c1df0edd3
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.tar.gz)
  * SIZE:   14450990 bytes
  * MD5:    a16561f64d78a902fab08693a300df98
  * SHA256: 1b467f13be6d3b3648a4de76b34b748781fe4f504a19c08ffa348c75dd62635e
* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-rc1.zip)
  * SIZE:   16107702 bytes
  * MD5:    b6cdc0e63185b4aeb268bdf6ebd4de9f
  * SHA256: 4d6a256b73b79f5b64182e1f55db3e61042bbe0166a45917e69c1b4e47247276

## Changes since 2.0

The notable changes are:

* VM (method cache)
* RGenGC (See ko1's [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73) and [RubyConf 2013 presentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* syntax changes
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def's return value [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * use GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0 and RubyGems 2.2.0
* "literal".freeze is now optimized [#9042](https://bugs.ruby-lang.org/issues/9042)
* add Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* update libraries like BigDecimal, JSON, NKF, Rake, RubyGems, and RDoc
* remove curses [#8584](https://bugs.ruby-lang.org/issues/8584)

See more details of changes: [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_rc1/NEWS).

ko1 talked about the new features of Ruby 2.1 at toruby: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) wrote a good summary in his blog post: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Release Comment

Known issues are:

<https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102>

See also the release schedule and other information:

<https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210>
