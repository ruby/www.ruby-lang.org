---
layout: news_post
title: "Ruby 3.1.2 已发布"
author: "naruse and mame"
translator: "GAO Jun"
date: 2022-04-12 12:00:00 +0000
lang: zh_cn
---

Ruby 3.1.2 已发布。

此版本包括安全补丁。
请通过以下条目来获取详情。

* [CVE-2022-28738: Regexp 编译中的双重释放（double free）]({%link zh_cn/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: String 到 Float 转换中的缓冲区溢出]({%link zh_cn/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

您可以通过 [提交日志](https://github.com/ruby/ruby/compare/v3_1_1...v3_1_2) 获取更多信息。

## 下载

{% assign release = site.data.releases | where: "version", "3.1.2" | first %}

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
