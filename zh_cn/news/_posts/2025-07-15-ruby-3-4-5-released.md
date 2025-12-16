---
layout: news_post
title: "Ruby 3.4.5 已发布"
author: k0kubun
translator: "GAO Jun"
date: 2025-07-15 17:00:00 +0000
lang: zh_cn
---

Ruby 3.4.5 已发布。

此次定期更新包含了若干问题修复，以及对 GCC 15 的支持。
详细信息可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v3_4_5)。

## 发布计划

我们计划每2个月发布最新的 Ruby 稳定版本（目前是 Ruby 3.4）。
Ruby 3.4.6 将发布于九月，3.4.7 将发布于十一月，3.4.8 将发布于明年一月。

如果存在会影响到大量用户的变更，我们可能会提前发布新版本，后续版本的发布计划也将发生相应变更。

## 下载

{% assign release = site.data.releases | where: "version", "3.4.5" | first %}

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
