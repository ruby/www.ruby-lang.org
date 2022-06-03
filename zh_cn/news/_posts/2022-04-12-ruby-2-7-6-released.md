---
layout: news_post
title: "Ruby 2.7.6 已发布"
author: "usa and mame"
translator: "GAO Jun"
date: 2022-04-12 12:00:00 +0000
lang: zh_cn
---

Ruby 2.7.6 已发布。

此版本包括一个安全补丁。
请通过以下条目来获取详情。

* [CVE-2022-28739: String 到 Float 转换中的缓冲区溢出]({%link zh_cn/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

此版本还包括一些错误补丁。
您可以通过 [提交日志](https://github.com/ruby/ruby/compare/v2_7_5...v2_7_6) 获取更多信息。

此版本发布后，我们将结束 Ruby 2.7 的普通维护期，Ruby 2.7 进入安全维护期。
这意味着除了安全补丁，我们将不再移植任何错误修复到 Ruby 2.7。
安全维护期的期限为一年。
Ruby 2.7 将在安全维护期结束时达到 EOL，此时官方支持也将终结。
因此，我们建议您开始规划升级到 Ruby 3.0 或 Ruby 3.1。

## 下载

{% assign release = site.data.releases | where: "version", "2.7.6" | first %}

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

包括这个版本在内的 Ruby 2.7 的维护，都基于 Ruby 协会 (Ruby Association) 的“Ruby 稳定版协议(Agreement for the Ruby stable version)”。
