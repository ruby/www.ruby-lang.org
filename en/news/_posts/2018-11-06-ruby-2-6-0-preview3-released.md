---
layout: news_post
title: "Ruby 2.6.0-preview3 Released"
author: "naruse"
translator:
date: 2018-11-06 00:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.6.0-preview3.

Ruby 2.6.0-preview3 is the third preview toward Ruby 2.6.0.
This preview3 is released to test new features before coming Release Candidate.

## JIT

Ruby 2.6 introduces an initial implementation of JIT (Just-in-time) compiler.

JIT compiler aims to improve performance of any Ruby program execution.
Unlike ordinary JIT compilers for other languages, Ruby's JIT compiler does JIT compilation in a unique way, which prints C code to a disk and spawns common C compiler process to generate native code.
See also: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

How to use: Just specify `--jit` in command line or `$RUBYOPT` environment variable.
Specifying `--jit-verbose=1` allows to print basic information of ongoing JIT compilation. See `ruby --help` for other options.

The main purpose of this JIT release is to provide a chance to check if it works for your platform and to find out security risks before the 2.6 release.
JIT compiler is supported when Ruby is built by GCC, Clang, or Microsoft VC++, which needs to be available on runtime. Otherwise you can't use it for now.

As of Ruby 2.6.0 preview3, we achieved 1.7x faster performance than Ruby 2.5 on CPU-intensive non-trivial benchmark workload called Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>. We're going to improve the performance on memory-intensive workload like Rails application as well.

Stay tuned for the new age of Ruby's performance.

## RubyVM::AST [Experimental]

Ruby 2.6 introduces `RubyVM::AST` module.

This module has `parse` method which parses a given ruby code of string and returns AST (Abstract Syntax Tree) nodes, and `parse_file` method which parses a given ruby code file and returns AST nodes.
`RubyVM::AST::Node` class is also introduced. You can get location information and children nodes from `Node` objects. This feature is experimental. Compatibility of the structure of AST nodes are not guaranteed.

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

* Transient Heap (theap) is introduced. [Bug #14858] [Feature #14989]
  theap is managed heap for short-living memory objects which are pointed by
  specific classes (Array, Hash, Object, and Struct). For example, making small
  and short-living Hash object is x2 faster. With rdoc benchmark, we observed
  6-7% performance improvement.

## Other notable changes since 2.5

* `$SAFE` is a process global state and we can set `0` again.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Passing `safe_level` to `ERB.new` is deprecated. `trim_mode` and `eoutvar` arguments are changed to keyword arguments. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Merge RubyGems 3.0.0.beta2. `--ri` and `--rdoc` options was removed. Please use `--document` and `--no-document` options instead of them.

* Merge [Bundler](https://github.com/bundler/bundler) as Default gems.

See [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS)
or the [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
for details.

With those changes,
[6474 files changed, 171888 insertions(+), 46617 deletions(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
since Ruby 2.5.0!

Enjoy programming with Ruby 2.6.0-preview3!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.gz>

      SIZE:   17071670 bytes
      SHA1:   67836fda11fa91e0b988a6cc07989fbceda025b4
      SHA256: 60243e3bd9661e37675009ab66ba63beacf5dec748885b9b93916909f965f27a
      SHA512: 877278cd6e9b947f5bb6ed78136efb232dcc9c5c218b7236576171e7c3cd7f6b7d10d07d8402014a14aba1fcd1913a4370f0725c561ead41d8a3fe92029f7f76

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.zip>

      SIZE:   21537655 bytes
      SHA1:   45f3c90dfffe03b746f21f24152666e361cbb41a
      SHA256: 9152af9e700349dcfa2eec196dd91587d42d70a6837fa2c415ebba1167587be1
      SHA512: 335de36cf56706326f4acc4bbd35be01e0ac5fff30d0a69b2e1630ba4c78f0e711822d1623d0099a517c824b154917d2f60be192dfb143a422cf1d17b38e1183

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.bz2>

      SIZE:   14973451 bytes
      SHA1:   5f2df5d8c5a3888ccb915d36a3532ba32cda8791
      SHA256: 1f09a2ac1ab26721923cbf4b9302a66d36bb302dc45e72112b41d6fccc5b5931
      SHA512: d1693625723796e8902f3e4c4fae444f2912af9173489f7cf18c99db2a217afc971b082fce7089e39f8edd54d762d2b4e72843c8306ed29b05ccb15ac03dbb5b

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.xz>

      SIZE:   12291692 bytes
      SHA1:   7f8216247745215e9645568e7a02140f9a029b31
      SHA256: 9856d9e0e32df9e5cdf01928eec363d037f1a76dab2abbf828170647beaf64fe
      SHA512: b4d3b17ecf96272c43cd7518c0b54dee63fc1150ad143e1d9c9d708506fe78676c80eb96cc47b8d46d1128bd483a53f16c944963a03d1f99f00131b74714df7b
