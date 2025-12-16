---
layout: news_post
title: "Ruby 3.3.9 發布"
author: nagachika
translator: "Bear Su"
date: 2025-07-24 11:00:00 +0000
lang: zh_tw
---

Ruby 3.3.9 已經發布了。

本次發布包含了以下預設 gem 的安全性修復：

* [CVE-2025-24294: Possible Denial of Service in resolv gem](https://www.ruby-lang.org/en/news/2025/07/08/dos-resolv-cve-2025-24294/)

和以下建置問題的修復：

* GCC 15.1
* Visual Studio 2022 Version 17.14

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_3_9)。

## 下載

{% assign release = site.data.releases | where: "version", "3.3.9" | first %}

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
