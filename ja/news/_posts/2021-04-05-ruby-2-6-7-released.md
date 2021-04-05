---
layout: news_post
title: "Ruby 2.6.7 Released"
author: "usa"
translator:
date: 2021-04-05 12:00:00 +0000
lang: ja
---

Ruby 2.6.7 がリリースされました。

このリリースには、多数のバグ修正、および、幾つかの脆弱性修正が含まれています。
脆弱性修正については、以下の記事を参照してください。

* [CVE-2020-25613: Potential HTTP Request Smuggling Vulnerability in WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: XML round-trip vulnerability in REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

個々の修正の詳細については、[commit logs](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7) を参照してください。

このリリースをもって、Ruby 2.6 系列の通常メンテナンスフェーズは終了し、セキュリティメンテナンスフェーズに移行します。
セキュリティメンテナンスフェーズにおいては、単なるバグの修正は行われず、セキュリティ上の問題の修正のみが行われます。
セキュリティメンテナンスフェーズの期間は 1 年間を予定しており、その期間が過ぎると、Ruby 2.6 系列のメンテナンスは完全に終了します。
したがって、ユーザーの皆様におかれましては、速やかに Ruby 3.0 あるいは 2.7 への移行を計画し、準備を進めることをお薦めします。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

本リリースを含む Ruby 2.6 のメンテナンスは Ruby アソシエーションの「Ruby 安定版保守事業」に基づき行われています。
