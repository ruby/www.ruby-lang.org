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

  You can specity the measuring target by an option to `Coverage.start`:

      Coverage.start(lines: true, branches: true, methods: true)

  After some Ruby files are loaded, you can use `Coverage.result` to get
  the coverage result:

      Coverage.result
      #=> { "/path/to/file.rb"=>
      #     { :lines => [1, 2, 0, nil, ...],
      #       :branches =>
      #         { [:if, 0, 2, 1, 6, 4] =>
      #             { [:then, 1, 3, 2, 3, 8] => 0,
      #               [:else, 2, 5, 2, 5, 8] => 2
      #             }
      #         },
      #       :methods => {
      #          [Object, :foo, 1, 0, 7, 3] => 2
      #       }
      #     }
      #   }

  The result type of line coverage is not changed; it is just an array that
  contains numbers, which means the count that each line was executed,
  or `nil`s, which means that the line is not relevant.

  The result type of branch coverage is:

      { (jump base) => { (jump target) => (counter) } }

  where jump base and targets have the format

      [type, unique-id, start lineno, start column, end lineno, end column]

  For example, `[:if, 0, 2, 1, 6, 4]` reads an `if` statement that ranges from
  line 2 and column 1, to line 6 and column 4.  `[:then, 1, 3, 2, 3, 8]` reads
  a `then` clause that ranges from line 3 and column 2, to line 3 and column 8.
  Note that lineno starts from 1, and that columnno starts from 0.  So, the
  above example shows a branch from the `if` to the `then` was never executed,
  adn a branch from the `if` to the `else` was executed twice.

  The result type of method coverage is:

      { (method key) => (counter) }

  where method key has the format

      [class, method-name, start lineno, start column, end lineno, end column]

  For example, `[Object, :foo, 1, 0, 7, 3]` reads `Object#foo` that ranges from
  line 1 and column 0, to line 7 and column 3.  The above example shows this
  `Object#foo` was invoked twice.

  Note: To keep compatibility, passing no option to `Coverage.start` will measure
  only line coverage, and `Coverage.result` will return the old format:

      Coverage.result
      #=> { "/path/to/file.rb"=> [1, 2, 0, nil, ...] }

## Performance improvements

* About 10% speed-up by removing all `trace` instructions from overall bytecodes (instruction sequences). `trace` instructions were inserted to support `TracePoint`. However, most of case `TracePoint` is not used and `trace` instructions are pure-overhead. Instead of `trace` instruction, we use dynamic instrumentation technique. See [Feature #14104] for details.

* Performance of block passing using block parameters is improved by
  lazy Proc allocation. [Feature #14045]

* Mutex is rewritten to be smaller and faster. [Feature #13517]

* SecureRandom now prefers OS-provided sources over OpenSSL. [Bug #9569]

## Other notable changes since 2.4

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

