---
layout: news_post
title: "Ruby 3.2.1 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2023-02-08 12:00:00 +0000
lang: zh_cn
---

Ruby 3.2.1 已发布。

这是 Ruby 3.2 系列的第一个小版本更新。

您可以通过 [提交日志](https://github.com/ruby/ruby/compare/v3_2_0...v3_2_1) 获取更多信息。

## 下载

{% assign release = site.data.releases | where: "version", "3.2.1" | first %}

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

## 版本说明

许多提交者、开发人员以及用户提供了问题报告，帮助我们完成了此版本。
感谢他们的贡献。
