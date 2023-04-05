---
layout: news_post
title: "Ruby 3.1.4 リリース"
author: "nagachika"
translator: "ytjmt"
date: 2023-03-30 12:00:00 +0000
lang: ja
---

Ruby 3.1.4 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事を参照してください。

* [CVE-2023-28755: ReDoS vulnerability in URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: ReDoS vulnerability in Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_4) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.1.4" | first %}

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
