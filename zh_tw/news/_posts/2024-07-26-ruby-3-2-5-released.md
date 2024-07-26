---
layout: news_post
title: "Ruby 3.2.5 發布"
author: "nagachika"
translator: "Bear Su"
date: 2024-07-26 10:00:00 +0000
lang: zh_tw
---

Ruby 3.2.5 已經發布了。

本次發布版本包含許多問題修正。
我們也更新了 bundled gem `rexml` 的版本以包含下列安全性修正：
[CVE-2024-39908 : DoS in REXML]({%link zh_tw/news/_posts/2024-07-16-dos-rexml-cve-2024-39908.md %}).

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_2_5)。

## 下載

{% assign release = site.data.releases | where: "version", "3.2.5" | first %}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## 發布紀錄

許多提交者、開發者和漏洞回報者幫助了此版本的發布，在此感謝所有人的貢獻。
