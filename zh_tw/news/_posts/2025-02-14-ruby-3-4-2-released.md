---
layout: news_post
title: "Ruby 3.4.2 發布"
author: k0kubun
translator: "Bear Su"
date: 2025-02-14 21:55:17 +0000
lang: zh_tw
---

Ruby 3.4.2 已經發布了。

這是包括修復小型錯誤的例行更新。
詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_4_2)。

## 發布時程

我們打算每 2 個月發布一次最新的穩定 Ruby 版本（目前為 Ruby 3.4）。

我們預計 Ruby 3.4.3 於 4 月發布、Ruby 3.4.4 於 6 月發布、Ruby 3.4.5 於 8 月發布、Ruby 3.4.6 於 10 月發布、Ruby 3.4.7 於 12 月發布。如果有任何變更影響到相當多的人，我們可能會比預期更早發布新版本。

## 下載

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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
