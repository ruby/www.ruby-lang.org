---
layout: news_post
title: "Ruby 2.7.0-preview1 Released"
author: "naruse"
translator:
date: 2019-04-20 00:00:00 +0000
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

<video autoplay="autoplay" loop="loop" width="478" height="202">
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

      SIZE:   16020966 bytes
      SHA1:   f968d0c6117a7767af0b354458195de1df628b93
      SHA256: b61dba9ed01e855000111964363fbd691219ab3c567455434717ecba962747ea
      SHA512: 820ac03c08fd6e8283275a0d37caac9787afb85426bbb27e2105d8007bbc7ad6a35b2b40c8af81cdbb7a00347d44e92b5ff9b6e7f48f22d05584cedb85578409
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283209 bytes
      SHA1:   fc31cb0620962f0aa73c902edfc8523ec5b2a2ec
      SHA256: 59da2314822add396f68ce3e8e43e98843d41f4eab2354edc7f793a1ec3f3359
      SHA512: e6726f21dc5e90f42e762a81cbf88caef325fe2d589d75a81d82663652695ed94b3be6e12fe238fc82e5caebb16e626456d9e9dfa4ecc6a55e532ba372b2d4de
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14040553 bytes
      SHA1:   0a03aa856d87110e14a621d5bf7378de59a9d682
      SHA256: b20c80adc1324c0ec87bf3f4a66b837771d7a30fc876d83e68e519c623cf0369
      SHA512: 282d51ab6a76f40014e7c1738a1a02484e12bd52057db953e356b300974f5a1603a14dc23e436587870767213816c5adda335e6f8716de02c8fd853c85447250
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11440260 bytes
      SHA1:   c7297e4a9e81657a9c8731da8de2e2aa4d4879c3
      SHA256: 540f11753f5805c1bf560c54a44d1ea04414217c7d319cac165de964e269399f
      SHA512: 78afd2b167658d0edb368a3f5f91446a5f6f63b451bfc1966af8964579bc74f6c6a2d227c8715ab742e97c6895ce4006b56ba0eed97b6effcd93555b43d90313

## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993, and is now developed as Open Source. It runs on multiple platforms and is used all over the world especially for web development.
