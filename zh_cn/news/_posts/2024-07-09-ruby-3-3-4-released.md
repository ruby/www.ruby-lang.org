---
layout: news_post
title: "Ruby 3.3.4 已发布"
author: "k0kubun"
translator: "GAO Jun"
date: 2024-07-09 00:30:00 +0000
lang: zh_cn
---

Ruby 3.3.4 已发布。

此版本修复了 Ruby 3.3.3 中的一个回归问题，一些绑定 gem 的 gemspec 中缺失了依赖项，这些 gem 包括：`net-pop`，`net-ftp`，`net-imap` 和 `prime`。
[[问题 #20581]](https://bugs.ruby-lang.org/issues/20581)。
这个修正可以让 Bundler 在 Heroku 之类的平台上成功安装这些 gem。
如果您能够正常运行 `bundle install` ，说明您可能不受此问题影响。

其他的变化大多是一些较小的问题修正。
您可以通过 [发布说明](https://github.com/ruby/ruby/releases/tag/v3_3_4) 获取进一步信息。

## 发布时间表

从今以后，我们打算在 `.1` 版本发布后，每 2 个月发布一次最新的 Ruby 稳定版本（目前是 Ruby 3.3)。
对于 Ruby 3.3，计划在9月3日发布 3.3.5，在11月7日发布 3.3.6，在1月7日发布 3.3.7。

如果有影响大量用户的变更，例如此次发布对 Heroku 上的 Ruby 3.3.3 用户的情况，我们可能会提前发布新版本。

## 下载

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

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
