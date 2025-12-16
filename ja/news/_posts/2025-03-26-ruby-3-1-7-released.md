---
layout: news_post
title: "Ruby 3.1.7 リリース"
author: hsbt
translator: teeta32
date: 2025-03-26 04:44:27 +0000
lang: ja
---

Ruby 3.1.7 がリリースされました。本リリースは [CVE-2025-27219、CVE-2025-27220 および CVE-2025-27221 の修正](https://www.ruby-lang.org/ja/news/2025/02/26/security-advisories/) と Bundled gems の REXML と RSS のアップデートを含みます。

詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_7) を参照してください。

本バージョンは Ruby 3.1 系列の最後のリリースです。セキュリティ修正を含む今後のさらなるアップデートは Ruby 3.1 系列には提供されません。

Ruby 3.3 系列または 3.4 系列へのアップグレードを推奨します。

## ダウンロード

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

## リリースコメント

Ruby 開発者の皆様、バグや脆弱性を報告してくれたユーザーの皆様のご協力により本リリースは行われています。
皆様のご協力に感謝します。
