---
layout: news_post
title: "Ruby 3.4.4 發布"
author: k0kubun
translator: "Bear Su"
date: 2025-05-14 18:20:00 +0000
lang: zh_tw
---

Ruby 3.4.4 已經發布了。

此版本修復了與本地變數相關的 YJIT 錯誤，並解決了在 Windows 平台上使用 GCC 15 時出現的建置問題。
本次提前發布是為了能夠盡快提供這些修復。
同時也修復了一些小型錯誤。

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_4_4)。

## 發布時程

我們打算按照近期的發布頻率每 2 個月發布一次最新的穩定 Ruby 版本（目前為 Ruby 3.4）。
本次版本(3.4.4) 發布後，Ruby 3.4.5 將於 7 月發布、Ruby 3.4.6 於 9 月發布、Ruby 3.4.7 於 11 月發布、Ruby 3.4.8 於 1 月發布。

如果有任何變更影響到相當多的人，我們可能會比預期更早發布新版本，並可能會調整後續的發布時程。

## 下載

{% assign release = site.data.releases | where: "version", "3.4.4" | first %}

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
