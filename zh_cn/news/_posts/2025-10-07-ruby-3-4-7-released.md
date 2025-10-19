---
layout: news_post
title: "Ruby 3.4.7 已发布"
author: k0kubun
translator: "GAO Jun"
date: 2025-10-07 17:14:11 +0000
lang: zh_cn
---

Ruby 3.4.7 已发布。

此次更新包含了 [修复导致 CVE-2025-61594 的 uri gem](/zh_cn/news/2025/10/07/uri-cve-2025-61594/)，
详情可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v3_4_7)。

我们建议您更新 `uri` gem 版本。此次发布为那些想继续将其作为默认 gem 的用户提供了便利。

## 发布计划

我们计划每2个月发布最新的 Ruby 稳定版本（目前是 Ruby 3.4）。
Ruby 3.4.8 将于十二月发布，3.4.9 将于明年二月发布。

如果存在会影响到大量用户的变更，我们可能会提前发布新版本，后续版本的发布计划也将进行相应变更。

## 下载

{% assign release = site.data.releases | where: "version", "3.4.7" | first %}

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
