---
layout: news_post
title: "Ruby 3.2.3 已发布"
author: "nagachika"
translator: "GAO Jun"
date: 2024-01-18 09:00:00 +0000
lang: zh_cn
---

Ruby 3.2.3 已发布。

此版本修正了很多问题。
您可以通过查看 [GitHub 发布页面](https://github.com/ruby/ruby/releases/tag/v3_2_3) 获取更多信息。

此版本还将 `uri` gem 更新到了 0.12.2，其中包含了安全修正。
您可以查看下面的主题来获取详细信息。

* [CVE-2023-36617: URI 包中的 ReDoS 漏洞]({%link zh_cn/news/_posts/2023-06-29-redos-in-uri-CVE-2023-36617.md %})

## 下载

{% assign release = site.data.releases | where: "version", "3.2.3" | first %}

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

## 发布说明

## 发布说明

许多提交者、开发人员以及用户提供了问题报告，帮助我们完成了此版本。
感谢他们的贡献。
