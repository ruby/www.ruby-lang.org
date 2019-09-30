---
layout: news_post
title: "Ruby 2.4.8 リリース"
author: "usa"
translator:
date: 2019-10-01 09:00:00 +0000
lang: ja
---

Ruby 2.4.8 がリリースされました。
これは 2.4 系列のセキュリティ修正リリースです。

今回のリリースでは、以下のセキュリティ上の問題に対する対応が含まれています。

* [CVE-2019-16255: Shell#[]およびShell#testのコード挿入脆弱性](ja/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md)
* [CVE-2019-16254: WEBrick における HTTP レスポンス偽装の脆弱性について（追加の修正）](ja/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md)
* [CVE-2019-15845: File.fnmatch の NUL 文字挿入脆弱性](ja/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md)
* [CVE-2019-16201: WEBrickのDigest認証に関する正規表現Denial of Serviceの脆弱性](ja/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md)

Ruby 2.4 系列は、現在、セキュリティメンテナンスフェーズにあります。
このフェーズ中は、重大なセキュリティ上の問題への対応のみが行われます。
現在の予定では、2020 年 3 月末頃を目処に、2.4 系列のセキュリティメンテナンスならびに公式サポートは終了する見込みです。
現在、2.4 系列を利用しているユーザーの皆さんは、なるべく早く、2.6 系列等のより新しいバージョン系列の Ruby への移行を検討されるよう、お勧めします。

## ダウンロード

{% assign release = site.data.releases | where: "version", "2.4.8" | first %}

* <{{ release.url.bz2 }}>

      SHA256: {{ release.sha256.bz2 }}

* <{{ release.url.gz }}>

      SHA256: {{ release.sha256.gz }}

* <{{ release.url.xz }}>

      SHA256: {{ release.sha256.xz }}

* <{{ release.url.zip }}>

      SHA256: {{ release.sha256.zip }}


## リリースコメント

リリースに協力してくれた皆様、また、脆弱性情報を報告してくれた皆様に感謝します。
