---
layout: news_post
title: "Ruby 3.2.1 リリース"
author: "naruse"
translator: mame
date: 2023-02-08 12:00:00 +0000
lang: ja
---

Ruby 3.2.1 がリリースされました。

これは 3.2 シリーズにおける最初の TEENY リリースになります。

詳しい変更については [commit log](https://github.com/ruby/ruby/compare/v3_2_0...v3_2_1) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.2.1" | first %}

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

このリリースにあたり、多くのコミッター、開発者、バグ報告をしてくれたユーザーの皆様に感謝を申し上げます。
