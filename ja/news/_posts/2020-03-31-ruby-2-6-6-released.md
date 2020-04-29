---
layout: news_post
title: "Ruby 2.6.6 リリース"
author: "nagachika"
translator: "wktk"
date: 2020-03-31 12:00:00 +0000
lang: ja
---

Ruby 2.6.6 がリリースされました。

このリリースには以下の脆弱性修正が含まれています。

* [CVE-2020-10663: JSON における安全でないオブジェクトの生成の脆弱性について（追加の修正）]({% link ja/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933: socketライブラリのヒープ暴露脆弱性について]({% link ja/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

詳細は [commit log](https://github.com/ruby/ruby/compare/v2_6_5...v2_6_6) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.6.6" | first %}

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

このリリースにあたり、多くのコミッター、開発者、バグ報告をしてくれたユーザーの皆様に感謝を申し上げます。
