---
layout: news_post
title: "Ruby 2.7.7 已发布"
author: "usa"
translator: "GAO Jun"
date: 2022-11-24 12:00:00 +0000
lang: zh_cn
---

Ruby 2.7.7 已发布。

此版本包括一个安全补丁。
请通过以下条目来获取详情。

* [CVE-2021-33621: CVE-2021-33621: CGI 中的 HTTP 响应拆分漏洞]({%link zh_cn/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

此版本还修复了一些构建问题。这些修复应不会影响与以前版本的兼容性。
您可以通过 [提交日志](https://github.com/ruby/ruby/compare/v2_7_6...v2_7_7) 获取更多信息。

## 下载

{% assign release = site.data.releases | where: "version", "2.7.7" | first %}

* <{{ release.url.bz2 }}>

      文件大小: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

## 版本说明

许多提交者、开发人员以及用户提供了问题报告，帮助我们完成了此版本。
感谢他们的贡献。
