---
layout: news_post
title: "Ruby 3.3.0-rc1 已发布"
author: "naruse"
translator: GAO Jun
date: 2023-12-11 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.3.0-rc1" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 发布。
Ruby 3.3 新增了 Prism 解析器，使用 Lrama 作为解析生成器，新增了纯 Ruby 实现的 JIT 编译器 RJIT，另有许多性能改进，尤其是 YJIT。

在 RC1 发布后，我们将尽可能避免引入 ABI 不兼容性，如果我们需要这么做，会在后续的发布说明里宣布。

## Prism

* 引入 [Prism 解析器](https://github.com/ruby/prism) 为默认 gem
  * Prism 是一个可移植、容错且可维护的 Ruby 语言递归下降解析器
* Prism 已可用于生产环境，并得到了积极维护，您可以使用它来代替 Ripper
  * 有关于如何使用 Prism 的 [详细文档](https://ruby.github.io/prism/)
  * Prism 既是 CRuby 内部使用的 C 库，也是任何需要解析 Ruby 代码的工具可以使用的 Ruby gem
  * Prism API 中值得注意的方法有：
    * `Prism.parse(source)` 返回 AST 作为 ParseResult 的一部分
    * `Prism.dump(source, filepath)` 将序列化的 AST 以字符串形式返回
    * `Prism.parse_comments(source)` 返回注释
* 如果您有兴趣贡献，可以直接在 [Prism 代码库](https://github.com/ruby/prism) 上提出拉取请求或报告问题

## 使用 Lrama 替代 Bison

* 使用 [Lrama LALR 解析生成器](https://github.com/ruby/lrama) 替换 Bison [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * 如果您有兴趣，请参阅 [Ruby 解析器的未来愿景](https://rubykaigi.org/2023/presentations/spikeolaf.html)
  * Lrama 内部解析器被 Racc 生成的 LR 解析器替换，以便于维护
  * 已支持参数化规则 `(?, *, +)` ，将被用于 Ruby parse.y 中

## RJIT

* 引入了纯 Ruby 的 JIT 编译器 RJIT 并替代 MJIT。
  * RJIT 仅支持 x86\_64 架构上的 Unix 平台。
  * 不同于 MJIT，RJIT在运行时不需要 C 编译器。
* RJIT 目前仅用于实验目的。
  * 您在生产环境中应当继续使用 YJIT。
* 如果您有兴趣为 Ruby 开发 JIT，请查看 [k0kubun 在 RubyKaigi 第 3 天 中的演讲](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)。

## YJIT

* 相对于 3.2 的主要性能提升
  * 改进了 splat 和 rest 参数支持。
  * 虚拟机的栈操作分配了寄存器。
  * 更多带有可选参数的调用被编译。
  * 错误处理也被编译。
  * 拥有复杂对象形状的实例变量不再退出到解释器执行。
  * 不支持的调用类型不再退出到解释器执行。
  * 特别优化了 `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===`。
  * 目前比 optcarrot 的解释器快 3 倍以上！
* 内存利用率相交 3.2 有显著提升
  * 编译代码使用的元数据使用更少的内存。
  * 在 ARM64 中的生成更紧凑的代码。
* 编译速度现在略快于 3.2。
* 新增 `RubyVM::YJIT.enable` 可以在运行时启用 YJIT
  * 您可以在不修改命令行参数或环境变量的情况下启用 YJIT。
  * 这也可以用于在应用程序启动完成后，仅启用 YJIT 一次。当您在启动程序时禁用了 YJIT ，您可以通过 `--yjit-disable` 来使用其他 YJIT 选项。
* 代码垃圾收集现在默认禁用，并视 `--yjit-exec-mem-size` 为新代码编译停止的硬限制。
  * 在使用 unicorn 和 forking 的服务器上提供更好的写时复制行为
  * 代码垃圾收集不会导致性能突然大幅降低
  * 您依旧可以通过 `--yjit-code-gc` 启用代码垃圾收集
* 发布版本中，现在可以用到通过 `--yjit-stats` 产生的 `ratio_in_yjit` 统计信息，不再需要特殊的统计信息或开发版本。
* 退出跟踪选项现在支持采样
  * `--trace-exits-sample-rate=N`
* 新增 `--yjit-perf` 以便于利用 Linux perf 进行性能分析。
* 更彻底的测试及多个错误修复

### M:N 线程调度器

* 引入了 M:N 线程调度器。[[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M 个 Ruby 线程由 N 个原生线程（OS 线程）管理，从而降低线程创建和管理成本。
  * 由于可能会破坏 C 扩展的兼容性，因此在默认情况下，主 Ractor 上禁用 M:N 线程调度器。
    * 可通过环境变量 `RUBY_MN_THREADS=1` 在主 Ractor 上启用 M:N 线程。
    * 非主 Ractor 上启用 M:N 线程。
  * 可通过环境变量 `RUBY_MAX_CPU=n` 设置 `N` 的最大值（原生线程的最大数量）。默认值为 8。
    * 由于每个 Ractor 中只能同时运行一个 Ruby 线程，因此将使用原生线程的数量，即 `RUBY_MAX_CPU` 和运行中的 Ractor 数量中较小的值。因此单 Ractor 应用程序（大多数应用程序）将使用 1 个原生线程。
    * 为了支持阻塞操作，可以使用多于 `N` 个原生线程。

## 其他值得关注的新功能



### 语言



## 性能提升

* 根据对象形状，优化 `defined?(@ivar)`。
* 诸如 `Socket.getaddrinfo` 的域名解析现在可以被中断（在 pthreads 可用的环境中）。[Feature #19965](https://bugs.ruby-lang.org/issues/19965)
  * 为此，现在每当调用 getaddrinfo 或 getnameinfo 时都会创建一个 pthread。 这会在域名解析中产生一些开销（在我们的实验中约为 2.5 倍）。 我们预计域名解析开销不会成为大多数应用程序的问题，但如果您观察到这种情况，或者您认为此更改造成了意外的影响，请向我们报告。
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

- 高级 `irb:rdbg` 集成，提供了类似 `pry-byebug` 的调试体验([文档](https://github.com/ruby/irb#debugging-with-irb))。
- 为 `ls` 和 `show_cmds` 这样的方法提供分页支持。
- 为 `ls` 和 `show_source` 方法提供更准确更有用的信息。
- 实验性的基于类型分析的自动补全功能([文档](https://github.com/ruby/irb#type-based-completion))。
- 现在可以通过新引入的类 Reline::Face 来更改自动补全对话框中的字体颜色和字体样式([文档](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))。

另外，IRB 还进行了广泛的重构，修复了数十个错误，以便未来的增强。

## 兼容性问题

注意：不包括 bug 修复。

* 在没有普通参数的 block 中对于没有参数的 `it` 调用被废弃。`it` 将在 Ruby 3.4 中作为第一个 block 参数的引用。[Feature #18980](https://bugs.ruby-lang.org/issues/18980)

### 移除的常量

移除了以下已废弃的常量。

### 移除的方法

移除了以下已废除的方法。

### 移除的环境变量

移除了以下已废除的环境变量

* 环境变量 `RUBY_GC_HEAP_INIT_SLOTS` 被废弃，并不再产生实际作用。请使用环境变量 `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS` 进行替代。 [Feature #19785](https://bugs.ruby-lang.org/issues/19785)

## Stdlib 兼容性问题

### `ext/readline` 已退役

* 我们有了纯 Ruby 实现的 `reline`，兼容 `ext/readline` API。未来我们将依赖 `reline`。如果您需要使用 `ext/readline`，可以通过 rubygems.org 进行安装 `gem install readline-ext`。
* 我们不再需要安装类似 `libreadline` 或 `libedit` 这样的库了。

## C API 更新

### 更新的 C API

更新了以下 API。



### 已移除的 C API

移除了以下废弃的 API。



## 标准库更新

当用户 require 在将来 Ruby 版本中成为绑定 gem 的库时，RubyGems 和 Bundler 会发出警告。

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

* prism 0.15.1

更新了以下默认 gems。

* RubyGems 3.5.0.dev
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.0.dev
* cgi 0.4.0
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* etc 1.4.3.dev.1
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.6.1.dev
* irb 1.8.3
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.0
* open3 0.2.0
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.1.1
* rdoc 6.6.0
* reline 0.3.9
* rinda 0.2.0
* securerandom 0.3.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* tempfile 0.2.0
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
* net-imap 0.4.4
* net-smtp 0.4.0
* rbs 3.2.2
* typeprof 0.21.8
* debug 1.8.0

有关默认 gems 和 绑定 gems 的细节，可以参考 GitHub 上的发布，例如 [logger gem](https://github.com/ruby/logger/releases) 或相应的变更日志。

更多详情，可参见 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})。

自 Ruby 3.2.0 以来，[{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)， 删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)!


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
