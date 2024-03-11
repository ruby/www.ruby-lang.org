---
layout: news_post
title: "Ruby 3.3.0-preview2 Released"
author: "naruse"
translator:
date: 2023-09-14 00:00:00 +0000
lang: en
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview2" | first %}

We are pleased to announce the release of Ruby {{ release.version }}. Ruby 3.3 adds a new pure-Ruby JIT compiler named RJIT, uses Lrama as a parser generator, and many performance improvements especially YJIT.

## RJIT

* Introduced a pure-Ruby JIT compiler RJIT and replaced MJIT.
  * RJIT supports only x86\_64 architecture on Unix platforms.
  * Unlike MJIT, it doesn't require a C compiler at runtime.
* RJIT exists only for experimental purposes.
  * You should keep using YJIT in production.
* If you are interested in developing JIT for Ruby, please check out [k0kubun's presentation on Day 3 of RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Use Lrama instead of Bison

* Replace Bison with [Lrama LALR parser generator](https://github.com/yui-knk/lrama) [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * If you have interest, please see [The future vision of Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)

## YJIT

* Major performance improvements over 3.2
  * Support for splat and rest arguments has been improved.
  * Registers are allocated for stack operations of the virtual machine.
  * More calls with optional arguments are compiled.
  * Exception handlers are also compiled.
  * Instance variables no longer exit to the interpreter
    with megamorphic Object Shapes.
  * Unsupported call types no longer exit to the interpreter.
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===` are specially optimized.
  * Now more than 3x faster than the interpreter on optcarrot!
* Metadata for compiled code uses a lot less memory.
* Generate more compact code on ARM64
* Option to start YJIT in paused mode and then later enable it manually
  * `--yjit-pause` and `RubyVM::YJIT.resume`
  * This can be used to enable YJIT only once your application is done booting
* `ratio_in_yjit` stat produced by `--yjit-stats` is now available in release builds,
  a special stats or dev build is no longer required.
* Exit tracing option now supports sampling
  * `--trace-exits-sample-rate=N`
* More thorough testing and multiple bug fixes



## Other Notable New Features

### Language



## Performance improvements

* `defined?(@ivar)` is optimized with Object Shapes.

## Other notable changes since 3.2

### IRB

IRB has received several enhancements, including but not limited to:

- Advanced `irb:rdbg` integration that provides an equivalent debugging experience to `pry-byebug` ([doc](https://github.com/ruby/irb#debugging-with-irb)).
- Pager support for commands like `ls` and `show_cmds`.
- More accurate and helpful information provided by the `ls` and `show_source` commands.

In addition, IRB has also undergone extensive refactoring and received dozens of bug fixes to facilitate easier future enhancements.

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

RubyGems and Bundler warn if users require gem that is scheduled to become the bundled gems in the future version of Ruby.

The following default gems are updated.

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.8
* erb 4.0.3
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.7.4
* nkf 0.1.3
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.8
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* time 0.2.2
* timeout 0.4.0
* uri 0.12.2
* yarp 0.9.0

The following bundled gems are updated.

* minitest 5.19.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-imap 0.3.7
* rbs 3.2.1
* typeprof 0.21.8
* debug 1.8.0

The following default gem is now bundled.

* racc 1.7.1

See GitHub releases like [Logger](https://github.com/ruby/logger/releases) or
changelog for details of the default gems or bundled gems.

See [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
since Ruby 3.2.0!


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
