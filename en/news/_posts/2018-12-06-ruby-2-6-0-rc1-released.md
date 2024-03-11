---
layout: news_post
title: "Ruby 2.6.0-rc1 Released"
author: "naruse"
translator:
date: 2018-12-06 00:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.6.0-rc1.

Ruby 2.6.0-rc1 is the first release candidate of Ruby 2.6.0.
It introduces some new features and performance improvements, for example:

## JIT

Ruby 2.6 introduces an initial implementation of JIT (Just-in-time) compiler.

JIT compiler aims to improve performance of any Ruby program execution.
Unlike ordinary JIT compilers for other languages, Ruby's JIT compiler does JIT compilation in a unique way, which prints C code to a disk and spawns common C compiler process to generate native code.
See also: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

How to use: Just specify `--jit` in command line or `$RUBYOPT` environment variable.
Specifying `--jit-verbose=1` allows to print basic information of ongoing JIT compilation. See `ruby --help` for other options.

The main purpose of this JIT release is to provide a chance to check if it works for your platform and to find out security risks before the 2.6 release.
JIT compiler is supported when Ruby is built by GCC, Clang, or Microsoft VC++, which needs to be available on runtime. Otherwise you can't use it for now.

As of Ruby 2.6.0-rc1, we achieved 1.7x faster performance than Ruby 2.5 on CPU-intensive non-trivial benchmark workload called Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>. We're going to improve the performance on memory-intensive workload like Rails application as well.

Stay tuned for the new age of Ruby's performance.

## RubyVM::AbstractSyntaxTree [Experimental]

Ruby 2.6 introduces `RubyVM::AbstractSyntaxTree` module.

This module has `parse` method which parses a given ruby code of string and returns AST (Abstract Syntax Tree) nodes, and `parse_file` method which parses a given ruby code file and returns AST nodes.
`RubyVM::AbstractSyntaxTree::Node` class is also introduced. You can get location information and children nodes from `Node` objects. This feature is experimental. Compatibility of the structure of AST nodes are not guaranteed.

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

* Add `:exception` option to let `Kernel#system` raise error instead of returning `false`.  [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* add the oneshot mode [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)
  * This mode checks "whether each line was executed at least once or not", instead of "how many times each line was executed".  A hook for each line is fired at most once, and after it is fired the hook flag is removed, i.e., it runs with zero overhead.
  * Add `:oneshot_lines` keyword argument to Coverage.start.
  * Add `:stop` and `:clear` keyword arguments to Coverage.result. If `clear` is true, it clears the counters to zero.  If `stop` is true, it disables coverage measurement.
  * Coverage.line_stub, which is a simple helper function that creates the "stub" of line coverage from a given source code.

* `FileUtils#cp_lr`.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Performance improvements

* Speedup `Proc#call` because we don't need to care about `$SAFE` any more.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  With `lc_fizzbuzz` benchmark which uses `Proc#call` so many times we can measure
  x1.4 improvements [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

* Speedup `block.call` where `block` is passed block parameter. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 improves block passing performance. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
  Additionally, Ruby 2.6 improves the performance of passed block calling.
  With micro-benchmark we can observe x2.6 improvement.

* Transient Heap (theap) is introduced. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)
  theap is managed heap for short-living memory objects which are pointed by
  specific classes (Array, Hash, Object, and Struct). For example, making small
  and short-living Hash object is x2 faster. With rdoc benchmark, we observed
  6-7% performance improvement.

## Other notable changes since 2.5

* `$SAFE` is a process global state and we can set `0` again.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Passing `safe_level` to `ERB.new` is deprecated. `trim_mode` and `eoutvar` arguments are changed to keyword arguments. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Supported Unicode version is updated to 11. It is planned to update 12 and 12.1 in future TEENY releases of Ruby 2.6.

* Merge RubyGems 3.0.0.beta3. `--ri` and `--rdoc` options was removed. Please use `--document` and `--no-document` options instead of them.

* Merge [Bundler](https://github.com/bundler/bundler) as Default gems.

See [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc1/NEWS)
or the [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
for details.

With those changes,
[6376 files changed, 227364 insertions(+), 51599 deletions(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
since Ruby 2.5.0!

Enjoy programming with Ruby 2.6.0-rc1!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.gz>

      SIZE:   16823448 bytes
      SHA1:   889db7731fd43f6dbf7f31ffdb0a29bba1a8d356
      SHA256: 6d6183639ed9c02320d7132e97c65489a39e24d8b55fc4ed35ac53d1189cb61d
      SHA512: ad101adee5c43f3645561e73970f15d4e9141f707da69a92e224575c665949e18ca53389e5315fca2ea3934d77967a59e304353cde4a915537e7c4e4ee20be73

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.zip>

      SIZE:   20737499 bytes
      SHA1:   457e39aee1978da5e42af42a6ad230421544aa07
      SHA256: 2bcdf468de499e4d6983d60d63dcc883f4c54fdc05a08a54eb93d315477bc4cc
      SHA512: 0842fae8a199f6c1e76f5d775edbf468e18a54f0419324eb73595e0268c728c71733371d71dc2fa342105dbc487987ca5556948a9ef067276a7b5f552462802a

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.bz2>

      SIZE:   14607078 bytes
      SHA1:   269fe9d414d7731e4a63959fadffe5c50c08ce0e
      SHA256: b4e9c0e8801946e9f0baba30948955f4341e9e04f363c206b7bd774208053eb5
      SHA512: cbd6281b2aab6fbce3f699c1ab57e5423304dca7a547a0b3cd4e8e980326dc7b85b2ca2bfaf3f3a648d40f4222fdf1740d81d422790ee7ae1ba1ed33eb11e3e8

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.xz>

      SIZE:   11851908 bytes
      SHA1:   3b93fdf1c5bd969ab4fe0a8176a6cf64e4597e6e
      SHA256: 21d9d54c20e45ccacecf8bea4dfccd05edc52479c776381ae98ef6a7b4afa739
      SHA512: 3d93d8d80e4900e8b3a27f904ed60581cebc6c55f4ab7acafc81e95001f92f3ea4ddec2da6169b1ed5e0146f7b7c35c1c13b3243955d5825c72170834fe933f3
