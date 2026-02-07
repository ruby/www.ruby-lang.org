---
layout: news_post
title: "Ruby 3.0.0 Preview 1 Released"
author: "naruse"
translator:
date: 2020-09-25 00:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 3.0.0-preview1.

It introduces a number of new features and performance improvements.

## RBS

RBS is a language to describe the types of Ruby programs.
Type checkers including type-profiler and other tools supporting RBS will understand Ruby programs much better with RBS definitions.

You can write down the definition of classes and modules: methods defined in the class, instance variables and their types, and inheritance/mix-in relations.
The goal of RBS is to support commonly seen patterns in Ruby programs and it allows writing advanced types including union types, method overloading, and generics. It also supports duck typing with _interface types_.

Ruby 3.0 ships with `rbs` gem, which allows parsing and processing type definitions written in RBS.

The following is a small example of RBS.

``` rbs
module ChatApp
  VERSION: String

  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.

    def initialize: (String) -> void

    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

See [README of rbs gem](https://github.com/ruby/rbs) for more detail.

## Ractor (experimental)

Ractor is an Actor-model like concurrent abstraction designed to provide a parallel execution feature without thread-safety concerns.

You can make multiple ractors and you can run them in parallel. Ractor enables to make thread-safe parallel programs because ractors can not share normal objects. Communication between ractors are supported by message passing.

To limit sharing objects, Ractor introduces several restrictions to the Ruby's syntax (without multiple Ractors, there is no changes).

The specification and implementation are not matured and changed in future, so this feature is marked as experimental and show the experimental feature warning if Ractor is created.

The following small program calculates `prime?` in parallel with two ractors and about x2 times faster with two or more cores than sequential program.

``` ruby
require 'prime'

# n.prime? with sent integers in r1, r2 run in parallel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.recv
    n.prime?
  end
end

# send parameters
r1.send 2**61 - 1
r2.send 2**61 + 15

# wait for the results of expr1, expr2
p r1.take #=> true
p r2.take #=> true
```

see [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) for more detail.

## Scheduler (Experimental)

`Thread#scheduler` is introduced for intercepting blocking operations. This allows for light-weight concurrency without changing existing code.

Currently supported classes/methods:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `IO#wait`, `IO#read`, `IO#write` and related methods (e.g. `#wait_readable`, `#gets`, `#puts` and so on).
- `IO#select` is *not supported*.

The current entry point for concurrency is `Fiber.schedule{...}` however this is subject to change by the time Ruby 3 is released.

Currently, there is a test scheduler available in [`Async::Scheduler`](https://github.com/socketry/async/pull/56). See [`doc/scheduler.md`](https://github.com/ruby/ruby/blob/master/doc/scheduler.md) for more details. [Feature #16786]

**CAUTION**: This feature is strongly experimental. Both the name and feature will change in next preview release.

## Other Notable New Features

* Rightward assignment statement is added.

  ``` ruby
  fib(10) => x
  p x #=> 55
  ```

* Endless method definition is added.

  ``` ruby
  def square(x) = x * x
  ```

* Find pattern is added.

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* `Hash#except` is now built-in.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Memory view is added as an experimental feature

    * This is a new C-API set to exchange a raw memory area, such as a numeric array and a bitmap image, between extension libraries.  The extension libraries can share also the metadata of the memory area that consists of the shape, the element format, and so on.  Using these kinds of metadata, the extension libraries can share even a multidimensional array appropriately.  This feature is designed by referring to Python's buffer protocol.

## Performance improvements

* Many improvements were implemented in MJIT. See NEWS in detail.

## Other notable changes since 2.7

* Keyword arguments are separated from other arguments.
  * In principle, code that prints a warning on Ruby 2.7 won't work.  See the [document](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) in detail.
  * By the way, arguments forwarding now supports leading arguments.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* The feature of `$SAFE` was completely removed; now it is a normal global variable.

* The order of backtrace had been reversed at Ruby 2.5, but it was cancelled.  Now it behaves like Ruby 2.4; an error message and the line number where the exception occurs are printed first, and its callers are printed later.

* Some standard libraries are updated.
  * RubyGems 3.2.0.rc.1
  * Bundler 2.2.0.rc.1
  * IRB 1.2.6
  * Reline 0.1.5

* The following libraries are no longer bundled gems.
  Install corresponding gems to use these features.
  * net-telnet
  * xmlrpc

* Promote default gems to bundled gems.
  * rexml
  * rss

* Promote stdlib to default gems. The following default gems were published on rubygems.org
  * abbrev
  * base64
  * English
  * erb
  * find
  * io-nonblock
  * io-wait
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * nkf
  * open-uri
  * optparse
  * resolv
  * resolv-replace
  * rinda
  * securerandom
  * set
  * shellwords
  * tempfile
  * time
  * tmpdir
  * tsort
  * weakref

See [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_preview1/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
for more details.

{% assign release = site.data.releases | where: "version", "3.0.0-preview1" | first %}

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_preview1)
since Ruby 2.7.0!

Please try Ruby 3.0.0-preview1, and give us any feedback!

## Download

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## 3.0.0-preview2 trailer

We plan to include ["type-profiler"](https://github.com/mame/ruby-type-profiler) that is a static type analysis feature.  Stay tuned!

## What is Ruby

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993,
and is now developed as Open Source. It runs on multiple platforms
and is used all over the world especially for web development.
