---
layout: news_post
title: "Ruby 2.1.0 is released"
author: "nurse"
translator:
date: 2013-12-20 16:53:05 UTC
lang: en
---

We are pleased to announce the release of Ruby 2.1.0.

## Download

* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.bz2)
  * SIZE:   XXX bytes
  * MD5:    XXX
  * SHA256: XXX
* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.tar.gz)
  * SIZE:   XXX bytes
  * MD5:    XXX
  * SHA256: XXX
* [http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip](http://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0.zip)
  * SIZE:   XXX bytes
  * MD5:    XXX
  * SHA256: XXX

## Changes since 2.0

The notable changes are:

* VM (method cache)
* RGenGC (See ko1's [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73) and [RubyConf 2013 presentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* syntax changes
  * Decimal/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
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

See more details of changes: [NEWS in Ruby repository](https://github.com/ruby/ruby/blob/v2_1_0/NEWS).

## Release Comment

(TBD)
