---
layout: news_post
title: "Ruby 4.0.0 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2025-12-25 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 已发布。
Ruby 4.0 引入了 Ruby::Box 和 "ZJIT"，以及若干改进。

## Ruby Box

Ruby Box 是一项新的（实验性）特性，提供了定义隔离的功能。 可以通过设置环境变量 `RUBY_BOX=1` 来启用 Ruby Box。对应的类是 `Ruby::Box`。

在 Ruby Box 中载入的定义是隔离的。Ruby Box 之间可以互相隔离：猴子补丁、全局变量、类变量、类/模块定义、加载的原生库和 Ruby 库。

预期使用场景包括：

* 在 box 中运行带有猴子补丁的测试用例，避免影响其他测试用例
* 在应用服务器的 Ruby 进程中，并行运行 Web 应用 box，以此进行蓝绿部署
* 在 Web 应用的 box 中并行运行，在一段时间内，通过响应时间差异来评估依赖更新的效果
* 用作基础（底层）API，以实现某种“包”（高层）API（尚未设计）。

"Ruby Box" 的详细信息，可以参阅  [Ruby::Box](https://docs.ruby-lang.org/en/master/Ruby/Box.html)。
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT 是一个新的即时 (JIT) 编译器，它是作为 YJIT 的下一代产品进行开发的。您需要使用 Rust 1.85.0 或后续版本来构建 Ruby 才能使用，
然后在运行时，指定 `--zjit` 来启用。

我们之所以创建这个新的 Ruby 编译器，是为了既能够提升性能上限（通过更大的变异单元和 SSA IR），
又能够鼓励更多的外部贡献（通过成为更传统的方法编译器）。更多详情，可以参阅 [我们的博客](https://railsatscale.com/2025-12-24-launch-zjit/)。

ZJIT 目前比解释器更快，但还不如 YJIT。我们鼓励您尝试 ZJIT，但目前不建议将其用于生产环境。敬请期待 Ruby 4.1 的 ZJIT。

## Ractor 实现

Ractor，即 Ruby 的并行执行机制，获得了多项改进。新类 `Ractor::Port` 被用来解决消息收发的相关问题（参见 [我们的博客](https://dev.to/ko1/ractorport-revamping-the-ractor-api-98)）。
另外，`Ractor.shareable_proc` 让 Ractor 之间共享 `Proc` 对象更加容易。

性能方面，改进了许多内部数据结构，大大减少了全局锁的争用，从而提升了并行性能。此外，Ractor 现在共享更少的内部数据，这也降低了并行运算时的 CPU 缓存争用。

Ractor 最初在 Ruby 3.0 作为实验性功能被引入。我们计划明年取消其 “实验性” 状态。

## 语言变化

* `*nil` 不再调用 `nil.to_a`，就像 `**nil` 不再调用 `nil.to_hash`。 [[Feature #21047]]

* 行首的逻辑二元运算符 (`||`，`&&`，`and` 和 `or`) 与行首的 `.` 一样，延续上一行。下面两段代码是等价的：

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    ```ruby
    if condition1 &&
       condition2
      ...
    end
    ```

    [[Feature #20925]]

## 核心类更新

注意：我们只列出了重要的核心类更新。

* Array

    * 新增 `Array#rfind`，提供了等价于 `array.reverse_each.find` 的高效方法 [[Feature #21678]]
    * 新增 `Array#find`，提供了比 `Enumerable#find` 更高效的覆盖方法 [[Feature #21678]]

* Binding

    * `Binding#local_variables` 不再包含数字引用参数（如 `_1`, `_2`）。
      同样， `Binding#local_variable_get` 和 `Binding#local_variable_set` 也会拒绝处理数字引用参数。
      [[Bug #21049]]

    * 新增 `Binding#implicit_parameters`，`Binding#implicit_parameter_get` 和
      `Binding#implicit_parameter_defined?`。用于访问数字引用参数和 `it` 参数。[[Bug #21049]]

* Enumerator

    * `Enumerator.produce` 现在能够接受一个可选关键词参数 `size` 来指定枚举器的大小。
      这个参数可以是：整数，`Float::INFINITY`，可调用对象（如 lambda） 或 `nil`（表示未知大小）。
      当此参数未指定时，默认使用 `Float::INFINITY`。

        ```ruby
        # 无限枚举器
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # 有限枚举器，指定了一个可计算的大小
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* 错误高亮显示

    * 当抛出了 ArgumentError，现在在展示代码段时，会同时显示调用方法代码段和方法定义代码段。
      [[Feature #21543]]

      ```
      test.rb:1:in 'Object#add': wrong number of arguments (given 1, expected 2) (ArgumentError)

          caller: test.rb:3
          | add(1)
            ^^^
          callee: test.rb:1
          | def add(x, y) = x + y
                ^^^
              from test.rb:3:in '<main>'
      ```

* Fiber

    * 引入和 `Kernel#raise` 类似的参数支持 `Fiber#raise(cause:)`。
      [[Feature #21360]]

* Fiber::Scheduler

    * 引入 `Fiber::Scheduler#fiber_interrupt`，允许通过指定异常来终端纤程。
      典型的用例是当 IO 操作关闭时，中断等待此 IO 的纤程。
      [[Feature #21166]]

    * 引入 `Fiber::Scheduler#yield`，允许纤程调度器在禁用信号异常时继续处理。
      [[Bug #21633]]

    * 再次引入 `Fiber::Scheduler#io_close` 钩子来处理异步 `IO#close`.

    * `Fiber::Scheduler#io_write` 在刷新 IO 写缓存时调用。
      [[Bug #21789]]

* File

    * Linux 中，`File::Stat#birthtime` 在操作系统和文件系统支持的情况下，会通过 `statx` 系统调用实现。
      [[Feature #21205]]

* IO

    * `IO.select` 允许使用 `Float::INFINITY` 作为超时参数。
      [[Feature #20610]]

    * 声明废弃行为：`IO` 类以传入 `|` 起始的字符串来创建进程的功能被移除。 [[Feature #19630]]

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

* Math

    * 新增 `Math.log1p` 和 `Math.expm1`。 [[Feature #21527]]

* Pathname

    * Pathname 从默认 gem 提升为 Ruby 核心类。
      [[Feature #17473]]

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

    * `Ractor.select` 现在只接受若干个 Ractor 和 Port 作为参数。
      如果参数是若干个 Ractor，方法会在最早结束的 Ractor 终止时返回。

    * 新增 `Ractor#default_port`。每个 `Ractor` 都有一个默认端口，用于
      `Ractor.send`，`Ractor.receive`。

    * 移除 `Ractor#close_incoming` 和 `Ractor#close_outgoing`。

    * 引入 `Ractor.shareable_proc` 和 `Ractor.shareable_lambda` 实现可共享的 Proc 或 lambda。
      [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` 现在会先检查大小，来避免无上限 range 的问题。
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
      关于 "Ruby Box" 的详细信息，请参阅 [doc/language/box.md](https://docs.ruby-lang.org/en/4.0/language/box_md.html)。
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` 现在是一个核心类，不再是自动加载的标准库类。
      [[Feature #21216]]

    * `Set#inspect` 现在返回一个更适合 `eval` 的字符串，
      使用 `Set[]` 语法（如： `Set[1, 2, 3]`，代替原来的 `#<Set: {1, 2, 3}>`）。
      [[Feature #21389]]

    * 声明废弃向方法 `Set#to_set` 和 `Enumerable#to_set` 传递参数的行为。
      [[Feature #21390]]

* Socket

    * `Socket.tcp` 和 `TCPSocket.new` 现在能接受关键词参数 `open_timeout`
      来定义初始连接时的超时时间。 [[Feature #21347]]
    * 如果用户在 `TCPSocket.new` 中指定了超时时间，根据具体情况，`Errno::ETIMEDOUT` 或 `IO::TimeoutError`
      都可能被更早抛出。此行为目前被统一为抛出 `IO::TimeoutError`。（请注意，在 `Socket.tcp` 中，仍然可能有某些情况下会抛出
      `Errno::ETIMEDOUT`，同样如果是操作系统层级发生超时，也可能抛出 `Errno::ETIMEDOUT`）

* String

    * 更新 Unicode 版本至 17.0.0，更新 Emoji 版本至 17.0。
      [[Feature #19908]][[Feature #20724]][[Feature #21275]] （同样适用于 Regexp）

    * 扩展 `String#strip`，`strip!`，`lstrip`，`lstrip!`，`rstrip` 和 `rstrip!`
      以接受 `*selectors` 参数。 [[Feature #21552]]

* Thread

    * 引入和 `Kernel#raise` 类似的参数支持 `Thread#raise(cause:)`。
      [[Feature #21360]]

## 标准库更新

我们只列出了重要的标准库更新。

其他变更列在下方。如果 gem 有自己的 GitHub 发布页面，我们还列出了自 Ruby 3.4.0 以来的发布历史。

以下默认 gems 提升为绑定 gem。

* ostruct 0.6.3
  * 0.6.1 至 [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]
* pstore 0.2.0
  * 0.1.4 至 [v0.2.0][pstore-v0.2.0]
* benchmark 0.5.0
  * 0.4.0 至 [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]
* logger 1.7.0
  * 1.6.4 至 [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]
* rdoc 7.0.2
  * 6.14.0 至 [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0], [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1], [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1], [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]
* win32ole 1.9.2
  * 1.9.1 至 [v1.9.2][win32ole-v1.9.2]
* irb 1.16.0
  * 1.14.3 至 [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2], [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]
* reline 0.6.3
  * 0.6.0 至 [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6 至 [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]

新增以下默认 gem。

* win32-registry 0.1.2

更新以下默认 gem。

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1 至 [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]
* delegate 0.6.1
  * 0.4.0 至 [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0], [v0.6.1][delegate-v0.6.1]
* digest 3.2.1
  * 3.2.0 至 [v3.2.1][digest-v3.2.1]
* english 0.8.1
  * 0.8.0 至 [v0.8.1][english-v0.8.1]
* erb 6.0.1
  * 4.0.4 至 [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0], [v6.0.1][erb-v6.0.1]
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0 至 [v1.3.0][fcntl-v1.3.0]
* fileutils 1.8.0
  * 1.7.3 至 [v1.8.0][fileutils-v1.8.0]
* forwardable 1.4.0
  * 1.3.3 至 [v1.4.0][forwardable-v1.4.0]
* io-console 0.8.2
  * 0.8.1 至 [v0.8.2][io-console-v0.8.2]
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2 至 [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1], [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1 至 [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1], [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1], [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0], [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0], [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0], [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1], [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0], [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]
* net-http 0.9.1
  * 0.6.0 至 [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0], [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]
* openssl 4.0.0
  * 3.3.1 至 [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]
* optparse 0.8.1
  * 0.6.0 至 [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0], [v0.8.1][optparse-v0.8.1]
* pp 0.6.3
  * 0.6.2 至 [v0.6.3][pp-v0.6.3]
* prism 1.7.0
  * 1.5.2 至 [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]
* psych 5.3.1
  * 5.2.2 至 [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4], [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0], [v5.3.1][psych-v5.3.1]
* resolv 0.7.0
  * 0.6.2 至 [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]
* stringio 3.2.0
  * 3.1.2 至 [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4], [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7], [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]
* strscan 3.1.6
  * 3.1.2 至 [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4], [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]
* time 0.4.2
  * 0.4.1 至 [v0.4.2][time-v0.4.2]
* timeout 0.6.0
  * 0.4.3 至 [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0], [v0.6.0][timeout-v0.6.0]
* uri 1.1.1
  * 1.0.4 至 [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]
* weakref 0.1.4
  * 0.1.3 至 [v0.1.4][weakref-v0.1.4]
* zlib 3.2.2
  * 3.2.1 至 [v3.2.2][zlib-v3.2.2]

更新以下绑定 gem。

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5 至 [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]
* rake 13.3.1
  * 13.2.1 至 [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]
* test-unit 3.7.3
  * 3.6.7 至 [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9], [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2], [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1 至 [0.3.2][rss-0.3.2]
* net-ftp 0.3.9
  * 0.3.8 至 [v0.3.9][net-ftp-v0.3.9]
* net-imap 0.6.2
  * 0.5.8 至 [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10], [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12], [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0], [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]
* net-smtp 0.5.1
  * 0.5.0 至 [v0.5.1][net-smtp-v0.5.1]
* matrix 0.4.3
  * 0.4.2 至 [v0.4.3][matrix-v0.4.3]
* prime 0.1.4
  * 0.1.3 至 [v0.1.4][prime-v0.1.4]
* rbs 3.10.0
  * 3.8.0 至 [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1], [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2], [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2], [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5], [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2], [v3.10.0][rbs-v3.10.0]
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0 至 [v1.11.1][debug-v1.11.1]
* base64 0.3.0
  * 0.2.0 至 [v0.3.0][base64-v0.3.0]
* bigdecimal 4.0.1
  * 3.1.8 至 [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1], [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3], [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1], [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]
* drb 2.2.3
  * 2.2.1 至 [v2.2.3][drb-v2.2.3]
* syslog 0.3.0
  * 0.2.0 至 [v0.3.0][syslog-v0.3.0]
* csv 3.3.5
  * 3.3.2 至 [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4], [v3.3.5][csv-v3.3.5]
* repl_type_completor 0.1.12

### RubyGems 和 Bundler

Ruby 4.0 绑定了 RubyGems 和 Bundler 版本 4。您可以通过下面的链接查看详情。

* [更新至 RubyGems/Bundler 4 - RubyGems 博客](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 已发布 - RubyGems 博客](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 已发布 - RubyGems 博客](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 已发布 - RubyGems 博客](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 已发布 - RubyGems 博客](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## 支持平台

* Windows

    * 不再支持 14.0（_MSC_VER 1900）之前的 MSVC 版本。
      这意味着现在需要 Visual Studio 2015 或更高版本。

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

* `ArgumentError` 中，"wrong number of arguments" 现在会包含被调用方法的类或模块名。
  （如：`Foo#bar` 替代原来的 `bar`）。 [[Bug #21698]]

* 错误栈现在不再展示 `internal` 帧。这些方法现在看起来像是在 Ruby 源文件中，与其他 C 语言实现的方法保持一致。 [[Bug #20968]]

  此前：
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  现在：
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

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


* Net::HTTP

    * 此前，在发送带有 body 的请求（如：`POST`，`PUT`）时，如果没有明确制定，
      那么 HTTP 头 `Content-Type` 会被自动设置为 `application/x-www-form-urlencoded`。
      此行为现在被移除。如果您的应用依赖这个默认行为，那么您的请求现在将缺失 `Content-Type` 头，
      这可能导致在与特定服务器交互时出现兼容性错误。
      [[GH-net-http #205]]

## C API 更新

* IO

    * `rb_thread_fd_close` 已声明废弃，如果执行将不产生任何效果。
      如果您需要将 C 扩展的文件描述符暴露给 Ruby 代码，可以创建一个使用 `RUBY_IO_MODE_EXTERNAL`
      的 `IO` 实例，然后使用 `rb_io_close(io)` 进行关闭（此操作也会中断并等待该 `IO` 上所有的待处理操作)。
      直接关闭文件描述符不会中断待处理操作，可能会导致未定义的行为。换言之，如果两个 `IO` 对象共享相同的文件描述符，
      则关闭一个不会影响另一个。 [[Feature #18455]]

* GVL

    * 现在，无论是否使用 GVL，`rb_thread_call_with_gvl` 都可以正常工作。
      这使得 gem 可以避免检查 `ruby_thread_has_gvl_p`。
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

* `Class#new`（如：`Object.new`）在所有情况下都更快，尤其是在传递关键字参数时。此功能同时被集成到 YJIT 和 ZJIT 中。[[Feature #21254]]
* 不同大小的 GC 堆现在独立增长。当只有某些池包含长期活跃对象时，将减少内存使用量。
* GC 清除包含大对象的页面的速度更快。
* "泛型 ivar" 对象（String，Array，`TypedData`等）现在使用新内部 "fields" 对象来加速实例变量的访问。
* 在初次使用前，GC 会避免维护内部的 `id2ref` 表，提升 `object_id` 的分配和 GC 清除速度。
* 类和模块对象的 `object_id` 和 `hash` 方法更快。
* 较大的大整数可以通过可变宽度分配保持嵌入状态。
* `Random`，`Enumerator::Product`，`Enumerator::Chain`，`Addrinfo`，`StringScanner`
  以及一些内部对象现在处于写屏障保护中，从而减少 GC 开销。

### Ractor

为了让 Ractor 更加稳定、高效、易用，我们投入了大量的工作。
这些改进让 Ractor 的实现逐渐完整，并即将离开实验性状态。

* 性能提升
    * 冻结字符串和符号表在内部使用了无锁哈希集合 [[Feature #21268]]
    * 方法缓存查找在多数场景下可以避免锁定
    * 类（以及一般实例变量）实例变量访问速度更快，并且可以避免锁定
    * 通过为每个 ractor 使用计数器，降低对象内存分配时的 CPU 缓存争用
    * 通过使用线程本地计数器，减少 xmallloc/xfree 中的 CPU 缓存争用
    * 在多数场景下 `object_id` 能避免锁定
* 错误修复和稳定性提升
    * 修正了同时使用 Ractors 和进程时的可能死锁情况
    * 修正了 Ractor 中 require 和自动载入的问题
    * 修正了 Ractors 间的 编码/转码 问题
    * 修复了 GC 操作和方法失效中的竞争条件
    * 修正了在启动 Ractor 后进行进程分叉的问题
    * Ractor 中的 GC 分配计数现在是准确的
    * 修正了 GC 后，TracePoints 不能正常工作的问题 [[Bug #19112]]

## JIT

* ZJIT
    * 引入了 [实验性的基于方法的 JIT 编译器](https://docs.ruby-lang.org/en/master/jit/zjit_md.html).
      ZJIT 可以通过两种方法启用：使用 `--zjit` 参数，或者调用 `RubyVM::ZJIT.enable`。
      构建 Ruby 时，如要包含 ZJIT 支持，需要使用 Rust 1.85.0 或后续版本来构建。
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

更多详情，可参见 [新闻](https://docs.ruby-lang.org/en/4.0/NEWS_md.html)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})。

自 Ruby 3.4.0 以来，这些变化共导致 [{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)！

圣诞快乐，新年快乐，一起来享受 Ruby 4.0 的编程乐趣！

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

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]:     https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]:     https://bugs.ruby-lang.org/issues/20968
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
[Feature #21254]: https://bugs.ruby-lang.org/issues/21254
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21268]: https://bugs.ruby-lang.org/issues/21268
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
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]:     https://bugs.ruby-lang.org/issues/21633
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]:     https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]:     https://bugs.ruby-lang.org/issues/21789
[GH-net-http #205]: https://github.com/ruby/net-http/issues/205
[ostruct-v0.6.2]: https://github.com/ruby/ostruct/releases/tag/v0.6.2
[ostruct-v0.6.3]: https://github.com/ruby/ostruct/releases/tag/v0.6.3
[pstore-v0.2.0]: https://github.com/ruby/pstore/releases/tag/v0.2.0
[benchmark-v0.4.1]: https://github.com/ruby/benchmark/releases/tag/v0.4.1
[benchmark-v0.5.0]: https://github.com/ruby/benchmark/releases/tag/v0.5.0
[logger-v1.6.5]: https://github.com/ruby/logger/releases/tag/v1.6.5
[logger-v1.6.6]: https://github.com/ruby/logger/releases/tag/v1.6.6
[logger-v1.7.0]: https://github.com/ruby/logger/releases/tag/v1.7.0
[rdoc-v6.14.1]: https://github.com/ruby/rdoc/releases/tag/v6.14.1
[rdoc-v6.14.2]: https://github.com/ruby/rdoc/releases/tag/v6.14.2
[rdoc-v6.15.0]: https://github.com/ruby/rdoc/releases/tag/v6.15.0
[rdoc-v6.15.1]: https://github.com/ruby/rdoc/releases/tag/v6.15.1
[rdoc-v6.16.0]: https://github.com/ruby/rdoc/releases/tag/v6.16.0
[rdoc-v6.16.1]: https://github.com/ruby/rdoc/releases/tag/v6.16.1
[rdoc-v6.17.0]: https://github.com/ruby/rdoc/releases/tag/v6.17.0
[rdoc-v7.0.0]: https://github.com/ruby/rdoc/releases/tag/v7.0.0
[rdoc-v7.0.1]: https://github.com/ruby/rdoc/releases/tag/v7.0.1
[rdoc-v7.0.2]: https://github.com/ruby/rdoc/releases/tag/v7.0.2
[rdoc-v7.0.3]: https://github.com/ruby/rdoc/releases/tag/v7.0.3
[win32ole-v1.9.2]: https://github.com/ruby/win32ole/releases/tag/v1.9.2
[irb-v1.15.0]: https://github.com/ruby/irb/releases/tag/v1.15.0
[irb-v1.15.1]: https://github.com/ruby/irb/releases/tag/v1.15.1
[irb-v1.15.2]: https://github.com/ruby/irb/releases/tag/v1.15.2
[irb-v1.15.3]: https://github.com/ruby/irb/releases/tag/v1.15.3
[irb-v1.16.0]: https://github.com/ruby/irb/releases/tag/v1.16.0
[reline-v0.6.1]: https://github.com/ruby/reline/releases/tag/v0.6.1
[reline-v0.6.2]: https://github.com/ruby/reline/releases/tag/v0.6.2
[reline-v0.6.3]: https://github.com/ruby/reline/releases/tag/v0.6.3
[fiddle-v1.1.7]: https://github.com/ruby/fiddle/releases/tag/v1.1.7
[fiddle-v1.1.8]: https://github.com/ruby/fiddle/releases/tag/v1.1.8
[date-v3.5.0]: https://github.com/ruby/date/releases/tag/v3.5.0
[date-v3.5.1]: https://github.com/ruby/date/releases/tag/v3.5.1
[delegate-v0.5.0]: https://github.com/ruby/delegate/releases/tag/v0.5.0
[delegate-v0.6.0]: https://github.com/ruby/delegate/releases/tag/v0.6.0
[delegate-v0.6.1]: https://github.com/ruby/delegate/releases/tag/v0.6.1
[digest-v3.2.1]: https://github.com/ruby/digest/releases/tag/v3.2.1
[english-v0.8.1]: https://github.com/ruby/english/releases/tag/v0.8.1
[erb-v5.1.2]: https://github.com/ruby/erb/releases/tag/v5.1.2
[erb-v5.1.3]: https://github.com/ruby/erb/releases/tag/v5.1.3
[erb-v6.0.0]: https://github.com/ruby/erb/releases/tag/v6.0.0
[erb-v6.0.1]: https://github.com/ruby/erb/releases/tag/v6.0.1
[fcntl-v1.3.0]: https://github.com/ruby/fcntl/releases/tag/v1.3.0
[fileutils-v1.8.0]: https://github.com/ruby/fileutils/releases/tag/v1.8.0
[forwardable-v1.4.0]: https://github.com/ruby/forwardable/releases/tag/v1.4.0
[io-console-v0.8.2]: https://github.com/ruby/io-console/releases/tag/v0.8.2
[io-wait-v0.3.3]: https://github.com/ruby/io-wait/releases/tag/v0.3.3
[io-wait-v0.3.5.test1]: https://github.com/ruby/io-wait/releases/tag/v0.3.5.test1
[io-wait-v0.3.5]: https://github.com/ruby/io-wait/releases/tag/v0.3.5
[io-wait-v0.3.6]: https://github.com/ruby/io-wait/releases/tag/v0.3.6
[io-wait-v0.4.0]: https://github.com/ruby/io-wait/releases/tag/v0.4.0
[json-v2.10.0]: https://github.com/ruby/json/releases/tag/v2.10.0
[json-v2.10.1]: https://github.com/ruby/json/releases/tag/v2.10.1
[json-v2.10.2]: https://github.com/ruby/json/releases/tag/v2.10.2
[json-v2.11.0]: https://github.com/ruby/json/releases/tag/v2.11.0
[json-v2.11.1]: https://github.com/ruby/json/releases/tag/v2.11.1
[json-v2.11.2]: https://github.com/ruby/json/releases/tag/v2.11.2
[json-v2.11.3]: https://github.com/ruby/json/releases/tag/v2.11.3
[json-v2.12.0]: https://github.com/ruby/json/releases/tag/v2.12.0
[json-v2.12.1]: https://github.com/ruby/json/releases/tag/v2.12.1
[json-v2.12.2]: https://github.com/ruby/json/releases/tag/v2.12.2
[json-v2.13.0]: https://github.com/ruby/json/releases/tag/v2.13.0
[json-v2.13.1]: https://github.com/ruby/json/releases/tag/v2.13.1
[json-v2.13.2]: https://github.com/ruby/json/releases/tag/v2.13.2
[json-v2.14.0]: https://github.com/ruby/json/releases/tag/v2.14.0
[json-v2.14.1]: https://github.com/ruby/json/releases/tag/v2.14.1
[json-v2.15.0]: https://github.com/ruby/json/releases/tag/v2.15.0
[json-v2.15.1]: https://github.com/ruby/json/releases/tag/v2.15.1
[json-v2.15.2]: https://github.com/ruby/json/releases/tag/v2.15.2
[json-v2.16.0]: https://github.com/ruby/json/releases/tag/v2.16.0
[json-v2.17.0]: https://github.com/ruby/json/releases/tag/v2.17.0
[json-v2.17.1]: https://github.com/ruby/json/releases/tag/v2.17.1
[json-v2.18.0]: https://github.com/ruby/json/releases/tag/v2.18.0
[net-http-v0.7.0]: https://github.com/ruby/net-http/releases/tag/v0.7.0
[net-http-v0.8.0]: https://github.com/ruby/net-http/releases/tag/v0.8.0
[net-http-v0.9.0]: https://github.com/ruby/net-http/releases/tag/v0.9.0
[net-http-v0.9.1]: https://github.com/ruby/net-http/releases/tag/v0.9.1
[openssl-v3.3.2]: https://github.com/ruby/openssl/releases/tag/v3.3.2
[openssl-v4.0.0]: https://github.com/ruby/openssl/releases/tag/v4.0.0
[optparse-v0.7.0]: https://github.com/ruby/optparse/releases/tag/v0.7.0
[optparse-v0.8.0]: https://github.com/ruby/optparse/releases/tag/v0.8.0
[optparse-v0.8.1]: https://github.com/ruby/optparse/releases/tag/v0.8.1
[pp-v0.6.3]: https://github.com/ruby/pp/releases/tag/v0.6.3
[prism-v1.6.0]: https://github.com/ruby/prism/releases/tag/v1.6.0
[prism-v1.7.0]: https://github.com/ruby/prism/releases/tag/v1.7.0
[psych-v5.2.3]: https://github.com/ruby/psych/releases/tag/v5.2.3
[psych-v5.2.4]: https://github.com/ruby/psych/releases/tag/v5.2.4
[psych-v5.2.5]: https://github.com/ruby/psych/releases/tag/v5.2.5
[psych-v5.2.6]: https://github.com/ruby/psych/releases/tag/v5.2.6
[psych-v5.3.0]: https://github.com/ruby/psych/releases/tag/v5.3.0
[psych-v5.3.1]: https://github.com/ruby/psych/releases/tag/v5.3.1
[resolv-v0.6.3]: https://github.com/ruby/resolv/releases/tag/v0.6.3
[resolv-v0.7.0]: https://github.com/ruby/resolv/releases/tag/v0.7.0
[stringio-v3.1.3]: https://github.com/ruby/stringio/releases/tag/v3.1.3
[stringio-v3.1.4]: https://github.com/ruby/stringio/releases/tag/v3.1.4
[stringio-v3.1.5]: https://github.com/ruby/stringio/releases/tag/v3.1.5
[stringio-v3.1.6]: https://github.com/ruby/stringio/releases/tag/v3.1.6
[stringio-v3.1.7]: https://github.com/ruby/stringio/releases/tag/v3.1.7
[stringio-v3.1.8]: https://github.com/ruby/stringio/releases/tag/v3.1.8
[stringio-v3.1.9]: https://github.com/ruby/stringio/releases/tag/v3.1.9
[stringio-v3.2.0]: https://github.com/ruby/stringio/releases/tag/v3.2.0
[strscan-v3.1.3]: https://github.com/ruby/strscan/releases/tag/v3.1.3
[strscan-v3.1.4]: https://github.com/ruby/strscan/releases/tag/v3.1.4
[strscan-v3.1.5]: https://github.com/ruby/strscan/releases/tag/v3.1.5
[strscan-v3.1.6]: https://github.com/ruby/strscan/releases/tag/v3.1.6
[time-v0.4.2]: https://github.com/ruby/time/releases/tag/v0.4.2
[timeout-v0.4.4]: https://github.com/ruby/timeout/releases/tag/v0.4.4
[timeout-v0.5.0]: https://github.com/ruby/timeout/releases/tag/v0.5.0
[timeout-v0.6.0]: https://github.com/ruby/timeout/releases/tag/v0.6.0
[uri-v1.1.0]: https://github.com/ruby/uri/releases/tag/v1.1.0
[uri-v1.1.1]: https://github.com/ruby/uri/releases/tag/v1.1.1
[weakref-v0.1.4]: https://github.com/ruby/weakref/releases/tag/v0.1.4
[zlib-v3.2.2]: https://github.com/ruby/zlib/releases/tag/v3.2.2
[power_assert-v3.0.0]: https://github.com/ruby/power_assert/releases/tag/v3.0.0
[power_assert-v3.0.1]: https://github.com/ruby/power_assert/releases/tag/v3.0.1
[rake-v13.3.0]: https://github.com/ruby/rake/releases/tag/v13.3.0
[rake-v13.3.1]: https://github.com/ruby/rake/releases/tag/v13.3.1
[test-unit-3.6.8]: https://github.com/test-unit/test-unit/releases/tag/3.6.8
[test-unit-3.6.9]: https://github.com/test-unit/test-unit/releases/tag/3.6.9
[test-unit-3.7.0]: https://github.com/test-unit/test-unit/releases/tag/3.7.0
[test-unit-3.7.1]: https://github.com/test-unit/test-unit/releases/tag/3.7.1
[test-unit-3.7.2]: https://github.com/test-unit/test-unit/releases/tag/3.7.2
[test-unit-3.7.3]: https://github.com/test-unit/test-unit/releases/tag/3.7.3
[test-unit-3.7.4]: https://github.com/test-unit/test-unit/releases/tag/3.7.4
[test-unit-3.7.5]: https://github.com/test-unit/test-unit/releases/tag/3.7.5
[rss-0.3.2]: https://github.com/ruby/rss/releases/tag/0.3.2
[net-ftp-v0.3.9]: https://github.com/ruby/net-ftp/releases/tag/v0.3.9
[net-imap-v0.5.9]: https://github.com/ruby/net-imap/releases/tag/v0.5.9
[net-imap-v0.5.10]: https://github.com/ruby/net-imap/releases/tag/v0.5.10
[net-imap-v0.5.11]: https://github.com/ruby/net-imap/releases/tag/v0.5.11
[net-imap-v0.5.12]: https://github.com/ruby/net-imap/releases/tag/v0.5.12
[net-imap-v0.5.13]: https://github.com/ruby/net-imap/releases/tag/v0.5.13
[net-imap-v0.6.0]: https://github.com/ruby/net-imap/releases/tag/v0.6.0
[net-imap-v0.6.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.1
[net-imap-v0.6.2]: https://github.com/ruby/net-imap/releases/tag/v0.6.2
[net-smtp-v0.5.1]: https://github.com/ruby/net-smtp/releases/tag/v0.5.1
[matrix-v0.4.3]: https://github.com/ruby/matrix/releases/tag/v0.4.3
[prime-v0.1.4]: https://github.com/ruby/prime/releases/tag/v0.1.4
[rbs-v3.8.1]: https://github.com/ruby/rbs/releases/tag/v3.8.1
[rbs-v3.9.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.dev.1
[rbs-v3.9.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.1
[rbs-v3.9.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.2
[rbs-v3.9.0]: https://github.com/ruby/rbs/releases/tag/v3.9.0
[rbs-v3.9.1]: https://github.com/ruby/rbs/releases/tag/v3.9.1
[rbs-v3.9.2]: https://github.com/ruby/rbs/releases/tag/v3.9.2
[rbs-v3.9.3]: https://github.com/ruby/rbs/releases/tag/v3.9.3
[rbs-v3.9.4]: https://github.com/ruby/rbs/releases/tag/v3.9.4
[rbs-v3.9.5]: https://github.com/ruby/rbs/releases/tag/v3.9.5
[rbs-v3.10.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.1
[rbs-v3.10.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.2
[rbs-v3.10.0]: https://github.com/ruby/rbs/releases/tag/v3.10.0
[debug-v1.11.1]: https://github.com/ruby/debug/releases/tag/v1.11.1
[base64-v0.3.0]: https://github.com/ruby/base64/releases/tag/v0.3.0
[bigdecimal-v3.2.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.0
[bigdecimal-v3.2.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.1
[bigdecimal-v3.2.2]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.2
[bigdecimal-v3.2.3]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.3
[bigdecimal-v3.3.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.0
[bigdecimal-v3.3.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.1
[bigdecimal-v4.0.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.0
[bigdecimal-v4.0.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.1
[drb-v2.2.3]: https://github.com/ruby/drb/releases/tag/v2.2.3
[syslog-v0.3.0]: https://github.com/ruby/syslog/releases/tag/v0.3.0
[csv-v3.3.3]: https://github.com/ruby/csv/releases/tag/v3.3.3
[csv-v3.3.4]: https://github.com/ruby/csv/releases/tag/v3.3.4
[csv-v3.3.5]: https://github.com/ruby/csv/releases/tag/v3.3.5
