---
layout: news_post
title: "Ruby 3.4.6 Released"
author: k0kubun
translator: TrES-12
date: 2025-09-16 00:00:00 +0000
lang: en
---

Ruby 3.4.6 がリリースされました。

これは定期的なアップデートであり、バグ修正を含みます。詳しくは [release notes on GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_6) を参照して下さい。

## リリーススケジュール

最新の安定版 Ruby (現在は Ruby 3.4) を最新のリリースから2ヶ月おきにリリースする予定です。Ruby 3.4.7 は11月に、3.4.8 は1月にリリースされる予定です。

ユーザーに重大な影響を与える変更が発生した場合はリリースが予定より早く行われ、それに応じて後続のスケジュールが早まる可能性があります。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.4.6" | first %}

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

Ruby 開発者の皆様、バグや脆弱性を報告してくれたユーザーの皆様のご協力により本リリースは行われています。皆様のご協力に感謝します。
