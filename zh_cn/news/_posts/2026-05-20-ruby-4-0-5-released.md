---
layout: news_post
title: "Ruby 4.0.5 已发布"
author: k0kubun
translator: "GAO Jun"
date: 2026-05-20 00:12:20 +0000
lang: zh_cn
---

Ruby 4.0.5 已发布。

此版本仅包含漏洞补丁
[CVE-2026-46727: 基于 pthread 的 getaddrinfo 超时处理中存在释放后使用(Use-after-free)漏洞](/zh_cn/news/2026/05/20/getaddrinfo-cve-2026-46727/)
以及 C 程序在特定区域设置下的构建问题 [[Bug #22065]](https://bugs.ruby-lang.org/issues/22065)。

详情可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v4.0.5)。

## 发布计划

我们计划在每次 **常规** 发布后的 2 个月为最新的 Ruby 稳定版本（目前是 Ruby 4.0）发布更新。
Ruby 4.0.6 将于七月发布，4.0.7 将于九月发布，4.0.8 将于十一月发布。

如果存在会影响到大量用户的重大变更，我们也可能会提前发布新版本，后续版本的发布计划也将进行相应调整。

## 下载

{% assign release = site.data.releases | where: "version", "4.0.5" | first %}

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
