---
layout: news_post
title: "Ruby 3.2.3 リリース"
author: "nagachika"
translator:
date: 2024-01-18 09:00:00 +0000
lang: ja
---

Ruby 3.2.3 がリリースされました。

このリリースでは多くの不具合修正を行なっています。
詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_3) を参照してください。

このリリースでは default gem の uri.gem のバージョンを脆弱性修正を含む 0.12.2 に更新しています。
詳しくは以下の記事を参照してください。

* [CVE-2023-36617: URI における ReDoS 脆弱性について]({%link ja/news/_posts/2023-06-29-redos-in-uri-CVE-2023-36617.md %})


## ダウンロード

{% assign release = site.data.releases | where: "version", "3.2.3" | first %}

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
