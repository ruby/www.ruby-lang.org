---
layout: news_post
title: "Ruby 4.0.0 preview2 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2025-11-17 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview2" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 已发布。Ruby 4.0 更新 Unicode 版本至 17.0.0，还有一些其他变更。

## 语言变化

* `*nil` 不再调用 `nil.to_a`，就像 `**nil` 不再调用 `nil.to_hash`。 [[Feature #21047]]

## 核心类更新

注意：我们只列出了重要的核心类更新。

* Binding

    * `Binding#local_variables` 不再包含数字引用参数（如 `_1`, `_2`）。
      同样， `Binding#local_variable_get` 和 `Binding#local_variable_set` 也会拒绝处理数字引用参数。
      [[Bug #21049]]

* IO

    * `IO.select` 允许使用 `Float::INFINITY` 作为超时参数。
      [[Feature #20610]]

* String

    * 更新 Unicode 版本至 17.0.0，更新 Emoji 版本至 17.0.0。 [[Feature #19908]][[Feature #20724]][[Feature #21275]]
      （同样适用于 Regexp）


## 标准库更新

注意：我们只列出了重要的标准库更新。

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## 兼容性问题

注意：不包括错误问题修正。



## 标准库兼容性问题


## C API 更新


## JIT

* YJIT
    * YJIT 统计
        * `ratio_in_yjit` 在标准构建中不可用。
          可以在 `configure` 中设置 `--enable-yjit=stats` 并在调用时通过 `--yjit-stats` 来启用。
        * 在默认统计中新增 `invalidate_everything`，当 TracePoint 失效代码时，此统计信息会递增。
    * `RubyVM::YJIT.enable` 新增选项 `mem_size:` 和 `call_threshold:`。
* ZJIT
    * 新增基于方法的实验性 JIT 编译器。
      可以在 `configure` 中设置 `--enable-zjit`，并通过 `--zjit` 来启用。
    * 截至 Ruby 4.0.0-preview2，ZJIT 还不能提升大多数基准测试的速度。
      请暂时不要对 ZJIT 进行评估，敬请期待 Ruby 4.0 的发布。
* RJIT
    * 移除 `--rjit`。我们将把第三方 JIT API 实现迁移到 [ruby/rjit](https://github.com/ruby/rjit) 代码库。

## 其他变化



更多详情，可参见 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})。

自 Ruby 3.4.0 以来，这些变化共导致 [{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} 行(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)!

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

[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
