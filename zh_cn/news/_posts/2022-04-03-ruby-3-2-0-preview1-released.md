---
layout: news_post
title: "Ruby 3.2.0 Preview 1 已发布"
author: "naruse"
translator: GAO Jun
date: 2022-04-03 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview1" | first %}

我们很高兴地宣布 Ruby {{ release.version }} 已发布。Ruby 3.2 增加了很多新功能和性能改进。


## 基于 WASI 的 WebAssembly 支持

这是首次基于 WASI 的 WebAssembly 支持。使得 CRuby 二进制内容可用于浏览器、Serverless Edge、以及其他 WebAssebly/WASI 嵌入环境。目前，此功能已通过除 Thread API 之外的 basic 和 bootstrap 测试套件。


![](https://i.imgur.com/opCgKy2.png)

### 背景

[WebAssembly (Wasm)](https://webassembly.org/) 希望能够在浏览器中提供安全快速的运行程序的方式。但其目标，也就是在不同环境中安全高效的运行程序，不仅是 web 应用长期以来的目标，也是其他一般程序所需要的。

[WASI (The WebAssembly System Interface)](https://wasi.dev/) 被设计用于此类应用场景。尽管此类应用需要与操作系统进行通信，WebAssembly 却运行在一个没有系统接口的虚拟机之上。WASI 使之标准化。

Ruby 的 WebAssembly/WASI 支持，希望利用这些项目，使 Ruby 开发者可以编写能运行于兼容此类功能的平台上。

### 应用场景

这种支持鼓励开发人员可以在 WebAssembly 环境中使用 CRuby。一个此类应用场景的案例是 [TryRuby playground](https://try.ruby-lang.org/playground/) 的 CRuby 支持。现在您可以在您的浏览器中尝试原生的 CRuby。

### 技术要点

目前，WASI 和 WebAssembly 仍在不断演进，同时基于安全原因，还缺少一些功能来实现纤程、异常和垃圾回收。
所以，CRuby 使用了一种可以控制用户空间中执行的二进制转换技术 Asyncify 来填补这一鸿沟。

此外，我们创建了 [WASI 之上的虚拟文件系统](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)，于是就可以很容易地将 Ruby 应用打包成单个 .wasm 文件，进而简化分发 Ruby 应用的过程。


### 相关链接

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Regexp 超时设置

新增正则表达式匹配的超时设置。

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x" #=> 1秒后 Regexp::TimeoutError
```

众所周知，正则表达式匹配的耗时长度可能出乎意料之外。如果您的代码尝试从一个不可信输入中匹配一个低效的正则表达式，攻击者可以借此发起有效的拒绝服务攻击(所谓的正则表达式 DoS，或 ReDoS)。

根据您的 Ruby 程序的需要，可以通过设置 `Regexp.timeout` 来避免或减轻这种 DoS 风险。请在您的程序中进行尝试，我们欢迎您的反馈。

请注意，`Regexp.timeout` 是全局性的配置。如果您希望对于某些特殊的正则表达式使用不同的超时设置，您可以使用 `Regexp.new` 中的 `timeout` 关键词。

```ruby
Regexp.timeout = 1.0

# 这个 Regexp 没有超时设置
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # 不会被中断
```

最初提议： https://bugs.ruby-lang.org/issues/17837


## 其他值得注意的新功能

### 不再捆绑第三方源代码

* 我们不再捆绑第三方源代码，例如 `libyaml`， `libffi`。

    * psych 中已经移除了 libyaml 的代码。您可能需要在 Ubuntu/Debian 平台中安装 `libyaml-dev`。软件包的名称可能因平台不同而各异。

    * 在 preview2 中，`fiddle` 将移除 libffi。

### 语言

* 查找模式不再是实验性功能。


## 性能改进



## 自 3.1 以来其他值得注意的变更

* Hash
    * 当 hash 为空时，Hash#shift 现在总是返回 nil，此前行为是返回默认值或调用默认 proc。 [[Bug #16908]]

* MatchData
    * 新增 MatchData#byteoffset 。 [[Feature #13110]]

* Module
    * 新增 Module.used_refinements 。 [[Feature #14332]]
    * 新增 Module#refinements 。 [[Feature #12737]]
    * 新增 Module#const_added 。 [[Feature #17881]]

* Proc
    * Proc#dup 返回子类的一个实例。 [[Bug #17545]]
    * Proc#parameters 现在接受 lambda 关键字。 [[Feature #15357]]

* Refinement
    * 新增 Refinement#refined_class 。 [[Feature #12737]]

* Set
    * Set 现在可以直接使用，不需要调用 `require "set"`。 [[Feature #16989]]
      目前其通过 `Set` 常量或对 `Enumerable#to_set` 调用自动载入。

* String
    * 新增 String#byteindex 和 String#byterindex 。 [[Feature #13110]]
    * 更新 Unicode 至 Version 14.0.0，Emoji Version 14.0. [[Feature #18037]] (同样适用于 Regexp)
    * 新增 String#bytesplice 。  [[Feature #18598]]

* Struct
    * 即使在 `Struct.new` 中不设置 `keyword_init: true`，Struct 类也可以通过关键词参数进行初始化。 [[Feature #16806]]


### 标准库更新

*   下列默认 gems 被更新。

    * 待定

*   下列 bundled gems 被更新。

    * 待定

*   下列默认 gems 现在是 bundled gems。您需要在 bundler 环境中，将其加入 `Gemfile` 文件。

    * 待定

您可以通过 [新闻](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
获取更多信息。

自 Ruby 3.1.0 以来，伴随这些变更， [{{ release.stats.files_changed }} 个文件被更改， 新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)!

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
