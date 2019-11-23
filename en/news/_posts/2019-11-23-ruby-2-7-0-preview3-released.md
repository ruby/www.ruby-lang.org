---
layout: news_post
title: "Ruby 2.7.0-preview3 Released"
author: "naruse"
translator:
date: 2019-11-23 12:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.7.0-preview3.

A preview version is released to gather feedback for the final release planned to release in December.
This preview3 is mainly released to confirm the compatibility of keyword arguments.

It also introduces a number of new features and performance improvements, most notably:

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

{% highlight ruby %}
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
{% endhighlight %}

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

  {% highlight ruby %}
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  {% endhighlight %}

* When a method call passes keywords to a method that accepts keywords,
  but it does not pass enough required positional arguments, the
  keywords are treated as a final required positional argument, and a
  warning is emitted.  Pass the argument as a hash instead of keywords
  to avoid the warning and ensure correct behavior in Ruby 3.

  {% highlight ruby %}
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  {% endhighlight %}

* When a method accepts specific keywords but not a keyword splat, and
  a hash or keywords splat is passed to the method that includes both
  Symbol and non-Symbol keys, the hash will continue to be split, and
  a warning will be emitted.  You will need to update the calling code
  to pass separate hashes to ensure correct behavior in Ruby 3.

  {% highlight ruby %}
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  {% endhighlight %}

* If a method does not accept keywords, and is called with keywords,
  the keywords are still treated as a positional hash, with no warning.
  This behavior will continue to work in Ruby 3.

  {% highlight ruby %}
  def foo(opt={});  end; foo( key: 42 )   # OK
  {% endhighlight %}

* Non-symbols are allowed as a keyword argument keys if method accepts
  arbitrary keywords.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  {% highlight ruby %}
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  {% endhighlight %}

* <code>**nil</code> is allowed in method definitions to explicitly mark
  that the method accepts no keywords. Calling such a method with keywords
  will result in an ArgumentError.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  {% highlight ruby %}
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  {% endhighlight %}

* Passing an empty keyword splat to a method that does not accept keywords
  no longer passes an empty hash, unless the empty hash is necessary for
  a required parameter, in which case a warning will be emitted.  Remove
  the double splat to continue passing a positional hash.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  {% highlight ruby %}
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  {% endhighlight %}

NOTE: Too many deprecation warnings about keyword argument incompatibility have been pointed out to be too verbose.  Currently, two possible solutions are discussed; disabling deprecation warnings by default ([#16345](https://bugs.ruby-lang.org/issues/16345)) or suppressing duplicated warnings ([#16289](https://bugs.ruby-lang.org/issues/16289)).  The final decision is not done, but will be fixed by the official release.

## Other Notable New Features

* A method reference operator, <code>.:</code>, is introduced as an experimental feature in earlier preview, but it reverted.  [[Feature #12125]](https://bugs.ruby-lang.org/issues/12125), [[Feature #13581]]( https://bugs.ruby-lang.org/issues/13581), [[Feature #16275]](https://bugs.ruby-lang.org/issues/16275)

* Numbered parameter as the default block parameter is introduced as an experimental feature.  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* A beginless range is experimentally introduced.  It might not be as useful
  as an endless range, but would be good for DSL purpose. [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  {% highlight ruby %}
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  {% endhighlight %}

* `Enumerable#tally` is added.  It counts the occurrence of each element.

  {% highlight ruby %}
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  {% endhighlight %}

* Calling a private method on `self` is now allowed.  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297) [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  {% highlight ruby %}
  def foo
  end
  private :foo
  self.foo
  {% endhighlight %}

* `Enumerator::Lazy#eager` is added.  It generates a non-lazy enumerator
  from a lazy enumerator.  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  {% highlight ruby %}
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  {% endhighlight %}

## Performance improvements

* JIT [Experimental]

  * JIT-ed code is recompiled to less-optimized code when an optimization assumption is invalidated.

  * Method inlining is performed when a method is considered as pure. This optimization is still experimental and many methods are NOT considered as pure yet.

  * Default value of `--jit-min-calls` is changed from 5 to 10,000

  * Default value of `--jit-max-cache` is changed from 1,000 to 100

* ~~`Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` and `nil.to_s` now always return a frozen String. The returned String is always the same for a given object. [Experimental]  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)~~ reverted

* The performance of `CGI.escapeHTML` is improved. [GH-2226](https://github.com/ruby/ruby/pull/2226)

* The performance of Monitor and MonitorMixin is improved. [[Feature #16255]](https://bugs.ruby-lang.org/issues/16255)

## Other notable changes since 2.6

* Some standard libraries are updated.
  * Bundler 2.1.0.pre.3 ([History](https://github.com/bundler/bundler/blob/2-1-stable/CHANGELOG.md#210pre3-november-8-2019))
  * RubyGems 3.1.0.pre.3 ([History](https://github.com/rubygems/rubygems/blob/3.1/History.txt))
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Some of other libraries that have no original version are also updated.

* Promote stdlib to default gems
  * The following default gems was published at rubygems.org
    * benchmarck
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * The following default gems only promoted ruby-core, Not yet published at rubygems.org.
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* `Proc.new` and `proc` with no block in a method called with a block is warned now.

* `lambda` with no block in a method called with a block errs.

* Update Unicode version and Emoji version from 11.0.0 to 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Update Unicode version to 12.1.0, adding support for U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, and `Date.parse` support the new Japanese era.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Require compilers to support C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Details of our dialect: <https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/C99>

* ~~Regexp#match{?} with nil raises TypeError as String, Symbol [[Feature #13083]](https://bugs.ruby-lang.org/issues/13083)~~ reverted

 3895 files changed, 213426 insertions(+), 96934 deletions(-)
See [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview3/NEWS) or [commit logs](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview3) for more details.

With those changes, [stat](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview3) since Ruby 2.6.0!

Enjoy programming with Ruby 2.7!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview3.tar.bz2>

      SIZE:   14628168 bytes
      SHA1:   849a96041202ad3beea82e1069694740d907d583
      SHA256: 09de8d3a014904142b7bc111195ba8094f6eeb59eb529f7bb0512d8b0fc06f5d
      SHA512: 661eaff1830546cea9e36f1f5a3cb591d792a17ad18d2c00bd097d53757bf321f0d192ddb3c8fdc75c28a0ecbef587e433ad1b345cdeeb4aa6a4744f7e828fbb
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview3.tar.gz>

      SIZE:   16715144 bytes
      SHA1:   a90300e13b4c8778c798e60b7d782f9808cfe492
      SHA256: 54300275a17a0367bab91ad54b51faf3d45955041f0bf69a4612fe7b0179f4f2
      SHA512: 9083525de830a4b2e8685681dfaa3bce14cc1ed7360f5540211f6aa97967e316983554596adf442dda52041245e31ec42bffd1982d28ad5e5c4c230be3fa7d62
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview3.tar.xz>

      SIZE:   11926312 bytes
      SHA1:   b40a6c8c11a0ba7c0d9f1548358da7c662673852
      SHA256: aaf3d78e2d7b3d42c668f9f619a016507771552e207f7729b3feba19b13c591a
      SHA512: 2a38ac56d63522bf998eaca755fa395ce490b4eaaa065b3345e9f4b57f6a1407b8089735b3dcdf6af9b761a9efe963f716f755867955e69c52e2ab5f0680e974
* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview3.zip>

      SIZE:   20689945 bytes
      SHA1:   0de6f8922f7be5b4341ad66e69f309473ba7b905
      SHA256: 3b227bf242de646f7479ec145bc9445e5fc6a24648a3912bfb8ac02b7effcdb7
      SHA512: a44bca1cd93e916ec137d65a0e844f1ea84f4d64409f8e2522c9bbcc16f43a61f3bdb5ff8821de62349678da344056b774762d6e625df9ee36fa66d08e244dce

## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993, and is now developed as Open Source. It runs on multiple platforms and is used all over the world especially for web development.
