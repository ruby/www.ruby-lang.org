---
layout: news_post
title: "Ruby 4.0.3 已发布"
author: k0kubun
translator: "GAO Jun"
date: 2026-04-21 08:45:44 +0000
lang: zh_cn
---

Ruby 4.0.3 已发布。

此版本只是更新了 ERB 6.0.1.1，以提供 [CVE-2026-41316](https://www.ruby-lang.org/zh/news/2026/04/21/erb-cve-2026-41316/) 的安全补丁。

如果您的应用在不受信任的数据上调用 `Marshal.load` 并且同时加载了 erb 和 activesupport，请将您的 ERB 更新到
4.0.3.1，4.0.4.1，6.0.1.1，6.0.4 或之后版本。您可以使用此次发布的 Ruby 4.0.3 来实现此修复。

## 发布计划

我们计划在每次 **常规** 发布后的 2 个月为最新的 Ruby 稳定版本（目前是 Ruby 4.0）发布更新。
Ruby 4.0.4 将于五月发布，4.0.5 将于七月发布，4.0.6 将于九月发布，4.0.7 将于十一月发布。

如果存在会影响到大量用户的重大变更，我们也可能会提前发布新版本，后续版本的发布计划也将进行相应调整。

## 下载

{% assign release = site.data.releases | where: "version", "4.0.3" | first %}

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
