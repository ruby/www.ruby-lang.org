---
layout: news_post
title: "Ruby 2.5.9 Released"
author: "usa"
translator:
date: 2021-04-05 12:00:00 +0000
lang: ja
---

Ruby 2.5.9 がリリースされました。

このリリースには以下の脆弱性修正が含まれています。
詳細については以下の記事を参照してください。

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

この他に、ビルドの都合に伴う若干の変更が含まれています。
変更の詳細については [commit logs](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9) を参照してください。

このリリースをもって、Ruby 2.5 系列は EOL となります。
即ち、Ruby 2.5.9 が Ruby 2.5 系列の最後のリリースとなります。
これ以降、仮に新たな脆弱性が発見されても、Ruby 2.5.10 などはリリースされません。
ユーザーの皆様におかれましては、速やかに、より新しい 3.0、2.7、2.6 といったバージョンへの移行を推奨します。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

このリリースに協力してくださった皆様、特に、脆弱性を報告してくださった方々に深く感謝します。
