---
layout: news_post
title: "Ruby 3.3.4 リリース"
author: "k0kubun"
translator: "egamasa"
date: 2024-07-09 00:30:00 +0000
lang: ja
---

Ruby 3.3.4 がリリースされました。

このリリースでは、Ruby 3.3.3 にバンドルされているいくつかの gem （`net-pop`、`net-ftp`、`net-imap` および `prime`）において、gemspec の依存関係が欠落していたリグレッションが修正されました [[Bug #20581]](https://bugs.ruby-lang.org/issues/20581)。
この修正により、Bundler はこれらの gem を Heroku などのプラットフォームへ正常にインストールできるようになりました。
現在 `bundle install` を正常に実行できている場合、この問題は発生しないかもしれません。

そのほか、数多くの軽微なバグ修正を行っています。
詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_4) を参照してください。

## リリーススケジュール

今後は、最新の安定版 Ruby（現在は Ruby 3.3）を `.1` リリース後の2ヶ月おきにリリースする予定です。
Ruby 3.3 の場合、3.3.5 は 9 月 3 日に、3.3.6 は 11 月 5 日に、3.3.7 は 1 月 7 日にリリースされる予定です。

Heroku 上で Ruby 3.3.3 を使用するユーザーに影響を与える今回のリリースのように、多くのユーザーに影響を与えるような変更があった場合、予定よりも早く新しいバージョンをリリースすることがあります。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

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
