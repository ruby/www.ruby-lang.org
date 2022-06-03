---
layout: news_post
title: "Ruby 3.1.2 發布"
author: "naruse and mame"
translator: "Vincent Lin"
date: 2022-04-12 12:00:00 +0000
lang: zh_tw
---

Ruby 3.1.2 已經發布了。

本次發布版本包含安全性修正。
細節請參考下列內容。

* [CVE-2022-28738: Regexp 編譯時雙重釋放風險]({%link zh_tw/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: String 轉換 Float 時緩衝區溢位]({%link zh_tw/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

詳細的變動請參閱[提交紀錄](https://github.com/ruby/ruby/compare/v3_1_1...v3_1_2)。

## 下載

{% assign release = site.data.releases | where: "version", "3.1.2" | first %}

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
