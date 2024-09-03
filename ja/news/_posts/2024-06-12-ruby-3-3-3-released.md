---
layout: news_post
title: "Ruby 3.3.3 リリース"
author: "k0kubun"
translator: "egamasa"
date: 2024-06-12 00:30:00 +0000
lang: ja
---

Ruby 3.3.3 がリリースされました。

このリリースには、以下が含まれています。

* RubyGems 3.5.11
* Bundler 2.5.11
* REXML 3.2.8
* strscan 3.0.9
* `--dump=prism_parsetree` を `--parser=prism --dump=parsetree` に置き換えました。
* シンボルのエンコーディング失敗時に、`EncodingError` の代わりに `SyntaxError` を発生させます。
* Ripper での解析時のメモリリークを修正しました。
* YJIT、`**{}`、`Ripper.tokenize`、`RubyVM::InstructionSequence#to_binary`、`--with-gmp` および一部のビルド環境におけるバグ修正

詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_3) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.3.3" | first %}

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
