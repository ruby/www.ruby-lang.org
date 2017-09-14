---
layout: news_post
title: "Ruby 2.3.5 リリース"
author: "usa"
translator:
date: 2017-09-14 12:00:00 +0000
lang: ja
---

Ruby 2.3.5 がリリースされました。
これは安定版 2.3 系列の TEENY リリースです。

今回のリリースでは、前回リリースから 70 件余りのバグ修正が行われ、安定性のさらなる向上が図られています。
また、以下のセキュリティ上の問題に対する対応が含まれています。

* [CVE-2017-0898: Kernel.sprintf におけるバッファーアンダーラン](/ja/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)への対応
* [CVE-2017-10784: WEBrick の BASIC 認証におけるエスケープシーケンス挿入](/ja/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)への対応
* [CVE-2017-14033: OpenSSL の ASN1 デコードにおけるバッファーアンダーラン](/ja/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)への対応
* [CVE-2017-14064: JSON の生成時におけるヒープ暴露](/ja/news/2017/09/14/json-heap-exposure-cve-2017-14064/)への対応
* [RubyGems の複数の脆弱性](/ja/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)への対応
* 添付の libyaml を 0.1.7 に更新

詳しくは、対応する [ChangeLog](http://svn.ruby-lang.org/repos/ruby/tags/v2_3_5/ChangeLog) を参照してください。

## ダウンロード

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.bz2)

      SIZE:   NNNN bytes
      SHA1:   XXXX
      SHA256: XXXX
      SHA512: XXXX

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz)

      SIZE:   NNNN bytes
      SHA1:   XXXX
      SHA256: XXXX
      SHA512: XXXX

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.xz)

      SIZE:   NNNN bytes
      SHA1:   XXXX
      SHA256: XXXX
      SHA512: XXXX

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.zip)

      SIZE:   NNNN bytes
      SHA1:   XXXX
      SHA256: XXXX
      SHA512: XXXX

## リリースコメント

リリースに協力してくれた皆様に感謝します。

このリリースを含む Ruby 2.3 系列の保守は、[一般財団法人 Ruby アソシエーション](http://www.ruby.or.jp/)の Ruby 安定版保守委託事業に基いています。
