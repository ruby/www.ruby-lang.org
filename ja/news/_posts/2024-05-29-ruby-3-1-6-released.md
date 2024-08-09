---
layout: news_post
title: "Ruby 3.1.6 リリース"
author: "hsbt"
translator: "teeta32"
date: 2024-05-29 9:00:00 +0000
lang: ja
---

Ruby 3.1.6 がリリースされました。

現在、Ruby 3.1 系列はセキュリティメンテナンスフェーズのため、通常は脆弱性の修正のみ行います。しかし、Ruby 3.1.5 のリリース後に Ruby のビルドに失敗する問題がいくつか生じたため、この問題を修正する Ruby 3.1.6 がリリースされました。

詳しくは以下の記事を参照してください。

* [Bug #20151: Can't build Ruby 3.1 on FreeBSD 14.0](https://bugs.ruby-lang.org/issues/20151)
* [Bug #20451: Bad Ruby 3.1.5 backport causes fiddle to fail to build](https://bugs.ruby-lang.org/issues/20451)
* [Bug #20431: Ruby 3.3.0 build fail with make: *** \[io_buffer.o\] Error 1](https://bugs.ruby-lang.org/issues/20431)

詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_1_6) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.1.6" | first %}

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
