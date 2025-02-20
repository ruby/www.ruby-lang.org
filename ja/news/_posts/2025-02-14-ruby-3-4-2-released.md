---
layout: news_post
title: "Ruby 3.4.2 リリース"
author: k0kubun
translator: shia
date: 2025-02-14 21:55:17 +0000
lang: ja
---

Ruby 3.4.2がリリースされました。

これは定期的なアップデートであり、バグ修正を含みます。
詳しくは[GitHub release notes](https://github.com/ruby/ruby/releases/tag/v3_4_2)を参照してください。

## リリーススケジュール

最新の安定版Ruby（現在はRuby 3.4）を2ヶ月おきにリリースする予定です。
Ruby 3.4.3は4月にリリースされ、3.4.4は6月、3.4.5は8月、3.4.6は10月、3.4.7は12月にリリースされます。

多くのユーザーに影響を与えるような変更があった場合、予定よりも早く新しいバージョンをリリースすることがあります。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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
