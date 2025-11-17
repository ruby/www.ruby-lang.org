---
layout: news_post
title: "Ruby 4.0.0 preview2 Released"
author: "naruse"
translator:
date: 2025-11-17 00:00:00 +0000
lang: en
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview2" | first %}
We are pleased to announce the release of Ruby {{ release.version }}. Ruby 4.0 updates its Unicode version to 15.1.0, and so on.

## Language changes

* `*nil` no longer calls `nil.to_a`, similar to how `**nil` does
  not call `nil.to_hash`.  [[Feature #21047]]

## Core classes updates

Note: We're only listing notable updates of Core class.

* Binding

    * `Binding#local_variables` does no longer include numbered parameters.
      Also, `Binding#local_variable_get` and `Binding#local_variable_set` reject to handle numbered parameters.
      [[Bug #21049]]

* IO

    * `IO.select` accepts +Float::INFINITY+ as a timeout argument.
      [[Feature #20610]]

* String

    * Update Unicode to Version 15.1.0 and Emoji Version 15.1. [[Feature #19908]]
        (also applies to Regexp)


## Standard Library updates

Note: We're only listing notable updates of Standard librarires.

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## Compatibility issues

Note: Excluding feature bug fixes.



## Standard library compatibility issues


## C API updates


## JIT

* YJIT
    * YJIT stats
        * `ratio_in_yjit` no longer works in the default build.
          Use `--enable-yjit=stats` on `configure` to enable it on `--yjit-stats`.
        * Add `invalidate_everything` to default stats, which is
          incremented when every code is invalidated by TracePoint.
    * Add `mem_size:` and `call_threshold:` options to `RubyVM::YJIT.enable`.
* ZJIT
    * Add an experimental method-based JIT compiler.
      Use `--enable-zjit` on `configure` to enable the `--zjit` support.
    * As of Ruby 4.0.0-preview2, ZJIT is not yet ready for speeding up most benchmarks.
      Please refrain from evaluating ZJIT just yet. Stay tuned for the Ruby 4.0 release.
* RJIT
    * `--rjit` is removed. We will move the implementation of the third-party JIT API
      to the [ruby/rjit](https://github.com/ruby/rjit) repository.

## Miscellaneous changes



See [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
since Ruby 3.4.0!

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
