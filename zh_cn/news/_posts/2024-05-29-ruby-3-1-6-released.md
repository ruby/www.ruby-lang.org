---
layout: news_post
title: "Ruby 3.1.6 已发布"
author: "hsbt"
translator: "GAO Jun"
date: 2024-05-29 9:00:00 +0000
lang: zh_cn
---

Ruby 3.1.6 已发布。

Ruby 3.1 目前处于安全维护状态。一般来说，在此期间我们只会修正安全问题。但在 Ruby 3.1.5 发布后，我们发现了一些编译失败的问题。
因此，我们决定发布 Ruby 3.1.6 来修正这些问题。

您可以点击下面的链接来了解详情。

* [Bug #20151: Can't build Ruby 3.1 on FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Bug #20451: Bad Ruby 3.1.5 backport causes fiddle to fail to build](https://bugs.ruby-lang.org/issues/20451)
* [Bug #20431: Ruby 3.3.0 build fail with make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

您可以通过 [发布说明](https://github.com/ruby/ruby/releases/tag/v3_1_6) 获取进一步信息。

## 下载

{% assign release = site.data.releases | where: "version", "3.1.6" | first %}

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

## 发布说明

许多提交者、开发人员以及用户提供了问题报告，帮助我们完成了此版本。
感谢他们的贡献。
