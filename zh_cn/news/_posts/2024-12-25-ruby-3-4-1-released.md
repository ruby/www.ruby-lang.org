---
layout: news_post
title: "Ruby 3.4.1 已发布"
author: "naruse"
translator: "GAO Jun"
date: 2024-12-25 00:00:00 +0000
lang: zh_cn
---

Ruby 3.4.1 已发布。

此版本修正了版本的描述。

更多信息可以参考 [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_4_1)。

## 下载

{% assign release = site.data.releases | where: "version", "3.4.1" | first %}

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
