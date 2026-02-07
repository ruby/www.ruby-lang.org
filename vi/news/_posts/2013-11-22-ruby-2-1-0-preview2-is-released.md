---
layout: news_post
title: "Ruby 2.1.0-preview2 is released"
author: "nurse"
translator:
date: 2013-11-22 22:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.1.0-preview2.
Please test the new features in Ruby 2.1 before the final release!

## Notable changes from preview 1

* fix [Heap Overflow in Floating Point Parsing (CVE-2013-4164)](https://www.ruby-lang.org/en/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/)
* "literal".freeze is now optimized [#9042](https://bugs.ruby-lang.org/issues/9042)
* f suffix of String Literal is removed [#9042](https://bugs.ruby-lang.org/issues/9042)
* fix memory consuming issue on RGenGC ([r43532](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=43532) and [r43755](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=43755))
* add Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* update libraries like json, nkf, rake, RubyGems, and RDoc.

## Download

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2)

      SIZE:   11432454 bytes
      MD5:    9d566a9b2d2e7e35ad6125e2a14ce672
      SHA256: 780fddf0e3c8a219057d578e83367ecfac5e945054b9f132b3b93ded4802d1ce

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz)

      SIZE:   14416029 bytes
      MD5:    ba2b95d174e156b417a4d580a452eaf5
      SHA256: a9b1dbc16090ddff8f6c6adbc1fd0473bcae8c69143cecabe65d55f95f6dbbfb

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip)

      SIZE:   16110720 bytes
      MD5:    2ad1aa3d89ae32607cf14fc73b192de1
      SHA256: cc2f7f8e05daed716489e5480e6365a711a13ed7747dbc59e989a41fe2805076

## Changes from 2.0

The notable changes are:

* VM (method cache)
* RGenGC (See ko1's [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73) and [RubyConf 2013 presentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* syntax changes
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * def's return value [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * use 128bit integers [#8509](https://bugs.ruby-lang.org/issues/8509)
  * use GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 and RubyGems 2.2.0.preview.2

See more details of changes: [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

ko1 talked about the new features of Ruby 2.1 at toruby: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) wrote a good summary in his blog post: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Release Comment

Known issues are:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

See also the release schedule and other information:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
