---
layout: news_post
title: "Ruby 3.2.9 已发布"
author: "hsbt"
translator: "GAO Jun"
date: 2025-07-24 08:51:53 +0000
lang: zh_cn
---

Ruby 3.2.9 已发布。

此次更新包含以下修复：

* [CVE-2025-24294: resolv gem 中的拒绝服务攻击漏洞](https://www.ruby-lang.org/zh_cn/news/2025/07/08/dos-resolv-cve-2025-24294/)
* [CVE-2025-43857: net-imap 中的 DoS 漏洞](https://www.ruby-lang.org/zh_cn/news/2025/04/28/dos-net-imap-cve-2025-43857/)

以及以下环境中的构建问题：

* GCC 15.1
* Visual Studio 2022 Version 17.14

详细信息可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v3_2_9)。

## 下载

{% assign release = site.data.releases | where: "version", "3.2.9" | first %}

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
