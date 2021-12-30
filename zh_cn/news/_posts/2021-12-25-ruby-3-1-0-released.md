---
layout: news_post
title: "Ruby 3.1.0 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2021-12-25 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.1.0" | first %}

我们很高兴地宣布 Ruby {{ release.version }} 已发布。Ruby 3.1 保持了对 Ruby 3.0 的兼容性，同时增加了很多特性。


## YJIT: 新试验性的进程内 JIT 编译器

Ruby 3.1 合并了 YJIT，一个由 Shopify 开发的进程内 JIT 编译器。

自从 [2018年，Ruby 2.6 引入 MJIT](https://www.ruby-lang.org/en/news/2018/12/25/ruby-2-6-0-released/)，其性能已显著提升，并最终 [于去年达成了 Ruby3x3 的目标](https://www.ruby-lang.org/zh_cn/news/2020/12/25/ruby-3-0-0-released/)。但即使 Optcarrot 基准测试的结果已有了令人印象深刻的提升，JIT 并未改善真实世界中的商业应用。

最近 Shopify 贡献了很多提升他们 Rails 应用的 Ruby 改进。YJIT 是其中一个重要的贡献，它提升了 Rails 应用的性能。

相比较而言，MJIT 是基于方法的 JIT 编译器，使用外部的 C 编译器；YJIT 使用 Basic Block Versioning 并将 JIT 编译器包含其中。通过 Lazy Basic Block Versioning (LBBV)，它首先对方法的起始部分进行编译，然后根据动态确定的参数和变量来增量编译剩余的部分。 具体的介绍可以参考 [YJIT: a basic block versioning JIT compiler for CRuby](https://dl.acm.org/doi/10.1145/3486606.3486781)。

基于此技术，YJIT 既可以加速启动时间，又可以提升多数现实世界中的软件性能：对 railsbench 最多提升 22%，对 liquid-render 最多提升 39%。

YJIT 目前还是一个试验性特性，默认处于关闭状态。如果您希望使用 YJIT，可以在命令行参数中加入 `--yjit` 来启用。同时，此功能目前仅在类 Unix 的 x86-64 平台中。

* <https://bugs.ruby-lang.org/issues/18229>
* <https://shopify.engineering/yjit-just-in-time-compiler-cruby>
* <https://www.youtube.com/watch?v=PBVLf3yfMs8>

## debug gem: 新调试器

提供了完全重写的新调试器 [debug.gem](https://github.com/ruby/debug) 。debug.gem 有以下特点：

* 改善了调试器性能（调试器不会降低应用的速度）。
* 支持远程调试。
* 支持富调试器前端（目前支持VS Code 和 Chrome 浏览器）。
* 支持 多进程/多线程 调试。
* REPL 色彩支持。
* 以及其他有用的特性，例如 记录/重放，跟踪 等。

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.jpg">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_debug_demo.mp4" type="video/mp4">
</video>

Ruby 包含了 lib/debug.rb，但它没有得到良好的维护，并且在性能和特性中存在问题。debug.gem 完全替代了 lib/debug.rb。

## error_highlight: 在调用栈中更细颗粒度的错误定位

引入了内置的 gem error_highlight。它提供了在调用栈中更细颗粒度的错误定位：

```
$ ruby test.rb
test.rb:1:in `<main>': undefined method `time' for 1:Integer (NoMethodError)

1.time {}
 ^^^^^
Did you mean?  times
```

目前，仅支持 `NameError`。

此 gem 默认启用。您可以通过在命令行参数中设置 `--disable-error_highlight` 来禁用。您可以参考 [error_highlight 代码库](https://github.com/ruby/error_highlight) 来了解更多详细信息。

## IRB 自动补全与展示文档

IRB 现在有了自动补全功能，您只需输入代码，候选补全窗口就会出现。您可以使用 Tab 和 Shift+Tab 在候选内容中进行选择。

如果您安装了文档，那么当您选择了候选补全后，文档窗口将在候选补全窗口旁出现，提供对应的文档内容。您可以通过 Alt+d 来阅读完整文档。

<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby310_irb_dialog.mp4" type="video/mp4">
</video>

## 其它值得注意的新特性

### 语言

* Hash字面量和关键词参数中，值可以省略。 [[Feature #14579]](https://bugs.ruby-lang.org/issues/14579)
  * `{x:, y:}` 等价于 `{x: x, y: y}`.
  * `foo(x:, y:)` 等价于  `foo(x: x, y: y)`.

* 在模式匹配中，pin 操作符 (`^`) 现在可以接受表达式。 [[Feature #17411]](https://bugs.ruby-lang.org/issues/17411)

  ```ruby
  Prime.each_cons(2).lazy.find_all{_1 in [n, ^(n + 2)]}.take(3).to_a
  #=> [[3, 5], [5, 7], [11, 13]]
  ```

* 在单行模式匹配中，括号可以省略。 [[Feature #16182]](https://bugs.ruby-lang.org/issues/16182)

  ```ruby
  [0, 1] => _, x
  {y: 2} => y:
  x #=> 1
  y #=> 2
  ```

### RBS

RBS 是用于描述 Ruby 程序结构的语言。详情可参考 [RBS 代码库](https://github.com/ruby/rbs)。

自 Ruby 3.0.0 以来的更新：

* 泛型参数可以设定继承于哪个类型。 ([PR](https://github.com/ruby/rbs/pull/844))
* 支持泛型参数别名。 ([PR](https://github.com/ruby/rbs/pull/823))
* 引入 `rbs collection` 来管理 gems 中的 RBS。  ([文档](https://github.com/ruby/rbs/blob/master/docs/collection.md))
* 新增/更新 了许多内建标准库的签名。
* 包含了许多错误修正和性能提升。

详情可参考 [RBS 变更日志](https://github.com/ruby/rbs/blob/master/CHANGELOG.md)。

### TypeProf

TypeProf 是一个 Ruby 分析器。可以从无类型标注的 Ruby 代码中生成 RBS 的原型。详情可参考 [文档](https://github.com/ruby/typeprof/blob/master/doc/doc.md)。

自 Ruby 3.0.0 以来主要的更新是一个试验型的 IDE 支持功能 “TypeProf for IDE”。

![Demo of TypeProf for IDE](https://cache.ruby-lang.org/pub/media/ruby310_typeprof_ide_demo.png)

VS Code 扩展实现了：在每个方法定义上方显示猜测的（或者在 RBS 文件中明确的）方法签名 ，在可能导致名称错误或类型错误的代码下画出红色下划线，补全方法名称（例如，显示候选方法）。详情可参考 [文档](https://github.com/ruby/typeprof/blob/master/doc/ide.md)。

同时，此版本包含了许多错误修正和性能提升。

## 性能提升

* MJIT
  * 对 Rails 等场景，默认参数 `--jit-max-cache` 从 100 变更为 1000。JIT 不再跳过编译超过 1000 条指令的方法。
  * 为了支持 Rails 的 Zeitwerk，当一个类事件 TracePoint 被启用时，已被 JIT 处理的代码不会被取消。

## 自从 3.0 以来其它值得注意的变更

* 单行模式匹配，例如 `ary => [x, y, z]`，不再是试验性的。
* 微调多变量赋值的计算顺序。 [[Bug #4443]](https://bugs.ruby-lang.org/issues/4443)
  * `foo[0], bar[0] = baz, qux` 在 Ruby 3.0 中的计算顺序是 `baz`， `qux`， `foo`， `bar` 。在 Ruby 3.1 中，计算顺序是 `foo`， `bar`， `baz`， `qux`。
* Variable Width Allocation：加入字符串支持（试验性）。 [[Bug #18239]](https://bugs.ruby-lang.org/issues/18239)

* Psych 4.0 的 `Psych.load` 将默认使用 `safe_load`。您可能需要通过 Psych 3.3.2 来迁移此功能。[[Bug #17866]](https://bugs.ruby-lang.org/issues/17866)

### 标准库更新

*   下列默认 gems 被更新。
    * RubyGems 3.3.3
    * base64 0.1.1
    * benchmark 0.2.0
    * bigdecimal 3.1.1
    * bundler 2.3.3
    * cgi 0.3.1
    * csv 3.2.2
    * date 3.2.2
    * did_you_mean 1.6.1
    * digest 3.1.0
    * drb 2.1.0
    * erb 2.2.3
    * error_highlight 0.3.0
    * etc 1.3.0
    * fcntl 1.0.1
    * fiddle 1.1.0
    * fileutils 1.6.0
    * find 0.1.1
    * io-console 0.5.10
    * io-wait 0.2.1
    * ipaddr 1.2.3
    * irb 1.4.1
    * json 2.6.1
    * logger 1.5.0
    * net-http 0.2.0
    * net-protocol 0.1.2
    * nkf 0.1.1
    * open-uri 0.2.0
    * openssl 3.0.0
    * optparse 0.2.0
    * ostruct 0.5.2
    * pathname 0.2.0
    * pp 0.3.0
    * prettyprint 0.1.1
    * psych 4.0.3
    * racc 1.6.0
    * rdoc 6.4.0
    * readline 0.0.3
    * readline-ext 0.1.4
    * reline 0.3.0
    * resolv 0.2.1
    * rinda 0.1.1
    * ruby2_keywords 0.0.5
    * securerandom 0.1.1
    * set 1.0.2
    * stringio 3.0.1
    * strscan 3.0.1
    * tempfile 0.1.2
    * time 0.2.0
    * timeout 0.2.0
    * tmpdir 0.1.2
    * un 0.2.0
    * uri 0.11.0
    * yaml 0.2.0
    * zlib 2.1.1
*   下列bundled gems 被更新。
    * minitest 5.15.0
    * power_assert 2.0.1
    * rake 13.0.6
    * test-unit 3.5.3
    * rexml 3.2.5
    * rbs 2.0.0
    * typeprof 0.21.1
*   下列默认 gems 现在是 bundled gems。您需要在 bundler 环境中，将其加入 `Gemfile` 文件。
    * net-ftp 0.1.3
    * net-imap 0.2.2
    * net-pop 0.1.1
    * net-smtp 0.3.1
    * matrix 0.4.2
    * prime 0.1.2
    * debug 1.4.0

您可以通过 [新闻](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md) 或 [提交日志](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}) 获取更多信息。

自 Ruby 3.0.0 以来，伴随这些变更， [{{ release.stats.files_changed }} 个文件被更改， 新增 {{ release.stats.insertions }} 行，删除 {{ release.stats.deletions }} 行](https://github.com/ruby/ruby/compare/v3_0_0...{{ release.tag }}#file_bucket)！

圣诞快乐，节日快乐，享受使用 Ruby 3.1 编程！

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
