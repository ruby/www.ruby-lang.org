---
layout: news_post
title: "Ruby 3.2.7 リリース"
author: nagachika
translator: shia
date: 2025-02-04 12:00:00 +0000
lang: ja
---

Ruby 3.2.7 がリリースされました。

詳しくは [GitHub release notes](https://github.com/ruby/ruby/releases/tag/v3_2_7) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.2.7" | first %}

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

## リリースコメント

Ruby 開発者の皆様、バグや脆弱性を報告してくれたユーザーの皆様のご協力により本リリースは行われています。
皆様のご協力に感謝します。
