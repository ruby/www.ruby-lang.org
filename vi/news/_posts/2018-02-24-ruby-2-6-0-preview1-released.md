---
layout: news_post
title: "Ruby 2.6.0-preview1 Released"
author: "naruse"
translator:
date: 2018-02-24 00:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 2.6.0-preview1.

Ruby 2.6.0-preview1 is the first preview toward Ruby 2.6.0.
This preview1 is released earlier than usual because it includes an important new feature, JIT.

## JIT

Ruby 2.6 introduces an initial implementation of JIT (Just-in-time) compiler.

JIT compiler aims to improve performance of any Ruby program execution.
Unlike ordinary JIT compilers for other languages, Ruby's JIT compiler does JIT compilation in a unique way, which prints C code to a disk and spawns common C compiler process to generate native code.
See also: [MJIT organization by Vladimir Makarov](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization).

How to use: Just specify `--jit` in command line or `$RUBYOPT` environment variable. Specifying `--jit-verbose=1` allows to print basic information of ongoing JIT compilation. See `ruby --help` for other options.

The main purpose of this JIT release is to provide a chance to check if it works for your platform and to find out security risks before the 2.6 release.
Currently JIT compiler is supported only when Ruby is built by gcc or clang and the compiler is available on runtime. Otherwise you can't use it for now.

As of 2.6.0-preview1, we're just preparing infrastructure for JIT and very few optimizations are implemented. You can measure some of potential improvements in micro benchmarks with this release, but it is NOT ready for benchmarking final performance of Ruby's JIT compiler, especially for large programs like Rails applications.

We're going to implement method inlining in JIT compiler, which is expected to increase Ruby's performance significantly.

Also, we're planning to increase the supported platforms, and the next plan is to support Visual Studio.

Stay tuned for the new age of Ruby's performance.

## New Features

* Add `Random.bytes`. [Feature #4938]
* Add `Binding#source_location`.  [Feature #14230]

  This method returns the source location of binding, a 2-element array of `__FILE__` and `__LINE__`.  Traditionally, the same information could be retrieved by `eval("[__FILE__, __LINE__]", binding)`, but we are planning to change this behavior so that `Kernel#eval` ignores `binding`'s source location [Bug #4352].  So, users should use this newly-introduced method instead of `Kernel#eval`.

* Add `:exception` option to let `Kernel.#system` raise error instead of returning `false`. [Feature #14386]

## Performance improvements

* Speedup `Proc#call` because we don't need to care about `$SAFE` any more.
  [Feature #14318]

  With `lc_fizzbuzz` benchmark which uses `Proc#call` so many times we can measure
  x1.4 improvements [Bug #10212].

* Speedup `block.call` where `block` is passed block parameter. [Feature #14330]

  Ruby 2.5 improves block passing performance. [Feature #14045]
  Additionally, Ruby 2.6 improves the performance of passed block calling.
  With micro-benchmark we can observe 2.6x improvement.

## Other notable changes since 2.5

* `$SAFE` is a process global state and we can set `0` again. [Feature #14250]

* Passing `safe_level` to `ERB.new` is deprecated. `trim_mode` and `eoutvar` arguments are changed to keyword arguments. [Feature #14256]

* Merged RubyGems 2.7.6

See [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview1/NEWS)
or the [commit logs](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
for details.

With those changes,
[1115 files changed, 23023 insertions(+), 14748 deletions(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)
since Ruby 2.5.0!

Today, February 24th, is Ruby's 25th birthday.
Happy birthday Ruby, and enjoy programming with Ruby 2.6.0-preview1!

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.gz>

      SIZE:   16082501 bytes
      SHA1:   94b4a2f5f992dc9855364284e9c64316bf129c90
      SHA256: 2023c42676d9237481e1a97157d5e2ecc10db5e320d5b9cf872ec1d293265d61
      SHA512: 004696c4f087333ba7cb2285418dcce70f399966ae8fed817aab9759fd2d75beb088c4aeb294fcd4260112e8422f490cd4dbdfce402d73f96bb679b8bb3e1607

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.zip>

      SIZE:   19807007 bytes
      SHA1:   24d76f67bf913348eca783a2ecf6f3faf37299ae
      SHA256: 6c883927e80430cf07f2d90728d6c2c71164223f378a48ebf964d3b66319f623
      SHA512: 1e7f318cec1b7875fd9891df671078de7585b556695a2a85708483ddcacfd6e0b63b70ec2535e92ff981b4f72063721ed552df49688e066666fcd7ae520ae667

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.bz2>

      SIZE:   14104578 bytes
      SHA1:   9f0fb79643a4673a839b0c8496eccc6e1dbd022d
      SHA256: 8bd6c373df6ee009441270a8b4f86413d101b8f88e8051c55ef62abffadce462
      SHA512: d9cb270529a97670d54f43a0236fab072714e715c39277dab70b7a1843ec818e6700e47e1384c7256f9e0ae41ab2c0b768a0de38a5ecf4f4fff5da6ef5ad4944

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.xz>

      SIZE:   11423984 bytes
      SHA1:   bbbc89d760cdaadbca3cbff587295864edeff0af
      SHA256: 1d99139116e4e245ce543edb137b2a8873c26e9f0bde88d8cee6789617cc8d0e
      SHA512: d12ff29778d8d940344619881b4d8247c2fb6b44ac2b2dbddb7078828e893cfac9a5a95b5588f0afdbed52bdb6dea95cff1b9ce3ad47dfa62209e97dab8810b6
