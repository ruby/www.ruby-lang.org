---
layout: news_post
title: "Ruby 3.4.0 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2024-12-25 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 发布。
Ruby 3.4 增加了块参数引用变量 `it`，使用 Prism 作为默认解析器，为 socket 库提供了 Happy Eyeballs Version 2 支持，
改进了 YJIT，添加了模块化垃圾回收功能，及其他改进。

## 块中的 `it` 引用

当没有定义块参数名时，可以使用 `it` 引用块参数. [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it` 与 `_1` 的功能类似。在块中使用 `_1` 时，读者可能会以为其他编号参数(`_2` 等)也会出现，这会给读者带来额外的阅读负担。
因此，我们引入 `it` 作为一个便捷的别名。在简单的情况下（例如单行块），使用 `it` 可以显著提升可读性。

## Prism 现在是默认解析器

默认解析器从 parse.y 切换到 Prism。 [[Feature #20564]]

这是一项内部改进，用户应该不会注意到任何变化。如果您发现了任何兼容性问题，请报告给我们。

如果需要使用原来的解析器，可以使用命令行参数 `--parser=parse.y`。

## socket 库现在支持 Happy Eyeballs Version 2 (RFC 8305)

socket 库现在支持 [Happy Eyeballs Version 2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305)，许多编程语言都提供这个最新版本的支持来优化网络连接。
socket 库在 `TCPSocket.new` (`TCPSocket.open`) 和 `Socket.tcp` 中添加了支持。
此项改进使得 Ruby 能够提供更高效可靠的网络连接，更适应现代互联网环境。

直至 Ruby 3.3，上述的方法会依次执行域名解析和尝试连接。通过现在的算法，将按下面的方式执行：

1. 并行执行 IPv6 和 IPv4 域名解析
2. 尝试连接解析到的 IP 地址（IPv6 优先），以 250ms 的间隔进行并行尝试
3. 返回第一个成功的连接，并取消其他连接

这样就保证了最小化网络延迟，即使特定的 IP 协议地址延迟或不可用。
此功能默认启用，不需要额外的配置。如果要全局禁用此功能，可以设置环境变量 `RUBY_TCP_NO_FAST_FALLBACK=1`
或者调用 `Socket.tcp_fast_fallback=false`。如果要在特定连接中禁用此功能，可以使用关键字参数 `fast_fallback: false`。

## YJIT

### 摘要

* 在 x86-64 和 arm64 平台上的大多数基准测试中，都获得了更好的性能表现。
* 减少了编译元数据的内存使用并提供了统一的内存限制。
* 修复了多个错误。YJIT 现在更健壮了，并被更好地测试。

### 新功能

* 命令行参数
    * `--yjit-mem-size` （默认值为 128 MiB），用于设置统一的内存限制选项，并跟踪 YJIT 总的内存使用情况，
      这比旧的 `--yjit-exec-mem-size` 更直观。
    * `--yjit-log` 可以启用编译日志来跟踪被编译的内容。
* Ruby API
    * `RubyVM::YJIT.log` 可以在运行时获取编译日志的尾部信息。
* YJIT 统计信息
    * `RubyVM::YJIT.runtime_stats` 现在总是能在无效化、内联和元数据编码时提供额外的统计信息。

### 新优化

* 通过压缩上下文减少了存储 YJIT 元数据所需的内存
* 为局部变量和方法参数分配寄存器
* 当 YJIT 启用时，使用更多 Ruby 编写的核心原型类型:
    * 使用 Ruby 重写 `Array#each`, `Array#select`, `Array#map` 以提升性能 [[Feature #20182]]。
* 能够内联小型方法，诸如：
    * 空方法
    * 返回常量的方法
    * 返回 `self` 的方法
    * 直接返回某个参数的方法
* 为更多运行时方法生成专用代码
* 优化 `String#getbyte`, `String#setbyte` 等字符串方法
* 优化位运算，加速低级 位/字节 操作
* 在 multi-ractor 模式中，支持共享常量
* 各种其他增量优化

## 模块化垃圾收集器

* 通过模块化垃圾收集功能，可以动态加载具体的垃圾收集器（GC）实现。
  若要启用此功能，可以在构建 Ruby 时，使用 `--with-modular-gc` 参数。
  运行时可以通过环境变量 `RUBY_GC_LIBRARY` 加载 GC 库。
  [[Feature #20351]]

* Ruby 内置的垃圾收集器已被拆分到单独的文件 `gc/default/default.c` 并通过 `gc/gc_impl.h` 中定义的 API 与 Ruby 进行交互。
  现在，内置的垃圾收集器也可以作为库进行构建：通过 `make modular-gc MODULAR_GC=default` 进行构建，
  并通过环境变量 `RUBY_GC_LIBRARY=default` 启用。 [[Feature #20470]]

* 提供了一个基于 [MMTk](https://www.mmtk.io/) 的实验性 GC 库。此库可以通过 `make modular-gc MODULAR_GC=mmtk` 进行构建，
  并通过环境变量 `RUBY_GC_LIBRARY=mmtk` 启用。构建的计算机需要 Rust 工具链。 [[Feature #20860]]

## 语言变化

* 在没有 `frozen_string_literal` 注释的文件中，当字符串字面量被修改时会发出警告。
  这些警告可以使用 `-W:deprecated` 或者通过设置 `Warning[:deprecated] = true` 来启用。
  如要禁用此变化，您可以在运行 Ruby 时，使用 `--disable-frozen-string-literal` 命令行参数。 [[Feature #20205]]

* 支持在调用方法时使用 `nil` 作为关键字展开参数。
  `**nil` 类似于 `**{}`，不传递关键字参数，也不调用任何转换方法。 [[Bug #20064]]

* 索引不再接受块传递。 [[Bug #19918]]

* 索引不再接受关键字参数。 [[Bug #20218]]

* 顶级名 `::Ruby` 现在是保留的，当启用 `Warning[:deprecated]` 时，如果对其进行定义将会被警告。 [[Feature #20884]]

## 核心类更新

注意：我们仅列出了核心类中值得注意的更新。

* Exception

    * `Exception#set_backtrace` 现在接受 `Thread::Backtrace::Location` 数组。
      `Kernel#raise`，`Thread#raise` 和 `Fiber#raise` 也接受这个新格式。 [[Feature #13557]]

* GC

    * 新增 `GC.config`，可以为垃圾收集器设置配置变量。 [[Feature #20443]]

    * 新增 GC 配置参数 `rgengc_allow_full_mark` 。如果值为 `false`，GC 仅标记年轻对象。默认值为 `true`。  [[Feature #20443]]

* Ractor

    * 允许在 Ractor 中使用 `require`。引入过程将在主 Ractor 中执行。
      可以通过 `Ractor._require(feature)` 在主 Ractor 中执行引入过程。 [[Feature #20627]]

    * 新增 `Ractor.main?`。 [[Feature #20627]]

    * 新增 `Ractor.[]` 和 `Ractor.[]=` 来访问当前 Ractor 关联存储的内容。 [[Feature #20715]]

    * 新增 `Ractor.store_if_absent(key){ init }`，可以在进程安全的环境下初始化 ractor 关联的本地变量。 [[Feature #20875]]

* Range

    * 当 range 不可枚举时，`Range#size` 将抛出 `TypeError`。 [[Misc #18984]]


## 标准库更新

注意：我们仅列出了标准库中值得注意的更新。

* RubyGems
    * gem push 增加 `--attestation` 参数。此参数允许保存签名到 [sigstore.dev]

* Bundler
    * 新增 `lockfile_checksums` 参数，将校验和包含到新的 lockfiles 中
    * 新增 `--add-checksums` 向既有 lockfile 中增加校验和

* JSON

    * 性能改进，`JSON.parse` 现在比 json-2.7.x 快约 1.5 倍。

* Tempfile

    * `Tempfile.create` 新增关键字参数 `anonymous: true`。
      `Tempfile.create(anonymous: true)` 会立即移除创建的临时文件。应用程序无需显式地移除临时文件。
      [[Feature #20497]]

* win32/sspi.rb

    * 此库现在从 Ruby 代码仓库抽取到独立的代码仓库 [ruby/net-http-sspi]。[[Feature #20775]]

以下默认 gem 成为绑定 gem

- mutex_m 0.3.0
- getoptlong 0.2.1
- base64 0.2.0
- bigdecimal 3.1.8
- observer 0.1.2
- abbrev 0.1.2
- resolv-replace 0.1.1
- rinda 0.2.0
- drb 2.2.1
- nkf 0.2.0
- syslog 0.2.0
- csv 3.3.2
- repl_type_completor 0.1.9

## 兼容性问题

注意：不包括问题补丁。

* 修改了错误信息和错误栈的显示。
    * 使用单引号(`'`)代替反勾号(`` ` ``)作为错误消息的起始引号。 [[Feature #16495]]
    * 在方法名前显示类名（仅当类具有永久名称时）。 [[Feature #19117]]
    * `Kernel#caller`，`Thread::Backtrace::Location` 等处也进行了相应更改。

  ```
  此前:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  现在:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in `<main>'
  ```

* Hash#inspect 的展示形式发生变化。 [[Bug #20433]]

    * 键是 Symbol 时，使用现代的语法形式： `"{user: 1}"`
    * 其他类型的键值对在显示时，在 `=>` 前后加入空格：`'{"user" => 1}'`，此前显示时没有空格： `'{"user"=>1}'`

* Kernel#Float() 现在接受省略小数部分的数字字符串。 [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (此前会导致 ArgumentError)
  Float("1.E-1") #=> 0.1 (此前会导致 ArgumentError)
  ```

* String#to_f 现在接受省略小数部分的数字字符串。注意，当指定指数时，返回结果与此前不同。 [[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (此前会返回 1.0)
  ```

* 移除 `Refinement#refined_class`。 [[Feature #19714]]

## 标准库兼容性问题

* DidYouMean

    * 移除 `DidYouMean::SPELL_CHECKERS[]=` 和 `DidYouMean::SPELL_CHECKERS.merge!`。

* Net::HTTP

    * 移除下列已废弃常量：
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

      这些变量从 2012 年起已废弃。

* Timeout

    * `Timeout.timeout` 的参数不允许负值。 [[Bug #20795]]

* URI

    * 默认解析器从 RFC 2396 兼容切换到 RFC 3986 兼容。 [[Bug #19266]]

## C API 更新

* 移除 `rb_newobj` 和 `rb_newobj_of` （以及相关的宏 `RB_NEWOBJ`，`RB_NEWOBJ_OF`，`NEWOBJ`，`NEWOBJ_OF`）。 [[Feature #20265]]
* 移除已废弃的函数 `rb_gc_force_recycle`。 [[Feature #18290]]

## 其他变化

* 如果传递了一个块给不使用块的方法时，在详细模式（`-w`）中将显示警告。 [[Feature #15554]]

* Ruby 对一些核心方法通过解释器和 JIT 进行了优化，诸如 `String.freeze`，`Integer#+`。
  当这些方法被重定义时，解释器将发出性能警告（`-W:performance` 或 `Warning[:performance] = true`）。 [[Feature #20429]]

更多详情，可参见 [NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})。

自 Ruby 3.3.0 以来，这些变化共导致 [{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)！

圣诞快乐，节日快乐，享受 Ruby 3.4 的编程乐趣！

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

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19266]:     https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: https://www.sigstore.dev/
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
