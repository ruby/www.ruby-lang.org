---
layout: news_post
title: "Ruby 3.4.9 リリース"
author: nagachika
translator: nagachika
date: 2026-03-11 11:00:00 +0000
lang: ja
---

Ruby 3.4.9 がリリースされました。

このリリースには default gems zlib の [CVE-2026-27820 の対策を含むバージョン更新](https://www.ruby-lang.org/en/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/) が含まれています。
その他にもいくつかの不具合修正が行なわれています。詳細は [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_4_9) を参照してください。

このリリースは引き続きデフォルトのgemとして利用される場合のために行なわれているものです。明示的に zlib gem のバージョンを更新することをおすすめします。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

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
