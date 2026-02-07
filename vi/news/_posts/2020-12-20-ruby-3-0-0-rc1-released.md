---
layout: news_post
title: "Ruby 3.0.0 RC1 Released"
author: "naruse"
translator:
date: 2020-12-20 00:00:00 +0000
lang: vi
---

We are pleased to announce the release of Ruby 3.0.0-rc1.

It introduces a number of new features and performance improvements.

## Static Analysis

### RBS

RBS is a language to describe the types of Ruby programs.

Type checkers including TypeProf and other tools supporting RBS will understand Ruby programs much better with RBS definitions.

You can write down the definition of classes and modules: methods defined in the class, instance variables and their types, and inheritance/mix-in relations.

The goal of RBS is to support commonly seen patterns in Ruby programs and it allows writing advanced types including union types, method overloading, and generics. It also supports duck typing with _interface types_.

Ruby 3.0 ships with `rbs` gem, which allows parsing and processing type definitions written in RBS.
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

You can run TypeProf by saving the input as "test.rb" and invoke a command called "typeprof test.rb".

You can also [try TypeProf online](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=).  (It runs TypeProf on the server side, so sorry if it is out!)

See [the documentation](https://github.com/ruby/typeprof/blob/master/doc/doc.md) and [demos](https://github.com/ruby/typeprof/blob/master/doc/demo.md) for details.

TypeProf is experimental and not so mature yet; only a subset of the Ruby language is supported, and the detection of type errors is limited. But it is still growing rapidly to improve the coverage of language features, the analysis performance, and usability. Any feedback is very welcome.

## Ractor (experimental)

Ractor is an Actor-model like concurrent abstraction designed to provide a parallel execution feature without thread-safety concerns.

You can make multiple ractors and you can run them in parallel. Ractor enables you to make thread-safe parallel programs because ractors can not share normal objects. Communication between ractors are supported by message passing.

To limit sharing of objects, Ractor introduces several restrictions to the Ruby's syntax (without multiple Ractors, there is no restriction).

The specification and implementation are not matured and may be changed in the future, so this feature is marked as experimental and show the "experimental feature" warning when the first `Ractor.new`.

The following small program calculates `n.prime?` (`n` is relatively a big integer) in parallel with two ractors. You will confirm that the program execution is about x2 times faster compared to the sequential program on the parallel computer.

``` ruby
require 'prime'
# n.prime? with sent integers in r1, r2 run in parallel
r1, r2 = *(1..2).map do
  Ractor.new do
    n = Ractor.receive
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

See [doc/ractor.md](https://github.com/ruby/ruby/blob/master/doc/ractor.md) for more details.

## Fiber Scheduler

`Fiber#scheduler` is introduced for intercepting blocking operations. This allows for light-weight concurrency without changing existing code. Watch ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) for an overview of how it works.

Currently supported classes/methods:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write` and related methods (e.g. `#wait_readable`, `#gets`, `#puts` and so on).
- `IO#select` is *not supported*.

(Explain Async gem with links). This example program will perform several HTTP requests concurrently:

(Explain this:)
1. async is outer gem
2. async uses this new feature

``` ruby
require 'async'
require 'net/http'
require 'uri'
Async do
  ["ruby", "python", "c"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

## Other Notable New Features

* One-line pattern matching is redesigned.  (experimental)

    * `=>` is added. It can be used as like rightward assignment.

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

    * This is a new C-API set to exchange a raw memory area, such as a numeric array and a bitmap image, between extension libraries.  The extension libraries can share also the metadata of the memory area that consists of the shape, the element format, and so on.  Using these kinds of metadata, the extension libraries can share even a multidimensional array appropriately.  This feature is designed by referring to Python's buffer protocol.

## Performance improvements

* Many improvements were implemented in MJIT. See NEWS in detail.
* Pasting long code to IRB is 53 times faster than bundled with Ruby 2.7.0. For example, the time required to paste [this sample code](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) goes from 11.7 seconds to 0.22 seconds.

## Other notable changes since 2.7

* Keyword arguments are separated from other arguments.
  * In principle, code that prints a warning on Ruby 2.7 won't work.  See the [document](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) in detail.
  * By the way, arguments forwarding now supports leading arguments.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Pattern matching (`case`/`in`) is no longer experimental.
* The `$SAFE` feature was completely removed; now it is a normal global variable.
* The order of backtrace had been reversed at Ruby 2.5, and is reverted.  Now it behaves like Ruby 2.4; an error message and the line number where the exception occurs are printed first, and its callers are printed later.
* Some standard libraries are updated.
  * RubyGems 3.2.2
  * Bundler 2.2.2
  * IRB 1.2.6
  * Reline 0.1.5
  * Psych 3.2.1
  * JSON 2.4.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Digest 3.0.0
  * Fiddle 1.0.4
  * StringIO 3.0.0
  * StringScanner 3.0.0
* The following libraries are no longer bundled gems.
  Install the corresponding gems to use these features.
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

See [NEWS](https://github.com/ruby/ruby/blob/v3_0_0_rc1/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0_rc1)
for more details.

{% assign release = site.data.releases | where: "version", "3.0.0-rc1" | first %}

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v2_7_0...v3_0_0)
since Ruby 2.7.0!

Please try Ruby 3.0.0-rc1, and give us any feedback!

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
