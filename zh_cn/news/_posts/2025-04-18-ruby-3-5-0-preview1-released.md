---
layout: news_post
title: "Ruby 3.5.0 preview1 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2025-04-18 00:00:00 +0000
lang: zh_cn
---

{% assign release = site.data.releases | where: "version", "3.5.0-preview1" | first %}
我们很高兴地宣布 Ruby {{ release.version }} 已发布。Ruby 3.5 除了将 Unicode 版本更新到 15.1.0外，还有一些其他变更。

## 语言变化

* `*nil` 不再调用 `nil.to_a`，就像 `**nil` 不再调用 `nil.to_hash`。  [[Feature #21047]]

## 核心类更新

注意：我们只列出了重要的核心类更新。

* Binding

    * `Binding#local_variables` 不再包含引用数字参数（如 `_1`, `_2`）。
      同样， `Binding#local_variable_get` 和 `Binding#local_variable_set` 也会拒绝处理引用数字参数。
      [[Bug #21049]]

* IO

    * `IO.select` 允许使用 `Float::INFINITY` 作为超时参数。
      [[Feature #20610]]

* String

    * 更新 Unicode 版本至 15.1.0，更新 Emoji 版本至 15.1。 [[Feature #19908]]
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



## 其他变化



更多详情，可参见 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
或 [提交日志](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})。

自 Ruby 3.4.0 以来，这些变化共导致 [{{ release.stats.files_changed }} 个文件被更改，新增 {{ release.stats.insertions }} 行(+)，删除 {{ release.stats.deletions }} deletions(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)！

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
