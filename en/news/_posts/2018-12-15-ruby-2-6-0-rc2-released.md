---
layout: news_post
title: "Ruby 2.6.0-rc2 Released"
author: "naruse"
translator:
date: 2018-12-15 00:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 2.6.0-rc2.

Ruby 2.6.0-rc2 is the second release candidate of Ruby 2.6.0.
RC2 is released to test bundled Bundler 1.17 instead of 2.0.
It introduces some new features and performance improvements, for example:

## JIT

Ruby 2.6 introduces an initial implementation of a JIT (Just-in-time) compiler.

The JIT compiler aims to improve performance of any Ruby program execution.
Unlike ordinary JIT compilers for other languages, Ruby's JIT compiler does JIT compilation in a unique way, which writes C code to a disk and spawns a common C compiler process to generate native code.
See also: [MJIT organization (by Vladimir Makarov)](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

How to use: Just specify `--jit` in the command line or `$RUBYOPT` environment variable.
Specifying `--jit-verbose=1` allows to print basic information of ongoing JIT compilation. See `ruby --help` for other options.

The main purpose of this JIT release is to provide a chance to check if it works for your platform and to find out security risks before the 2.6 release.
The JIT compiler is supported when Ruby is built by GCC, Clang, or Microsoft VC++, which needs to be available at runtime. Otherwise you can't use it for now.

As of Ruby 2.6.0-rc2, we achieved 1.7x faster performance than Ruby 2.5 on a CPU-intensive non-trivial benchmark workload called Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208>. We're going to improve the performance on memory-intensive workloads like Rails applications as well.

Stay tuned for the new age of Ruby's performance.

## RubyVM::AbstractSyntaxTree [Experimental]

Ruby 2.6 introduces the `RubyVM::AbstractSyntaxTree` module.

This module has a `parse` method which parses Ruby code from a given string and returns AST (Abstract Syntax Tree) nodes, and a `parse_file` method which parses Ruby code from a given file and returns AST nodes.
The `RubyVM::AbstractSyntaxTree::Node` class is also introduced. You can get location information and children nodes from `Node` objects. This feature is experimental. Compatibility of the structure of AST nodes is not guaranteed.

## New Features

* Add a new alias `then` to `Kernel#yield_self`. [[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* `else` without `rescue` now causes a syntax error.  [EXPERIMENTAL][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

* Constant names may start with a non-ASCII capital letter. [[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* Introduce endless ranges. [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  An endless range, `(1..)`, is introduced. It works as if it has no end. This shows typical use cases:

      ary[1..]                             # identical to ary[1..-1] without magical -1
      (1..).each {|index| block }          # infinite loop from index 1
      ary.zip(1..) {|elem, index| block }  # ary.each.with_index(1) { }

* Add `Binding#source_location`.  [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  This method returns the source location of the binding, a 2-element array of `__FILE__` and `__LINE__`.  Traditionally, the same information could be retrieved by `eval("[__FILE__, __LINE__]", binding)`, but we are planning to change this behavior so that `Kernel#eval` ignores binding's source location [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352).  So, users should use this newly-introduced method instead of `Kernel#eval`.

* Add `:exception` option to let `Kernel#system` raise an exception on failure instead of returning `false`.  [[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* Add a oneshot mode to `Coverage`. [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * This mode checks "whether each line was executed at least once or not", instead of "how many times each line was executed".  A hook for each line is fired at most once, and after it is fired the hook flag is removed, i.e., it runs with zero overhead.
  * Add `:oneshot_lines` keyword argument to Coverage.start.
  * Add `:stop` and `:clear` keyword arguments to Coverage.result. If `clear` is true, it clears the counters to zero.  If `stop` is true, it disables coverage measurement.
  * Coverage.line_stub, which is a simple helper function that creates the "stub" of line coverage from a given source code.

* Add `FileUtils#cp_lr`.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## Performance improvements

* Speedup `Proc#call` because we don't need to care about `$SAFE` any more.
  [[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  With `lc_fizzbuzz` benchmark which uses `Proc#call` many times we can measure
  x1.4 improvements. [[Bug #10212]](https://bugs.ruby-lang.org/issues/10212).

* Speedup `block.call` where `block` is passed block parameter. [[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  Ruby 2.5 improves block passing performance. [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

  Additionally, Ruby 2.6 improves the performance of passed block calling.
  With micro-benchmark we can observe x2.6 improvement.

* Transient Heap (theap) is introduced. [[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  theap is a managed heap for short-living memory objects which are pointed to by
  specific classes (Array, Hash, Object, and Struct). For example, making a small
  and short-living Hash object is x2 faster. With rdoc benchmark, we observed
  6-7% performance improvement.

## Other notable changes since 2.5

* `$SAFE` now is a process global state and can be set to `0` again.  [[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* Passing `safe_level` to `ERB.new` is deprecated. `trim_mode` and `eoutvar` arguments are changed to keyword arguments. [[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* Supported Unicode version is updated to 11. It is planned to update to 12 and 12.1 in future TEENY releases of Ruby 2.6.

* Merge RubyGems 3.0.0.beta3. `--ri` and `--rdoc` options were removed. Please use `--document` and `--no-document` options instead.

* Merge [Bundler](https://github.com/bundler/bundler) as default gem.

See [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc2/NEWS)
or the [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
for details.

With those changes,
[6411 files changed, 228864 insertions(+), 97600 deletions(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)
since Ruby 2.5.0!

Enjoy programming with Ruby 2.6.0-rc2!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.gz>

      SIZE:   16723556 bytes
      SHA1:   a4d7f8c8c3584a60fe1a57d03d80162361fe3c78
      SHA256: 9c0245e96379246040f1fd0978f8e447e7f47cdccbdaffdb83302a995276b62b
      SHA512: 789f608f93db6e12835911f3105d9abe2fabb67cd22dc3bafdff38716ac56974925738e7f7788ebef5bdf67b6fd91f84a4ee78a3e5d072cfc8ee0972de737b08

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.zip>

      SIZE:   20643747 bytes
      SHA1:   c1a2898949d929dd952880f1c1c2bac2ef2609b4
      SHA256: e8a446cf1f2ffc14483604de0a5e12c2578dd2f672ae87798ca2bbb9b7b73899
      SHA512: 2d06feae13f485f5da59574672b14d03881ed532d652648f94e2435f5d81df623b5ef532b8ba8e0b9bc4ee6baf7c0328a5610eab753a9020a0fea2673254c76c

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.bz2>

      SIZE:   14581998 bytes
      SHA1:   94bbee97de4955e67effb7f512c58300617a3a09
      SHA256: b3d03e471e3136f43bb948013d4f4974abb63d478e8ff7ec2741b22750a3ec50
      SHA512: 9bfbe83fd3699b71bae2350801d8c967eb128e79b62a9d36fc0f011b83c53cab28a280939f4cc9f0a28f9bf02dce8eea30866ca4d06480dc44289400abf580ba

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.xz>

      SIZE:   11908088 bytes
      SHA1:   13a7f06d832dc28989e3e4321490a6ba528ed023
      SHA256: d620b3d87b3190867304067f3ce77f5305f7ec1b2e73b09c17710c97c028986d
      SHA512: a3dc43c0bc70dfdb9ff0d18b5b9797bbf332524f5d3bbb7940cf4e32286ca715808acfd11ebf3cdbe358a2466b7c6b5be3a7a784af7eb95c071fe1f8b4ab1261
