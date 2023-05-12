---
layout: news_post
title: "Ruby 3.3.0-preview1 Released"
author: "naruse"
translator:
date: 2023-05-12 00:00:00 +0000
lang: en
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview1" | first %}

We are pleased to announce the release of Ruby {{ release.version }}. Ruby 3.3 adds a new pure-Ruby JIT compiler named RJIT, uses lrama as a parser generator, and many performance improvements especially YJIT.

## RJIT

* Introduced a pure-Ruby JIT compiler RJIT and replaced MJIT.
  * RJIT supports only x86\_64 architecture on Unix platforms.
  * Unlike MJIT, it doesn't require a C compiler at runtime.
* RJIT exists only for experimental purposes.
  * You should keep using YJIT in production.
* If you are interested in developing JIT for Ruby, please check out [k0kubun's presentation on Day 3 of RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Use Lrama instead of Bison

* Replace Bison with [Lrama LALR parser generator](https://github.com/yui-knk/lrama) [Feature #19637]
  * If you have interest, please see [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)

## YJIT

* Significant performance improvements over 3.2
  * Splat and rest arguments support has been improved.
  * Registers are allocated for stack operations of the virtual machine.
  * More calls with optional arguments are compiled.
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===` are specially optimized.
  * Instance variables no longer exit to the interpreter
    with megamorphic Object Shapes.
* Metadata for compiled code uses a lot less memory.
* Improved code generation on ARM64
* Option to start YJIT in paused mode and then later enable it manually
  * `--yjit-pause` and `RubyVM::YJIT.resume`
  * This can be used to enable YJIT only once your application is done booting
* Exit tracing option now supports sampling
  * `--trace-exits-sample-rate=N`
* Multiple bug fixes



## Other Notable New Features

### Language



## Performance improvements

* `defined?(@ivar)` is optimized with Object Shapes.

## Other notable changes since 3.2



## Compatibility issues

Note: Excluding feature bug fixes.

### Removed constants

The following deprecated constants are removed.



### Removed methods

The following deprecated methods are removed.



## Stdlib compatibility issues

### `ext/readline` is retired

* We have `reline` that is pure Ruby implementation compatible with `ext/readline` API. We rely on `reline` in the future. If you need to use `ext/readline`, you can install `ext/readline` via rubygems.org with `gem install readline-ext`.
* We no longer need to install libraries like `libreadline` or `libedit`.

## C API updates

### Updated C APIs

The following APIs are updated.



### Removed C APIs

The following deprecated APIs are removed.



## Standard library updates



The following default gems are updated.

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.7
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.6.4
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.3
* stringio 3.0.7
* strscan 3.0.7
* syntax_suggest 1.0.4
* time 0.2.2
* timeout 0.3.2
* uri 0.12.1

The following bundled gems are updated.

* minitest 5.18.0
* rbs 3.1.0
* typeprof 0.21.7
* debug 1.8.0

See GitHub releases like [Logger](https://github.com/ruby/logger/releases) or
changelog for details of the default gems or bundled gems.

See [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
since Ruby 3.2.0!

Merry Christmas, Happy Holidays, and enjoy programming with Ruby 3.3!

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
