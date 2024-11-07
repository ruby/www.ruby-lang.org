---
layout: news_post
title: "Ruby 3.3.6 リリース"
author: k0kubun
translator: yokomaru
date: 2024-11-05 04:25:00 +0000
lang: ja
---

Ruby 3.3.6がリリースされました。

これは定期的なアップデートであり、マイナーなバグ修正を含みます。
また、Ruby 3.5でバンドルされるデフォルトの gem の依存関係の警告が表示されなくなります。
詳しくは[GitHub release notes](https://github.com/ruby/ruby/releases/tag/v3_3_6)を参照してください。

## リリーススケジュール

以前[お知らせ](https://www.ruby-lang.org/ja/news/2024/07/09/ruby-3-3-4-released/)したとおり、最新の安定版Ruby（現在は Ruby 3.3）を `.1` リリース後の2ヶ月おきにリリースする予定です。

Ruby 3.3.7は1月7日にリリースされる予定です。多くのユーザーに影響を与えるような変更があった場合、予定よりも早く新しいバージョンをリリースすることがあります。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

- <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

- <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

- <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## リリースコメント

Ruby 開発者の皆様、バグや脆弱性を報告してくれたユーザーの皆様のご協力により本リリースは行われています。
皆様のご協力に感謝します。
