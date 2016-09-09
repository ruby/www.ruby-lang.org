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
This preview2 is released to get feedback from community.
Feel free to
[send feedback](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)
since you can still change the features.

## [Unify Fixnum and Bignum into Integer](https://bugs.ruby-lang.org/issues/12005)

Though [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
doesn't specify details of the Integer class,
CRuby had two visible Integer classes: Fixnum and Bignum.
Ruby 2.4 unifies them into Integer.
All C extensions which touches Fixnum or Bignum class needs to fix.

See also [the ticket](https://bugs.ruby-lang.org/issues/12005) and [akr's slide](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

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
[2353 files changed, 289057 insertions(+), 73847 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)
since Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12454994 bytes
  * SHA1:   88c4bbf76bd624689c98ab0ad43d98074488341b
  * SHA256: db484f3911f8d6471e106bb35c4db1a6d11e2b0ec348e614002ce5d19a88a37a
  * SHA512: fb9b664a54b74f69f69c59a57b03d90274f775a058f2cc41f9cfcc1cfa200e12972db48d2c7689419df6a3f0c7a8e383444d2e2c93f6f9cd15825183854bd24f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15590354 bytes
  * SHA1:   2deed5dc0115d2d7e2207f5ffea744e8db0729d1
  * SHA256: db0e97acf44c32ddd854a28bd6bdad7c5ad8a562bd00f2879386f39d48880f04
  * SHA512: 5d0f281ef57250a06bcc3eea4665da6b584e8a670e06cca135720bcd5f2fb0bbd4b2eb4ef34863de0f048766e2d65f070c03622186bb2fa68fb5beed44287631

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9785128 bytes
  * SHA1:   b3bd452819dfe54cb4c50785c4e65a145a26620b
  * SHA256: cc08f958cf584c4fb6f6acf012336bc19032c31c54a79d4b531a302b5de76494
  * SHA512: c08cdcc9e9c1fec36af3a1bfef3bca4df0202c8872ed8e6768f4d3f868f03c2888676c7e210b1d504eeadd09fd08047f7803f8fb9b85080469cf089f35540518

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401054 bytes
  * SHA1:   d0f2c8b252026d7dcddbc6ba01b16a121ead7bc6
  * SHA256: 6513426ab2c84696da3c7c024fdc269489ad2e6e008a27ffe244ac251799ab4c
  * SHA512: acb4f2234d5454af24af1c5187deb12d09543395654b9c52ecf7ef92ea4257a38e34a5a5062db1ce2b02425106ceb8ddd07f11856ae83c579d8b439e7f8632a0

## Release Comment

See also the release schedule and other information:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering24)
