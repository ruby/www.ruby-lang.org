---
layout: news_post
title: "Ruby 4.1.0-preview1 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2026-10-12 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "4.1.0-preview1" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 已发布。
Ruby 4.1 引入了 Ractor 本地 GC，Windows 的 YJIT 支持，autoload_relative，以及许多其他改进。

## Ractor 改进

我们投入了大量精力，让 Ractors 变得更稳定、更高效、更易用。这些改进让 Ractor 更接近从实验状态毕业。

* 默认的垃圾回收机制现在 **以每个 Ractor 为单位** 运行：每个 Ractor 在自己的线程中回收自己的堆内存，
  不会导致其他线程中断。全局性垃圾回收仅会在真正需要时执行（显式执行 `GC.start`，共享对象增长，回收已失效 Ractor 堆内存）。
  分配密集型 Ractor 程序现在可以像多进程一样进行扩展。

* 当运行多个 Ractor 时，可以使用 `GC.start(global: false)` 强制执行 Ractor 本地 GC。
  默认情况下，`GC.start` 和此前一样运行全局 GC，也可以显式通过 `GC.start(global: true)` 触发。
  关键字参数 `global` 在只有一个 Ractor 运行时无效。

  可见的行为变化：

  * `Ractor#value` 仅返回一次值，第二次调用时将抛出 `Ractor::Error`。
  * `GC.disable`/`GC.enable` 现在是每个 Ractor 各自的设置：一个 Ractor 的
    `GC.enable` 不再覆盖另一个 Ractor 的 `GC.disable`。
  * `ObjectSpace.each_object` 会枚举调用方 Ractor 自身的对象以及其他 Ractor 的可共享对象
    （`ObjectSpace.dump_all` 仍然涵盖所有对象）。
  * 对另一个 Ractor 对象调用 `ObjectSpace.define_finalizer` 将抛出 `Ractor::IsolationError`。

* `Ractor#monitor` 现在会发送一个包含 Ractor 及其状态的数组，如 `[ractor, :exited]` 或 `[ractor, :aborted]`，
  此前仅发送单独的 Symbol `:exited` 或 `:aborted`。这样，多个 Ractor 可以通过同一个端口报告状态，而接收方可以区分哪些已经执行结束。此数组专为接收方 Ractor 构建，因此监控大量 Ractor 也不会留下共享对象。

      r = Ractor.new { :ok }
      r.monitor(port = Ractor::Port.new)
      port.receive #=> [r, :exited]

  这样就可以满足用一个端口监控整个 Ractor 组的需求：

      workers.each { |r| r.monitor port }

      until workers.empty?
        r, status = port.receive
        workers.delete(r)
        workers << restart(r) if status == :aborted
      end

## 语言变化

* 对于模块中通过 `refine` 定义的方法，现在在 refinement 中可以正确地处理 `super` 调用。
  [[Feature #22309]]

* `Module#clone` 和 `Module#dup` 不再重写所复制方法的词法作用域。
  常量和类变量通过原始类进行解析，与继承和混入(mixin)保持一致。
  [[Feature #21981]]

* 在模块中使用 `alias` 和 `Module#alias_method` 时，如果原始方法既不是该模块的方法，也不是其祖先方法，
  而是 `Object` 的方法，那么系统将会发出弃用警告。这种回退到 `Object` 方法的机制将在 Ruby 4.3 中移除，
  届时，此类操作将引发 `NameError`。如此调整是因为理论上 `BasicObject` 才是所有类的基类，而 `Object`
  中的方法并不能保证在被引入后一定存在。
  [[Bug #22276]]

* 当原始方法定义在 `prepend` 模块中时，使用 `alias` 或 `Module#alias_method` 会触发弃用警告。
  此行为将在 Ruby 4.3 中被移除，届时别名查找将从原始类开始（跳过 prepend 模块）。
  [[Bug #22273]]

## 核心类更新

注意：我们仅列出了重要的更新。

* C API

    * `rb_nogvl` 新增了 `RB_NOGVL_PENDING_INTR_FAIL` 标志。如果当前线程有挂起中断（包括被
      `Thread.handle_interrupt` 阻塞的情况），`rb_nogvl` 不会进入阻塞区域（也不会调用给定的函数），返回 `0`。
      与现有的跳过行为一致，因为函数从未被调用，所以 `errno` 为 0。
    * `RHASH_TBL` 被弃用。  [[Feature #22232]]

* Array

    * `Array#pack` 接受新格式 `R` 与 `r`，用于无符号与有符号的 LEB128 编码整数。 [[Feature #21785]]
    * `Array#pack` 接受新格式 `x!` 与 `@!`，用于对齐当前偏移到字节边界，以及按另一指令的 ABI 对齐。
      [[Feature #22185]]

* Dir

    * `Dir.glob` 支持 `***/` 用于递归匹配，会跟随目录符号链接，直到遇到祖先目录链接为止。
      [[Feature #17548]]

* ENV

    * 新增 `ENV.fetch_values` 方法。此方法根据参数提供的多个环境变量名称，返回对应的环境变量值数组。
      如果没有提供处理程序块，且存在环境变量缺失，将会抛出 `KeyError`。 [[Feature #21781]]

* Fiber::Scheduler

    * `fiber_interrupt` 钩子现在是必需的。 没有实现它的 Schedulers 不再能够通过 `Fiber.set_scheduler`
      进行安装。

* GC

    * `GC.stat` 接受 `scope: :ractor` （默认值），`scope: :local`（`:ractor` 的同义词）和
      `scope: :global`。使用默认收集器时，全局作用域报告跨 Ractor 的累计收集次数和测得的
      标记/清扫 CPU 时间，包括来自已销毁对象空间的历史，而无需请求全局停止（stop-the-world）快照。
      无作用域的 `GC.stat`、`GC.count` 和 `GC.total_time` 保留当前 Ractor 行为。
    * `GC.stat` 报告新键 `:global_gc_count`： 全局垃圾收集器发起的全局停止（stop-the-world）
      垃圾收集循环次数。每个全局收集都被准确地归因于一个 Ractor，因此这些值是跨 Ractor 累加的。
      `GC.stat(:global_gc_count, scope: :global)` 报告整个进程的总数，包括已终止 Ractor 的计数。
    * 全局垃圾回收不计入 `:major_gc_count`。在两个作用域中，`:count` 等于 `:minor_gc_count` 加
      `:major_gc_count` 加 `:global_gc_count`。当存在另一个 Ractor 的对象空间时
      （包括已终止但尚未被吸收的 Ractor 留下的对象空间，或自上次全局收集以来有对象空间被吸收），
      `GC.start` 默认运行全局收集，因此增加的是 `:global_gc_count` 而不是 `:major_gc_count`；
      传入 `global: false` 可用于本地计数收集。
    * 全局压缩不再在 GC 计时统计中计入重叠的 CPU 区间。分析器墙钟时间（wall-time）区间不变。

* Hash

    * `Hash.ruby2_keywords_hash?` 和 `Hash.ruby2_keywords_hash` 已弃用，并将在 Ruby 4.5 中移除。
      [[Feature #22205]]

* Integer

    * 新增 `Integer#bit_count`。它返回非负整数的二进制表示中 `1` 位的数量（population count）。
      [[Feature #20163]]

* IO::Buffer

    * `read`，`write`，`pread` 和 `pwrite` 现在使用`(offset, length)`进行一次 IO 操作，
      其中 `length` 是最大传输大小。短传输会直接返回。

    * 相应的纤程调度钩子不再是实验性的，现在使用相同的 `(offset, length)` 参数顺序和操作语义。

* Kernel

    * 新增 `Kernel#autoload_relative` 和 `Module#autoload_relative`。
      这些方法的逻辑类似 `autoload`，但会根据调用该方法的文件来解析文件路径，类似 `require_relative`。
      这使得从同一目录中的文件自动加载常量变得更为容易，避免硬编码绝对路径或操作 `$LOAD_PATH`。
      [[Feature #15330]]

* MatchData

    * 新增 `MatchData#integer_at`。此方法将匹配的字符串转换为整数并返回。
      [[Feature #21932]]

* Module

    * 新增 `Module#descendants`。此方法返回一个数组，包含将接受者作为祖先的类和模块。 [[Feature #9779]]
    * `Module#ruby2_keywords` 和顶层 `ruby2_keywords` 已弃用，并将在 Ruby 4.4 中移除。 [[Feature #22205]]
    * `Module#method_defined?` 现在可以接受第三个可选参数，以同时匹配私有方法。 [[Feature #22297]]

* ObjectSpace

    * 移除 `ObjectSpace._id2ref`。 [[Feature #22135]]

* Proc

    * 新增 `Proc#refined`。此方法返回一个新的 `Proc`，其行为类似接收者，但在其中激活了对应的 refinement，
      且不影响原来的 `Proc`。
      [[Feature #22097]]
    * `Proc#ruby2_keywords` 已弃用，并将在 Ruby 4.4 中移除。 [[Feature #22205]]

* Range

    * 新增 `Range#clamp`。 此方法返回一个新的 `Range` 实例，其起始值受到原 `Range` 实例起始值的约束。
      [[Feature #22175]]

* Regexp

    * 所有 `Regexp` 实例现在都是冻结的，而不仅仅是字面量。基于兼容性考量，`Regexp` 的子类不会被冻结。
      [[Feature #8948]]

* Set

    * `Set#to_set`，`Range#to_set` 和 `Enumerable#to_set` 不再接受参数。 [[Feature #21390]]

* String

    * `String#unpack` 和 `String#unpack1` 接受新格式 `R` 和 `r`，
      用于解析无符号与有符号的 LEB128 编码整数。 [[Feature #21785]]
    * `String#unpack` 和 `String#unpack1` 接受新格式 `^` 返回当前的偏移。
      与 LEB128 等可变宽度格式结合时很有用。 [[Feature #21796]]
    * `String#unpack` 和 `String#unpack1` 接受新格式 `x!` 和 `@!`，
      用于对齐当前偏移到字节边界或另一个指令的 ABI 对齐。 [[Feature #22185]]
    * 新增基础位操作。 包括处理单个位的 `String#bit_get`，`String#bit_set?`，`String#bit_set`，
      `String#bit_clear`，`String#bit_flip` 和 `String#bit_count`。
      以及处理整个字符串的 `String#bitwise_not`，`String#bitwise_and`，`String#bitwise_or`，
      `String#bitwise_xor`（包括对应的 ! 变体）。 [[Feature #22118]]
    * `String#tr` 现在可以通过传入 Hash 来进行多字符替换。 [[Feature #22238]]

* Symbol

    * `Symbol#to_s` 现在返回冻结的字符串。 [[Feature #22137]]

* Thread

    * 通过将 `nil` 传递给 `Thread#thread_variable_set` 可以删除线程本地变量。 [[Feature #19333]]

* Thread::Backtrace::Location

    * 新增 `Thread::Backtrace::Location#source_range`。此方法返回与该帧关联的 Ruby 表达式的
      `Ruby::SourceRange`。

## Stdlib 更新

* Psych

    * 新增实验性的 `libfyaml` 后端。仅当 psych 使用 `--enable-libfyaml` 构建时启用，否则会使用默认的
      `libyaml` 后端。此功能不支持 Windows。 [[GH-psych #805]]

* Ruby::Prism

    * 新增 `Ruby::Prism`。 它是内置到解释器中的 prism 解析器，即用于解析正在运行程序的解析器，
      独立于 prism gem。它是自动加载的。`Method#syntax_tree` 等返回它的节点。
      其 API 可能在 Ruby 次要版本之间变化；除非需要正在运行解释器的解析器，否则请使用 `prism` gem。
      [[Bug #22379]]

### 添加了下列绑定 gem

我们只列出具有显著功能变化的标准库变更。

其他变更列在以下各节中。如果之前的捆绑版本有 GitHub releases，我们也列出了其发布历史。

### 以下默认 gem 已提升为绑定 gem

* prism 1.9.0
* tsort 0.2.0
* win32-registry 0.1.2

### 移除了以下绑定 gem

* net-ftp 0.3.9
* net-pop 0.1.2

它们仍然可以从 rubygems.org 获取，并通过 `gem install` 进行安装。  [[Feature #21835]]

### 添加了以下默认 gem

### 更新了以下默认 gem

* RubyGems 4.1.0.beta2
  * 4.0.3 到 [v4.0.4][RubyGems-v4.0.4], [v4.0.5][RubyGems-v4.0.5], [v4.0.6][RubyGems-v4.0.6], [v4.0.7][RubyGems-v4.0.7], [v4.0.8][RubyGems-v4.0.8], [v4.0.9][RubyGems-v4.0.9], [v4.0.10][RubyGems-v4.0.10], [v4.0.11][RubyGems-v4.0.11], [v4.0.12][RubyGems-v4.0.12], [v4.0.13][RubyGems-v4.0.13], [v4.0.14][RubyGems-v4.0.14], [v4.0.15][RubyGems-v4.0.15], [v4.0.16][RubyGems-v4.0.16], [v4.0.17][RubyGems-v4.0.17], [v4.0.18][RubyGems-v4.0.18], [v4.0.19][RubyGems-v4.0.19], [v4.0.20][RubyGems-v4.0.20], [v4.0.21][RubyGems-v4.0.21], [v4.0.22][RubyGems-v4.0.22], [v4.1.0.beta1][RubyGems-v4.1.0.beta1], [v4.1.0.beta2][RubyGems-v4.1.0.beta2]
* bundler 4.1.0.beta2
  * 4.0.3 到 [v4.0.4][bundler-v4.0.4], [v4.0.5][bundler-v4.0.5], [v4.0.6][bundler-v4.0.6], [v4.0.7][bundler-v4.0.7], [v4.0.8][bundler-v4.0.8], [v4.0.9][bundler-v4.0.9], [v4.0.10][bundler-v4.0.10], [v4.0.11][bundler-v4.0.11], [v4.0.12][bundler-v4.0.12], [v4.0.13][bundler-v4.0.13], [v4.0.14][bundler-v4.0.14], [v4.0.15][bundler-v4.0.15], [v4.0.16][bundler-v4.0.16], [v4.0.17][bundler-v4.0.17]
* date 3.6.0
  * 3.5.1 到 [v3.6.0][date-v3.6.0]
* delegate 0.7.0
  * 0.6.1 到 [v0.7.0][delegate-v0.7.0]
* digest 3.3.0
  * 3.2.1 到 [v3.3.0][digest-v3.3.0]
* erb 6.1.0
  * 6.0.1 到 [v6.0.1.1][erb-v6.0.1.1], [v6.0.2][erb-v6.0.2], [v6.0.3][erb-v6.0.3], [v6.0.4][erb-v6.0.4], [v6.0.5][erb-v6.0.5], [v6.0.6][erb-v6.0.6], [v6.0.7][erb-v6.0.7]
* error_highlight 0.7.2
* etc 1.5.0
  * 1.4.6 到 [v1.5.0][etc-v1.5.0]
* fileutils 1.8.1
  * 1.8.0 到 [v1.8.1][fileutils-v1.8.1]
* io-console 0.9.4
  * 0.8.2 到 [v0.9.0][io-console-v0.9.0], [v0.9.1][io-console-v0.9.1], [v0.9.2][io-console-v0.9.2], [v0.9.3][io-console-v0.9.3], [v0.9.4][io-console-v0.9.4]
* io-wait 999.999.999
* ipaddr 1.2.9
  * 1.2.8 到 [v1.2.9][ipaddr-v1.2.9]
* json 3.0.2
  * 2.18.0 到 [v2.18.1][json-v2.18.1], [v2.19.0][json-v2.19.0], [v2.19.1][json-v2.19.1], [v2.19.2][json-v2.19.2], [v2.19.3][json-v2.19.3], [v2.19.4][json-v2.19.4], [v2.19.5][json-v2.19.5], [v2.19.6][json-v2.19.6], [v2.19.7][json-v2.19.7], [v2.19.8][json-v2.19.8], [v2.19.9][json-v2.19.9], [v2.20.0][json-v2.20.0], [v2.21.0][json-v2.21.0], [v2.21.2][json-v2.21.2], [v3.0.0.rc1][json-v3.0.0.rc1], [v3.0.0][json-v3.0.0]
* net-http 0.10.0
  * 0.9.1 到 [v0.10.0][net-http-v0.10.0]
* net-protocol 0.4.0
  * 0.2.2 到 [v0.3.0][net-protocol-v0.3.0], [v0.4.0][net-protocol-v0.4.0]
* open3 0.3.0
  * 0.2.1 到 [v0.3.0][open3-v0.3.0]
* openssl 4.0.2
  * 4.0.0 到 [v4.0.1][openssl-v4.0.1], [v4.0.2][openssl-v4.0.2]
* pp 0.6.4
  * 0.6.3 到 [v0.6.4][pp-v0.6.4]
* prettyprint 0.2.1
  * 0.2.0 到 [v0.2.1][prettyprint-v0.2.1]
* psych 5.5.0
  * 5.3.1 到 [v5.4.0][psych-v5.4.0], [v5.5.0][psych-v5.5.0]
* resolv 0.8.1
  * 0.7.0 到 [v0.7.1][resolv-v0.7.1], [v0.7.2][resolv-v0.7.2], [v0.8.0][resolv-v0.8.0], [v0.8.1][resolv-v0.8.1]
* stringio 3.2.1.dev
* strscan 3.1.9.dev
  * 3.1.6 到 [v3.1.7][strscan-v3.1.7], [v3.1.8][strscan-v3.1.8]
* syntax_suggest 3.0.0
* tempfile 0.3.2
  * 0.3.1 到 [v0.3.2][tempfile-v0.3.2]
* time 0.5.0
  * 0.4.2 到 [v0.5.0][time-v0.5.0]
* timeout 0.6.1
  * 0.6.0 到 [v0.6.1][timeout-v0.6.1]
* tmpdir 0.3.2
  * 0.3.1 到 [v0.3.2][tmpdir-v0.3.2]
* uri 1.1.2
  * 1.1.1 到 [v1.1.2][uri-v1.1.2]
* zlib 3.2.4
  * 3.2.2 到 [v3.2.3][zlib-v3.2.3], [v3.2.4][zlib-v3.2.4]

### 更新了以下绑定 gem。

* minitest 6.0.6
* power_assert 3.1.0
  * 3.0.1 到 [v3.1.0][power_assert-v3.1.0]
* rake 13.4.2
  * 13.3.1 到 [v13.4.0][rake-v13.4.0], [v13.4.1][rake-v13.4.1], [v13.4.2][rake-v13.4.2]
* test-unit 3.7.8
  * 3.7.5 到 [3.7.6][test-unit-3.7.6], [3.7.7][test-unit-3.7.7], [3.7.8][test-unit-3.7.8]
* rss 0.3.3
  * 0.3.2 到 [0.3.3][rss-0.3.3]
* net-imap 0.6.7
  * 0.6.2 到 [v0.6.3][net-imap-v0.6.3], [v0.6.4][net-imap-v0.6.4], [v0.6.4.1][net-imap-v0.6.4.1], [v0.6.5][net-imap-v0.6.5], [v0.6.6][net-imap-v0.6.6], [v0.6.7][net-imap-v0.6.7]
* net-smtp 0.5.2
  * 0.5.1 到 [v0.5.2][net-smtp-v0.5.2]
* rbs 4.2.0
  * 3.10.0 到 [v3.10.1][rbs-v3.10.1], [v3.10.2][rbs-v3.10.2], [v3.10.3][rbs-v3.10.3], [v3.10.4][rbs-v3.10.4], [v4.0.0.dev.1][rbs-v4.0.0.dev.1], [v4.0.0.dev.2][rbs-v4.0.0.dev.2], [v4.0.0.dev.3][rbs-v4.0.0.dev.3], [v4.0.0.dev.4][rbs-v4.0.0.dev.4], [v4.0.0.dev.5][rbs-v4.0.0.dev.5], [v4.0.0][rbs-v4.0.0], [v4.0.1.dev.1][rbs-v4.0.1.dev.1], [v4.0.1.dev.2][rbs-v4.0.1.dev.2], [v4.0.1][rbs-v4.0.1], [v4.0.2][rbs-v4.0.2], [v4.0.3][rbs-v4.0.3], [v4.1.0.pre.1][rbs-v4.1.0.pre.1], [v4.1.0.pre.2][rbs-v4.1.0.pre.2], [v4.1.0][rbs-v4.1.0], [v4.1.1.pre.1][rbs-v4.1.1.pre.1], [v4.1.1][rbs-v4.1.1], [v4.1.2][rbs-v4.1.2], [v4.1.3][rbs-v4.1.3], [v4.2.0.pre.1][rbs-v4.2.0.pre.1], [v4.2.0][rbs-v4.2.0]
* typeprof 0.33.2
* mutex_m 0.3.0
* bigdecimal 4.1.3
  * 4.0.1 到 [v4.1.0][bigdecimal-v4.1.0], [v4.1.1][bigdecimal-v4.1.1], [v4.1.2][bigdecimal-v4.1.2], [v4.1.3][bigdecimal-v4.1.3]
* resolv-replace 0.2.0
  * 0.1.1 到 [v0.2.0][resolv-replace-v0.2.0]
* nkf 0.3.0
  * 0.2.0 到 [v0.3.0][nkf-v0.3.0]
* syslog 0.4.0
  * 0.3.0 到 [v0.4.0][syslog-v0.4.0]
* csv 3.3.6
  * 3.3.5 到 [v3.3.6][csv-v3.3.6]
* repl_type_completor 0.1.16
  * 0.1.12 到 [v0.1.13][repl_type_completor-v0.1.13], [v0.1.14][repl_type_completor-v0.1.14], [v0.1.15][repl_type_completor-v0.1.15], [v0.1.16][repl_type_completor-v0.1.16]
* pstore 0.2.1
  * 0.2.0 到 [v0.2.1][pstore-v0.2.1]
* rdoc 8.1.0
  * 7.0.3 到 [v7.0.4][rdoc-v7.0.4], [v7.1.0][rdoc-v7.1.0], [v7.2.0][rdoc-v7.2.0], [v8.0.0][rdoc-v8.0.0], [v8.1.0][rdoc-v8.1.0]
* win32ole 1.9.3
  * 1.9.2 到 [v1.9.3][win32ole-v1.9.3]
* irb 1.18.0
  * 1.16.0 到 [v1.17.0][irb-v1.17.0], [v1.18.0][irb-v1.18.0]
* reline 0.7.0
  * 0.6.3 到 [v0.7.0][reline-v0.7.0]

### RubyGems 和 Bundler

Ruby 4.1 捆绑了 RubyGems 和 Bundler 版本 4。 有关详细信息，请参阅以下链接。

## 支持的平台

* 已移除以下平台的支持代码。它们的供应商或发行商已结束支持，没有环境可在其上测试 Ruby，并且它们都没有平台维护者。

    * AmigaOS
    * AtheOS
    * BSD/OS (BSDi)
    * ESIX
    * EWS-UX (NEC EWS4800)
    * 使用 a.out 二进制文件的 FreeBSD、NetBSD 和 OpenBSD
    * GNU/kFreeBSD
    * GNU/kOpenSolaris
    * HI-UX/MPP
    * HP 9000 Series 300 上的 HP-UX
    * Interix (Windows Services for UNIX)
    * IRIX
    * MirOS BSD
    * NeXTSTEP、OpenStep 和 Rhapsody
    * OSF/1 (Tru64 UNIX)
    * QNX Neutrino
    * SunOS 4 (Solaris，如 SunOS 5 等，不受影响)
    * System V Release 4
    * UNICOS/mp (Cray X1)
    * UX/PDS

* 已移除以下旧版本的支持代码。

    * Cygwin 1.3 及更早版本
    * Solaris 9 及更早版本
    * Linux 2.6.23 及更早版本 (RHEL 5)

* Windows 10 1703 及后续版本不再需要 `LongPathsEnabled` 注册表值就可以使用超过 260 个字符的路径。
  这适用于运行解释器的任何进程，包括嵌入 libruby 的程序。每个路径组件仍限制为 255 个字符，子进程仍受当前目录
  `MAX_PATH` 限制。 [[Bug #18947]]

* 使用 MSVC 构建 Ruby 需要 Visual Studio 2017 15.8(`_MSC_VER` 1915) 或更新版本。

* 使用 MSVC 构建的 Ruby 现在需要 Windows 10 版本 1809 （内部版本 17763）或 Windows Server 2019
  及更新版本。不再支持更早的 Windows 10 版本以及 Windows Server 2016。

* macOS 上的 Ruby 现在需要 Mac OS X 10.6 或更新版本。 不再支持 Mac OS X 10.5 和 PowerPC Mac。

## 兼容性问题

* 一个类或模块现在只能由创建它的 Ractor（其 **owner**）修改。
  在任何其他 Ractor 中进行下列操作都会抛出 `Ractor::IsolationError`：
  定义、删除或 `undef`、`alias`、更改可见性、`include`/`prepend`、`Module#refine`、定义或删除常量、
  注册 `autoload`、写入类自身的实例变量和类变量、`Module#freeze` 和 `Module#set_temporary_name`.
  读方法不受影响。启动时或由主 Ractor 定义的所有内容（包括 `require` 的库）都归主 Ractor 所有，因此非主 Ractor
  不能再使用猴子补丁；并且由于禁止在外部类中定义常量，它也不能定义顶层类或模块名称。
  作为交换，Ractor 可以完全使用它自己创建的类，包括不可共享的常量、实例变量和类变量值，这是以前连主 Ractor 都做不到的。
  参见 doc/language/ractor.md。 [[Feature #22226]]

* 在非主 Ractor 中调用 `Kernel#at_exit` 和 `END {}` 现在会抛出 `Ractor::IsolationError`。
  以前注册的处理器会在进程退出时在主 Ractor 中运行，这会令人困惑。 [[Feature #22139]]

* 对于 `IO` 对象，`Ractor.make_shareable` 现在抛出 `Ractor::Error`，并且 `Ractor.shareable?` 返回 `false`。
  冻结的 `IO` 对象此前是可以共享的，但几乎所有的方法都会抛出 `FrozenError`，并且仍可以通过 `rb_io_t` 引用不可共享对象。

* 任何请求大小超过 `long` 的 `Random.urandom` 调用，现在会抛出 `RangeError`，行为类似 `Random#bytes`。
  此前，即使对于大小仍在 `unsigned long` 范围内的，也会抛出 `ArgumentError`。 [[Feature #22400]]

* `Struct#[]` 和 `Struct#[]=` 现在对于任何能放入 `long` 的越界整数索引抛出 `IndexError`。
  此前，当索引超过 `int` 范围时，会抛出 `RangeError`。 [[Feature #22400]]

## Stdlib 兼容性问题

* prism 现在是绑定 gem。在 Bundler 中，`require "prism"` 需要先在 Gemfile 中注明 prism。
  在解释器中进行解析时，可以使用 `Ruby::Prism`。 [[Bug #22379]]

* 在 Windows 中 `Etc.getlogin` 现在返回进程启动时确定的登录名，登录名来自 `USER` 环境变量或
  `USERNAME` 环境变量或 `GetUserName()`。此前，该方法会跟随 `ENV['USER']` 的变化而变化。

* Socket

    * Windows 中，被拒绝或不可达的连接现在会在 Winsock 报告后，立刻抛出对应的 `Errno` 类，
      而不是在 `connect_timeout` 超时后抛出 `Errno::ETIMEDOUT`。如果代码依赖捕获 `Errno::ETIMEDOUT`
      来处理对应逻辑的，则需要对代码进行相应修改。

    * Windows 中， `BasicSocket#getsockopt(:SOCKET, :ERROR)` 现在像其他平台一样报告 errno，
      而不是原始 WinSock 错误代码。如果代码依赖 `WASE*` 错误码的，需要修改为对应的 `Errno::*::Errno`。

    [[Bug #18661]]

## C API 更新

### 嵌入式 TypedData

* `RUBY_TYPED_EMBEDDABLE` 现在是公开且文档化的，可供 C 扩展使用。它允许将 C 结构体直接分配到 Ruby 对象槽中，
  从而减少了指针追逐的次数，在某些情况下也能减少内存使用。详情可参见 C 扩展文档。 [[Feature #21853]]

* 新增受 C23 启发的分配器函数，这些函数接受先前的内存大小。这使 Ruby GC 能更好地跟踪内存使用，改进其管理策略，
  并提高了支持 C23 `free_sized` 的系统分配器的性能。

  然而，必须注意，向这些函数传入错误的大小会导致未定义行为，从而引发崩溃或内存泄漏。

  - `ruby_xfree_sized(void *ptr, size_t size)`
  - `ruby_xrealloc_sized(void *ptr, size_t newsiz, size_t oldsiz)`
  - `ruby_xrealloc2_sized(void *ptr, size_t newelems, size_t newsiz, size_t oldelems)`

  [[Feature #21861]]

### Ractor 作用域的 GC 地址注册

* `rb_gc_register_address` 和 `rb_global_variable` 现在将地址注册到调用方 Ractor，
  并且只有该 Ractor 的 GC 会标记存储的对象。

  任何 Ractor 都可以注册地址，但通过它存储的值必须是特殊常量、可共享对象，或由注册 Ractor
  拥有的不可共享对象。存储另一个 Ractor 的不可共享对象可能导致对象在地址仍在引用时被释放（use-after-free）。

  如果地址具有进程生命周期（静态 VALUE），请从主 Ractor 注册，或保持存储值可共享。

  当注册 Ractor 通过 `Ractor#value` 被 join 时，剩余注册会转移到 join 的 Ractor；
  否则一旦终止 Ractor 被收集，它们会转移到主 Ractor。

  [[Feature #22277]]

### 长度和索引的类型

* 新增了 `rb_len_t` 和 `rb_ulen_t`，作为 String、Array 和 MatchData 的长度和索引类型，
  并带有 `LEN2NUM`、`NUM2LEN`、`ULEN2NUM`、`rb_len2int`、`PRIdLEN`等相关定义，
  `RB_LEN_MAX`、`RB_LEN_MIN`、`RB_ULEN_MAX`、`SIZEOF_RB_LEN_T` 和 `HAVE_RB_LEN_T`。
  `RbConfig::SIZEOF["rb_len_t"]` 将其大小提供给 extconf.rb。目前它们在所有平台上都是 `long`，
  携带此类长度的 C API（如 `RSTRING_LEN` 和 `rb_range_beg_len`）会使用这些定义。
  后续的变更中，将在 mswin 上使它们变为 64 位，因此相关扩展应将这些长度保存在 `rb_len_t` 中。
  [[Feature #22400]]

* 新增 `rb_len2long`，用于将 `rb_len_t` 转换为 `long`，当长度不合适时，通过新的 `rb_out_of_long`
  抛出 `RangeError`，供将长度保存在 `long` 中的扩展使用。 [[Feature #22400]]

### 移除的 APIs

下列 API已声明废弃多年，现在被移除。[[Feature #21768]]

* 旧的 postponed job 函数，
* 无类型数据对象类型/函数，
* 分配数据对象的旧 API，
* taintedness/trustedness enums/macros，
* `rb_gc_force_recycle` 函数，
* `rb_iterate` 函数，
* 以及一些内部使用的函数和常量。

## 实现改进

- 默认垃圾回收器已从 freelist 分配器切换为 bump pointer 分配器。 [[PR #17201]]

- error_highlight、did_you_mean 和 syntax_suggest gems 现在在首次显示错误时惰性加载，
  而不是在解释器启动时加载，从而减少启动时间。`Process.warmup` 会加载它们，以便 pre-fork
  服务器将其代码保留在写时复制共享内存中。 [[Feature #21951]]

### M:N 线程调度器

* 调度器现在可随等待者和 Ractor 数量扩展，而过去它会遍历列表或为所有等待者使用一把锁：

  * 定时等待位于分层时间轮中，而不是按截止时间排序的列表中，后者的插入需要线性扫描。
  * fd 在两次等待之间保持在后台，而不是每次等待前添加、每次唤醒后移除。
  * io-wait 记账按 fd 分片，而不是通过一把锁在所有 fd 上串行化。
  * 对 fd 的定时等待由调度器处理，而不是进入阻塞区域，后者每次等待都要付出原生线程交接成本。
  * 上下文切换，以及离开或重新加入共享池，不再获取调度器的全局锁。

* `RUBY_MN_THREADS` 环境变量现在可控制从完全不使用 M:N 调度到全部使用 M:N 调度。`-1` 是新增的：
  自 M:N 调度器加入以来，Ractor 的线程默认就是 M:N 调度的，且无法关闭。`0` 和 `1` 的行为未变更。


  | | 主线程 | 主 Ractor 的其他线程 | Ractor 的线程 |
  |---|---|---|---|
  | `-1` | 1:1 | 1:1 | 1:1 |
  | `0` or unset | 1:1 | 1:1 | M:N |
  | `1` | 1:1 | M:N | M:N |
  | `2` | M:N | M:N | M:N |


* 新增 `RUBY_MN_THREADS=2`。主线程像任何其他 M:N 线程一样恢复，而不是在自己的原生线程上被唤醒，
  后者的开销要高一个数量级。当主线程负责执行任务时，这一特性的优势显著；而对于只启动其他线程并等待的主线程则没有作用。

  这样一来，主线程不再绑定到一个 OS 线程，这正是 M:N 调度器对其他所有线程的预期

  * 保留每个 OS 线程状态的 C 扩展必须调用 `rb_thread_lock_native_thread()`。
  * 包括需要固定到进程初始线程的操作：macOS AppKit 和 CFRunLoop，以及嵌入 Ruby 并运行自己的主循环的宿主，将完全无法工作

* 对于 M:N 线程，OS 线程名不再从 Ruby 线程设置：一个原生线程在其生命周期内运行许多 Ruby 线程。
  由于同样的原因，`Thread#name=` 早已被跳过。

## JIT

### YJIT

* YJIT 现在支持 x64 CPU 上的 Windows（mswin）。可以通过 `win32\configure.bat --enable-yjit`
  进行配置，构建需要 `x86_64-pc-windows-msvc` target 的 `rustc`。仅支持 release 构建，不支持 MinGW。
  [[Feature #18439]]

更多详情，可参见 [新闻](https://docs.ruby-lang.org/en/{{ release.tag }}/NEWS_md.html)
或 [提交日志](https://github.com/ruby/ruby/compare/v4_0_0...{{ release.tag }})。

自 Ruby 4.0.0 以来，这些变更共计： [{{ release.stats.files_changed }} 个文件变更，新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v4_0_0...{{ release.tag }}#file_bucket)！

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

Ruby 最初由 Matz（松本行弘，Yukihiro Matsumoto）于 1993 年开发，
现在以开源软件的形式开发。它可以在多个平台上运行，并在全球得到广泛使用，尤其是 Web 开发领域。

[Bug #18661]: https://bugs.ruby-lang.org/issues/18661
[Bug #18947]: https://bugs.ruby-lang.org/issues/18947
[Bug #22273]: https://bugs.ruby-lang.org/issues/22273
[Bug #22276]: https://bugs.ruby-lang.org/issues/22276
[Bug #22379]: https://bugs.ruby-lang.org/issues/22379
[Feature #8948]: https://bugs.ruby-lang.org/issues/8948
[Feature #9779]: https://bugs.ruby-lang.org/issues/9779
[Feature #15330]: https://bugs.ruby-lang.org/issues/15330
[Feature #17548]: https://bugs.ruby-lang.org/issues/17548
[Feature #18439]: https://bugs.ruby-lang.org/issues/18439
[Feature #20163]: https://bugs.ruby-lang.org/issues/20163
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21768]: https://bugs.ruby-lang.org/issues/21768
[Feature #21781]: https://bugs.ruby-lang.org/issues/21781
[Feature #21785]: https://bugs.ruby-lang.org/issues/21785
[Feature #21796]: https://bugs.ruby-lang.org/issues/21796
[Feature #21835]: https://bugs.ruby-lang.org/issues/21835
[Feature #21853]: https://bugs.ruby-lang.org/issues/21853
[Feature #21861]: https://bugs.ruby-lang.org/issues/21861
[Feature #21932]: https://bugs.ruby-lang.org/issues/21932
[Feature #21951]: https://bugs.ruby-lang.org/issues/21951
[Feature #21981]: https://bugs.ruby-lang.org/issues/21981
[Feature #22097]: https://bugs.ruby-lang.org/issues/22097
[Feature #22118]: https://bugs.ruby-lang.org/issues/22118
[Feature #22135]: https://bugs.ruby-lang.org/issues/22135
[Feature #22137]: https://bugs.ruby-lang.org/issues/22137
[Feature #22139]: https://bugs.ruby-lang.org/issues/22139
[Feature #22175]: https://bugs.ruby-lang.org/issues/22175
[Feature #22185]: https://bugs.ruby-lang.org/issues/22185
[Feature #22205]: https://bugs.ruby-lang.org/issues/22205
[Feature #22226]: https://bugs.ruby-lang.org/issues/22226
[Feature #22232]: https://bugs.ruby-lang.org/issues/22232
[Feature #22238]: https://bugs.ruby-lang.org/issues/22238
[Feature #22277]: https://bugs.ruby-lang.org/issues/22277
[Feature #22297]: https://bugs.ruby-lang.org/issues/22297
[Feature #22309]: https://bugs.ruby-lang.org/issues/22309
[Feature #22400]: https://bugs.ruby-lang.org/issues/22400
[PR #17201]: https://github.com/ruby/ruby/pull/17201
[GH-psych #805]: https://github.com/ruby/psych/pull/805
[RubyGems-v4.0.4]: https://github.com/rubygems/rubygems/releases/tag/v4.0.4
[RubyGems-v4.0.5]: https://github.com/rubygems/rubygems/releases/tag/v4.0.5
[RubyGems-v4.0.6]: https://github.com/rubygems/rubygems/releases/tag/v4.0.6
[RubyGems-v4.0.7]: https://github.com/rubygems/rubygems/releases/tag/v4.0.7
[RubyGems-v4.0.8]: https://github.com/rubygems/rubygems/releases/tag/v4.0.8
[RubyGems-v4.0.9]: https://github.com/rubygems/rubygems/releases/tag/v4.0.9
[RubyGems-v4.0.10]: https://github.com/rubygems/rubygems/releases/tag/v4.0.10
[RubyGems-v4.0.11]: https://github.com/rubygems/rubygems/releases/tag/v4.0.11
[RubyGems-v4.0.12]: https://github.com/rubygems/rubygems/releases/tag/v4.0.12
[RubyGems-v4.0.13]: https://github.com/rubygems/rubygems/releases/tag/v4.0.13
[RubyGems-v4.0.14]: https://github.com/rubygems/rubygems/releases/tag/v4.0.14
[RubyGems-v4.0.15]: https://github.com/rubygems/rubygems/releases/tag/v4.0.15
[RubyGems-v4.0.16]: https://github.com/rubygems/rubygems/releases/tag/v4.0.16
[RubyGems-v4.0.17]: https://github.com/rubygems/rubygems/releases/tag/v4.0.17
[RubyGems-v4.0.18]: https://github.com/rubygems/rubygems/releases/tag/v4.0.18
[RubyGems-v4.0.19]: https://github.com/rubygems/rubygems/releases/tag/v4.0.19
[RubyGems-v4.0.20]: https://github.com/rubygems/rubygems/releases/tag/v4.0.20
[RubyGems-v4.0.21]: https://github.com/rubygems/rubygems/releases/tag/v4.0.21
[RubyGems-v4.0.22]: https://github.com/rubygems/rubygems/releases/tag/v4.0.22
[RubyGems-v4.1.0.beta1]: https://github.com/rubygems/rubygems/releases/tag/v4.1.0.beta1
[RubyGems-v4.1.0.beta2]: https://github.com/rubygems/rubygems/releases/tag/v4.1.0.beta2
[bundler-v4.0.4]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.4
[bundler-v4.0.5]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.5
[bundler-v4.0.6]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.6
[bundler-v4.0.7]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.7
[bundler-v4.0.8]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.8
[bundler-v4.0.9]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.9
[bundler-v4.0.10]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.10
[bundler-v4.0.11]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.11
[bundler-v4.0.12]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.12
[bundler-v4.0.13]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.13
[bundler-v4.0.14]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.14
[bundler-v4.0.15]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.15
[bundler-v4.0.16]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.16
[bundler-v4.0.17]: https://github.com/rubygems/rubygems/releases/tag/bundler-v4.0.17
[date-v3.6.0]: https://github.com/ruby/date/releases/tag/v3.6.0
[delegate-v0.7.0]: https://github.com/ruby/delegate/releases/tag/v0.7.0
[digest-v3.3.0]: https://github.com/ruby/digest/releases/tag/v3.3.0
[erb-v6.0.1.1]: https://github.com/ruby/erb/releases/tag/v6.0.1.1
[erb-v6.0.2]: https://github.com/ruby/erb/releases/tag/v6.0.2
[erb-v6.0.3]: https://github.com/ruby/erb/releases/tag/v6.0.3
[erb-v6.0.4]: https://github.com/ruby/erb/releases/tag/v6.0.4
[erb-v6.0.5]: https://github.com/ruby/erb/releases/tag/v6.0.5
[erb-v6.0.6]: https://github.com/ruby/erb/releases/tag/v6.0.6
[erb-v6.0.7]: https://github.com/ruby/erb/releases/tag/v6.0.7
[etc-v1.5.0]: https://github.com/ruby/etc/releases/tag/v1.5.0
[fileutils-v1.8.1]: https://github.com/ruby/fileutils/releases/tag/v1.8.1
[io-console-v0.9.0]: https://github.com/ruby/io-console/releases/tag/v0.9.0
[io-console-v0.9.1]: https://github.com/ruby/io-console/releases/tag/v0.9.1
[io-console-v0.9.2]: https://github.com/ruby/io-console/releases/tag/v0.9.2
[io-console-v0.9.3]: https://github.com/ruby/io-console/releases/tag/v0.9.3
[io-console-v0.9.4]: https://github.com/ruby/io-console/releases/tag/v0.9.4
[ipaddr-v1.2.9]: https://github.com/ruby/ipaddr/releases/tag/v1.2.9
[json-v2.18.1]: https://github.com/ruby/json/releases/tag/v2.18.1
[json-v2.19.0]: https://github.com/ruby/json/releases/tag/v2.19.0
[json-v2.19.1]: https://github.com/ruby/json/releases/tag/v2.19.1
[json-v2.19.2]: https://github.com/ruby/json/releases/tag/v2.19.2
[json-v2.19.3]: https://github.com/ruby/json/releases/tag/v2.19.3
[json-v2.19.4]: https://github.com/ruby/json/releases/tag/v2.19.4
[json-v2.19.5]: https://github.com/ruby/json/releases/tag/v2.19.5
[json-v2.19.6]: https://github.com/ruby/json/releases/tag/v2.19.6
[json-v2.19.7]: https://github.com/ruby/json/releases/tag/v2.19.7
[json-v2.19.8]: https://github.com/ruby/json/releases/tag/v2.19.8
[json-v2.19.9]: https://github.com/ruby/json/releases/tag/v2.19.9
[json-v2.20.0]: https://github.com/ruby/json/releases/tag/v2.20.0
[json-v2.21.0]: https://github.com/ruby/json/releases/tag/v2.21.0
[json-v2.21.2]: https://github.com/ruby/json/releases/tag/v2.21.2
[json-v3.0.0.rc1]: https://github.com/ruby/json/releases/tag/v3.0.0.rc1
[json-v3.0.0]: https://github.com/ruby/json/releases/tag/v3.0.0
[net-http-v0.10.0]: https://github.com/ruby/net-http/releases/tag/v0.10.0
[net-protocol-v0.3.0]: https://github.com/ruby/net-protocol/releases/tag/v0.3.0
[net-protocol-v0.4.0]: https://github.com/ruby/net-protocol/releases/tag/v0.4.0
[open3-v0.3.0]: https://github.com/ruby/open3/releases/tag/v0.3.0
[openssl-v4.0.1]: https://github.com/ruby/openssl/releases/tag/v4.0.1
[openssl-v4.0.2]: https://github.com/ruby/openssl/releases/tag/v4.0.2
[pp-v0.6.4]: https://github.com/ruby/pp/releases/tag/v0.6.4
[prettyprint-v0.2.1]: https://github.com/ruby/prettyprint/releases/tag/v0.2.1
[psych-v5.4.0]: https://github.com/ruby/psych/releases/tag/v5.4.0
[psych-v5.5.0]: https://github.com/ruby/psych/releases/tag/v5.5.0
[resolv-v0.7.1]: https://github.com/ruby/resolv/releases/tag/v0.7.1
[resolv-v0.7.2]: https://github.com/ruby/resolv/releases/tag/v0.7.2
[resolv-v0.8.0]: https://github.com/ruby/resolv/releases/tag/v0.8.0
[resolv-v0.8.1]: https://github.com/ruby/resolv/releases/tag/v0.8.1
[strscan-v3.1.7]: https://github.com/ruby/strscan/releases/tag/v3.1.7
[strscan-v3.1.8]: https://github.com/ruby/strscan/releases/tag/v3.1.8
[tempfile-v0.3.2]: https://github.com/ruby/tempfile/releases/tag/v0.3.2
[time-v0.5.0]: https://github.com/ruby/time/releases/tag/v0.5.0
[timeout-v0.6.1]: https://github.com/ruby/timeout/releases/tag/v0.6.1
[tmpdir-v0.3.2]: https://github.com/ruby/tmpdir/releases/tag/v0.3.2
[uri-v1.1.2]: https://github.com/ruby/uri/releases/tag/v1.1.2
[zlib-v3.2.3]: https://github.com/ruby/zlib/releases/tag/v3.2.3
[zlib-v3.2.4]: https://github.com/ruby/zlib/releases/tag/v3.2.4
[power_assert-v3.1.0]: https://github.com/ruby/power_assert/releases/tag/v3.1.0
[rake-v13.4.0]: https://github.com/ruby/rake/releases/tag/v13.4.0
[rake-v13.4.1]: https://github.com/ruby/rake/releases/tag/v13.4.1
[rake-v13.4.2]: https://github.com/ruby/rake/releases/tag/v13.4.2
[test-unit-3.7.6]: https://github.com/test-unit/test-unit/releases/tag/3.7.6
[test-unit-3.7.7]: https://github.com/test-unit/test-unit/releases/tag/3.7.7
[test-unit-3.7.8]: https://github.com/test-unit/test-unit/releases/tag/3.7.8
[rss-0.3.3]: https://github.com/ruby/rss/releases/tag/0.3.3
[net-imap-v0.6.3]: https://github.com/ruby/net-imap/releases/tag/v0.6.3
[net-imap-v0.6.4]: https://github.com/ruby/net-imap/releases/tag/v0.6.4
[net-imap-v0.6.4.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.4.1
[net-imap-v0.6.5]: https://github.com/ruby/net-imap/releases/tag/v0.6.5
[net-imap-v0.6.6]: https://github.com/ruby/net-imap/releases/tag/v0.6.6
[net-imap-v0.6.7]: https://github.com/ruby/net-imap/releases/tag/v0.6.7
[net-smtp-v0.5.2]: https://github.com/ruby/net-smtp/releases/tag/v0.5.2
[rbs-v3.10.1]: https://github.com/ruby/rbs/releases/tag/v3.10.1
[rbs-v3.10.2]: https://github.com/ruby/rbs/releases/tag/v3.10.2
[rbs-v3.10.3]: https://github.com/ruby/rbs/releases/tag/v3.10.3
[rbs-v3.10.4]: https://github.com/ruby/rbs/releases/tag/v3.10.4
[rbs-v4.0.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.1
[rbs-v4.0.0.dev.2]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.2
[rbs-v4.0.0.dev.3]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.3
[rbs-v4.0.0.dev.4]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.4
[rbs-v4.0.0.dev.5]: https://github.com/ruby/rbs/releases/tag/v4.0.0.dev.5
[rbs-v4.0.0]: https://github.com/ruby/rbs/releases/tag/v4.0.0
[rbs-v4.0.1.dev.1]: https://github.com/ruby/rbs/releases/tag/v4.0.1.dev.1
[rbs-v4.0.1.dev.2]: https://github.com/ruby/rbs/releases/tag/v4.0.1.dev.2
[rbs-v4.0.1]: https://github.com/ruby/rbs/releases/tag/v4.0.1
[rbs-v4.0.2]: https://github.com/ruby/rbs/releases/tag/v4.0.2
[rbs-v4.0.3]: https://github.com/ruby/rbs/releases/tag/v4.0.3
[rbs-v4.1.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.1.0.pre.1
[rbs-v4.1.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v4.1.0.pre.2
[rbs-v4.1.0]: https://github.com/ruby/rbs/releases/tag/v4.1.0
[rbs-v4.1.1.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.1.1.pre.1
[rbs-v4.1.1]: https://github.com/ruby/rbs/releases/tag/v4.1.1
[rbs-v4.1.2]: https://github.com/ruby/rbs/releases/tag/v4.1.2
[rbs-v4.1.3]: https://github.com/ruby/rbs/releases/tag/v4.1.3
[rbs-v4.2.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v4.2.0.pre.1
[rbs-v4.2.0]: https://github.com/ruby/rbs/releases/tag/v4.2.0
[bigdecimal-v4.1.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.0
[bigdecimal-v4.1.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.1
[bigdecimal-v4.1.2]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.2
[bigdecimal-v4.1.3]: https://github.com/ruby/bigdecimal/releases/tag/v4.1.3
[resolv-replace-v0.2.0]: https://github.com/ruby/resolv-replace/releases/tag/v0.2.0
[nkf-v0.3.0]: https://github.com/ruby/nkf/releases/tag/v0.3.0
[syslog-v0.4.0]: https://github.com/ruby/syslog/releases/tag/v0.4.0
[csv-v3.3.6]: https://github.com/ruby/csv/releases/tag/v3.3.6
[repl_type_completor-v0.1.13]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.13
[repl_type_completor-v0.1.14]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.14
[repl_type_completor-v0.1.15]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.15
[repl_type_completor-v0.1.16]: https://github.com/ruby/repl_type_completor/releases/tag/v0.1.16
[pstore-v0.2.1]: https://github.com/ruby/pstore/releases/tag/v0.2.1
[rdoc-v7.0.4]: https://github.com/ruby/rdoc/releases/tag/v7.0.4
[rdoc-v7.1.0]: https://github.com/ruby/rdoc/releases/tag/v7.1.0
[rdoc-v7.2.0]: https://github.com/ruby/rdoc/releases/tag/v7.2.0
[rdoc-v8.0.0]: https://github.com/ruby/rdoc/releases/tag/v8.0.0
[rdoc-v8.1.0]: https://github.com/ruby/rdoc/releases/tag/v8.1.0
[win32ole-v1.9.3]: https://github.com/ruby/win32ole/releases/tag/v1.9.3
[irb-v1.17.0]: https://github.com/ruby/irb/releases/tag/v1.17.0
[irb-v1.18.0]: https://github.com/ruby/irb/releases/tag/v1.18.0
[reline-v0.7.0]: https://github.com/ruby/reline/releases/tag/v0.7.0
