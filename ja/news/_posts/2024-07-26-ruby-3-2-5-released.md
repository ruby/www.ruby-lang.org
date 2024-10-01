---
layout: news_post
title: "Ruby 3.2.5 リリース"
author: "nagachika"
translator: "egamasa"
date: 2024-07-26 10:00:00 +0000
lang: ja
---

Ruby 3.2.5 がリリースされました。

このリリースでは多くの不具合修正を行っています。
また、バンドルされている `rexml` gem のバージョンが更新されました。これには、[CVE-2024-39908: REXML内のDoS脆弱性]({%link ja/news/_posts/2024-07-16-dos-rexml-cve-2024-39908.md %}) の脆弱性修正が含まれています。


詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_5) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.2.5" | first %}

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
