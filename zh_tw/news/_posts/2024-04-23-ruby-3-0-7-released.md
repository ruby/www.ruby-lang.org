---
layout: news_post
title: "Ruby 3.0.7 發布"
author: "hsbt"
translator: "Bear Su"
date: 2024-04-23 10:00:00 +0000
lang: zh_tw
---

Ruby 3.0.7 已經發布了。

本次發布版本包含安全性修正。
細節請參考下列內容。

* [CVE-2024-27282: Regex 搜尋的任意記憶體位址讀取漏洞]({%link zh_tw/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: RDoc 中 .rdoc_options 的 RCE 漏洞](https://www.ruby-lang.org/zh_tw/news/2024/03/21/rce-rdoc-cve-2024-27281/)
* [CVE-2024-27280: StringIO 中的緩衝區 overread 漏洞](https://www.ruby-lang.org/zh_tw/news/2024/03/21/buffer-overread-cve-2024-27280/)

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_0_7)。

隨著這個版本的發佈，Ruby 3.0 進入了終了階段(EOL)。這意味著此為 Ruby 3.0 系列的最後版本。
之後即使發現安全性漏洞，我們也不會發布 Ruby 3.0.8 (除非發現有嚴重的回歸問題)。
我們建議所有 Ruby 3.0 使用者盡快遷移至 Ruby 3.3、3.2、或是 3.1。

## 下載

{% assign release = site.data.releases | where: "version", "3.0.7" | first %}

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
