---
layout: news_post
title: "Ruby 2.7.6 リリース"
author: "usa and mame"
translator: "jinroq"
date: 2022-04-12 12:00:00 +0000
lang: ja
---

Ruby 2.7.6 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事などを参照してください。

* [CVE-2022-28739: String から Float 変換時のバッファオーバーラン]({%link ja/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

このリリースには、いくつかのバグ修正も含まれています。
詳しくは [commit logs](https://github.com/ruby/ruby/compare/v2_7_5...v2_7_6) を参照してください。

このリリースをもって、Ruby 2.7 系列の通常メンテナンスフェーズは終了し、セキュリティメンテナンスフェーズに移行します。
セキュリティメンテナンスフェーズにおいては、単なるバグの修正は行われず、セキュリティ上の問題の修正のみが行われます。
セキュリティメンテナンスフェーズの期間は 1 年間を予定しており、その期間が過ぎると、Ruby 2.7 系列のメンテナンスは完全に終了します。
したがって、ユーザーの皆様におかれましては、速やかに Ruby 3.1 あるいは 3.0 への移行を計画し、準備を進めることをお薦めします。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.7.6" | first %}

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

本リリースを含む Ruby 2.7 のメンテナンスは Ruby アソシエーションの「Ruby 安定版保守事業」に基づき行われています。
