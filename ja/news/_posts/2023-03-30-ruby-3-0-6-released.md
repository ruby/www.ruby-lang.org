---
layout: news_post
title: "Ruby 3.0.6 リリース"
author: "usa"
translator: "ytjmt"
date: 2023-03-30 12:00:00 +0000
lang: ja
---

Ruby 3.0.6 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事を参照してください。

* [CVE-2023-28755: ReDoS vulnerability in URI]({%link en/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: ReDoS vulnerability in Time]({%link en/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

このリリースには、いくつかのビルド上の問題への対応も含まれています。
詳しくは [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_0_6) を参照してください。

このリリースをもって、Ruby 3.0 系列の通常メンテナンスフェーズは終了し、セキュリティメンテナンスフェーズに移行します。
セキュリティメンテナンスフェーズにおいては、単なるバグの修正は行われず、セキュリティ上の問題の修正のみが行われます。

セキュリティメンテナンスフェーズの期間は 1 年間を予定しており、その期間が過ぎると、Ruby 3.0 系列のメンテナンスは完全に終了します。
したがって、ユーザーの皆様におかれましては、速やかに Ruby 3.1 あるいは 3.2 への移行を計画し、準備を進めることをお薦めします。

## ダウンロード

{% assign release = site.data.releases | where: "version", "3.0.6" | first %}

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
