---
layout: news_post
title: "Ruby 3.3.9 リリース"
author: nagachika
translator: teeta32
date: 2025-07-24 11:00:00 +0000
lang: ja
---

Ruby 3.3.9 がリリースされました。

このリリースは以下の default gems のセキュリティ修正を含みます。

* [CVE-2025-24294: resolv gem の DoS 可能な脆弱性](https://www.ruby-lang.org/en/news/2025/07/08/dos-resolv-cve-2025-24294/)

また、以下のビルドの問題を修正します。

* GCC 15.1
* Visual Studio 2022 Version 17.14

詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_9) を参照してください。

## ダウンロード

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

## リリースコメント

Ruby 開発者の皆様、バグや脆弱性を報告してくれたユーザーの皆様のご協力により本リリースは行われています。皆様のご協力に感謝します。
