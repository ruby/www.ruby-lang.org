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

This introduces `GC.compact` method for compacting the heap. This function compacts live objects in the heap so that fewer pages may be used, and the heap may be more CoW friendly. [#15626](https://bugs.ruby-lang.org/issues/15626)

Known issues: It may cause Segmentation Fault if MJIT is enabled. Please avoid to use both Compaction GC and MJIT at the same time.

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

## REPL improvement

`irb`, bundled interactive environment (REPL; Read-Eval-Print-Loop), now supports multi-line editing. It's powered by `reline`, `readline` compatible pure Ruby implementation.
It also provides rdoc integration. In `irb` you can show the reference of given class, module, and method.  [#14683](https://bugs.ruby-lang.org/issues/14683) [#14787](https://bugs.ruby-lang.org/issues/14787) [#14918](https://bugs.ruby-lang.org/issues/14918)

<video autoplay="autoplay" loop="loop" width="478" height="202">
  <source src="//ftp.ruby-lang.org/pub/media/irb_multiline.mp4" type="video/mp4">
</video>

## Other Notable New Features

* Method reference operator, <code>.:</code> is introduced as an experimental feature.  [#12125]( https://bugs.ruby-lang.org/issues/12125) [#13581]( https://bugs.ruby-lang.org/issues/13581)

* Numbered parameter as the default block parameter is introduced as an experimental feature.  [#4475](https://bugs.ruby-lang.org/issues/4475)

* A beginless range is experimentally introduced.  It might not be as useful
  as an endless range, but would be good for DSL purpose. [14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      where(sales: ..100)

## Performance improvements

* JIT [Experimental]

  * JIT-ed code is recompiled to less-optimized code when an optimization assumption is invalidated.

  * Method inlining is performed when a method is considered as pure. This optimization is still experimental and many methods are NOT considered as pure yet.

  * Default value of +--jit-min-calls+ is changed from 5 to 10,000

  * Default value of +--jit-max-cache+ is changed from 1,000 to 100

## Other notable changes since 2.6

* Proc.new and proc with no block in a method called with a block is warned now.

* lambda with no block in a method called with a block errs.

* Update Unicode version and Emoji version from 11.0.0 to 12.0.0.  [Feature #15321]

* Update Unicode version to 12.1.0, adding support for U+32FF SQUARE ERA NAME REIWA.  [Feature #15195]

* Date.jisx0301, Date#jisx0301, and Date.parse provisionally support the new Japanese era as an informal extension, until the new JIS X 0301 is issued.  [Feature #15742]

* Require compilers to support C99 [Misc #15347]
  * Details of our dialect: https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99

See [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) or [commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) for more details.

With those changes, [6376 files changed, 227364 insertions(+), 51599 deletions(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) since Ruby 2.6.0!

Enjoy programming with Ruby 2.7!

## Download



## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993, and now is developing as Open Source. It runs on multiple platforms and used by all over the world especially for Web Development.
