---
layout: news_post
title: "Ruby 3.1.5 已发布"
author: "hsbt"
translator: "GAO Jun"
date: 2024-04-23 10:00:00 +0000
lang: zh_cn
---

Ruby 3.1.5 已发布。

此版本包括安全补丁。
请通过以下条目来获取详情。

* [CVE-2024-27282: Regex 搜索中的任意地址读取漏洞]({%link zh_cn/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: RDoc 中 .rdoc_options 的 RCE 漏洞](https://www.ruby-lang.org/zh_cn/news/2024/03/21/rce-rdoc-cve-2024-27281/)
* [CVE-2024-27280: StringIO 中的缓存过读漏洞](https://www.ruby-lang.org/zh_cn/news/2024/03/21/buffer-overread-cve-2024-27280/)

您可以通过 [发布说明](https://github.com/ruby/ruby/releases/tag/v3_1_5) 获取进一步信息。

## 下载

{% assign release = site.data.releases | where: "version", "3.1.5" | first %}

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
