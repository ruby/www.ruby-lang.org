---
layout: news_post
title: "Ruby 2.6.8 リリース"
author: "usa"
translator:
date: 2021-07-07 09:00:00 +0000
lang: ja
---

Ruby 2.6.8 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事などを参照してください。

* [CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP]({%link en/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP]({%link en/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: RDoc におけるコマンドインジェクションの脆弱性について]({%link ja/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

通常、Ruby 2.6 には脆弱性修正以外の修正は行いませんが、今回のリリースでは、いくつかのリグレッションバグおよびビルド時の問題に対する修正が含まれています。
詳しくは [commit log](https://github.com/ruby/ruby/compare/v2_6_7...v2_6_8) を参照してください。

Ruby 2.6 系列は、現在、セキュリティメンテナンスフェーズにあります。
このフェーズ中は、重大なセキュリティ上の問題への対応のみが行われます。
現在の予定では、2022 年 3 月末頃を目処に、2.6 系列のセキュリティメンテナンスならびに公式サポートは終了する見込みです。
現在、2.6 系列を利用しているユーザーの皆さんは、なるべく早く、3.0 系列等のより新しいバージョン系列の Ruby への移行を検討されるよう、お勧めします。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.6.8" | first %}

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
