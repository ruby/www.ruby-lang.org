---
layout: news_post
title: "Ruby 2.4.0 Released"
author: "naruse"
translator:
date: 2016-12-25 00:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.4.0.

Ruby 2.4.0 is the first stable release of the Ruby 2.4 series.
It introduces many new features, for example:

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

## Other notable changes since 2.3

* Support OpenSSL 1.1.0 (drop support for 0.9.7 or prior)
* ext/tk is now removed from stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC is now removed from stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

See [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)
or commit logs for details.

With those changes,
[2523 files changed, 289129 insertions(+), 84670 deletions(-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)
since Ruby 2.3.0!

Merry Christmas, Happy Holidays, and enjoy programming with Ruby 2.4!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
