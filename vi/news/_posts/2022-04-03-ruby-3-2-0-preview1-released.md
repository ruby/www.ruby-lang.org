---
layout: news_post
title: "Ruby 3.2.0 Preview 1 Released"
author: "naruse"
translator:
date: 2022-04-03 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview1" | first %}

We are pleased to announce the release of Ruby {{ release.version }}. Ruby 3.2 adds many features and performance improvements.


## WASI based WebAssembly support

This is an initial port of WASI based WebAssembly support. This enables a CRuby binary to be available on Web browser, Serverless Edge environment, and other WebAssembly/WASI embedders. Currently this port passes basic and bootstrap test suites not using Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Background

[WebAssembly (Wasm)](https://webassembly.org/) is originally introduced to run programs safely and fast in web browsers. But its objective - running programs efficiently with security on various environment - is long wanted not only by web but also by general applications.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) is designed for such use cases. Though such applications need to communicate with operating systems, WebAssembly runs on a virtual machine which didn't have a system interface. WASI standardizes it.

WebAssembly/WASI Support in Ruby intends to leverage those projects. It enables Ruby developers to write applications which runs on such promised platform.

### Use case

This support enables developers to utilize CRuby in a WebAssembly environment. An example use case is [TryRuby playground](https://try.ruby-lang.org/playground/)'s CRuby support. Now you can try original CRuby in your web browser.

### Technical points

Today’s WASI and WebAssembly itself has some missing features to implement Fiber, exception, and GC because it’s still evolving and also for security reasons. So CRuby fills the gap by using Asyncify, which is a binary transformation technique to control execution in userland.

In addition, we built [a VFS on top of WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby) so that we can easily pack Ruby apps into a single .wasm file. This makes distribution of Ruby apps a bit easier.


### Related links

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Regexp timeout

A timeout feature for Regexp matching is introduced.

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

It is known that Regexp matching may take unexpectedly long. If your code attempts to match an possibly inefficient Regexp against an untrusted input, an attacker may exploit it for efficient Denial of Service (so-called Regular expression DoS, or ReDoS).

The risk of DoS can be prevented or significantly mitigated by configuring `Regexp.timeout` according to the requirements of your Ruby application. Please try it out in your application and welcome your feedback.

Note that `Regexp.timeout` is a global configuration. If you want to use different timeout settings for some special Regexps, you may want to use `timeout` keyword for `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

The original proposal is https://bugs.ruby-lang.org/issues/17837


## Other Notable New Features

### No longer bundle 3rd party sources

* We no longer bundle 3rd party sources like `libyaml`, `libffi`.

    * libyaml source has been removed from psych. You may need to install `libyaml-dev` with Ubuntu/Debian platform. The package name may differ on other platforms.

    * libffi will be removed from `fiddle` at preview2

### Language

* Find pattern is no longer experimental.


## Performance improvements



## Other notable changes since 3.1

* Hash
    * Hash#shift now always returns nil if the hash is
      empty, instead of returning the default value or
      calling the default proc. [[Bug #16908]]

* MatchData
    * MatchData#byteoffset has been added. [[Feature #13110]]

* Module
    * Module.used_refinements has been added. [[Feature #14332]]
    * Module#refinements has been added. [[Feature #12737]]
    * Module#const_added has been added. [[Feature #17881]]

* Proc
    * Proc#dup returns an instance of subclass. [[Bug #17545]]
    * Proc#parameters now accepts lambda keyword. [[Feature #15357]]

* Refinement
    * Refinement#refined_class has been added. [[Feature #12737]]

* Set
    * Set is now available as a builtin class without the need for `require "set"`. [[Feature #16989]]
      It is currently autoloaded via the `Set` constant or a call to `Enumerable#to_set`.

* String
    * String#byteindex and String#byterindex have been added. [[Feature #13110]]
    * Update Unicode to Version 14.0.0 and Emoji Version 14.0. [[Feature #18037]]
      (also applies to Regexp)
    * String#bytesplice has been added.  [[Feature #18598]]

* Struct
    * A Struct class can also be initialized with keyword arguments
      without `keyword_init: true` on `Struct.new` [[Feature #16806]]


### Standard libraries updates

*   The following default gem are updated.

    * TBD

*   The following bundled gems are updated.

    * TBD

*   The following default gems are now bundled gems. You need to add the following libraries to `Gemfile` under the bundler environment.

    * TBD

See [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
since Ruby 3.1.0!

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
