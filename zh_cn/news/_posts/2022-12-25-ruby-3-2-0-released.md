---
layout: news_post
title: "Ruby 3.2.0 已发布"
author: "naruse"
translator: GAO Jun
date: 2022-12-25 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

我们很高兴地宣布 Ruby {{ release.version }}。Ruby 3.2 增加了很多新功能和性能改进。


## 基于 WASI 的 WebAssembly 支持

这是首次基于 WASI 的 WebAssembly 支持。使得 CRuby 二进制内容可用于浏览器、Serverless Edge、以及其他 WebAssembly/WASI 嵌入环境。目前，此功能已通过除 Thread API 之外的 basic 和 bootstrap 测试套件。


![](https://i.imgur.com/opCgKy2.png)

### 背景

[WebAssembly (Wasm)](https://webassembly.org/) 希望能够在浏览器中提供安全快速的运行程序的方式。但其目标，也就是在不同环境中安全高效的运行程序，不仅是 web 应用长期以来的目标，也是其他一般程序所需要的。

[WASI (The WebAssembly System Interface)](https://wasi.dev/) 被设计用于此类应用场景。尽管此类应用需要与操作系统进行通信，WebAssembly 却运行在一个没有系统接口的虚拟机之上。WASI 使之标准化。

基于这些项目，Ruby 的 WebAssembly/WASI 支持能使 Ruby 开发者可以编写能运行于兼容此类功能的平台上。

### 应用场景

此功能使得开发人员可以在 WebAssembly 环境中使用 CRuby。一个此类应用场景的案例是 [TryRuby playground](https://try.ruby-lang.org/playground/) 的 CRuby 支持。现在您可以在您的浏览器中尝试原生的 CRuby。

### 技术要点

目前，WASI 和 WebAssembly 仍在不断演进，同时基于安全原因，还缺少一些功能来实现纤程、异常和垃圾回收。
所以，CRuby 使用了一种可以控制用户空间中执行的二进制转换技术 Asyncify 来填补这一鸿沟。

此外，我们创建了 [WASI 之上的虚拟文件系统](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)，于是就可以很容易地将 Ruby 应用打包成单个 .wasm 文件，进而简化分发 Ruby 应用的过程。

### 相关链接

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

## Regexp 用于防御 ReDoS 攻击的改进

众所周知，正则表达式匹配的耗时可能出乎意料的长。如果您的代码尝试从一个不可信输入中匹配一个低效的正则表达式，攻击者可以借此发起有效的拒绝服务攻击(所谓的正则表达式 DoS，或 ReDoS)。

我们引入了2个更新，能够显著减轻 ReDoS 的影响

### 改进 Regexp 匹配算法

自 Ruby 3.2 开始，Regexp 的匹配算法通过缓存技术得到了显著改进。
新增正则表达式匹配的超时设置。

```
# 下面的正则匹配在 Ruby 3.1 中耗时10秒，在 Ruby 3.2 中耗时0.003秒

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

通过改进的匹配算法，使得 Regexp 的匹配（根据我们的实验，约90%）能够在线性时间内完成。

此改进可能会消耗与每个匹配的输入长度成比例的内存。我们预计不会出现实际问题，因为这种内存分配通常会延迟，并且正常的 Regexp 匹配最多只会消耗表达式长度10倍的内存。如果您在实际应用中遇到 Regexp 匹配导致的内存不足情况，请报告给我们。

最初提议 <https://bugs.ruby-lang.org/issues/19104>

### Regexp 超时设置

上面的改进不能使用于某些正则表达式，比如使用了某些高级特性（例如：反向引用 back-references，环视 look-around），或者大量使用固定重复次数。作为一种后备措施，Regexp 还引入了超时设置功能。

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> 1秒后 Regexp::TimeoutError
```

请注意，`Regexp.timeout` 是全局性的配置。如果您希望对于某些特殊的正则表达式使用不同的超时设置，您可以使用 `Regexp.new` 中的 `timeout` 关键词。

```ruby
Regexp.timeout = 1.0

# 这个 Regexp 没有超时设置
long_time_re = Regexp.new("^a*b?a*()\1$", timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # 不会被中断
```

最初提议：<https://bugs.ruby-lang.org/issues/17837>

## 其他值得注意的新功能

### 语法建议

* `syntax_suggest`（曾用名 `dead_end`）的功能已被集成到 Ruby。这可以帮助您找到错误的位置，例如缺失或多余的 `end`，让您更快地修正错误，例如下面的例子：

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
  ```

  [[Feature #18159]]


### 错误提示

* 现在，在 TypeError 和 ArgumentError 中将指出出错的参数

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

### 语言

* 除了在方法参数中使用，匿名的可变长参数现在可以作为参数进行传递
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* 接受一个单独位置参数的 proc 不再会自动解封装。 [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 及之前版本
  # => 1
  # Ruby 3.2 及之后版本
  # => [1, 2]
  ```

* 对于显示对象的常量赋值求值顺序，将始终使用单属性赋值求值顺序。参考下面的代码:

    ```ruby
    foo::BAR = baz
    ```

  `foo` 现在在 `baz` 之前求值。类似的，对于多重常量的赋值，使用从左到右的求值顺序。参考下面的代码:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  现在使用下面的求值顺序:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* 查找模式不再是实验性功能。
  [[Feature #18585]]

* 使用可变长参数 (例如 `*args`) 的方法，如果同时希望通过 `foo(*args)` 使用关键词参数的，那么必须使用 `ruby2_keywords` 进行标记。也就是说，所有希望通过 `*args` 来使用关键字参数的方法现在毫无例外地都必须使用
  `ruby2_keywords` 进行标记。一旦某个库需要 Ruby 3+，这将是一个更容易的过渡升级方式。此前，当接收方法使用 `*args` 时，`ruby2_keywords` 标记被保留，但这可能是错误并且是行为不一致的。对于查找潜在缺失的
  `ruby2_keywords` 的好方法应当是运行测试套件，检查测试失败时调用的最后一个方法，这个方法必须接收关键词参数。通过在错误处使用 `puts nil, caller, nil`，然后检查在调用链上的每一个使用自动委派关键词的方法/块被标记为
  `ruby2_keywords`。 [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Ruby 2.7-3.1 可以意外地在没有 ruby2_keywords 的情况下执行，在 3.2 中必需。
    # 如需去除 ruby2_keywords，需要修改 #foo 和 #bar 的参数为 (*args, **kwargs) 或 (...)。
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## 性能改进

### MJIT

* MJIT 编译器在 Ruby 中以 `ruby_vm/mjit/compiler` 标准库重新实现。
* MJIT 编译器在分叉的(forked) Ruby 进程中执行，不再以 MJIT worker 的本地线程中执行。[[Feature #18968]]
    * 由此，不再支持 Microsoft Visual Studio (MSWIN)。
* 不再支持 MinGW。[[Feature #18824]]
* `--mjit-min-calls` 更名为 `--mjit-call-threshold`。
* 将 `--mjit-max-cache` 的默认值从 10000 修改回 100。

### PubGrub

* Bundler 2.4 现在使用 [PubGrub](https://github.com/jhawthorn/pub_grub) 来替换 [Molinillo](https://github.com/CocoaPods/Molinillo) 进行依赖解析。

  * PubGrub 是 Dart 语言的 `pub` 包管理器使用的新一代解析算法。
  * 在此次变更后，您可能会得到不同的解析结果。请将此类问题报告到 [RubyGems/Bundler 问题](https://github.com/rubygems/rubygems/issues)。

* RubyGems 在 Ruby 3.2 中依旧使用 Molinillo。我们计划在将来用 PubGrub 进行替换。

## 自 3.1 以来其他值得注意的变更

* Hash
    * 当 hash 为空时，`Hash#shift` 现在总是返回 nil，此前行为是返回默认值或调用默认 proc。 [[Bug #16908]]

* MatchData
    * 新增 `MatchData#byteoffset` 。 [[Feature #13110]]

* Module
    * 新增 `Module.used_refinements` 。 [[Feature #14332]]
    * 新增 `Module#refinements` 。 [[Feature #12737]]
    * 新增 `Module#const_added` 。 [[Feature #17881]]

* Proc
    * `Proc#dup` 返回子类的一个实例。 [[Bug #17545]]
    * `Proc#parameters` 现在接受 lambda 关键字。 [[Feature #15357]]

* Refinement
    * 新增 `Refinement#refined_class`。 [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * 为`parse`, `parse_file` 和 `of` 增加 `error_tolerant` 选项。 [[Feature #19013]]
      启用此选项时
        1. 不提示 SyntaxError
        2. 对于错误输入，返回 AST
        3. 如果当解析器处理到输入尾部而 `end` 不足时，`end` 将被补足
        4. `end` 将根据缩进来进行处理

        ```ruby
        # 不启用 error_tolerant 选项时
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # 启用 error_tolerant 选项时
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` 根据缩进来进行处理
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

    * 为 `parse`, `parse_file` 和 `of` 增加 `keep_tokens` 选项。 [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set 现在可以直接使用，不需要调用 `require "set"`。 [[Feature #16989]]
      目前其通过 `Set` 常量或对 `Enumerable#to_set` 调用自动载入。

* String
    * 新增 `String#byteindex` 和 `String#byterindex`。 [[Feature #13110]]
    * 更新 Unicode 至 Version 15.0.0，Emoji Version 15.0. [[Feature #18639]] (同样适用于 Regexp)
    * 新增 `String#bytesplice`。  [[Feature #18598]]

* Struct
    * 即使在 `Struct.new` 中不设置 `keyword_init: true`，Struct 类也可以通过关键词参数进行初始化。 [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # 自 Ruby 3.2 起，即使不设置 keyword_init: true 下面代码也可执行。
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

## 兼容性问题

注意：不包含特性的问题修正

### 被移除的常量

下列废弃常量被移除。

* `Fixnum` 与 `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### 被移除的方法

下列废弃方法被移除。

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## 标准库兼容性问题

### 不再捆绑第三方源代码
* 我们不再捆绑第三方源代码，例如 `libyaml`， `libffi`。

    * psych 中已经移除了 libyaml 的代码。您可能需要在 Ubuntu/Debian 平台中安装 `libyaml-dev`。软件包的名称可能因平台不同而各异。

    * 从 `fiddle` 中移除捆绑的 libffi 源码

* Psych 和 fiddle 支持指定 libyaml 和 libffi 的版本来静态编译。您可以像这样基于 libyaml-0.2.5 编译 psych：

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    同样，您可以像这样基于 libffi-3.4.4 编译 fiddle：

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

##  C API 更新

### 更新的 C API

下列 API 被更新。

* PRNG 更新
  * `rb_random_interface_t` 被更新并设定版本。
    如果扩展库使用旧版本的接口需要更新。
    同样，`init_int32` 函数需要被定义。

### 被移除的 C API

下列废弃的 API 被移除。

* 变量 `rb_cData`。
* "taintedness" 与 "trustedness" 函数。 [[Feature #16131]]

### 标准库更新

* Bundler

    * 增加 --ext=rust，支持基于 Rust 扩展的 bundle gem。
      [[GH-rubygems-6149]]
    * 从 git 库克隆代码更快 [[GH-rubygems-4475]]

* RubyGems

    * 增加 cargo builder 的 mswin 支持。 [[GH-rubygems-6167]]

* ERB

    * 使 `ERB::Util.html_escape` 比 `CGI.escapeHTML` 更快。
        * 当没有字符需要转义时，不再分配 String 对象。
        * 当参数已经是 String 时，跳过调用 `#to_s` 方法。
        * `ERB::Escape.html_escape` 作为 `ERB::Util.html_escape` 的别名被添加，它还没有被 Rails 作为猴子补丁(monkey-patched)。

* IRB

    * 增加 debug.gem 集成命令： `debug`，`break`，`catch`，
      `next`，`delete`，`step`，`continue`，`finish`，`backtrace`， `info`
        * 即使在您的 Gemfile 中没有 `gem "debug"`，也可以使用。
        * 可参考 [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * 新增更多 Pry-like 命令和特性。
        * 新增 `edit` 和 `show_cmds` (类似 Pry 的 `help`)。
        * `ls` 可以使用 `-g` 或 `-G` 参数来过滤输出。
        * `show_source` 是 `$` 的别名，且接受未引用输入。
        * `whereami` 是 `@` 的别名。

*   下列默认 gems 被更新。

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

*   下列绑定 gems 被更新。

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

可参考 GitHub 的版本页面，例如 [logger 的 GitHub 版本页面](https://github.com/ruby/logger/releases) 或通过变更日志获取更详细的 gem 信息。

您可以通过 [新闻](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
获取更多信息。

自 Ruby 3.1.0 以来，伴随这些变更， [{{ release.stats.files_changed }} 个文件被更改， 新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)!

圣诞快乐，节日快乐，享受 Ruby 3.2 编程的快乐时光吧！

## 下载

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

## Ruby是什么

Ruby 最初由 Matz （松本行弘，Yukihiro Matsumoto） 于 1993 年开发，现在以开源软件的形式开发。它可以在多个平台上运行，并在全球得到广泛使用，尤其是Web开发领域。

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
