---
layout: news_post
title: "Ruby 2.4.0-preview1 Released"
author: "naruse"
translator:
date: 2016-06-20 14:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.4.0-preview1.

Ruby 2.4.0-preview1 is the first preview of Ruby 2.4.0.
This preview1 is released earlier than usual because it has so
many new features and improvements.
Feel free to [send feedback](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport) since you can still change the features.

## [Unify Fixnum and Bignum into Integer](https://bugs.ruby-lang.org/issues/12005)

Though [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579) doesn't specify the detail of Integer,
CRuby has two visible Integer classes: Fixnum and Bignum.
Ruby 2.4 unifies them into Integer.

## [String supports Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

String/Symbol#upcase/downcase/swapcase/capitalize(!) now handle Unicode case mappings
not only ASCII case mappings.

## Performance improvements

Ruby 2.4 also contains the following performance improvements including language changes:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

In some condition, `[x, y].max` and `[x, y].min` are optimized
so that a temporal array is not created.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Added Regexp#match? which executes regexp match without creating back reference object
and change `$~` to reduce object allocation.

### Other performance improvements

* [speed up instance variable access](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception and Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignored exceptions in threads unless another thread explicitly joins it.
With `report_on_exception = true`,
you can notice if a thread is died by an unhandled exception.

Send us feedback what should be the default of report_on_exception and about report-on-GC.

### [Thread deadlock detection now shows their backtrace and dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby has deadlock detection around waiting threads, but its report doesn't
have enough information to debug.
Ruby 2.4 shows who waits the thread and their backtrace.

Try and enjoy programming with Ruby 2.4.0-preview1, and [send us feedback](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)!

## Notable Changes since 2.3

See [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS)
and [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
for details.

With those changes, [1097 files changed, 97466 insertions(+), 58685 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1) since Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## Release Comment

See also the release schedule and other information:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering24)
