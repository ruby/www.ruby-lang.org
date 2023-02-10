---
layout: news_post
title: "Ruby 2.7.7 リリース"
author: "usa"
translator:
date: 2022-11-24 12:00:00 +0000
lang: ja
---

Ruby 2.7.7 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事を参照してください。

* [CVE-2021-33621: HTTP response splitting in CGI]({%link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

このリリースには、いくつかのビルド上の問題への対応も含まれています。これらの変更は以前のバージョンとの互換性には影響しないと判断されています。
詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v2_7_7) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.7.7" | first %}

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

Ruby 開発者の皆様、バグや脆弱性を報告してくれたユーザーの皆様のご協力により本リリースは行われています。
皆様のご協力に感謝します。
