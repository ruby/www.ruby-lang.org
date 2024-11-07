---
layout: news_post
title: "Ruby 3.3.6 已发布"
author: k0kubun
translator: "GAO Jun"
date: 2024-11-05 04:25:00 +0000
lang: zh_cn
---

Ruby 3.3.6 已发布。

这是包含了一些小补丁的计划更新。
此版本同时停止了对 Ruby 3.5 中即将作为绑定 gems 的依赖警告。
更多信息可以参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v3_3_6)。

## 发布计划

正如此前的 [公告](https://www.ruby-lang.org/zh_cn/news/2024/07/09/ruby-3-3-4-released/) 中所规划的，我们打算在 `.1` 版本发布后，每 2 个月发布一次最新的 Ruby 稳定版本（目前是 Ruby 3.3)。

我们预期在1月7日发布 Ruby 3.3.7。 如果有影响大量用户的变更，我们可能会提前发布新版本。

## 下载

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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
