---
layout: news_post
title: "Ruby 2.5.7 リリース"
author: "usa"
translator:
date: 2019-10-01 11:00:00 +0000
lang: ja
---

Ruby 2.5.7 がリリースされました。
これは安定版 2.5 系列の TEENY リリースです。

今回のリリースには、以下のセキュリティ上の問題に対する対応が含まれています。

* [CVE-2019-16255: Shell#[]およびShell#testのコード挿入脆弱性]({% link ja/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: WEBrick における HTTP レスポンス偽装の脆弱性について（追加の修正）]({% link ja/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: File.fnmatch の NUL 文字挿入脆弱性]({% link ja/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: WEBrickのDigest認証に関する正規表現Denial of Serviceの脆弱性]({% link ja/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

詳しくは、対応する [commit log](https://github.com/ruby/ruby/compare/v2_5_6...v2_5_7) を参照してください。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.5.7" | first %}

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

このリリースを含む Ruby 2.5 系列の保守は、[一般財団法人 Ruby アソシエーション](http://www.ruby.or.jp/)の Ruby 安定版保守委託事業に基いています。
