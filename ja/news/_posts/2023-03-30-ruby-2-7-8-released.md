---
layout: news_post
title: "Ruby 2.7.8 リリース"
author: "usa"
translator: "ytjmt"
date: 2023-03-30 12:00:00 +0000
lang: ja
---

Ruby 2.7.8 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事を参照してください。

* [CVE-2023-28755: ReDoS vulnerability in URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: ReDoS vulnerability in Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

このリリースには、いくつかのビルド上の問題への対応も含まれています。
詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v2_7_8) を参照してください。

このリリースをもって、Ruby 2.7 系列は EOL となります。即ち、Ruby 2.7.8 が Ruby 2.7 系列の最後のリリースとなる予定です。
これ以降、仮に新たな脆弱性が発見されても、Ruby 2.7.9 などはリリースされません（ただし、深刻なリグレッションが発見された場合にはリリースする可能性があります）。
全ての Ruby 2.7 ユーザーの皆様は、速やかに 3.2、3.1、3.0 への移行を開始することをお勧めします。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.7.8" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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
