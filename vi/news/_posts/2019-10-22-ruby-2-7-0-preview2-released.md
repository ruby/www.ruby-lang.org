---
layout: news_post
title: "Ruby 2.7.0-preview2 Released"
author: "naruse"
translator:
date: 2019-10-22 12:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.7.0-preview2.

A preview version is released to gather feedback for the final release planned to release on December. It introduces a number of new features and performance improvements, most notably:

* Compaction GC
* Pattern Matching
* REPL improvement
* Separation of positional and keyword arguments

## Compaction GC

This release introduces Compaction GC which can defragment a fragmented memory space.

Some multi-threaded Ruby programs may cause memory fragmentation, leading to high memory usage and degraded speed.

The `GC.compact` method is introduced for compacting the heap. This function compacts live objects in the heap so that fewer pages may be used, and the heap may be more CoW friendly. [[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Experimental]

Pattern matching, widely used feature in functional programming languages, is introduced as an experimental feature. [[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)
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

`irb`, bundled interactive environment (REPL; Read-Eval-Print-Loop), now supports multi-line editing. It's powered by `reline`, `readline`-compatible pure Ruby implementation.
It also provides rdoc integration. In `irb` you can display the reference for a given class, module, or method.  [[Feature #14683]](https://bugs.ruby-lang.org/issues/14683), [[Feature #14787]](https://bugs.ruby-lang.org/issues/14787), [[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)
Besides, source lines shown at `binding.irb` and inspect results for core-class objects are now colorized.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Separation of positional and keyword arguments

Automatic conversion of keyword arguments and positional arguments is
deprecated, and conversion will be removed in Ruby 3.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

* When a method call passes a Hash at the last argument, and when it
  passes no keywords, and when the called method accepts keywords, a
  warning is emitted.  To continue treating as keywords, add a double
  splat operator to avoid the warning and ensure correct behavior in
  Ruby 3.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* When a method call passes keywords to a method that accepts keywords,
  but it does not pass enough required positional arguments, the
  keywords are treated as a final required positional argument, and a
  warning is emitted.  Pass the argument as a hash instead of keywords
  to avoid the warning and ensure correct behavior in Ruby 3.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* When a method accepts specific keywords but not a keyword splat, and
  a hash or keywords splat is passed to the method that includes both
  Symbol and non-Symbol keys, the hash will continue to be split, and
  a warning will be emitted.  You will need to update the calling code
  to pass separate hashes to ensure correct behavior in Ruby 3.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* If a method does not accept keywords, and is called with keywords,
  the keywords are still treated as a positional hash, with no warning.
  This behavior will continue to work in Ruby 3.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* Non-symbols are allowed as a keyword argument keys if method accepts
  arbitrary keywords.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* <code>**nil</code> is allowed in method definitions to explicitly mark
  that the method accepts no keywords. Calling such a method with keywords
  will result in an ArgumentError.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* Passing an empty keyword splat to a method that does not accept keywords
  no longer passes an empty hash, unless the empty hash is necessary for
  a required parameter, in which case a warning will be emitted.  Remove
  the double splat to continue passing a positional hash.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

## Other Notable New Features

* A method reference operator, <code>.:</code>, is introduced as an experimental feature.  [[Feature #12125]](https://bugs.ruby-lang.org/issues/12125), [[Feature #13581]]( https://bugs.ruby-lang.org/issues/13581)

* Numbered parameter as the default block parameter is introduced as an experimental feature.  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* A beginless range is experimentally introduced.  It might not be as useful
  as an endless range, but would be good for DSL purpose. [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` is added.  It counts the occurrence of each element.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Calling a private method on `self` is now allowed.  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297) [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` is added.  It generates a non-lazy enumerator
  from a lazy enumerator.  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Performance improvements

* JIT [Experimental]

  * JIT-ed code is recompiled to less-optimized code when an optimization assumption is invalidated.

  * Method inlining is performed when a method is considered as pure. This optimization is still experimental and many methods are NOT considered as pure yet.

  * Default value of `--jit-min-calls` is changed from 5 to 10,000

  * Default value of `--jit-max-cache` is changed from 1,000 to 100

* `Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` and `nil.to_s` now always return a frozen String. The returned String is always the same for a given object. [Experimental]  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* The performance of `CGI.escapeHTML` is improved. [GH-2226](https://github.com/ruby/ruby/pull/2226)

## Other notable changes since 2.6

* Some standard libraries are updated.
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Some of other libraries that have no original version are also updated.

* `Proc.new` and `proc` with no block in a method called with a block is warned now.

* `lambda` with no block in a method called with a block errs.

* Update Unicode version and Emoji version from 11.0.0 to 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Update Unicode version to 12.1.0, adding support for U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, and `Date.parse` support the new Japanese era.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Require compilers to support C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Details of our dialect: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

See [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview2/NEWS) or [commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) for more details.

With those changes, [3670 files changed, 201242 insertions(+), 88066 deletions(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) since Ruby 2.6.0!

Enjoy programming with Ruby 2.7!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993, and is now developed as Open Source. It runs on multiple platforms and is used all over the world especially for web development.
