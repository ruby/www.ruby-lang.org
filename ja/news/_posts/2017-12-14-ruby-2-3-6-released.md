---
layout: news_post
title: "Ruby 2.3.6 リリース"
author: "usa"
translator:
date: 2017-12-14 16:00:00 +0000
lang: ja
---

Ruby 2.3.6 がリリースされました。
これは安定版 2.3 系列の TEENY リリースです。

今回のリリースでは、前回リリースから 10 件弱のバグ修正が行われ、安定性のさらなる向上が図られています。
また、以下のセキュリティ上の問題に対する対応が含まれています。

* [CVE-2017-17405: Net::FTP におけるコマンドインジェクション](/ja/news/2017/12/14/net-ftp-command-injection-cve-2017-17405/)への対応
* [RubyGems における安全でないオブジェクトの逆シリアル化の脆弱性](http://blog.rubygems.org/2017/10/09/unsafe-object-deserialization-vulnerability.html)への対応

詳しくは、対応する [ChangeLog](https://svn.ruby-lang.org/repos/ruby/tags/v2_3_6/ChangeLog) を参照してください。

## ダウンロード

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.tar.bz2)

      SIZE:   14429114 bytes
      SHA1:   07c3b66d544dd22c22fbae3f16cfb3eeb88b7b1e
      SHA256: 07aa3ed3bffbfb97b6fc5296a86621e6bb5349c6f8e549bd0db7f61e3e210fd0
      SHA512: bc3c7a115745a38e44bd91eb5637b1e412011c471d9749db7960185ef75737b944dd0e524f22432809649952ca7d93f46d458990e9cd2b0db5ca8abf4bc8ea99

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.tar.gz)

      SIZE:   17840901 bytes
      SHA1:   4e6a0f828819e15d274ae58485585fc8b7caace0
      SHA256: 8322513279f9edfa612d445bc111a87894fac1128eaa539301cebfc0dd51571e
      SHA512: 104553d888f7d49d1b8df0cff0a3e8aee3086183d75e1a88289730e34c2da669874d7abe83e84bf1b3be9a3337a34f19ea9f9dcfbf1f7fc1136bb8f922776ea4

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.tar.xz)

      SIZE:   11445628 bytes
      SHA1:   55e97913180a313f161d2e4e541dd904a477c31d
      SHA256: e0d969ac22d4a403c1204868bb9c0d068aa35045bb3934cf50b17b7f66059f56
      SHA512: a09c8715097d16190ee17ee39e7a74438cefc9013add350217b7e3fb4d60aa9dcb30595adf832b0d67a5c45b1fe9d4effb767c995af2759420859f8d763c693a

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.6.zip)

      SIZE:   19892406 bytes
      SHA1:   0d631f32e7b360dcbfb9f8f46dfff2445f0a6a51
      SHA256: 6fee49a2099d49a1b98bf0637fe974fd87af3ae64978392c802ba4d10ac70fb5
      SHA512: c6dc2ee01a4ef84850b0ca4d1e60841f07fbff263ebbbc44c8bd0f72ced3172c2e0b9c883496bfc4f5a42f4827a061f8f479d05bda5f693a274c451914e0b03e

## リリースコメント

リリースに協力してくれた皆様に感謝します。

このリリースを含む Ruby 2.3 系列の保守は、[一般財団法人 Ruby アソシエーション](http://www.ruby.or.jp/)の Ruby 安定版保守委託事業に基いています。
