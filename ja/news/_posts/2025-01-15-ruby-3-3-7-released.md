---
layout: news_post
title: "Ruby 3.3.7 リリース"
author: k0kubun
translator: teeta32
date: 2025-01-15 07:51:59 +0000
lang: ja
---

Ruby 3.3.7 がリリースされました。

本リリースはマイナーなバグ修正を含む定期的なアップデートです。

詳しくは [GitHub release notes](https://github.com/ruby/ruby/releases/tag/v3_3_7) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.3.7" | first %}

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

Ruby 開発者の皆様、バグや脆弱性を報告してくれたユーザーの皆様のご協力により本リリースは行われています。 皆様のご協力に感謝します。
