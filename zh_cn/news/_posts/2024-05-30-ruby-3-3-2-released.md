---
layout: news_post
title: "Ruby 3.3.2 已发布"
author: "k0kubun"
translator: "GAO Jun"
date: 2024-05-30 03:50:00 +0000
lang: zh_cn
---

Ruby 3.3.2 已发布.

此版本包含了很多问题修正补丁。
您可以通过 [发布说明](https://github.com/ruby/ruby/releases/tag/v3_3_2) 获取进一步信息。

## 下载

{% assign release = site.data.releases | where: "version", "3.3.2" | first %}

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
