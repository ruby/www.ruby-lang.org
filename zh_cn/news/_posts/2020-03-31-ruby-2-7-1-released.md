---
layout: news_post
title: "Ruby 2.7.1 发布"
author: "naruse"
translator: "Alex S"
date: 2020-03-31 12:00:00 +0000
lang: zh_cn
---

Ruby 2.7.1 已经发布。

本版本包含安全性修复。细节请参考以下内容。

* [CVE-2020-10663: JSON 存在任意创建不安全对象风险 (额外修复)]({% link zh_cn/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933：socket 函数库存在堆内存泄漏风险]({% link zh_cn/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

详细变动请参阅[提交记录](https://github.com/ruby/ruby/compare/v2_7_0...v2_7_1)。

## 下载

{% assign release = site.data.releases | where: "version", "2.7.1" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## 发布记

许多提交者、开发者和漏洞报告者帮助了此版本的发布，在此感谢所有人的贡献。
