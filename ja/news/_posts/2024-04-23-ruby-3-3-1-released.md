---
layout: news_post
title: "Ruby 3.3.1 リリース"
author: "naruse"
translator: "HiroyasuTawwara"
date: 2024-04-23 10:00:00 +0000
lang: ja
---

Ruby 3.3.1 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事を参照してください。

* [CVE-2024-27282: Arbitrary memory address read vulnerability with Regex search]({%link ja/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: RCE vulnerability with .rdoc_options in RDoc]({%link ja/news/_posts/2024-03-21-rce-rdoc-cve-2024-27281.md %})
* [CVE-2024-27280: Buffer overread vulnerability in StringIO]({%link ja/news/_posts/2024-03-21-buffer-overread-cve-2024-27280.md %})

詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_3_1) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.3.1" | first %}

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
