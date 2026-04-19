---
layout: news_post
title: "Ruby 4.0.1 已发布"
author: k0kubun
translator: "GAO Jun"
date: 2026-01-13 02:28:48 +0000
lang: zh_cn
---

Ruby 4.0.1 已发布。

此版本修复了当子进程在另一个线程中退出时，`Kernel#sleep` 函数会异常唤醒的问题，以及其他一些修正。
详情可参考 [GitHub 发布说明](https://github.com/ruby/ruby/releases/tag/v4.0.1)。

## 发布计划

我们计划每 2 个月发布最新的 Ruby 稳定版本（目前是 Ruby 4.0）。

Ruby 4.0.2 将于三月发布，4.0.3 将于五月发布，4.0.4 将于七月发布，4.0.5 将于九月发布，4.0.6 将于十一月发布。

如果存在会影响到大量用户的重大变更，我们也可能会提前发布新版本，后续版本的发布计划也将进行相应调整。

## 下载

{% assign release = site.data.releases | where: "version", "4.0.1" | first %}

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
