---
layout: news_post
title: "Ruby 4.0.2 リリース"
author: k0kubun
translator: egamasa
date: 2026-03-16 23:18:29 +0000
lang: ja
---

Ruby 4.0.2 がリリースされました。

このリリースには [Puma における NoMethodError](https://github.com/puma/puma/issues/3620) に関する YJIT のバグ修正を含む、定期的なアップデートです。
詳細は [GitHub releases](https://github.com/ruby/ruby/releases/tag/v4.0.2) を参照してください。

## リリーススケジュール

最新の安定版Ruby（現在はRuby 4.0）を最新のリリースから2ヶ月おきにリリースする予定です。
Ruby 4.0.3 は5月にリリースされ、4.0.4 は7月、4.0.5 は9月、4.0.6 は11月にリリースされます。

多くのユーザーに影響を与えるような変更があった場合、予定よりも早く新しいバージョンをリリースすることがあり、その後のスケジュールも変更される場合があります。

## ダウンロード

{% assign release = site.data.releases | where: "version", "4.0.2" | first %}

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
