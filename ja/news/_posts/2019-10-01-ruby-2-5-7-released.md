---
layout: news_post
title: "Ruby 2.5.7 リリース"
author: "usa"
translator:
date: 2019-10-01 09:00:00 +0000
lang: ja
---

Ruby 2.5.7 がリリースされました。
これは安定版 2.5 系列の TEENY リリースです。

今回のリリースには、以下のセキュリティ上の問題に対する対応が含まれています。

* [CVE-2019-16255: Shell#[]およびShell#testのコード挿入脆弱性](ja/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md)
* [CVE-2019-16254: WEBrick における HTTP レスポンス偽装の脆弱性について（追加の修正）](ja/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md)
* [CVE-2019-15845: File.fnmatch の NUL 文字挿入脆弱性](ja/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md)
* [CVE-2019-16201: WEBrickのDigest認証に関する正規表現Denial of Serviceの脆弱性](ja/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md)

詳しくは、対応する [commit log](https://github.com/ruby/ruby/compare/v2_5_6...v2_5_7) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.5.7" | first %}

* <{{ release.url.bz2 }}>

      SHA256: {{ release.sha256.bz2 }}

* <{{ release.url.gz }}>

      SHA256: {{ release.sha256.gz }}

* <{{ release.url.xz }}>

      SHA256: {{ release.sha256.xz }}

* <{{ release.url.zip }}>

      SHA256: {{ release.sha256.zip }}

## リリースコメント

リリースに協力してくれた皆様に感謝します。

このリリースを含む Ruby 2.5 系列の保守は、[一般財団法人 Ruby アソシエーション](http://www.ruby.or.jp/)の Ruby 安定版保守委託事業に基いています。
