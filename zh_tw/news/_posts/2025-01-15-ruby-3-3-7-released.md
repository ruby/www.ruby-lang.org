---
layout: news_post
title: "Ruby 3.3.7 發布"
author: k0kubun
translator: "Bear Su"
date: 2025-01-15 07:51:59 +0000
lang: zh_tw
---

Ruby 3.3.7 已經發布了。

這是包括修復小型錯誤的例行更新。
詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_3_7)。

## 下載

{% assign release = site.data.releases | where: "version", "3.3.7" | first %}

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
