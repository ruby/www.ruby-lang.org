---
layout: news_post
title: "Ruby 3.0.4 リリース"
author: "nagachika and mame"
translator: "jinroq"
date: 2022-04-12 12:00:00 +0000
lang: ja
---

Ruby 3.0.4 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事などを参照してください。

* [CVE-2022-28738: Regexp コンパイル時のダブルフリー]({%link ja/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: String から Float 変換時のバッファオーバーラン]({%link ja/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

詳しくは [commit logs](https://github.com/ruby/ruby/compare/v3_0_3...v3_0_4) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.0.4" | first %}

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
