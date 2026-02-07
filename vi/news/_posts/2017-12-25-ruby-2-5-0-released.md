---
layout: news_post
title: "Ruby 2.5.0 Released"
author: "naruse"
translator:
date: 2017-12-25 00:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.5.0.

Ruby 2.5.0 is the first stable release of the Ruby 2.5 series.
It introduces many new features and performance improvements.
The notable changes are as follows:

## New Features

* `rescue`/`else`/`ensure` are now allowed to be used directly with
  `do`/`end` blocks.
  [[Feature #12906]](https://bugs.ruby-lang.org/issues/12906)
* Add `yield_self` to yield given block in its context.
  Unlike `tap`, it returns the result of the block.
  [[Feature #6721]](https://bugs.ruby-lang.org/issues/6721)
* Support branch coverage and method coverage measurement.
  The branch coverage indicates which branches are executed and which are not.
  The method coverage indicates which methods are invoked and which are not.
  By running a test suite with these new features, you will know which
  branches and methods are executed, and evaluate total coverage of the test
  suite more strictly.
  [[Feature #13901]](https://bugs.ruby-lang.org/issues/13901)
* Hash#slice [[Feature #8499]](https://bugs.ruby-lang.org/issues/8499)
  and Hash#transform_keys [[Feature #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new can create classes that accept keyword arguments.
  [[Feature #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none?, and one? accept a pattern argument.
  [[Feature #11286]](https://bugs.ruby-lang.org/issues/11286)
* Top-level constant look-up is no longer available.
  [[Feature #11547]](https://bugs.ruby-lang.org/issues/11547)
* One of our most loved libraries, pp.rb, is now automatically loaded.
  You no longer have to write `require "pp"`.
  [[Feature #14123]](https://bugs.ruby-lang.org/issues/14123)
* Print backtrace and error message in reverse order (oldest call first,
  most recent call last). When a long backtrace appears on your terminal (TTY),
  you can easily find the cause line at the bottom of the backtrace.
  Note that the order is reversed only when the backtrace is printed out
  to the terminal directly.
  [[Feature #8661]](https://bugs.ruby-lang.org/issues/8661) [experimental]

## Performance improvements

* About 5-10% performance improvement by removing all `trace` instructions
  from overall bytecode (instruction sequences).
  The `trace` instruction was added to support the `TracePoint`.
  However, in most cases, `TracePoint` is not used and `trace` instructions
  are pure overhead. Instead, now we use a dynamic instrumentation technique.
  See [[Feature #14104]](https://bugs.ruby-lang.org/issues/14104) for more details.
* Block passing by a block parameter (e.g. `def foo(&b); bar(&b); end`)
  is about 3 times faster than Ruby 2.4 by "Lazy Proc allocation" technique.
  [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
* Mutex is rewritten to be smaller and faster.
  [[Feature #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB now generates code from a template twice as fast as Ruby 2.4.
* Improve performance of some built-in methods including `Array#concat`,
  `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+`, and more.
* IO.copy_stream uses copy_file_range(2) to copy offload.
  [[Feature #13867]](https://bugs.ruby-lang.org/issues/13867)

## Other notable changes since 2.4

* SecureRandom now prefers OS-provided sources over OpenSSL.
  [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
* Promote cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr,
  scanf, sdbm, stringio, strscan, webrick, zlib from standard libraries
  to default gems.
* Update to [Onigmo](https://github.com/k-takata/Onigmo/) 6.1.3.
  * It adds the [absence operator](https://github.com/k-takata/Onigmo/issues/87).
  * Note that [Ruby 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/) also includes this change.
* Update to Psych 3.0.2.
* Update to RubyGems 2.7.3.
* Update to RDoc 6.0.1.
  * [Switch the lexer from IRB based one to Ripper](https://github.com/ruby/rdoc/pull/512).
    This dramatically improves the performance of document generation.
  * Fix a significant amount of bugs that existed over ten years.
  * Add support for new Ruby syntax from the latest versions.
* Update supported Unicode version to 10.0.0.
* `Thread.report_on_exception` is now set to true by default.
  This change helps debugging of multi-threaded programs.
  [[Feature #14143]](https://bugs.ruby-lang.org/issues/14143)
* IO#write now receives multiple arguments.
  [[Feature #9323]](https://bugs.ruby-lang.org/issues/9323)

See [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)
or the [commit logs](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
for details.

With those changes,
[6158 files changed, 348484 insertions(+), 82747 deletions(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
since Ruby 2.4.0!

Merry Christmas, Happy Holidays, and enjoy programming with Ruby 2.5!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
