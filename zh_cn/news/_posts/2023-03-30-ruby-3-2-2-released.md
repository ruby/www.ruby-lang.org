---
layout: news_post
title: "Ruby 3.2.2 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2023-03-30 12:00:00 +0000
lang: zh_cn
---

Ruby 3.2.2 已发布。

此版本包括安全补丁。
请通过以下条目来获取详情。

* [CVE-2023-28755: URI 包中的 ReDoS 漏洞]({%link zh_cn/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756：Time 包中的 ReDoS 漏洞]({%link zh_cn/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

此版本还修复了一些构建问题。
您可以通过 [发布说明](https://github.com/ruby/ruby/releases/tag/v2_7_8) 获取进一步信息。

## 下载

{% assign release = site.data.releases | where: "version", "3.2.2" | first %}

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

许多提交者、开发人员以及用户提供了问题报告，帮助我们完成了此版本。
感谢他们的贡献。
