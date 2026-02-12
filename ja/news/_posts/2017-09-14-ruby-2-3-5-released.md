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

詳しくは、対応する [ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_3_5) を参照してください。

## 既知の不具合について(2017年9月15日追記)

Ruby 2.3.5 において、libgmp および jemalloc と正しくリンクできないという非互換性が発見されています。
次回リリース時には修正される予定ですが、緊急に対応が必要なユーザーは、以下のページから修正を入手してください。

* [Ruby 2.4.2 and 2.3.5 cannot link with libgmp nor jemalloc](https://bugs.ruby-lang.org/issues/13899)

## ダウンロード

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.bz2)

      SIZE:   14439326 bytes
      SHA1:   48302800c78ef9bbfc293ffcc4b6e2c728705bca
      SHA256: f71c4b67ba1bef424feba66774dc9d4bbe02375f5787e41596bc7f923739128b
      SHA512: 3ecc7c0ac10672166e1a58cfcd5ae45dfc637c22cec549a30975575cbe59ec39945d806e47661f45071962ef9404566007a982aedccb7d4241b4459cb88507df

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz)

      SIZE:   17836997 bytes
      SHA1:   3247e217d6745c27ef23bdc77b6abdb4b57a118f
      SHA256: 5462f7bbb28beff5da7441968471ed922f964db1abdce82b8860608acc23ddcc
      SHA512: cd6bbba4fb5a0ab5ce7aa6f3b89d021ea742c5aa7934e24b87554d10e2a3233d416051c11aee90f3d8714d168db523a7bf56ef4dafdd256fc8595169c2db496a

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.xz)

      SIZE:   11437868 bytes
      SHA1:   ef388992fa71cd77c5be960dd7e3bec1280c4441
      SHA256: 7d3a7dabb190c2da06c963063342ca9a214bcd26f2158e904f0ec059b065ffda
      SHA512: c55e3b71241f505b6bbad78b3bd40235064faae3443ca14b77b6356556caed6a0d055dc2e2cd7ebdb5290ab908e06d2b7d68f72469af5017eda4b29664b0d889

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.zip)

      SIZE:   19887946 bytes
      SHA1:   09c80f9021fa2bfc04ae30a1939faad03b0f5b14
      SHA256: c9971e1ccb6e2f1ab32b1fe05416fce0b19a1cd9ba8fa095c77c4bdf2058e514
      SHA512: 6f14d0cc48d6eaf6168316cb45e22af8d2118ba058fd888ce930f12a22cf7e849e2e185cc7c516fe980f30ee9a942accf9d9e2d4b8a2e79c97b87d4bab704495

## リリースコメント

リリースに協力してくれた皆様に感謝します。

このリリースを含む Ruby 2.3 系列の保守は、[一般財団法人 Ruby アソシエーション](http://www.ruby.or.jp/)の Ruby 安定版保守委託事業に基いています。
