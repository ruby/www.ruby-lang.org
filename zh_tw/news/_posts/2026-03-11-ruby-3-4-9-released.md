---
layout: news_post
title: "Ruby 3.4.9 發布"
author: nagachika
translator: "Bear Su"
date: 2026-03-11 11:00:00 +0000
lang: zh_tw
---

Ruby 3.4.9 已經發布了。

本次發布包含 [針對 CVE-2026-27820 的 zlib gem 更新](https://www.ruby-lang.org/zh_tw/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/)，以及其他錯誤修復。
詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_4_9)。

我們建議更新您的 zlib gem 版本。本次發布是為了方便那些希望繼續將其作為預設 gem 的使用者。

## 下載

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

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
