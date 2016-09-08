---
layout: news_post
title: "Ruby 2.4.0-preview2 Released"
author: "naruse"
translator:
date: 2016-09-08 18:00:00 +0900
lang: en
---

We are pleased to announce the release of Ruby 2.4.0-preview2.

Ruby 2.4.0-preview2 is the second preview of Ruby 2.4.0.
This preview2 is released earlier than usual because it includes so
many new features and improvements.
(This is the one usually released as preview1)
Feel free to
[send feedback](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)
since you can still change the features.

## [Unify Fixnum and Bignum into Integer](https://bugs.ruby-lang.org/issues/12005)

Though [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
doesn't specify details of the Integer class,
CRuby has two visible Integer classes: Fixnum and Bignum.
Ruby 2.4 unifies them into Integer.

All C extensions which touches Fixnum or Bignum needs to fix.

## [String supports Unicode case mappings](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` now handle
Unicode case mappings instead of only ASCII case mappings.

## Performance improvements

Ruby 2.4 also contains the following performance improvements including
language changes:

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` and `[x, y].min` are optimized to not create a temporary array
under certain conditions.

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

Added `Regexp#match?`, which executes a regexp match without creating
a back reference object and changing `$~` to reduce object allocation.

### Other performance improvements

* [speed up instance variable access](https://bugs.ruby-lang.org/issues/12274)

## Debugging

### [Thread#report_on_exception and Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby ignores exceptions in threads unless another thread explicitly joins them.
With `report_on_exception = true`,
you can notice if a thread has died due to an unhandled exception.

Send us feedback what should be the default for `report_on_exception`
and about report-on-GC.

### [Thread deadlock detection now shows threads with their backtrace and dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby has deadlock detection around waiting threads, but its report doesn't
include enough information for debugging.
Ruby 2.4's deadlock detection shows threads with their backtrace and
dependent threads.

Try and enjoy programming with Ruby 2.4.0-preview2, and
[send us feedback](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)!

## Notable Changes since 2.3

* Support OpenSSL 1.1.0
* ext/tk is now removed from stdlib [Feature #8539]

See [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS)
and [ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
for details.

With those changes,
[2353 files changed, 289060 insertions(+), 73816 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
since Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12417688 bytes
  * SHA1:   01c07fb5ea987a425c5d8773295d2d1578c4fe5a
  * SHA256: 316649418013dc2bf59af27f1f789cb9b143d30fc0a9deea72ec0abf05912913
  * SHA512: f6735c552179bed67264b533098e612708d3a08432d7d30a9cdcc47c3e6e69fdd3513fdc9df758c792cad57a8097b60da44061df499d2ddbef333cfc8744f083

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15591900 bytes
  * SHA1:   26084a3d48e60c36061c920f24d4be3902f8296c
  * SHA256: 3ea845a5f4fc48c907ebd0dcf158cc66efa4c33e32c5529132886dd3ff3efef0
  * SHA512: e460a8baf24e8c9480e8b47480d42aeb257b64a407913319ee8ab5c62779a56be8324aa3b11df6f0aa67a89019a8c256a2e01e0cb0867183ab6bb09a44ac79c6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9846052 bytes
  * SHA1:   f820981fd17d7f184ca5d503b0c1876aab836332
  * SHA256: d332972b62cd621a927d2b98ff2694ac19873e5361fbcc02aca75b9885fabdce
  * SHA512: b68458680f189391340a3286ec1f4dfa7a5534a9e3f8bcf5fe196926dbb3813e1187b892bf3a73b4d04a7c4ed75da337814bc74a149db207d24a2c299ab58bd7

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17400847 bytes
  * SHA1:   c1b56c520b0286e3f5fec1dc64aaa8a04af47b5d
  * SHA256: a7d0c755ebf529cec818adb0cb76074ed075d7261e40808f8b0d7fffe05661bb
  * SHA512: 1acb25dd743699ac272d47a74b3721642c3a12fe1b317ddafa816fd4c459f6d0c3e0a7e83e9ba8ebf05627bfd1c7545cde89b94ba50a6adc0bae1bbf08c2ae69

## Release Comment

See also the release schedule and other information:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering24)
