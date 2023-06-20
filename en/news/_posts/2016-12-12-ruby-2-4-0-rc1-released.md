---
layout: news_post
title: "Ruby 2.4.0-rc1 Released"
author: "naruse"
translator:
date: 2016-12-12 09:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.4.0-rc1.

Ruby 2.4.0-rc1 is the first release candidate of Ruby 2.4.0.
This rc1 is released to get feedback from the community.
Feel free to
[send feedback](https://github.com/ruby/ruby/wiki/How-To-Report)
since you can still fix the features.

## [Introduce hash table improvement (by Vladimir Makarov)](https://bugs.ruby-lang.org/issues/12142)

Improve the internal structure of hash table (st_table) by introducing open addressing
and an inclusion order array.
This improvement has been discussed with many people, especially with Yura Sokolov.

## Binding#irb: Start a REPL session similar to `binding.pry`

While you are debugging, you may often use `p` to see the value of variables.
With [pry](https://github.com/pry/pry) you can use `binding.pry` in your application
to launch a REPL and run any Ruby code.
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
introduces `binding.irb` which behaves like that with irb.

## [Unify Fixnum and Bignum into Integer](https://bugs.ruby-lang.org/issues/12005)

Though [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
doesn't specify details of the Integer class,
Ruby had two visible Integer classes: Fixnum and Bignum.
Ruby 2.4 unifies them into Integer.
All C extensions which touch the Fixnum or Bignum class need to be fixed.

See also [the ticket](https://bugs.ruby-lang.org/issues/12005) and [akr's slides](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

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
and about report-on-GC, which shows a report when a thread is
garbage collected without join.

### [Thread deadlock detection now shows threads with their backtrace and dependency](https://bugs.ruby-lang.org/issues/8214)

Ruby has deadlock detection around waiting threads, but its report doesn't
include enough information for debugging.
Ruby 2.4's deadlock detection shows threads with their backtrace and
dependent threads.

Try and enjoy programming with Ruby 2.4.0-rc1, and
[send us feedback](https://github.com/ruby/ruby/wiki/How-To-Report)!

## Other notable changes since 2.3

* Support OpenSSL 1.1.0 (drop support for 0.9.7 or prior)
* ext/tk is now removed from stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC is now removed from stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

See [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS)
or commit logs for details.

With those changes,
[2519 files changed, 288606 insertions(+), 83896 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)
since Ruby 2.3.0!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## Release Comment

See also the release schedule and other information:

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
