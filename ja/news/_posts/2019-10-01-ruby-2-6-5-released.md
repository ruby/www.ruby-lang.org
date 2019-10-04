---
layout: news_post
title: "Ruby 2.6.5 リリース"
author: "nagachika"
translator:
date: 2019-10-01 11:00:00 +0000
lang: ja
---

Ruby 2.6.5 がリリースされました。

このリリースには 4 つの脆弱性修正が含まれています。

* [CVE-2019-16255: Shell#[]およびShell#testのコード挿入脆弱性]({% link ja/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: WEBrick における HTTP レスポンス偽装の脆弱性について（追加の修正）]({% link ja/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: File.fnmatch の NUL 文字挿入脆弱性]({% link ja/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: WEBrickのDigest認証に関する正規表現Denial of Serviceの脆弱性]({% link ja/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

その他の変更点の詳細は [commit log](https://github.com/ruby/ruby/compare/v2_6_4...v2_6_5) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.6.5" | first %}

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

このリリースにあたり、多くのコミッター、開発者、バグ報告をしてくれたユーザーの皆様に感謝を申し上げます。
