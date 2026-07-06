---
layout: news_post
title: "Ruby 4.0.5 發布"
author: k0kubun
translator: "Bear Su"
date: 2026-05-20 00:12:20 +0000
lang: zh_tw
---

Ruby 4.0.5 已經發布了。

此發佈只包含 [CVE-2026-46727: 基於 pthread 的 getaddrinfo 逾時處理常式中的 Use-after-free 漏洞](/zh_tw/news/2026/05/20/getaddrinfo-cve-2026-46727/) 的安全性修復，和 Ruby 4.0.4 在 C locale 下的建置系統迴歸問題 [[Bug #22065]](https://bugs.ruby-lang.org/issues/22065) 的修復。

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v4.0.5)。

## 發布時程

我們打算按照近期的常規發布，每 2 個月發布一次最新的穩定 Ruby 版本（目前為 Ruby 4.0）。
4.0.6 將於 7 月發布、4.0.7 將於 9 月發布、4.0.8 將於 11 月發布。

如果有任何變更影響到相當多的人，我們可能會比預期更早發布新版本，並可能會調整後續的發布時程。

## 下載

{% assign release = site.data.releases | where: "version", "4.0.5" | first %}

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
