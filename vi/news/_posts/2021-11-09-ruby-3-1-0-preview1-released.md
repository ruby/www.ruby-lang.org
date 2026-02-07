---
layout: news_post
title: "Ruby 3.1.0 Preview 1 Released"
author: "naruse"
translator:
date: 2021-11-09 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.1.0-preview1" | first %}

We are pleased to announce the release of Ruby {{ release.version }}.

## YJIT: New experimental in-process JIT compiler


Ruby 3.1 merges YJIT, a new in-process JIT compiler developed by Shopify.

Since [Ruby 2.6 introduced MJIT in 2018](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/), its performance greatly improved, and finally [we achieved Ruby3x3 last year](https://www.ruby-lang.org/en/news/2020/12/25/ruby-3-0-0-released/). But even though Optcarrot has shown impressive speedups, the JIT hasn't benefited real world business applications.

Recently Shopify contributed many Ruby improvements to speed up their Rails application. YJIT is an important contribution, and aims to improve the performance of Rails applications.

Though MJIT is a method-based JIT compiler and uses an external C compiler, YJIT uses Basic Block Versioning and includes JIT compiler inside it. With Lazy Basic Block Versioning (LBBV) it first compiles the beginning of a method, and incrementally compiles the rest when the type of arguments and variables are dynamically determined. See [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781) for a detailed introduction.

With this technology, YJIT achieves both fast warmup time and performance improvements on most real-world software, up to 22% on railsbench, 39% on liquid-render.

<!-- 試す人向けのお知らせ -->

YJIT is still an experimental feature, and as such, it is disabled by default. If you want to use this, specify the `--yjit` command-line option to enable YJIT. It is also limited to macOS & Linux on x86-64 platforms for now.

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: A new debugger

A new debugger [debug.gem](https://github.com/ruby/debug) is bundled. debug.gem is fast debugger implementation and it provides many features like remote debugging, colorful REPL, IDE (VSCode) integration and more. It replaces `lib/debug.rb` standard library.

## error_highlight: Fine-grained error location in backtrace

A built-in gem, error_highlight, has been introduced. It includes fine-grained error location in backtrace:

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

This gem is enabled by default. You can disable it by using a command-line option `--disable-error_highlight`. See [the repository](https://github.com/ruby/error_highlight) in detail.

## Irb improvement

To be described in next preview.

## Other Notable New Features

### Language

* Values in Hash literals and keyword arguments can be omitted. [Feature #14579]
  * `{x:, y:}` is a syntax sugar of `{x: x, y: y}`.
  * `foo(x:, y:)` is a syntax sugar of `foo(x: x, y: y)`.

* Pin operator in pattern matching now takes an expression. [Feature #17411]

```ruby
Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
#=> [[3, 5], [5, 7], [11, 13]]
```


### RBS

RBS is a language to describe the structure of Ruby programs. See [the repository](https://github.com/ruby/rbs) for detail.

Updates since Ruby 3.0.0:

* `rbs collection` has been introduced to manage gems' RBSs.  [doc](https://github.com/ruby/rbs/blob/master/docs/collection.md)
* Many signatures for built-in and standard libraries have been added/updated.
* It includes many bug fixes and performance improvements too.

See [the CHANGELOG.md](https://github.com/ruby/rbs/blob/master/CHANGELOG.md) for more information.

### TypeProf

TypeProf is a static type analyzer for Ruby. It generates a prototype of RBS from non-type-annotated Ruby code. See [the document](https://github.com/ruby/typeprof/blob/master/doc/doc.md) for detail.

Updates since Ruby 3.0.0:

* [Experimental IDE support](https://github.com/ruby/typeprof/blob/master/doc/ide.md) has been implemented.
* Many bug fixes and performance improvements.

## Performance improvements

* MJIT
  * For workloads like Rails, the default `--jit-max-cache` is changed from 100 to 10000.
    The JIT compiler no longer skips compilation of methods longer than 1000 instructions.
  * To support Zeitwerk of Rails, JIT-ed code is no longer cancelled
    when a TracePoint for class events is enabled.

## Other notable changes since 3.0

* One-line pattern matching, e.g., `ary => [x, y, z]`, is no longer experimental.
* Multiple assignment evaluation order has been changed slightly. [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` was evaluated in order `baz`, `qux`, `foo`, and then `bar` in Ruby 3.0. In Ruby 3.1, it is evaluated in order `foo`, `bar`, `baz`, and then `qux`.
* Variable Width Allocation: Strings (experimental) [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

### Standard libraries updates

* Some standard libraries are updated.
  * RubyGems
  * Bundler
  * RDoc 6.4.0
  * ReLine
  * JSON 2.6.0
  * Psych 4.0.2
  * FileUtils 1.6.0
  * Fiddle
  * StringIO 3.0.1
  * IO::Console 0.5.9
  * IO::Wait 0.2.0
  * CSV
  * Etc 1.3.0
  * Date 3.2.0
  * Zlib 2.1.1
  * StringScanner
  * IpAddr
  * Logger 1.4.4
  * OStruct 0.5.0
  * Irb
  * Racc 1.6.0
  * Delegate 0.2.0
  * Benchmark 0.2.0
  * CGI 0.3.0
  * Readline(C-ext) 0.1.3
  * Timeout 0.2.0
  * YAML 0.2.0
  * URI 0.11.0
  * OpenSSL
  * DidYouMean
  * Weakref 0.1.1
  * Tempfile 0.1.2
  * TmpDir 0.1.2
  * English 0.7.1
  * Net::Protocol 0.1.2
  * Net::Http 0.2.0
  * BigDecimal
  * OptionParser 0.2.0
  * Set
  * Find 0.1.1
  * Rinda 0.1.1
  * Erb
  * NKF 0.1.1
  * Base64 0.1.1
  * OpenUri 0.2.0
  * SecureRandom 0.1.1
  * Resolv 0.2.1
  * Resolv::Replace 0.1.0
  * Time 0.2.0
  * PP 0.2.1
  * Prettyprint 0.1.1
  * Drb 2.1.0
  * Pathname 0.2.0
  * Digest 3.1.0.pre2
  * Un 0.2.0
* The following bundled gems are updated.
  * minitest 5.14.4
  * power_assert 2.0.1
  * rake 13.0.6
  * test-unit 3.5.0
  * rbs 1.6.2
  * typeprof 0.20.0
* The following default gems are now bundled gems.
  * net-ftp
  * net-imap
  * net-pop
  * net-smtp
  * matrix
  * prime

See [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)
since Ruby 3.0.0!

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
