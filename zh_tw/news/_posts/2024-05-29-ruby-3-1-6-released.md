---
layout: news_post
title: "Ruby 3.1.6 發布"
author: "hsbt"
translator: "Bear Su"
date: 2024-05-29 9:00:00 +0000
lang: zh_tw
---

Ruby 3.1.6 已經發布了。

Ruby 3.1 已經進入安全性維護週期，在此週期通常我們只會修復安全性問題。但在發布 Ruby 3.1.5 後我們發現有一些建置失敗的問題。
所以我們決定發布 Ruby 3.1.6 來修復這些問題。

細節請參考下列內容。

* [Bug #20151: Can't build Ruby 3.1 on FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Bug #20451: Bad Ruby 3.1.5 backport causes fiddle to fail to build](https://bugs.ruby-lang.org/issues/20451)
* [Bug #20431: Ruby 3.3.0 build fail with make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_1_6)。

## 下載

{% assign release = site.data.releases | where: "version", "3.1.6" | first %}

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
