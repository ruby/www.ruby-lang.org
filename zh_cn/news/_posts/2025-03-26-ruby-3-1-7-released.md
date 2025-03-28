---
layout: news_post
title: "Ruby 3.1.7 已发布"
author: hsbt
translator: "GAO Jun"
date: 2025-03-26 04:44:27 +0000
lang: zh_cn
---

Ruby 3.1.7 已发布。此版本包括 [CVE-2025-27219，CVE-2025-27220 和 CVE-2025-27221 的补丁](https://www.ruby-lang.org/zh_cn/news/2025/02/26/security-advisories/)
并更新了绑定的 REXML 和 RSS gems.

详细信息可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v3_1_7)。

此版本是 Ruby 3.1 系列的最终版本。我们不会再发布 Ruby 3.1 系列的后续版本，包括安全补丁。

我们建议您更新到 Ruby 3.3 或 3.4 系列版本。

## 下载

{% assign release = site.data.releases | where: "version", "3.1.7" | first %}

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
