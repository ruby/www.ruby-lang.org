---
layout: news_post
title: "Ruby 3.4.4 リリース"
author: k0kubun
translator: teeta32
date: 2025-05-14 18:20:00 +0000
lang: ja
---

Ruby 3.4.4 がリリースされました。

本リリースはローカル変数に関係する YJIT のバグ修正を含み、Windows で GCC 15 を使用してビルドする際の問題に対処しています。
この修正をできるだけ早く利用できるように予定より前にリリースされました。
また、他にもいくつかのバグ修正を含んでいます。

詳しくは[GitHub release notes](https://github.com/ruby/ruby/releases/tag/v3_4_4)を参照してください。

## リリーススケジュール

最新の安定版 Ruby (現在は Ruby 3.4) を最新のリリースから2ヶ月おきにリリースする予定です。
本リリース(3.4.4)に続けて Ruby 3.4.5が7月に予定されており、3.4.6が9月に、3.4.7が11月に、そして3.4.8が1月に予定されています。

ユーザーに重大な影響を与える変更が発生した場合はリリースが予定より早く行われ、それに応じて後続のスケジュールが早まる可能性があります。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.4.4" | first %}

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
