---
layout: news_post
title: "Ruby 3.4.7 發布"
author: k0kubun
translator: "Bear Su"
date: 2025-10-07 17:14:11 +0000
lang: zh_tw
---

Ruby 3.4.7 已經發布了。

本次發布包含 [修復 CVE-2025-61594 的 uri gem 更新](https://www.ruby-lang.org/en/news/2025/10/07/uri-cve-2025-61594/)，與修復其他小型錯誤。

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_4_7)。

我們建議更新您的 uri gem 版本。本次發布是為了方便那些希望繼續將其作為預設 gem 的使用者。

## 發布時程

我們打算每 2 個月發布一次最新的穩定 Ruby 版本（目前為 Ruby 3.4）。
我們預計 Ruby 3.4.8 於 12 月發布、Ruby 3.4.9 於 2 月發布。

如果有任何變更影響到相當多的人，我們可能會比預期更早發布新版本。

## 下載

{% assign release = site.data.releases | where: "version", "3.4.7" | first %}

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
