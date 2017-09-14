---
layout: news_post
title: "Ruby 2.2.8 リリース"
author: "usa"
translator:
date: 2017-09-14 12:00:00 +0000
lang: ja
---

Ruby 2.2.8 がリリースされました。
今回のリリースでは、以下のセキュリティ上の問題への対応が行われています。

* [CVE-2017-0898: Kernel.sprintf におけるバッファーアンダーラン](/ja/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)への対応
* [CVE-2017-10784: WEBrick の BASIC 認証におけるエスケープシーケンス挿入](/ja/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)への対応
* [CVE-2017-14033: OpenSSL の ASN1 デコードにおけるバッファーアンダーラン](/ja/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)への対応
* [CVE-2017-14064: JSON の生成時におけるヒープ暴露](/ja/news/2017/09/14/json-heap-exposure-cve-2017-14064/)への対応
* [RubyGems の複数の脆弱性](/ja/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)への対応
* 添付の libyaml を 0.1.7 に更新

Ruby 2.2 系列は、現在、セキュリティメンテナンスフェーズにあります。
このフェーズ中は、重大なセキュリティ上の問題への対応のみが行われます。
現在の予定では、2018 年 3 月末頃を目処に、2.2 系列のセキュリティメンテナンスならびに公式サポートは終了する見込みです。
現在、2.2 系列を利用しているユーザーの皆さんは、なるべく早く、2.4 系列等のより新しいバージョン系列の Ruby への移行を検討されるよう、お勧めします。

## ダウンロード

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.bz2)

      SIZE:   NNNN bytes
      SHA1:   XXXX
      SHA256: XXXX
      SHA512: XXXX

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.gz)

      SIZE:   NNNN bytes
      SHA1:   XXXX
      SHA256: XXXX
      SHA512: XXXX

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.xz)

      SIZE:   NNNN bytes
      SHA1:   XXXX
      SHA256: XXXX
      SHA512: XXXX

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.zip](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.zip)

      SIZE:   NNNN bytes
      SHA1:   XXXX
      SHA256: XXXX
      SHA512: XXXX

## リリースコメント

リリースに協力してくれた皆様、特に、脆弱性情報を報告してくれた皆様に感謝します。
