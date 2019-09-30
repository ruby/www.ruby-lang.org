---
layout: news_post
title: "Ruby 2.6.5 リリース"
author: "nagachika"
translator:
date: 2019-10-01 09:00:00 +0000
lang: ja
---

Ruby 2.6.5 がリリースされました。

このリリースには 4 つの脆弱性修正が含まれています。

* [CVE-2019-16255: Shell#[]およびShell#testのコード挿入脆弱性](ja/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md)
* [CVE-2019-16254: WEBrick における HTTP レスポンス偽装の脆弱性について（追加の修正）](ja/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md)
* [CVE-2019-15845: File.fnmatch の NUL 文字挿入脆弱性](ja/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md)
* [CVE-2019-16201: WEBrickのDigest認証に関する正規表現Denial of Serviceの脆弱性](ja/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md)

その他の変更点の詳細は [commit log](https://github.com/ruby/ruby/compare/v2_6_4...v2_6_5) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.6.5" | first %}

* <{{ release.url.bz2 }}>

      SHA256: {{ release.sha256.bz2 }}

* <{{ release.url.gz }}>

      SHA256: {{ release.sha256.gz }}

* <{{ release.url.xz }}>

      SHA256: {{ release.sha256.xz }}

* <{{ release.url.zip }}>

      SHA256: {{ release.sha256.zip }}

## リリースコメント

このリリースにあたり、多くのコミッター、開発者、バグ報告をしてくれたユーザーの皆様に感謝を申し上げます。
