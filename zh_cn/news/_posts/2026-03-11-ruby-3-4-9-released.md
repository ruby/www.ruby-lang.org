---
layout: news_post
title: "Ruby 3.4.9 已发布"
author: nagachika
translator: "GAO Jun"
date: 2026-03-11 11:00:00 +0000
lang: zh_cn
---

Ruby 3.4.9 已发布。

此版本包括了 [处理 CVE-2026-27820 的 zlib gem 更新](https://www.ruby-lang.org/en/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/)，以及一些其他问题补丁。
详情可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v3_4_9)。

我们建议您更新 `zlib` gem。由于包含了 `zlib` 的更新版本，对于希望继续将其作为默认 gem 的用户，此版本能让您不用再单独处理 `zlib` 更新。

## 下载

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

* <{{ release.url.gz }}>

      文件大小: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      文件大小: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}.
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
