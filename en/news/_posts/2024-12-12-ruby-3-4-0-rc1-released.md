---
layout: news_post
title: "Ruby 3.4.0 rc1 Released"
author: "naruse"
translator:
date: 2024-12-12 00:00:00 +0000
lang: en
---

{% assign release = site.data.releases | where: "version", "3.4.0-rc1" | first %}
We are pleased to announce the release of Ruby {{ release.version }}.

## Prism

Switch the default parser from parse.y to Prism. [[Feature #20564]]

## Modular GC

* Alternative garbage collector (GC) implementations can be loaded dynamically
  through the modular garbage collector feature. To enable this feature,
  configure Ruby with `--with-modular-gc` at build time. GC libraries can be
  loaded at runtime using the environment variable `RUBY_GC_LIBRARY`.
  [[Feature #20351]]

* Ruby's built-in garbage collector has been split into a separate file at
  `gc/default/default.c` and interacts with Ruby using an API defined in
  `gc/gc_impl.h`. The built-in garbage collector can now also be built as a
  library using `make modular-gc MODULAR_GC=default` and enabled using the
  environment variable `RUBY_GC_LIBRARY=default`. [[Feature #20470]]

* An experimental GC library is provided based on [MMTk](https://www.mmtk.io/).
  This GC library can be built using `make modular-gc MODULAR_GC=mmtk` and
  enabled using the environment variable `RUBY_GC_LIBRARY=mmtk`. This requires
  the Rust toolchain on the build machine. [[Feature #20860]]


## Language changes

* String literals in files without a `frozen_string_literal` comment now behave
  as if they were frozen. If they are mutated a deprecation warning is emitted.
  These warnings can be enabled with `-W:deprecated` or by setting `Warning[:deprecated] = true`.
  To disable this change, you can run Ruby with the `--disable-frozen-string-literal`
  command line argument. [[Feature #20205]]

* `it` is added to reference a block parameter. [[Feature #18980]]

* Keyword splatting `nil` when calling methods is now supported.
  `**nil` is treated similarly to `**{}`, passing no keywords,
  and not calling any conversion methods.  [[Bug #20064]]

* Block passing is no longer allowed in index.  [[Bug #19918]]

* Keyword arguments are no longer allowed in index.  [[Bug #20218]]

## YJIT

TL;DR:
* Better performance on most benchmarks on both x86-64 and arm64 platforms.
* Reduced memory usage of compilation metadata
* Multiple bug fixes. YJIT is now even more robust and better tested.

New features:
* Add unified memory limit via `--yjit-mem-size` command-line option (default 128MiB)
  which tracks total YJIT memory usage and is more intuitive than the
  old `--yjit-exec-mem-size`.
* More statistics now always available via `RubyVM::YJIT.runtime_stats`
* Add compilation log to track what gets compiled via `--yjit-log`
  * Tail of the log also available at run-time via `RubyVM::YJIT.log`
* Add support for shareable consts in multi-ractor mode
* Can now trace counted exits with `--yjit-trace-exits=COUNTER`

New optimizations:
* Compressed context reduces memory needed to store YJIT metadata
* Improved allocator with ability to allocate registers for local variables
* When YJIT is enabled, use more Core primitives written in Ruby:
  * `Array#each`, `Array#select`, `Array#map` rewritten in Ruby for better performance [[Feature #20182]].
* Ability to inline small/trivial methods such as:
  * Empty methods
  * Methods returning a constant
  * Methods returning `self`
  * Methods directly returning an argument
* Specialized codegen for many more runtime methods
* Optimize `String#getbyte`, `String#setbyte` and other string methods
* Optimize bitwise operations to speed up low-level bit/byte manipulation
* Various other incremental optimizations

## Core classes updates

Note: We're only listing outstanding class updates.

* Exception

  * `Exception#set_backtrace` now accepts an array of `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` and `Fiber#raise` also accept this new format. [[Feature #13557]]

* Range

  * `Range#size` now raises `TypeError` if the range is not iterable. [[Misc #18984]]



## Compatibility issues

Note: Excluding feature bug fixes.

* Error messages and backtrace displays have been changed.
  * Use a single quote instead of a backtick as a opening quote. [[Feature #16495]]
  * Display a class name before a method name (only when the class has a permanent name). [[Feature #19117]]
  * `Kernel#caller`, `Thread::Backtrace::Location`'s methods, etc. are also changed accordingly.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

## C API updates

* `rb_newobj` and `rb_newobj_of` (and corresponding macros `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) have been removed. [[Feature #20265]]
* Removed deprecated function `rb_gc_force_recycle`. [[Feature #18290]]

## Miscellaneous changes

* Passing a block to a method which doesn't use the passed block will show
  a warning on verbose mode (`-w`).
  [[Feature #15554]]

* Redefining some core methods that are specially optimized by the interpeter
  and JIT like `String.freeze` or `Integer#+` now emits a performance class
  warning (`-W:performance` or `Warning[:performance] = true`).
  [[Feature #20429]]

See GitHub releases like [Logger](https://github.com/ruby/logger/releases) or
changelog for details of the default gems or bundled gems.

See [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
since Ruby 3.3.0!


## Download

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993,
and is now developed as Open Source. It runs on multiple platforms
and is used all over the world especially for web development.

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
