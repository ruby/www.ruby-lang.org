---
layout: news_post
title: "Ruby 2.7.4 リリース"
author: "usa"
translator:
date: 2021-07-07 09:00:00 +0000
lang: ja
---

Ruby 2.7.4 がリリースされました。

このリリースでは以下の脆弱性修正が含まれています。
詳しくは以下の記事などを参照してください。

* [CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP]({%link en/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP]({%link en/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: RDoc におけるコマンドインジェクションの脆弱性について]({%link ja/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

その他の変更については [commit log](https://github.com/ruby/ruby/compare/v2_7_3...v2_7_4) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.7.4" | first %}

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

Ruby 開発者の皆様、バグや脆弱性を報告してくれたユーザーの皆様のご協力により本リリースは行われています。 皆様のご協力に感謝します。

本リリースを含む Ruby 2.7 のメンテナンスは Ruby アソシエーションの「Ruby 安定版保守事業」に基づき行われています。
