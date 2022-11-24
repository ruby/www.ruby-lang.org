---
layout: news_post
title: "Ruby 3.0.5 リリース"
author: "usa"
translator:
date: 2022-11-24 12:00:00 +0000
lang: ja
---

Ruby 3.0.5 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事を参照してください。

* [CVE-2021-33621: HTTP response splitting in CGI]({%link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

このリリースには、いくつかのバグ修正も含まれています。
詳しくは [commit logs](https://github.com/ruby/ruby/compare/v3_0_4...v3_0_5) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.0.5" | first %}

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

本リリースを含む Ruby 3.0 のメンテナンスは Ruby アソシエーションの「Ruby 安定版保守事業」に基づき行われています。
