---
layout: news_post
title: "Ruby 3.2.0 Preview 2 Released"
author: "naruse"
translator:
date: 2022-09-09 00:00:00 +0000
lang: en
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview2" | first %}

We are pleased to announce the release of Ruby {{ release.version }}. Ruby 3.2 adds many features and performance improvements.


## WASI based WebAssembly support

This is an initial port of WASI based WebAssembly support. This enables a CRuby binary to be available on Web browser, Serverless Edge environment, and other WebAssembly/WASI embedders. Currently this port passes basic and bootstrap test suites not using Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Background

[WebAssembly (Wasm)](https://webassembly.org/) is originally introduced to run programs safely and fast in web browsers. But its objective - running programs efficinently with security on various environment - is long wanted not only by web but also by general applications.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) is designed for such use cases. Though such applications need to communicate with operating systems, WebAssembly runs on a virtual machine which didn't have a system interface. WASI standardizes it.

WebAssembly/WASI Support in Ruby intends to leverage those projects. It enables Ruby developers to write applications which runs on such promised platform.

### Use case

This support encourages developers can utilize CRuby in WebAssembly environment. An example use case of it is [TryRuby playground](https://try.ruby-lang.org/playground/)'s CRuby support. Now you can try original CRuby in your web browser.

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

    * libyaml source has been removed from psych. You may need to install `libyaml-dev` with Ubuntu/Debian platfrom. The package name is different each platforms.

    * libffi will be removed from `fiddle` at preview2

### Language

* Anonymous rest and keyword rest arguments can now be passed as
  arguments, instead of just used in method parameters.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* A proc that accepts a single positional argument and keywords will
  no longer autosplat. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* Constant assignment evaluation order for constants set on explicit
  objects has been made consistent with single attribute assignment
  evaluation order. With this code:

    ```ruby
    foo::BAR = baz
    ```

  `foo` is now called before `baz`. Similarly, for multiple assignments
  to constants,  left-to-right evaluation order is used. With this
  code:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  The following evaluation order is now used:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Find pattern is no longer experimental.
  [[Feature #18585]]

* Methods taking a rest parameter (like `*args`) and wishing to delegate keyword
  arguments through `foo(*args)` must now be marked with `ruby2_keywords`
  (if not already the case). In other words, all methods wishing to delegate
  keyword arguments through `*args` must now be marked with `ruby2_keywords`,
  with no exception. This will make it easier to transition to other ways of
  delegation once a library can require Ruby 3+. Previously, the `ruby2_keywords`
  flag was kept if the receiving method took `*args`, but this was a bug and an
  inconsistency. A good technique to find the potentially-missing `ruby2_keywords`
  is to run the test suite, for where it fails find the last method which must
  receive keyword arguments, use `puts nil, caller, nil` there, and check each
  method/block on the call chain which must delegate keywords is correctly marked
  as `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Accidentally worked without ruby2_keywords in Ruby 2.7-3.1, ruby2_keywords
    # needed in 3.2+. Just like (*args, **kwargs) or (...) would be needed on
    # both #foo and #bar when migrating away from ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Performance improvements

### YJIT

* Support arm64 / aarch64 on UNIX platforms.
* Building YJIT requires Rust 1.58.1+. [[Feature #18481]]

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

## Compatibility issues

Note: Excluding feature bug fixes.

### Removed constants

The following deprecated constants are removed.

* `Fixnum` and `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Removed methods

The following deprecated methods are removed.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Stdlib compatibility issues

* `Psych` no longer bundles libyaml sources.
  Users need to install the libyaml library themselves via the package
  system. [[Feature #18571]]

## C API updates

### Removed C APIs

The following deprecated APIs are removed.

* `rb_cData` variable.
* "taintedness" and "trustedness" functions. [[Feature #16131]]

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



[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18037]: https://bugs.ruby-lang.org/issues/18037
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
