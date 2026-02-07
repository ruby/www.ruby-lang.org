---
layout: news_post
title: "Ruby 2.6.0-preview2 Released"
author: "naruse"
translator:
date: 2018-05-31 00:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.6.0-preview2.

Ruby 2.6.0-preview2 is the second preview toward Ruby 2.6.0.
This preview2 is released earlier than usual because it includes an important new feature, JIT.

## JIT

Ruby 2.6 introduces an initial implementation of JIT (Just-in-time) compiler.

JIT compiler aims to improve performance of any Ruby program execution.
Unlike ordinary JIT compilers for other languages, Ruby's JIT compiler does JIT compilation in a unique way, which prints C code to a disk and spawns common C compiler process to generate native code.
See also: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

How to use: Just specify `--jit` in command line or `$RUBYOPT` environment variable.
Specifying `--jit-verbose=1` allows to print basic information of ongoing JIT compilation. See `ruby --help` for other options.

The main purpose of this JIT release is to provide a chance to check if it works for your platform and to find out security risks before the 2.6 release.
Currently JIT compiler is supported only when Ruby is built by gcc or clang and the compiler is available on runtime. Otherwise you can't use it for now.

As of 2.6.0-preview2, we're just preparing infrastructure for JIT and very few optimizations are implemented.
You can measure some of potential improvements in micro benchmarks with this release, but it is NOT ready for benchmarking final performance of Ruby's JIT compiler, especially for larger programs like Rails applications.

We're going to implement method iniling in JIT compiler, which is expected to increase Ruby's performance in order of magnitude.
Also, we're planning to increase the supported platforms, and the next plan is to support Visual Studio.

Stay tuned for the new age of Ruby's performance.

## RubyVM::AST [Experimental]

Ruby 2.6 introduces `RubyVM::AST` module.

This module has `parse` method which parses a given ruby code of string and returns AST (Abstract Syntax Tree) nodes, and `parse_file` method which parses a given ruby code file and returns AST nodes.

`RubyVM::AST::Node` class is also introduced you can get location information and children nodes from `Node` objects. This feature is experimental. Compatibility of the structure of AST nodes are not guaranteed.

## New Features

* Add a new alias `then` to `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` without `rescue` now causes a syntax error.  [EXPERIMENTAL]

* constant names may start with a non-ASCII capital letter. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* endless range [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  An endless range, `(1..)`, is introduced. It works as it has no end. This shows typical use cases:

      ary[1..]                          # identical to ary[1..-1] without magical -1
      (1..).each {|index| ... }         # infinite loop from index 1
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* Add `Binding#source_location`.  [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  This method returns the source location of binding, a 2-element array of `__FILE__` and `__LINE__`.  Traditionally, the same information could be retrieved by `eval("[__FILE__, __LINE__]", binding)`, but we are planning to change this behavior so that `Kernel#eval` ignores binding's source location [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352).  So, users should use this newly-introduced method instead of `Kernel#eval`.

* Add `:exception` option to let `Kernel.#system` raise error instead of returning `false`.  [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

## Performance improvements

* Speedup `Proc#call` because we don't need to care about `$SAFE` any more.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  With `lc_fizzbuzz` benchmark which uses `Proc#call` so many times we can measure
  x1.4 improvements [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

* Speedup `block.call` where `block` is passed block parameter. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 improves block passing performance. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
  Additionally, Ruby 2.6 improves the performance of passed block calling.
  With micro-benchmark we can observe x2.6 improvement.

## Other notable changes since 2.5

* `$SAFE` is a process global state and we can set `0` again.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Passing `safe_level` to `ERB.new` is deprecated. `trim_mode` and `eoutvar` arguments are changed to keyword arguments. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Merge RubyGems 3.0.0.beta1

See [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview2/NEWS)
or the [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
for details.

With those changes,
[4699 files changed, 45744 insertions(+), 30885 deletions(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
since Ruby 2.5.0!

Enjoy programming with Ruby 2.6.0-preview2!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.gz>

      SIZE:   16170732 bytes
      SHA1:   6867b00e81af0b70fcb6f1aa7fc22d89d48a7d12
      SHA256: ee15ab35f17c942b1f41bd792f2494f639affff6e03babf44708b72fdbb6de34
      SHA512: 95c5a277785dfeb3006503e1b9ccccefdf6ce29669d4576f0191ee6986ba0e3567fbbed18a8d2b1f147d637434e4a3a4fdf47d84995e10ad4a354950e9092690

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.zip>

      SIZE:   19850776 bytes
      SHA1:   eba80a09b552ce3142fd571ff5867a13736d170e
      SHA256: 97fc187b90570fce110d22803a319ab04e68700692b2b6b4e9961886f1a931e5
      SHA512: d5501819635bda64ac3dc717815652b692302b44a7cdf4c08edfa5cb9ec7f79a70fffc534879b316a4a9584825ed3c0948667beae2d7c313de58583931b981f4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.bz2>

      SIZE:   14209461 bytes
      SHA1:   a9b1b4f359601b94b3f5b77115fcbf3790ff69cd
      SHA256: d8ede03d5ad3abd9d2c81cf0ad17a41d22b747c003cc16fd59befb2aaf48f0b2
      SHA512: 3872227e9b1c97c206d19bf1e6ce15a38ee15a26c431b4436605dea67affcf16372358984df76b35e7abaa902c15c16f533ac7af47e3031dea9451bbe459b693

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.xz>

      SIZE:   11525372 bytes
      SHA1:   e795abe1a4f828b3d851f7148b4bf6c9d9a7e7fd
      SHA256: 00ddfb5e33dee24469dd0b203597f7ecee66522ebb496f620f5815372ea2d3ec
      SHA512: bef3e90e97d6e58889cd500c591c579b728ca5833022b690182c0bf4d661e437b3a2ca33470dac35fcf693897819b9d7f500c0f71b707e2fcdcb0644028f2c03
