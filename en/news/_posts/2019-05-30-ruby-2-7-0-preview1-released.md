---
layout: news_post
title: "Ruby 2.7.0-preview1 Released"
author: "naruse"
translator:
date: 2019-05-30 00:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.7.0-preview1.

A preview version is released to gather feedback for the final release planed to release on December. It introduces a number of new features and performance improvements, most notably:

* Compaction GC
* Pattern Matching
* REPL improvement

## Compaction GC

This release introduces Compaction GC which can defragment a fragmented memory space.

Some multithread Ruby programs may cause memory fragmentation, leading to high memory usage and degraded speed.

The `GC.compact` method is introduced for compacting the heap. This function compacts live objects in the heap so that fewer pages may be used, and the heap may be more CoW friendly. [#15626](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Experimental]

Pattern matching, widely used feature in functional programming languages, is introduced as an experimental feature. [#14912](https://bugs.ruby-lang.org/issues/14912)
It can traverse a given object and assign its value if it matches a pattern.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

For more details, please see https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7.

## REPL improvement

`irb`, bundled interactive environment (REPL; Read-Eval-Print-Loop), now supports multi-line editing. It's powered by `reline`, `readline` compatible pure Ruby implementation.
It also provides rdoc integration. In `irb` you can display the reference for a given class, module, or method.  [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
Besides, source lines shown at `binding.irb` and inspect results for core-class objects are now colorized.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Other Notable New Features

* A method reference operator, <code>.:</code>, is introduced as an experimental feature.  [#12125]( https://bugs.ruby-lang.org/issues/12125), [#13581]( https://bugs.ruby-lang.org/issues/13581)

* Numbered parameter as the default block parameter is introduced as an experimental feature.  [#4475](https://bugs.ruby-lang.org/issues/4475)

* A beginless range is experimentally introduced.  It might not be as useful
  as an endless range, but would be good for DSL purpose. [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` is added.  It counts the occurrence of each element.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Performance improvements

* JIT [Experimental]

  * JIT-ed code is recompiled to less-optimized code when an optimization assumption is invalidated.

  * Method inlining is performed when a method is considered as pure. This optimization is still experimental and many methods are NOT considered as pure yet.

  * Default value of `--jit-min-calls` is changed from 5 to 10,000

  * Default value of `--jit-max-cache` is changed from 1,000 to 100

## Other notable changes since 2.6

* `Proc.new` and `proc` with no block in a method called with a block is warned now.

* `lambda` with no block in a method called with a block errs.

* Update Unicode version and Emoji version from 11.0.0 to 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Update Unicode version to 12.1.0, adding support for U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, and `Date.parse` provisionally support the new Japanese era as an informal extension, until the new JIS X 0301 is issued.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Require compilers to support C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Details of our dialect: <https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99>

See [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) or [commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) for more details.

With those changes, [6376 files changed, 227364 insertions(+), 51599 deletions(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) since Ruby 2.6.0!

Enjoy programming with Ruby 2.7!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16020363 bytes
      SHA1:   db070c20aceb235907e6a773dd147a292cb2a7ca
      SHA256: f0305c4d2a78d66c3cf91c3509a027753888d9b7fba28b8e6bc165854a58fc0b
      SHA512: d763a4330d43c7ffe16d20f95e8c695f29fafec7cea96953697dd07079e6daab23266a133c3f4e7a971a1781eb29388bafc305f9ad3a68ba4fed6c72f539dd04
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283369 bytes
      SHA1:   3ab08e70e15a6d4205c543478abd0dfb9a4aa751
      SHA256: 1ccc2fc75d2eb72b8a684272db5fb657cd1aa560f6eadae16cb5d97d0547c223
      SHA512: 0ff8bd687775c1d34d0e3eeccde7359990d94688ef4914f645db4e8b59586dcdc0817708505c127b1de1bb1406ecc8d1538370113f202e7bc69d8eceb5104383
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14039220 bytes
      SHA1:   041ce5746424cf07f02282f7c9b774e509de4071
      SHA256: 6b7e57399ac3be3233148e902bf3008fff3ad0b7bb2bb0ec57e6aaa85f79dd8b
      SHA512: e112a0d52509fe4b6954e08c3b67f2fb408784bc0df1c63828728c3f8d88a8917c6451606e2d9f35b6fefaa5ee648b0a3d51417456a5979bde2d079726479a24
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11437508 bytes
      SHA1:   009c197ceb96a6b4330048804e30ba351c3bc15b
      SHA256: 5fa3d54b3610fe57d129b304ca88849663dbd892b7f04a926952a1b254c0565e
      SHA512: 4940e0d879367946823284cf694975d479ce34fd77d3736dc2e4f5d9c601d085821d5112e59e4781d213e6c3dd0e1fa54d1244a32aac07868a1fe70d76b97572

## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993, and is now developed as Open Source. It runs on multiple platforms and is used all over the world especially for web development.
