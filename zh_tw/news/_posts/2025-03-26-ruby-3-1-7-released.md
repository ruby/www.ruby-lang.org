---
layout: news_post
title: "Ruby 3.1.7 發布"
author: hsbt
translator: "Bear Su"
date: 2025-03-26 04:44:27 +0000
lang: zh_tw
---

Ruby 3.1.7 已經發布了。 本次發布版本包含 [CVE-2025-27219、CVE-2025-27220 和 CVE-2025-27221 修復](https://www.ruby-lang.org/en/news/2025/02/26/security-advisories/) 以及更新 bundled REXML 和 RSS gems。

詳細的變動請參閱 [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_7)。

此為 Ruby 3.1 系列的最後版本。
我們將不會為 Ruby 3.1 系列發布任何包含安全性修復的更新。

我們建議升級至 Ruby 3.3 或 3.4 系列。


## 下載

{% assign release = site.data.releases | where: "version", "3.1.7" | first %}

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
