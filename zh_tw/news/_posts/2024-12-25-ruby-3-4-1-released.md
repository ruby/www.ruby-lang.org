---
layout: news_post
title: "Ruby 3.4.1 發布"
author: "naruse"
translator: "Bear Su"
date: 2024-12-25 00:00:00 +0000
lang: zh_tw
---

Ruby 3.4.1 已經發布了。

修復了版本描述。

詳細的變動請參閱 [GitHub 發布](https://github.com/ruby/ruby/releases/tag/v3_4_1)。

## 下載

{% assign release = site.data.releases | where: "version", "3.4.1" | first %}

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
