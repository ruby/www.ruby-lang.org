---
layout: news_post
title: "Ruby 4.0.0 preview3 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2025-12-18 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview3" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 已发布。
Ruby 4.0 引入了 Ruby::Box 和 "ZJIT"，以及若干改进。

## Ruby::Box

这是一项新的用于提供定义隔离的实验性功能。
"Ruby Box" 的详细信息，可以参阅 [doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md)。
[[Feature #21311]] [[Misc #21385]]

## 语言变化

* `*nil` 不再调用 `nil.to_a`，就像 `**nil` 不再调用 `nil.to_hash`。 [[Feature #21047]]

* 行首的逻辑二元运算符 (`||`，`&&`，`and` 和 `or`) 与行首的 `.` 一样，延续上一行。下面两段代码是等价的：

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    [[Feature #20925]]

## 核心类更新

注意：我们只列出了重要的核心类更新。

* Kernel

    * `Kernel#inspect` 现在会检查是否存在 `#instance_variables_to_inspect` 方法，
      这个方法可以用来控制在 `#inspect` 的结果字符串中包含哪些实例变量：

        ```ruby
        class DatabaseConfig
          def initialize(host, user, password)
            @host = host
            @user = user
            @password = password
          end

          private def instance_variables_to_inspect = [:@host, :@user]
        end

        conf = DatabaseConfig.new("localhost", "root", "hunter2")
        conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
        ```

        [[Feature #21219]]

    * 声明废弃行为：`Kernel#open` 以传入 `|` 起始的字符串来创建进程的功能被移除。 [[Feature #19630]]

* Binding

    * `Binding#local_variables` 不再包含数字引用参数（如 `_1`, `_2`）。
      同样， `Binding#local_variable_get` 和 `Binding#local_variable_set` 也会拒绝处理数字引用参数。
      [[Bug #21049]]

* File

    * Linux 中，`File::Stat#birthtime` 在操作系统和文件系统支持的情况下，会通过 `statx` 系统调用实现。
      [[Feature #21205]]

* IO

    * `IO.select` 允许使用 `Float::INFINITY` 作为超时参数。
      [[Feature #20610]]

    * 声明废弃行为：`IO` 类以传入 `|` 起始的字符串来创建进程的功能被移除。 [[Feature #19630]]

* Math

    * 新增 `Math.log1p` 和 `Math.expm1`。 [[Feature #21527]]

* Method

    * `Method#source_location`，`Proc#source_location` 和
      `UnboundMethod#source_location` 现在返回 5 个位置信息：
      `[path, start_line, start_column, end_line, end_column]`。
      其中前 2 个信息仍然可以通过在结果上调用 `.take(2)` 来获取。
      [[Feature #6012]]

* Proc

    * `Proc#parameters` 现在将匿名可选参数显示为 `[:opt]`，替代原来的 `[:opt, nil]`，
      使得输出能与需要匿名参数时一致。 [[Bug #20974]]

* Ractor

    * 新增 `Ractor::Port` 类，用于在 Ractor 之间进行通信的新同步机制。 [[Feature #21262]]

        ```ruby
        port1 = Ractor::Port.new
        port2 = Ractor::Port.new
        Ractor.new port1, port2 do |port1, port2|
          port1 << 1
          port2 << 11
          port1 << 2
          port2 << 12
        end
        2.times{ p port1.receive } #=> 1, 2
        2.times{ p port2.receive } #=> 11, 12
        ```

        `Ractor::Port` 提供以下方法：

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (或 `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        由此，`Ractor.yield` 和 `Ractor#take` 被移除。

    * 新增 `Ractor#join` 和 `Ractor#value`，用于等待 Ractor 终止。
      这类似于 `Thread#join` 和 `Thread#value`。

    * 新增 `Ractor#monitor` 和 `Ractor#unmonitor` 作为内部使用的底层接口来实现 `Ractor#join`。

    * `Ractor.select` 现在只接受 Ractors 和 Ports 作为参数。
      如果参数是 Ractors，方法会在某个 Ractor 终止时返回。

    * 新增 `Ractor#default_port`。每个 `Ractor` 都有一个默认端口，用于
      `Ractor.send`，`Ractor.receive`。

    * 移除 `Ractor#close_incoming` 和 `Ractor#close_outgoing`。

    * 引入 `Ractor.shareable_proc` 和 `Ractor.shareable_lambda` 实现可共享的 Proc 或 lambda。
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` 和 `Enumerator#to_set` 现在会先检查大小，来避免无上限 range 的问题。
      [[Bug #21654]]

    * `Range#overlap?` 现在可以正确处理无限（无界）  range。
      [[Bug #21185]]

    * `Range#max` 在无下限整数 range 中的行为已修复。
      [[Bug #21174]] [[Bug #21175]]

* Ruby

    * 定义了新的顶级模块 `Ruby`，包含了 Ruby 相关的常量，此模块在 Ruby 3.4 中被保留，
      现在被正式定义。 [[Feature #20884]]

* Ruby::Box

    * 这是一项新的（实验性）功能，用于实现定义分离。
      关于 "Ruby Box" 的详细信息，请参阅 [doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md)。
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` 现在是一个核心类，不再是自动加载的标准库类。
      [[Feature #21216]]

    * `Set#inspect` 现在返回一个更适合 `eval` 的字符串，
      使用 `Set[]` 语法（如： `Set[1, 2, 3]`，代替原来的 `#<Set: {1, 2, 3}>`）。
      这使得 `Set` 的行为能与其他核心集合类（如： `Array` 和 `Hash`）保持一致。
      [[Feature #21389]]

    * 声明废弃向方法 `Set#to_set` 和 `Enumerable#to_set` 传递参数的行为。
      [[Feature #21390]]

* Socket

    * `Socket.tcp` 和 `TCPSocket.new` 现在能接受关键词参数 `open_timeout`
      来定义初始连接时的超时时间。 [[Feature #21347]]

* String

    * 更新 Unicode 版本至 17.0.0，更新 Emoji 版本至 17.0。
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] （同样适用于 Regexp）

    * 扩展 `String#strip`，`strip!`，`lstrip`，`lstrip!`，`rstrip` 和 `rstrip!`
      以接受 `*selectors` 参数。 [[Feature #21552]]

* Thread

    * 引入和 `Kernel#raise` 类似的参数支持 `Thread#raise(cause:)`。
      [[Feature #21360]]

* Fiber

    * 引入和 `Kernel#raise` 类似的参数支持 `Fiber#raise(cause:)`。
      [[Feature #21360]]

* Fiber::Scheduler

    * 引入 `Fiber::Scheduler#fiber_interrupt`，允许通过指定异常来终端纤程。
      典型的用例是当 IO 操作关闭时，中断等待此 IO 的纤程。
      [[Feature #21166]]

* Pathname

    * Pathname 从默认 gem 提升为 Ruby 核心类。
      [[Feature #17473]]

## 标准库更新

以下默认 gems 提升为绑定 gem。

* ostruct 0.6.3
* pstore 0.2.0
* benchmark 0.5.0
* logger 1.7.0
* rdoc 6.17.0
* win32ole 1.9.2
* irb 1.16.0
* reline 0.6.3
* readline 0.0.4
* fiddle 1.1.8

我们只列出了重要的标准库更新。

新增以下默认 gem。

* win32-registry 0.1.2

更新以下默认 gem。

* RubyGems 4.0.2
* bundler 4.0.2
* date 3.5.1
* digest 3.2.1
* english 0.8.1
* erb 6.0.1
* etc 1.4.6
* fcntl 1.3.0
* fileutils 1.8.0
* forwardable 1.4.0
* io-console 0.8.2
* io-nonblock 0.3.2
* io-wait 0.4.0
* ipaddr 1.2.8
* json 2.18.0
* net-http 0.9.1
* openssl 4.0.0
* optparse 0.8.1
* pp 0.6.3
* prism 1.6.0
* psych 5.3.1
* resolv 0.7.0
* stringio 3.2.0
* strscan 3.1.6
* time 0.4.2
* timeout 0.6.0
* uri 1.1.1
* weakref 0.1.4
* zlib 3.2.2

更新以下绑定 gems。

* minitest 5.27.0
* power_assert 3.0.1
* rake 13.3.1
* test-unit 3.7.3
* rexml 3.4.4
* net-ftp 0.3.9
* net-imap 0.6.1
* net-smtp 0.5.1
* matrix 0.4.3
* prime 0.1.4
* rbs 3.10.0.pre.2
* typeprof 0.31.0
* debug 1.11.0
* base64 0.3.0
* bigdecimal 4.0.1
* drb 2.2.3
* syslog 0.3.0
* csv 3.3.5
* repl_type_completor 0.1.12

## 支持平台

* Windows

    * 不再支持 14.0（_MSC_VER 1900）之前的 MSVC 版本。
      这意味着现在需要 Visual Studio 2015 或更新版本。

## 兼容性问题

* 由于新增了 `Ractor::Port`，以下方法从 Ractor 中被移除：

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoging`

    [[Feature #21262]]

* 声明废弃 `ObjectSpace._id2ref`。 [[Feature #15408]]

* 移除 `Process::Status#&` 和 `Process::Status#>>`，他们已在 Ruby 3.3 中声明废弃。
  [[Bug #19868]]

* 移除 `rb_path_check`。此方法原用来检查已在 Ruby 2.7 中移除的 `$SAFE` 路径。
  [[Feature #20971]]

## 标准库兼容性问题

* CGI 库从默认 gems 中移除。现在 `cgi/escape` 仅提供下列方法：

    * `CGI.escape` 和 `CGI.unescape`
    * `CGI.escapeHTML` 和 `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` 和 `CGI.unescapeURIComponent`
    * `CGI.escapeElement` 和 `CGI.unescapeElement`

    [[Feature #21258]]

* 随着 `Set` 类从标准库升为核型类，`set/sorted_set.rb` 被移除。
  `SortedSet` 不再是自动加载的常量。
  如需使用 `SortedSet`，请先安装 `sorted_set` gem，然后执行 `require 'sorted_set'`。
  [[Feature #21287]]

## C API 更新

* IO

    * `rb_thread_fd_close` 已声明废弃，如果执行将不产生任何效果。
      如果您需要将 C 扩展的文件描述符暴露给 Ruby 代码，可以创建一个使用 `RUBY_IO_MODE_EXTERNAL`
      的 `IO` 实例，然后使用 `rb_io_close(io)` 进行关闭（此操作也会中断并等待该 `IO` 上所有的待处理操作)。
      直接关闭文件描述符不会中断待处理操作，可能会导致未定义的行为。换言之，如果两个 `IO` 对象共享相同的文件描述符，
      则关闭一个不会影响另一个。 [[Feature #18455]]

* GVL

    * 现在，无论是否使用 GVL，`rb_thread_call_with_gvl` 都可以正常工作。
      这使得 gems 可以避免检查 `ruby_thread_has_gvl_p`。
      但仍请谨慎对待 GVL。 [[Feature #20750]]

* Set

    * 新增一组用于 `Set` 的 C API。 支持以下方法：
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## 实现改进

### Ractor

为了让 Ractors 更加稳定、高效、易用，我们投入了大量的工作。
这些改进让 Ractors 的实现逐渐完整，并即将离开实验性状态。

* 性能提升
    * 冻结字符串和符号表在内部使用了无锁哈希集合
    * 方法缓存查找在多数场景下可以避免锁定
    * 类（以及 geniv）实例变量访问速度更快，并且可以避免锁定
    * 在对象分配过程中，避免了缓存争用
    * 在多数场景下 `object_id` 能避免锁定
* 错误修复和稳定性提升
    * 修正了同时使用 Ractors 和进程时的可能死锁情况
    * 修正了 Ractor 中 require 和自动载入的问题
    * 修正了 Ractors 间的 编码/转码 问题
    * 修复了 GC 操作和方法失效中的竞争条件
    * 修正了在启动 Ractor 后进行进程分叉的问题

## JIT

* ZJIT
    * 引入了 [实验性的基于方法的 JIT 编译器](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
      如需启用 `--zjit` 支持，需要使用 Rust 1.85.0 或后续版本来构建 Ruby。
    * 从 Ruby 4.0.0 起，ZJIT 比解释器更快，但还不及 YJIT。
      我们鼓励尝试 ZJIT，但目前不建议将其用于生产环境。
    * 我们的目标是让 ZJIT 比 YJIT 更快，并在 Ruby 4.1 时可用于生产环境。
* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` 在标准构建中不可用。
          可以在 `configure` 中设置 `--enable-yjit=stats` 并在调用时通过 `--yjit-stats` 来启用。
        * 在默认统计中新增 `invalidate_everything`，当 TracePoint 失效代码时，此统计信息会递增。
    * `RubyVM::YJIT.enable` 新增选项 `mem_size:` 和 `call_threshold:`。
* RJIT
    * 移除 `--rjit`。我们将把第三方 JIT API 实现迁移到 [ruby/rjit](https://github.com/ruby/rjit) 代码库。

## 其他变化

更多详情，可参见 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})。

自 Ruby 3.4.0 以来，这些变化共导致 [{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)！

## 下载

* <{{ release.url.gz }}>

      文件大小: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      文件大小: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      文件大小: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby 是什么

Ruby 最初由 Matz （松本行弘，Yukihiro Matsumoto） 于 1993 年开发，
现在以开源软件的形式开发。它可以在多个平台上运行，并在全球得到广泛使用，尤其是 Web 开发领域。

[Feature #6012]: https://bugs.ruby-lang.org/issues/6012
[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]:     https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]:     https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]:     https://bugs.ruby-lang.org/issues/21174
[Bug #21175]:     https://bugs.ruby-lang.org/issues/21175
[Bug #21185]:     https://bugs.ruby-lang.org/issues/21185
[Feature #21205]: https://bugs.ruby-lang.org/issues/21205
[Feature #21216]: https://bugs.ruby-lang.org/issues/21216
[Feature #21219]: https://bugs.ruby-lang.org/issues/21219
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21262]: https://bugs.ruby-lang.org/issues/21262
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
[Feature #21287]: https://bugs.ruby-lang.org/issues/21287
[Feature #21311]: https://bugs.ruby-lang.org/issues/21311
[Feature #21347]: https://bugs.ruby-lang.org/issues/21347
[Feature #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
