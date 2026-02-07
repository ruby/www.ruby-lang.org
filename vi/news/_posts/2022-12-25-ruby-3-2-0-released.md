---
layout: news_post
title: "Ruby 3.2.0 Released"
author: "naruse"
translator:
date: 2022-12-25 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

We are pleased to announce the release of Ruby {{ release.version }}. Ruby 3.2 adds many features and performance improvements.


## WASI based WebAssembly support

This is an initial port of WASI based WebAssembly support. This enables a CRuby binary to be available on a Web browser, a Serverless Edge environment, or other kinds of WebAssembly/WASI embedders. Currently this port passes basic and bootstrap test suites not using the Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Background

[WebAssembly (Wasm)](https://webassembly.org/) was originally introduced to run programs safely and fast in web browsers. But its objective - running programs efficiently with security on various environment - is long wanted not only for web but also by general applications.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) is designed for such use cases. Though such applications need to communicate with operating systems, WebAssembly runs on a virtual machine which didn't have a system interface. WASI standardizes it.

WebAssembly/WASI support in Ruby intends to leverage those projects. It enables Ruby developers to write applications which run on such promised platforms.

### Use case

This support encourages developers to utilize CRuby in a WebAssembly environment. An example use case is [TryRuby playground](https://try.ruby-lang.org/playground/)'s CRuby support. Now you can try original CRuby in your web browser.

### Technical points

Today’s WASI and WebAssembly itself is missing some features to implement Fiber, exception, and GC because it’s still evolving, and also for security reasons. So CRuby fills the gap by using Asyncify, which is a binary transformation technique to control execution in userland.

In addition, we built [a VFS on top of WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby) so that we can easily pack Ruby apps into a single .wasm file. This makes distribution of Ruby apps a bit easier.

### Related links

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)


## Production-ready YJIT

![](https://i.imgur.com/X9ulfac.png)

* YJIT is no longer experimental
    * Has been tested on production workloads for over a year and proven to be quite stable.
* YJIT now supports both x86-64 and arm64/aarch64 CPUs on Linux, MacOS, BSD and other UNIX platforms.
    * This release brings support for Apple M1/M2, AWS Graviton, Raspberry Pi 4 and more.
* Building YJIT now requires Rust 1.58.0+. [[Feature #18481]]
    * In order to ensure that CRuby is built with YJIT, please install `rustc` >= 1.58.0
      before running the `./configure` script.
    * Please reach out to the YJIT team should you run into any issues.
* The YJIT 3.2 release is faster than 3.1, and has about 1/3 as much memory overhead.
  * Overall YJIT is 41% faster (geometric mean) than the Ruby interpreter on [yjit-bench](https://github.com/Shopify/yjit-bench).
  * Physical memory for JIT code is lazily allocated. Unlike Ruby 3.1,
    the RSS of a Ruby process is minimized because virtual memory pages
    allocated by `--yjit-exec-mem-size` will not be mapped to physical
    memory pages until actually utilized by JIT code.
  * Introduce Code GC that frees all code pages when the memory consumption
    by JIT code reaches `--yjit-exec-mem-size`.
  * `RubyVM::YJIT.runtime_stats` returns Code GC metrics in addition to
    existing `inline_code_size` and `outlined_code_size` keys:
    `code_gc_count`, `live_page_count`, `freed_page_count`, and `freed_code_size`.
* Most of the statistics produced by `RubyVM::YJIT.runtime_stats` are now available in release builds.
    * Simply run ruby with `--yjit-stats` to compute and dump stats (incurs some run-time overhead).
* YJIT is now optimized to take advantage of object shapes. [[Feature #18776]]
* Take advantage of finer-grained constant invalidation to invalidate less code when defining new constants. [[Feature #18589]]
* The default `--yjit-exec-mem-size` is changed to 64 (MiB).
* The default `--yjit-call-threshold` is changed to 30.

## Regexp improvements against ReDoS

It is known that Regexp matching may take unexpectedly long. If your code attempts to match a possibly inefficient Regexp against an untrusted input, an attacker may exploit it for efficient Denial of Service (so-called Regular expression DoS, or ReDoS).

We have introduced two improvements that significantly mitigate ReDoS.

### Improved Regexp matching algorithm

Since Ruby 3.2, Regexp's matching algorithm has been greatly improved by using a memoization technique.

```
# This match takes 10 sec. in Ruby 3.1, and 0.003 sec. in Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

The improved matching algorithm allows most Regexp matching (about 90% in our experiments) to be completed in linear time.

This optimization may consume memory proportional to the input length for each match. We expect no practical problems to arise because this memory allocation is usually delayed, and a normal Regexp match should consume at most 10 times as much memory as the input length. If you run out of memory when matching Regexps in a real-world application, please report it.

The original proposal is <https://bugs.ruby-lang.org/issues/19104>

### Regexp timeout

The optimization above cannot be applied to some kind of regular expressions, such as those including advanced features (e.g., back-references or look-around), or with a huge fixed number of repetitions. As a fallback measure, a timeout feature for Regexp matches is also introduced.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

Note that `Regexp.timeout` is a global configuration. If you want to use different timeout settings for some special Regexps, you may want to use the `timeout` keyword for `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

The original proposal is <https://bugs.ruby-lang.org/issues/17837>.

## Other Notable New Features

### SyntaxSuggest

* The feature of `syntax_suggest` (formerly `dead_end`) is integrated into Ruby. This helps you find the position of errors such as missing or superfluous `end`s, to get you back on your way faster, such as in the following example:

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
  ```

  [[Feature #18159]]


### ErrorHighlight

* Now it points at the relevant argument(s) for TypeError and ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

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
  to constants, left-to-right evaluation order is used. With this
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

* The find pattern is no longer experimental.
  [[Feature #18585]]

* Methods taking a rest parameter (like `*args`) and wishing to delegate keyword
  arguments through `foo(*args)` must now be marked with `ruby2_keywords`
  (if not already the case). In other words, all methods wishing to delegate
  keyword arguments through `*args` must now be marked with `ruby2_keywords`,
  with no exception. This will make it easier to transition to other ways of
  delegation once a library can require Ruby 3+. Previously, the `ruby2_keywords`
  flag was kept if the receiving method took `*args`, but this was a bug and an
  inconsistency. A good technique to find potentially missing `ruby2_keywords`
  is to run the test suite, find the last method which must
  receive keyword arguments for each place where the test suite fails, and use `puts nil, caller, nil` there. Then check that each
  method/block on the call chain which must delegate keywords is correctly marked
  with `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

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

### MJIT

* The MJIT compiler is re-implemented in Ruby as `ruby_vm/mjit/compiler`.
* MJIT compiler is executed under a forked process instead of
  doing it in a native thread called MJIT worker. [[Feature #18968]]
    * As a result, Microsoft Visual Studio (MSWIN) is no longer supported.
* MinGW is no longer supported. [[Feature #18824]]
* Rename `--mjit-min-calls` to `--mjit-call-threshold`.
* Change default `--mjit-max-cache` back from 10000 to 100.

### PubGrub

* Bundler 2.4 now uses [PubGrub](https://github.com/jhawthorn/pub_grub) resolver instead of [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub is the next generation solving algorithm used by `pub` package manager for the Dart programming language.
  * You may get different resolution result after this change. Please report such cases to [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)

* RubyGems still uses Molinillo resolver in Ruby 3.2. We plan to replace it with PubGrub in the future.

## Other notable changes since 3.1

* Data
    * New core class to represent simple immutable value object. The class is
      similar to Struct and partially shares an implementation, but has more
      lean and strict API. [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * `Hash#shift` now always returns nil if the hash is
      empty, instead of returning the default value or
      calling the default proc. [[Bug #16908]]

* MatchData
    * `MatchData#byteoffset` has been added. [[Feature #13110]]

* Module
    * `Module.used_refinements` has been added. [[Feature #14332]]
    * `Module#refinements` has been added. [[Feature #12737]]
    * `Module#const_added` has been added. [[Feature #17881]]

* Proc
    * `Proc#dup` returns an instance of subclass. [[Bug #17545]]
    * `Proc#parameters` now accepts lambda keyword. [[Feature #15357]]

* Refinement
    * `Refinement#refined_class` has been added. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Add `error_tolerant` option for `parse`, `parse_file` and `of`. [[Feature #19013]]
      With this option
        1. SyntaxError is suppressed
        2. AST is returned for invalid input
        3. `end` is complemented when a parser reaches to the end of input but `end` is insufficient
        4. `end` is treated as keyword based on indent

        ```ruby
        # Without error_tolerant option
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # With error_tolerant option
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` is treated as keyword based on indent
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * Add `keep_tokens` option for `parse`, `parse_file` and `of`. [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set is now available as a builtin class without the need for `require "set"`. [[Feature #16989]]
      It is currently autoloaded via the `Set` constant or a call to `Enumerable#to_set`.

* String
    * `String#byteindex` and `String#byterindex` have been added. [[Feature #13110]]
    * Update Unicode to Version 15.0.0 and Emoji Version 15.0. [[Feature #18639]]
      (also applies to Regexp)
    * `String#bytesplice` has been added.  [[Feature #18598]]

* Struct
    * A Struct class can also be initialized with keyword arguments
      without `keyword_init: true` on `Struct.new` [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # From Ruby 3.2, the following code also works without keyword_init: true.
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

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

### No longer bundle 3rd party sources

* We no longer bundle 3rd party sources like `libyaml`, `libffi`.

    * libyaml source has been removed from psych. You may need to install `libyaml-dev` with Ubuntu/Debian platform. The package name is different for each platform.

    * Bundled libffi source is also removed from `fiddle`

* Psych and fiddle supported static builds with specific versions of libyaml and libffi sources. You can build psych with libyaml-0.2.5 like this:

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    And you can build fiddle with libffi-3.4.4 like this:

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## C API updates

### Updated C APIs

The following APIs are updated.

* PRNG update
  * `rb_random_interface_t` updated and versioned.
    Extension libraries which use this interface and built for older versions.
    Also `init_int32` function needs to be defined.

### Removed C APIs

The following deprecated APIs are removed.

* `rb_cData` variable.
* "taintedness" and "trustedness" functions. [[Feature #16131]]

## Standard library updates

* Bundler

    * Add --ext=rust support to bundle gem for creating simple gems with Rust extensions.
      [[GH-rubygems-6149]]
    * Make cloning git repos faster [[GH-rubygems-4475]]

* RubyGems

    * Add mswin support for cargo builder. [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape` is made faster than `CGI.escapeHTML`.
        * It no longer allocates a String object when no character needs to be escaped.
        * It skips calling `#to_s` method when an argument is already a String.
        * `ERB::Escape.html_escape` is added as an alias to `ERB::Util.html_escape`,
          which has not been monkey-patched by Rails.

* IRB

    * debug.gem integration commands have been added: `debug`, `break`, `catch`,
      `next`, `delete`, `step`, `continue`, `finish`, `backtrace`, `info`
        * They work even if you don't have `gem "debug"` in your Gemfile.
        * See also: [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * More Pry-like commands and features have been added.
        * `edit` and `show_cmds` (like Pry's `help`) are added.
        * `ls` takes `-g` or `-G` option to filter out outputs.
        * `show_source` is aliased from `$` and accepts unquoted inputs.
        * `whereami` is aliased from `@`.

*   The following default gems are updated.

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   The following bundled gems are updated.

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

See GitHub releases like [GitHub Releases of logger](https://github.com/ruby/logger/releases) or changelog for details of the default gems or bundled gems.

See [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
or [commit logs](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
for more details.

With those changes, [{{ release.stats.files_changed }} files changed, {{ release.stats.insertions }} insertions(+), {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
since Ruby 3.1.0!

Merry Christmas, Happy Holidays, and enjoy programming with Ruby 3.2!

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

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
