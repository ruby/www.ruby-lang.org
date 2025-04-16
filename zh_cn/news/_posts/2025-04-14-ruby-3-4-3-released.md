---
layout: news_post
title: "Ruby 3.4.3 已发布"
author: k0kubun
translator: "GAO Jun"
date: 2025-04-14 08:06:57 +0000
lang: zh_cn
---

Ruby 3.4.3 已发布。

此版本是包含了若干问题修正的定期更新版本。
详细信息可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v3_4_3)。

## 发布计划

我们计划每2个月发布最新的 Ruby 版本（目前是 Ruby 3.4）。
Ruby 3.4.4 将发布于六月，3.4.5 将发布于八月，3.4.6 将发布于十月，3.4.7 将发布于十二月。

如果存在会影响到大量用户的更改，我们可能会提前发布新版本。

## 下载

{% assign release = site.data.releases | where: "version", "3.4.3" | first %}

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
