---
layout: news_post
title: "Ruby 3.4.8 リリース"
author: k0kubun
translator: speak-mentaiko
date: 2025-12-17 00:24:30 +0000
lang: ja
---

Ruby 3.4.8 がリリースされました。

これは定期的なアップデートであり、バグ修正を含みます。
詳しくは [release notes on GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_8) を参照してください。

## リリーススケジュール

最新の安定版 Ruby (現在は Ruby 3.4) を2ヶ月おきにリリースする予定です。
Ruby 3.4.9 は2月にリリースされる予定です。

ユーザーに重大な影響を与える変更が発生した場合はリリースが予定より早く行われ、それに応じて後続のスケジュールが早まる可能性があります。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.4.8" | first %}

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
