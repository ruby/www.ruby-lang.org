---
layout: news_post
title: "Ruby 4.0.3 發布"
author: k0kubun
translator: "Bear Su"
date: 2026-04-21 08:45:44 +0000
lang: zh_tw
---

Ruby 4.0.3 已經發布了。本次發布只包含修復 [CVE-2026-41316](https://www.ruby-lang.org/zh_tw/news/2026/04/21/erb-cve-2026-41316/) 的 ERB 6.0.1.1。

如果您的應用程式呼叫 Marshal.load 處理不受信任的資料且載入了 erb 和 activesupport，請升級您的 ERB 至 4.0.3.1、4.0.4.1、6.0.1.1、6.0.4 或更新的版本。您也能使用這個 Ruby 4.0.3 版本來修復。

## 發布時程

我們打算按照近期的常規發布，每 2 個月發布一次最新的穩定 Ruby 版本（目前為 Ruby 4.0）。
4.0.4 將於 5 月發布、4.0.5 將於 7 月發布、4.0.6 將於 9 月發布、4.0.7 將於 11 月發布。

如果有任何變更影響到相當多的人，我們可能會比預期更早發布新版本，並可能會調整後續的發布時程。

## 下載

{% assign release = site.data.releases | where: "version", "4.0.3" | first %}

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
