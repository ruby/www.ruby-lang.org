---
layout: news_post
title: "Ruby 2.5.0 Released"
author: "naruse"
translator:
date: 2017-12-25 00:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.5.0.

Ruby 2.5.0 is the first stable release of Ruby 2.5 series.
It introduces many new features and performance improvements, for example:

## New Features

* Print backtrace and error message in reverse order if STDERR is unchanged and a tty.
  [Feature #8661] [experimental]

* Top-level constant look-up is removed.  [Feature #11547]

* rescue/else/ensure are allowed inside do/end blocks.  [Feature #12906]

* Add yield\_self.  [Feature #6721]

* Support branch coverage and method coverage measurement. [Feature #13901]
  Branch coverage tells you which branches are executed, and which not.
  Method coverage tells you which methods are invoked, and which not.
  By running a test suite with this new feature, you can know which branches
  and methods are executed by a test, and evaluate total coverage of a test
  suite more strictly.

## Performance improvements

* About 10% speed-up by removing all `trace` instructions from overall bytecodes (instruction sequences). `trace` instructions were inserted to support `TracePoint`. However, most of case `TracePoint` is not used and `trace` instructions are pure-overhead. Instead of `trace` instruction, we use dynamic instrumentation technique. See [Feature #14104] for details.

* Given block passing by a block parameter is about 3 times faster than Ruby 2.4 by "Lazy Proc allocation" technique. We need to use a block parameter to pass given block to another methods. However, block parameters requires Proc creation and it becomes huge overhead for this purpose. "Lazy Proc allocation" solves this performance problem. See [Feature #14045] for details.

* Mutex is rewritten to be smaller and faster. [Feature #13517]

## Other notable changes since 2.4

* SecureRandom now prefers OS-provided sources over OpenSSL. [Bug #9569]
* Update to Onigmo 6.1.3.
  It adds the [absence operator](https://github.com/k-takata/Onigmo/issues/87).
  Note that Ruby 2.4.1 also includes this change.
* Update to RubyGems 2.7.0.
* Update to RDoc 6.0.0.
  * Change lexer from IRB based one to Ripper;
    this much improves the speed of generating documentation.
    [https://github.com/ruby/rdoc/pull/512]
  * Fix so many bugs from the last dozen years or so.
  * Support new Ruby syntaxes from the last several years.
* Update supported Unicode version to 10.0.0.

See [NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS)
or commit logs for details.

With those changes,
[6162 files changed, 339744 insertions(+), 28699 deletions(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)
since Ruby 2.4.0!

Merry Christmas, Happy Holidays, and enjoy programming with Ruby 2.5!

## Download

