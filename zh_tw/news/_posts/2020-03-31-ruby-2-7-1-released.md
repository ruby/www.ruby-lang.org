---
layout: news_post
title: "Ruby 2.7.1 發布"
author: "naruse"
translator: "Juanito Fatas"
date: 2020-03-31 12:00:00 +0000
lang: zh_tw
---

Ruby 2.7.1 已經發布。

本發行版包含安全性修正。細節請參考下列內容。

* [CVE-2020-10663: JSON 存在任意建立物件安全性風險 (額外修正)]({% link zh_tw/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933：socket 函式庫存在記憶體堆疊資料洩漏風險]({% link zh_tw/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

詳細的變動請參閱[提交紀錄](https://github.com/ruby/ruby/compare/v2_7_0...v2_7_1)。

## 下載

{% assign release = site.data.releases | where: "version", "2.7.1" | first %}

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

## 發布記

許多提交者、開發者和漏洞回報者幫助了此版本的發佈，在此感謝所有人的貢獻。
