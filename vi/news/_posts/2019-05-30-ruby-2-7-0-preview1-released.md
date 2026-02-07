---
layout: news_post
title: "Ruby 2.7.0-preview1 Released"
author: "naruse"
translator:
date: 2019-05-30 00:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.7.0-preview1.

A preview version is released to gather feedback for the final release planned to release on December. It introduces a number of new features and performance improvements, most notably:

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

For more details, please see [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

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
  * Details of our dialect: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

See [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) or [commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) for more details.

With those changes, [1727 files changed, 76022 insertions(+), 60286 deletions(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) since Ruby 2.6.0!

Enjoy programming with Ruby 2.7!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993, and is now developed as Open Source. It runs on multiple platforms and is used all over the world especially for web development.
