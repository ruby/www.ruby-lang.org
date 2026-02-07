---
layout: news_post
title: "Ruby 2.6.0 Released"
author: "naruse"
translator:
date: 2018-12-25 00:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.6.0.

It introduces a number of new features and performance improvements, most notably:

 * A new JIT compiler.
 * The `RubyVM::AbstractSyntaxTree` module.

## JIT [Experimental]

Ruby 2.6 introduces an initial implementation of a JIT (Just-In-Time) compiler.

The JIT compiler aims to improve the performance of Ruby programs. Unlike traditional JIT compilers which operate in-process, Ruby's JIT compiler writes out C code to disk and spawns a common C compiler to generate native code. For more details about it, see the [MJIT organization by Vladimir Makarov](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#MJIT-organization).

In order to enable the JIT compiler, specify `--jit` on the command line or in the `$RUBYOPT` environment variable. Specifying `--jit-verbose=1` will cause the JIT compiler to print additional information. Read the output of `ruby --help` or the [documentation](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage) for other options.

The JIT compiler is supported when Ruby is built by GCC, Clang, or Microsoft VC++, which needs to be available at runtime.

As of Ruby 2.6.0, we have achieved [1.7x faster performance](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208) compared to Ruby 2.5 on a CPU-intensive, non-trivial benchmark called [Optcarrot](https://github.com/mame/optcarrot). However, it is still experimental and many other memory-intensive workloads like Rails applications might not benefit from it at the moment. For more details, see [Ruby 2.6 JIT - Progress and Future](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf).

Stay tuned for the new age of Ruby's performance.

## `RubyVM::AbstractSyntaxTree` [Experimental]

Ruby 2.6 introduces the `RubyVM::AbstractSyntaxTree` module. **Future compatibility of this module is not guaranteed**.

This module has a `parse` method, which parses the given string as Ruby code and returns the AST (Abstract Syntax Tree) nodes of the code. The `parse_file` method opens and parses the given file as Ruby code and returns AST nodes.

The `RubyVM::AbstractSyntaxTree::Node` class is also introduced. You can get source location and children nodes from `Node` objects. This feature is experimental.

## Other Notable New Features

* Add an alias of `Kernel#yield_self` named `#then`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* Constant names may start with a non-ASCII capital letter. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Introduce endless ranges. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  An endless range, `(1..)`, works as if it has no end. Here are some typical use cases:

      ary[1..]                          # identical to ary[1..-1] without magical -1
      (1..).each {|index| ... }         # enumerates values starting from index 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Add `Enumerable#chain` and `Enumerator#+`. [[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* Add function composition operators `<<` and `>>` to `Proc` and `Method`. [[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; identical to f(g(3))
      (f >> g).call(3) # -> 15; identical to g(f(3))

* Add `Binding#source_location`.  [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  This method returns the source location of the binding, a 2-element array of `__FILE__` and `__LINE__`.  Technically speaking, this is identical to `eval("[__FILE__, __LINE__]", binding)`. However, we are planning to change this behavior so that `Kernel#eval` ignores binding's source location [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352). As such, it is recommended to use `Binding#source_location` instead of `Kernel#eval`.

* Add an `exception:` option to `Kernel#system` which causes it to raise an exception on failure instead of returning `false`. [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Add a oneshot mode to `Coverage`. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * This mode checks "whether each line was executed at least once or not", instead of "how many times each line was executed".  A hook for each line is fired only once, and once it is fired the hook flag will be removed, i.e., it runs with zero overhead.
  * Add `oneshot_lines:` keyword argument to `Coverage.start`.
  * Add `stop:` and `clear:` keyword arguments to `Coverage.result`. If `clear` is true, it clears the counters to zero.  If `stop` is true, it disables coverage measurement.
  * `Coverage.line_stub` is a simple helper function that creates the "stub" of line coverage from a given source code.

* Add `FileUtils#cp_lr`.  It works just like `cp_r` but links instead of copies.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Performance improvements

* Speed up `Proc#call` by removing the temporary allocation for `$SAFE`.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  We have observed a 1.4x performance improvement in the `lc_fizzbuzz` benchmark that calls `Proc#call` numerous times. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* Speed up `block.call` when `block` is passed in as a block parameter. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Combined with improvements around block handling introduced in Ruby 2.5, block evaluation now performs 2.6x faster in a micro-benchmark in Ruby 2.6. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

* Transient Heap (`theap`) is introduced. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  `theap` is a managed heap for short-living memory objects which are pointed to by specific classes (`Array`, `Hash`, `Object`, and `Struct`). Making small and short-living Hash objects is 2x faster. With rdoc benchmark, we observed 6-7% performance improvement.

* Native implementations (`arm32`, `arm64`, `ppc64le`, `win32`, `win64`, `x86`, `amd64`) of coroutines to improve context switching performance of Fiber significantly. [[Feature #14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield` and `Fiber#resume` is about 5x faster on 64-bit Linux. Fiber intensive programs can expect up to 5% improvement overall.

## Other notable changes since 2.5

* `$SAFE` is now a process global state and it can be set back to `0`.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Passing `safe_level` to `ERB.new` is deprecated. `trim_mode` and `eoutvar` arguments have been changed to keyword arguments. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Unicode support is updated to version 11. We have plans to add support for Unicode version 12 and 12.1 in a future TEENY release of Ruby 2.6. This will include support for the [new Japanese era](http://blog.unicode.org/2018/09/new-japanese-era.html).

* Merge RubyGems 3.0.1. The `--ri` and `--rdoc` options have been removed. Please use the `--document` and `--no-document` options instead.

* [Bundler](https://github.com/bundler/bundler) is now installed as a default gem.

* In exception handling blocks, `else` without `rescue` now causes a syntax error. [EXPERIMENTAL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

See [NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS) or the [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) for more details.

With those changes, [6437 files changed, 231471 insertions(+), 98498 deletions(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) since Ruby 2.5.0!

Merry Christmas, Happy Holidays, and enjoy programming with Ruby 2.6!

## Known Problem

_(This section was added at January 28, 2019.)_

* [Net::Protocol::BufferedIO#write raises NoMethodError when sending large multi-byte string](https://github.com/ruby/ruby/pull/2058)

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
