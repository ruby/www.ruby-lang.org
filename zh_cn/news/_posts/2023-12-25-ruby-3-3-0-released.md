---
layout: news_post
title: "Ruby 3.3.0 已发布"
author: "naruse"
translator: GAO Jun
date: 2023-12-25 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.3.0" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 发布。
Ruby 3.3 新增了 Prism 解析器，使用 Lrama 作为解析生成器，新增了纯 Ruby 实现的 JIT 编译器 RJIT，另有许多性能改进，尤其是 YJIT。

## Prism

* 引入 [Prism 解析器](https://github.com/ruby/prism) 为默认 gem
  * Prism 是一个可移植、容错且可维护的 Ruby 语言递归下降解析器
* Prism 已可用于生产环境，并得到了积极维护，您可以使用它来代替 Ripper
  * 有关于如何使用 Prism 的 [详细文档](https://ruby.github.io/prism/)
  * Prism 既是 CRuby 内部使用的 C 库，也是任何需要解析 Ruby 代码的工具可以使用的 Ruby gem
  * Prism API 中值得注意的方法有：
    * `Prism.parse(source)` 返回 AST 作为解析结果对象的一部分
    * `Prism.parse_comments(source)` 返回注释
    * `Prism.parse_success?(source)` 返回解析是否成功（没有错误）
* 如果您有兴趣贡献，可以直接在 [Prism 代码库](https://github.com/ruby/prism) 上提出拉取请求或报告问题
* 您现在可以通过 `ruby --parser=prism` 或 `RUBYOPT="--parser=prism"` 来试用 Prism 编译器。 请注意，此选项仅用于调试。

## 使用 Lrama 替代 Bison

* 使用 [Lrama LALR 解析生成器](https://github.com/ruby/lrama) 替换 Bison [[Feature #19637]](https://bugs.ruby-lang.org/issues/19637)
  * 如果您有兴趣，请参阅 [Ruby 解析器的未来愿景](https://rubykaigi.org/2023/presentations/spikeolaf.html)
  * Lrama 内部解析器被 Racc 生成的 LR 解析器替换，以便于维护
  * 已支持参数化规则 `(?, *, +)` ，将被用于 Ruby parse.y 中

## YJIT

* 相对于 Ruby 3.2 的主要性能提升
  * 改进了 splat 和 rest 参数支持。
  * 虚拟机的栈操作分配了寄存器。
  * 更多带有可选参数的调用被编译。错误处理也被编译。
  * 不支持的调用类型和多态调用不再推出到解释器执行。
  * 诸如 Rails 的 `#blank?` 和 [特定的 `#present?`](https://github.com/rails/rails/pull/49909) 现在被内联。
  * 特别优化了 `Integer#*`, `Integer#!=`, `String#!=`, `String#getbyte`,
    `Kernel#block_given?`, `Kernel#is_a?`, `Kernel#instance_of?`, `Module#===`。
  * 编译速度比 Ruby 3.2 略快。
  * 比 Optcarrot 的解释器快 3 倍以上！
* 内存利用率相较 Ruby 3.2 有显著提升
  * 编译代码所用的元数据使用更少的内存。
    * 当应用程序超过 40000 ISEQ 时，`--yjit-call-threshold` 自动从 30 提升到 120。
    * 增加 `--yjit-cold-threshold` 来跳过编译冷 ISEQ。
  * 在 ARM64 中的生成更多紧凑代码。
* 代码垃圾收集现在默认禁用
  * 将 `--yjit-exec-mem-size` 作为新代码编译停止的硬限制。
  * 代码垃圾收集不会导致性能突然大幅降低
    基于 [Pitchfork](https://github.com/shopify/pitchfork) 为服务器上的重新分叉提供更好的写时复制行为。
  * 您依旧可以通过 `--yjit-code-gc` 启用代码垃圾收集
* 新增 `RubyVM::YJIT.enable` 可以在运行时启用 YJIT
  * 您可以在不修改命令行参数或环境变量的情况下启用 YJIT。
    Rails 7.2 将通过此方法 [默认启用 YJIT](https://github.com/rails/rails/pull/49947)。
  * 这也可以用于在应用程序启动完成后，仅启用 YJIT 一次。当您在启动程序时禁用了 YJIT ，您可以通过 `--yjit-disable` 来使用其他 YJIT 选项。
* 默认可以获取更多的 YJIT 状态
  * `yjit_alloc_size` 和一些更多的元数据相关状态现在默认可用。
  * 发布版本中，现在可以用到通过 `--yjit-stats` 产生的 `ratio_in_yjit` 统计信息，不再需要特殊的统计信息或开发版本。
* 新增更多性能分析能力
  * 新增 `--yjit-perf` 以便于利用 Linux perf 进行性能分析。
  * `--yjit-trace-exits` 现在支持通过 `--yjit-trace-exits-sample-rate=N` 进行取样
* 更彻底的测试及多个错误修复

## RJIT

* 引入了纯 Ruby 的 JIT 编译器 RJIT 并替代 MJIT。
  * RJIT 仅支持 x86\_64 架构上的 Unix 平台。
  * 不同于 MJIT，RJIT在运行时不需要 C 编译器。
* RJIT 目前仅用于实验目的。
  * 您在生产环境中应当继续使用 YJIT。
* 如果您有兴趣为 Ruby 开发 JIT，请查看 [k0kubun 在 RubyKaigi 第 3 天 中的演讲](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)。

## M:N 线程调度器

* 引入了 M:N 线程调度器。[[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M 个 Ruby 线程由 N 个原生线程（OS 线程）管理，从而降低线程创建和管理成本。
  * 由于可能会破坏 C 扩展的兼容性，因此在默认情况下，主 Ractor 上禁用 M:N 线程调度器。
    * 可通过环境变量 `RUBY_MN_THREADS=1` 在主 Ractor 上启用 M:N 线程。
    * 非主 Ractor 上总是启用 M:N 线程。
  * 可通过环境变量 `RUBY_MAX_CPU=n` 设置 `N` 的最大值（原生线程的最大数量）。默认值为 8。
    * 由于每个 Ractor 中只能同时运行一个 Ruby 线程，因此将使用原生线程的数量，即 `RUBY_MAX_CPU` 和运行中的 Ractor 数量中较小的值。因此单 Ractor 应用程序（大多数应用程序）将仅使用 1 个原生线程。
    * 为了支持阻塞操作，可以使用多于 `N` 个原生线程。

## 性能提升

* 根据对象形状，优化 `defined?(@ivar)`。
* 诸如 `Socket.getaddrinfo` 的域名解析现在可以被中断（在 pthreads 可用的环境中）。[[Feature #19965]](https://bugs.ruby-lang.org/issues/19965)
* 垃圾收集器的一些性能改进
  * 老对象引用的年轻对象不再立即提升到老一代。这显着降低了主要垃圾收集的频率。 [[Feature #19678]](https://bugs.ruby-lang.org/issues/19678)
  * 新增调节变量 `RUBY_GC_HEAP_REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO` 来控制导致触发主要垃圾收集的未保护对象的数量。
    默认设置为 `0.01` (1%)。这显著降低了主要垃圾收集的频率。 [[Feature #19571]](https://bugs.ruby-lang.org/issues/19571)
  * 为许多缺少写入屏障的核心类型实现了写入屏障，特别是`Time`, `Enumerator`, `MatchData`, `Method`, `File::Stat`, `BigDecimal`等。
    这显着减少了次要垃圾收集时间和主要垃圾收集的频率。
  * 大多数核心类现在都使用可变宽度分配，特别是`Hash`, `Time`, `Thread::Backtrace`, `Thread::Backtrace::Location`, `File::Stat`, `Method`。
    这使得这些类的分配和释放速度更快，使用更少的内存并减少堆碎片。
  * 垃圾收集器中添加了对弱引用的支持。 [功能 #19783](https://bugs.ruby-lang.org/issues/19783)


## 自 3.2 以来，其他值得注意的变化

### IRB

IRB 进行了多项增强功能，包括但不限于：

* 高级 `irb:rdbg` 集成，提供了类似 `pry-byebug` 的调试体验([文档](https://github.com/ruby/irb#debugging-with-irb))。
* 为 `ls` 和 `show_cmds` 这样的方法提供分页支持。
* 为 `ls` 和 `show_source` 方法提供更准确更有用的信息。
* 实验性的基于类型分析的自动补全功能([文档](https://github.com/ruby/irb#type-based-completion))。
* 现在可以通过新引入的类 Reline::Face 来更改自动补全对话框中的字体颜色和字体样式([文档](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))。

另外，IRB 还进行了广泛的重构，修复了数十个错误，以便未来的增强。

如需了解更详细信息，请参考 [Unveiling the big leap in Ruby 3.3's IRB](https://railsatscale.com/2023-12-19-irb-for-ruby-3-3/)。

## 兼容性问题

注意：不包括 bug 修复。

* 在没有普通参数的 block 中对于没有参数的 `it` 调用被废弃。`it` 将在 Ruby 3.4 中作为第一个 block 参数的引用。[[Feature #18980]](https://bugs.ruby-lang.org/issues/18980)

### 移除的环境变量

移除了以下已废除的环境变量

* 环境变量 `RUBY_GC_HEAP_INIT_SLOTS` 被废弃，并不再产生实际作用。请使用环境变量 `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS` 进行替代。 [[Feature #19785]](https://bugs.ruby-lang.org/issues/19785)

## Stdlib 兼容性问题

### `ext/readline` 已退役

* 我们有了纯 Ruby 实现的 `reline`，兼容 `ext/readline` API。未来我们将依赖 `reline`。如果您需要使用 `ext/readline`，可以通过 rubygems.org 进行安装 `gem install readline-ext`。
* 我们不再需要安装类似 `libreadline` 或 `libedit` 这样的库了。

## 标准库更新

如果在 Gemfile 或 gemspec 中没有加入下列 gems，那么当用户 `require` 这些 gems时，RubyGems 和 Bundler 会发出警告。
因为这些 gems 会在将来的 Ruby 版本中成为绑定的 gems 库。

当时用 bootsnap gem 时，将不显示此警告。我们建议使用 `DISABLE_BOOTSNAP=1` 环境变量运行您的应用程序至少一次。这是此版本的限制。

这些库包括：
* abbrev
* base64
* bigdecimal
* csv
* drb
* getoptlong
* mutex_m
* nkf
* observer
* racc
* resolv-replace
* rinda
* syslog

新增以下默认 gem。

* prism 0.19.0

更新了以下默认 gems。

* RubyGems 3.5.3
* abbrev 0.1.2
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.3
* cgi 0.4.1
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* error_highlight 0.6.0
* etc 1.4.3
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.7.1
* io-nonblock 0.3.0
* io-wait 0.3.1
* ipaddr 1.2.6
* irb 1.11.0
* json 2.7.1
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.1
* open3 0.2.1
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.2
* rdoc 6.6.2
* readline 0.0.4
* reline 0.4.1
* resolv 0.3.0
* rinda 0.2.0
* securerandom 0.3.1
* set 1.1.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.1.0
* strscan 3.0.7
* syntax_suggest 2.0.0
* syslog 0.1.2
* tempfile 0.2.1
* time 0.3.0
* timeout 0.4.1
* tmpdir 0.2.0
* tsort 0.2.0
* un 0.3.0
* uri 0.13.0
* weakref 0.1.3
* win32ole 1.8.10
* yaml 0.3.0
* zlib 3.1.0

以下默认 gem 成为绑定 gem

* racc 1.7.3

更新了以下绑定 gems。

* minitest 5.20.0
* rake 13.1.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-ftp 0.3.3
* net-imap 0.4.9
* net-smtp 0.4.0
* rbs 3.4.0
* typeprof 0.21.9
* debug 1.9.1

有关默认 gems 和 绑定 gems 的细节，可以参考 GitHub 上的发布，例如 [logger gem](https://github.com/ruby/logger/releases) 或相应的变更日志。

更多详情，可参见 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})。

自 Ruby 3.2.0 以来，[{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)， 删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)!

圣诞快乐，节日快乐，享受 Ruby 3.3 的编程乐趣！

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

## 什么是 Ruby

Ruby 最初由 Matz （松本行弘，Yukihiro Matsumoto） 于 1993 年开发，现在以开源软件的形式开发。它可以在多个平台上运行，并在全球得到广泛使用，尤其是Web开发领域。
