---
layout: news_post
title: "Ruby 2.7.2 リリース"
author: "nagachika"
translator:
date: 2020-10-02 11:00:00 +0000
lang: ja
---

Ruby 2.7.2 がリリースされました。

このリリースでは depreceted カテゴリの警告についての意図的な非互換が含まれています。
2.7.2 以降では deprecated カテゴリの警告はデフォルトの状態で出力が抑制されます。
コマンドラインオプション -w や -W:deprecated を明示的に指定することで deprecated 警告が出力されます。
詳しくは以下のチケットなどを参照してください。

* [Feature #17000 2.7.2 turns off deprecation warnings by default](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Don't emit deprecation warnings by default.](https://bugs.ruby-lang.org/issues/16345)

またこのリリースでは標準添付されている webrick の以下の脆弱性修正を含む新バージョンへの更新も含まれています。

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick](/en/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

その他の変更については [commit log](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

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
