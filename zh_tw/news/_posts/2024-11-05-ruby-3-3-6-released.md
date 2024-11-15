---
layout: news_post
title: "Ruby 3.3.6 發布"
author: k0kubun
translator: "Bear Su"
date: 2024-11-05 04:25:00 +0000
lang: zh_tw
---

Ruby 3.3.6 已經發布了。

這是包括修復小型錯誤的例行更新。
此版本也停止有關缺少預設 gem 依賴項目的警告，這些 gems 將在 Ruby 3.5 成為 bundled gems。
詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_3_6)。

## 發布時程

如同之前[公布](https://www.ruby-lang.org/zh_tw/news/2024/07/09/ruby-3-3-4-released/)，我們打算在「.1」版本發布後每 2 個月發布一次最新的穩定 Ruby 版本（目前為 Ruby 3.3）。

我們預計 Ruby 3.3.7 於 1 月 7 日發布。如果有任何變更影響到相當多的人，我們可能會比預期更早發佈新版本。

## 下載

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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
