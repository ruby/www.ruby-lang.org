---
layout: news_post
title: "Ruby 3.0.0 Released"
author: "naruse"
translator:
date: 2020-12-25 00:00:00 +0000
lang: en
---

We are pleased to announce the release of Ruby 3.0.0. From 2015 we developed hard toward Ruby 3, whose goal is performance, concurrency, and Typing. Especially about performance, Matz stated "Ruby3 will be 3 times faster than Ruby2" a.k.a. [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3).

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

With [Optcarrot benchmark](https://github.com/mame/optcarrot), which measures single thread performance based on NES's game emulation workload, it achieved 3x faster performance than Ruby 2.0! <details>These were measured at the environment noted in [github.com/ruby/ruby/tree/master/benchmark](https://github.com/ruby/ruby/tree/master/benchmark). [Commit 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095) was used as Ruby 3.0. It may not be 3x faster depending on your environment or benchmark.</details>

Ruby 3.0.0 covers those goals by
* Performance
  * MJIT
* Concurrency
  * Ractor
  * Fiber Scheduler
* Typing (Static Analysis)
  * RBS
  * TypeProf

With the above performance improvement, Ruby 3.0 introduces several new features described below.

## Performance

> When I first declared "Ruby3x3" in the conference keynote, many including members of the core team felt "Matz is a boaster". In fact, I felt so too. But we did. I am honored to see the core team actually accomplished to make Ruby3.0 three times faster than Ruby2.0 (in some benchmarks). -- Matz

### MJIT

Many improvements were implemented in MJIT. See NEWS for details.

As of Ruby 3.0, JIT is supposed to give performance improvements in limited workloads, such as games ([Optcarrot](https://github.com/mame/optcarrot)), AI ([Rubykon](https://github.com/benchmark-driver)), or whatever application that spends the majority of time in calling a few methods many times.

Although Ruby 3.0 [significantly decreased the size of JIT-ed code](https://twitter.com/k0kubun/status/1256142302608650244), it is still not ready for optimizing workloads like Rails, which often spend time on so many methods and therefore suffer from i-cache misses exacerbated by JIT. Stay tuned for Ruby 3.1 for further improvements on this issue.

## Concurrency / Parallel

> It's multi-core age today. Concurrency is very important. With Ractor, along with Async Fiber, Ruby will be a real concurrent language. --- Matz

### Ractor (experimental)

Ractor is an Actor-model like concurrent abstraction designed to provide a parallel execution feature without thread-safety concerns.

You can make multiple ractors and you can run them in parallel. Ractor enables you to make thread-safe parallel programs because ractors can not share normal objects. Communication between ractors is supported by exchanging messages.

To limit the sharing of objects, Ractor introduces several restrictions to Ruby's syntax (without multiple Ractors, there is no restriction).

The specification and implementation are not matured and may be changed in the future, so this feature is marked as experimental and shows the "experimental feature" warning when the first `Ractor.new` occurs.

The following small program measures the execution time of the famous benchmark tak function ([Tak (function) - Wikipedia](https://en.wikipedia.org/wiki/Tak_(function))), by executing it 4 times sequentially or 4 times in parallel with ractors.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

The result was measured on Ubuntu 20.04, Intel(R) Core(TM) i7-6700 (4 cores, 8 hardware threads). It shows that the parallel version is 3.87 times faster than the sequential version.

See [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html) for more details.

### Fiber Scheduler

`Fiber#scheduler` is introduced for intercepting blocking operations. This allows for light-weight concurrency without changing existing code. Watch ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) for an overview of how it works.

Currently supported classes/methods:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write`, and related methods (e.g. `#wait_readable`, `#gets`, `#puts`, and so on).
- `IO#select` is *not supported*.

This example program will perform several HTTP requests concurrently:

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

It uses [async](https://github.com/socketry/async) which provides the event loop. This event loop uses the `Fiber#scheduler` hooks to make `Net::HTTP` non-blocking. Other gems can use this interface to provide non-blocking execution for Ruby, and those gems can be compatible with other implementations of Ruby (e.g. JRuby, TruffleRuby) which can support the same non-blocking hooks.

## Static Analysis

> 2010s were an age of statically typed programming languages. Ruby seeks the future with static type checking, without type declaration, using abstract interpretation. RBS & TypeProf are the first step to the future. More steps to come. --- Matz

### RBS

RBS is a language to describe the types of Ruby programs.

Type checkers including TypeProf and other tools supporting RBS will understand Ruby programs much better with RBS definitions.

You can write down the definition of classes and modules: methods defined in the class, instance variables and their types, and inheritance/mix-in relations.

The goal of RBS is to support commonly seen patterns in Ruby programs and it allows writing advanced types including union types, method overloading, and generics. It also supports duck typing with _interface types_.

Ruby 3.0 ships with the `rbs` gem, which allows parsing and processing type definitions written in RBS.
The following is a small example of RBS with class, module, and constant definitions.

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

### TypeProf

TypeProf is a type analysis tool bundled in the Ruby package.

Currently, TypeProf serves as a kind of type inference.

It reads plain (non-type-annotated) Ruby code, analyzes what methods are defined and how they are used, and generates a prototype of type signature in RBS format.

Here is a simple demo of TypeProf.

An example input:

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

An example output:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

You can run TypeProf by saving the input as "test.rb" and invoking the command "typeprof test.rb".

You can also [try TypeProf online](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).  (It runs TypeProf on the server side, so sorry if it is out!)

See the [TypeProf documentation](https://github.com/ruby/typeprof/blob/master/doc/doc.md) and [demos](https://github.com/ruby/typeprof/blob/master/doc/demo.md) for details.

TypeProf is experimental and not so mature yet; only a subset of the Ruby language is supported, and the detection of type errors is limited. But it is still growing rapidly to improve the coverage of language features, the analysis performance, and usability. Any feedback is very welcome.

## Other Notable New Features

* One-line pattern matching is redesigned.  (experimental)

    * `=>` is added. It can be used like a rightward assignment.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` is changed to return `true` or `false`.

      ```ruby
      # version 3.0
      0 in 1 #=> false

      # version 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* Find pattern is added. (experimental)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* Endless method definition is added.

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` is now built-in.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Memory view is added as an experimental feature

    * This is a new C-API set to exchange a raw memory area, such as a numeric array or a bitmap image, between extension libraries.  The extension libraries can share also the metadata of the memory area that consists of the shape, the element format, and so on.  Using these kinds of metadata, the extension libraries can share even a multidimensional array appropriately.  This feature is designed by referring to Python's buffer protocol.

## Performance improvements

* Pasting long code to IRB is 53 times faster than in the version bundled with Ruby 2.7.0. For example, the time required to paste [this sample code](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) goes from 11.7 seconds to 0.22 seconds.


<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* The `measure` command has been added to IRB. It allows simple execution time measurement.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## Other notable changes since 2.7

* Keyword arguments are separated from other arguments.
  * In principle, code that prints a warning on Ruby 2.7 won't work.  See [this document](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) for details.
  * By the way, arguments forwarding now supports leading arguments.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Pattern matching (`case`/`in`) is no longer experimental.
  * See the [pattern matching documentation](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html) for details.
* The `$SAFE` feature was completely removed; now it is a normal global variable.
* The order of backtraces had been reversed with Ruby 2.5; this change has been reverted.  Now backtraces behave like in Ruby 2.4: an error message and the line number where the exception occurs are printed first, and its callers are printed later.
* Some standard libraries are updated.
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * etc.
* The following libraries are no longer bundled gems or standard libraries.
  Install the corresponding gems to use these features.
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc
* The following default gems are now bundled gems.
  * rexml
  * rss
* The following stdlib files are now default gems and are published on rubygems.org.
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

See [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)
since Ruby 2.7.0!

> Ruby3.0 is a milestone. The language is evolved, keeping compatibility. But it's not the end. Ruby will keep progressing, and become even greater. Stay tuned! --- Matz

Merry Christmas, Happy Holidays, and enjoy programming with Ruby 3.0!

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

Ruby was first developed by Matz (Yukihiro Matsumoto) in 1993
and is now developed as Open Source. It runs on multiple platforms
and is used all over the world especially for web development.
