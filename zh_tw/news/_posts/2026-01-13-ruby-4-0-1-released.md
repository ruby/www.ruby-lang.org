---
layout: news_post
title: "Ruby 4.0.1 發布"
author: k0kubun
translator: "Bear Su"
date: 2026-01-13 02:28:48 +0000
lang: zh_tw
---

Ruby 4.0.1 已經發布了。

此版本修復了當子行程在另一個執行緒中退出時，`Kernel#sleep` 導致的虛假喚醒問題，以及其他一些錯誤修復。

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v4.0.1)。

## 發布時程

我們打算按照近期的發布頻率每 2 個月發布一次最新的穩定 Ruby 版本（目前為 Ruby 4.0）。
Ruby 4.0.2 將於 3 月發布、4.0.3 將於 5 月發布、4.0.4 將於 7 月發布、4.0.5 將於 9 月發布、4.0.6 將於 11 月發布。

如果有任何變更影響到相當多的人，我們可能會比預期更早發布新版本，並可能會調整後續的發布時程。

## 下載

{% assign release = site.data.releases | where: "version", "4.0.1" | first %}

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
