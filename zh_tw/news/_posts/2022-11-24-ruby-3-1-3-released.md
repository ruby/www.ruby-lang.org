---
layout: news_post
title: "Ruby 3.1.3 發布"
author: "nagachika"
translator: "Bear Su"
date: 2022-11-24 12:00:00 +0000
lang: zh_tw
---

Ruby 3.1.3 已經發布了。

本次發布版本包含安全性修正。
細節請參考下列內容。

* [CVE-2021-33621: CGI 存在 HTTP 響應切分風險]({%link zh_tw/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

此次發布也修復了在 Xcode 14 和 macOS 13 (Ventura) 上編譯失敗的問題。
詳細的資訊請參閱[相關議題](https://bugs.ruby-lang.org/issues/18912)。

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_1_3)。

## 下載

{% assign release = site.data.releases | where: "version", "3.1.3" | first %}

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
