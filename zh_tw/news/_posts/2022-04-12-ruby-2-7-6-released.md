---
layout: news_post
title: "Ruby 2.7.6 發布"
author: "usa and mame"
translator: "Vincent Lin"
date: 2022-04-12 12:00:00 +0000
lang: zh_tw
---

Ruby 2.7.6 已經發布了。

本發行版包含安全性修正。
細節請參考下列內容。

* [CVE-2022-28739: String 轉換 Float 時緩衝區溢位]({%link zh_tw/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

此次發布也包含了數個錯誤修復。
詳細的變動請參閱[提交紀錄](https://github.com/ruby/ruby/compare/v2_7_5...v2_7_6)。

本次發布後，我們將結束 Ruby 2.7 的正常維護週期，進入安全性維護週期。
這代表接下來除了安全性修正外，我們將不會移植任何錯誤修正回去 2.7 系列。

在預計為期一年的安全性維護週期後，Ruby 2.7 將會停止官方支援，並進入最終階段。
因此，我們建議您著手更新至新版本如 Ruby 3.0 或 3.1。

## 下載

{% assign release = site.data.releases | where: "version", "2.7.6" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

許多提交者、開發者和漏洞回報者幫助了此版本的發佈，在此感謝所有人的貢獻。

Ruby 2.7 的維護（包含本版本）是基於 Ruby 協會的「穩定版本協議」。
