---
layout: news_post
title: "Ruby 3.3.0-preview1 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2023-05-12 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview1" | first %}

我们很高兴地宣布 Ruby {{ release.version }} 发布。Ruby 3.3 新增了纯 Ruby 实现的 JIT 编译器 RJIT；使用 Lrama 作为解析生成器；另有许多性能改进，尤其是 YJIT。

## RJIT

* 引入了纯 Ruby 的 JIT 编译器 RJIT 并替代 MJIT。
  * RJIT 仅支持 x86\_64 架构上的 Unix 平台。
  * 不同于 MJIT，RJIT在运行时不需要 C 编译器。
* RJIT 目前仅用于实验目的。
  * 您在生产环境中应当继续使用 YJIT。
* 如果您有兴趣为 Ruby 开发 JIT，请查看[k0kubun 在 RubyKaigi 第 3 天 中的演讲](https://rubykaigi.org/2023/presentations/k0kubun.html#day3)。

## 使用 Lrama 替代 Bison

* 使用 [Lrama LALR 解析生成器](https://github.com/yui-knk/lrama) 替换 Bison [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * 如果您有兴趣，请参阅 [Ruby 解析器的未来愿景](https://rubykaigi.org/2023/presentations/spikeolaf.html)

## YJIT

* 相对于 3.2 有显著的性能提升
  * 改进了 splat 和 rest 参数支持。
  * 虚拟机的栈操作分配了寄存器。
  * 更多带有可选参数的调用被编译。
  * 特别优化了 `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===`。
  * 拥有复杂对象形状的实例变量不再用于解析器执行。
* 编译代码使用的元数据使用更少的内存。
* 改进 ARM64 中的代码生成。
* 可以在暂停模式下启动 YJIT，并后续手动启动
  * `--yjit-pause` 和 `RubyVM::YJIT.resume`
  * 这可以用来在应用程序启动完成后，仅启用 YJIT 一次
* 退出跟踪选项现在支持采样
  * `--trace-exits-sample-rate=N`
* 多个错误修复



## 其他值得关注的新功能

### 语言



## 性能提升

* 根据对象形状，优化 `defined?(@ivar)`。

## 自 3.2 以来，其他值得注意的变化



## 兼容性问题

注意：不包括 bug 修复。

### 删除的常量

删除了以下已废弃的常量。



### 删除的方法

删除了以下已废除的方法。



## 标准库兼容性问题

### `ext/readline` 已退役

* 我们有了纯 Ruby 实现的 `reline`，兼容 `ext/readline` API。未来我们将依赖 `reline`。如果您需要使用 `ext/readline`，可以通过 rubygems.org 进行安装 `gem install readline-ext`。
* 我们不再需要安装类似 `libreadline` 或 `libedit` 这样的库了。

## C API 更新

### 更新的 C API

更新了以下 API。



### 已移除的 C API

移除了以下废弃的 API。



## 标准库更新



更新了以下默认 gems。

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.7
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.6.4
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.3
* stringio 3.0.7
* strscan 3.0.7
* syntax_suggest 1.0.4
* time 0.2.2
* timeout 0.3.2
* uri 0.12.1

更新了以下绑定 gems。

* minitest 5.18.0
* rbs 3.1.0
* typeprof 0.21.7
* debug 1.8.0

有关默认 gems 和 绑定 gems 的细节，可以参考 GitHub 上的发布，例如 [Logger](https://github.com/ruby/logger/releases) 或相应的变更日志。

更多详情，可参见 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})。

自 Ruby 3.2.0 以来，[{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)， 删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)!

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

## Ruby是什么

Ruby 最初由 Matz （松本行弘，Yukihiro Matsumoto） 于 1993 年开发，现在以开源软件的形式开发。它可以在多个平台上运行，并在全球得到广泛使用，尤其是Web开发领域。
