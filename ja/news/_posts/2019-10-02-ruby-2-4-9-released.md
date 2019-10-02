---
layout: news_post
title: "Ruby 2.4.9 リリース"
author: "usa"
translator:
date: 2019-10-02 09:00:00 +0000
lang: ja
---

Ruby 2.4.9 がリリースされました。

このリリースは2.4.8の再パッケージです。
2.4.8のtarballはインストールができないという問題がありました
（詳しくは[[Bug #16197]](https://bugs.ruby-lang.org/issues/16197)をご参照ください）。
2.4.8と2.4.9の間のバージョン番号以外の本質的な変更はありません。

Ruby 2.4 系列は、現在、セキュリティメンテナンスフェーズにあります。
このフェーズ中は、重大なセキュリティ上の問題への対応のみが行われます。
現在の予定では、2020 年 3 月末頃を目処に、2.4 系列のセキュリティメンテナンスならびに公式サポートは終了する見込みです。
現在、2.4 系列を利用しているユーザーの皆さんは、なるべく早く、2.6 系列等のより新しいバージョン系列の Ruby への移行を検討されるよう、お勧めします。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

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

リリースに協力してくれた皆様に感謝します。
