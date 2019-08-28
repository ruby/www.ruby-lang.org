---
layout: news_post
title: "Ruby 2.4.7 リリース"
author: "usa"
translator:
date: 2019-08-27 14:30:00 +0000
lang: ja
---

Ruby 2.4.7 がリリースされました。
これは 2.4 系列のセキュリティ修正リリースです。

今回のリリースでは、以下のセキュリティ上の問題に対する対応が含まれています。

* [RDoc における jQuery の脆弱性について](/ja/news/2019/08/27/multiple-jquery-vulnerabilities-in-rdoc/)への対応

Ruby 2.4 系列は、現在、セキュリティメンテナンスフェーズにあります。
このフェーズ中は、重大なセキュリティ上の問題への対応のみが行われます。
現在の予定では、2020 年 3 月末頃を目処に、2.4 系列のセキュリティメンテナンスならびに公式サポートは終了する見込みです。
現在、2.4 系列を利用しているユーザーの皆さんは、なるべく早く、2.6 系列等のより新しいバージョン系列の Ruby への移行を検討されるよう、お勧めします。

## ダウンロード

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.7.tar.bz2>

      SIZE:   12830620 bytes
      SHA1:   dfb45b5c3edd19ee29d2697da256344b78bd5ac4
      SHA256: e677ff8fdc380fdaf80cd7c92fed125da7919a3807ee4f8baa344cfba1a37752
      SHA512: d71f364ca7937c9469501cbea5a50c0cf33ea918a23cb1f6e64e7cecdfc18baf14e68b94b3d02f40e2e5983379d753c2bbb2e5532af5e216302b1c339e8d3f86

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.7.tar.gz>

      SIZE:   16073060 bytes
      SHA1:   420aa53371aa84271612ed89a7346af67295276a
      SHA256: a546dcd1491274c0dceb3acdb43f96d51049ece682226e12e8f1ccf0a9daebf1
      SHA512: e24edc281aed1869ee0d497fda1674b5ed8391817d94bcf493f0ccd6f45b3809e6c38d7fdcf6ce0eb9289d84f99b886ba198a5d77de362cb26bda2ab6db94d90

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.7.tar.xz>

      SIZE:   10141968 bytes
      SHA1:   20608bb57e2c4bdab7172d4fc253d77e37632509
      SHA256: aad833c5e3fe7222ed4f5ddd25e47e7691651986bae80c43ecf663540f8d4acc
      SHA512: 36996efd325303bf0b410c6e5950796df13636a28dcb508436e398ae8f64c248e5ee56ab2b076a6506eabe10848e38dbab66cc8202c5c42d00ee294b5a6df38b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.7.zip>

      SIZE:   17659404 bytes
      SHA1:   1c006ced0ff8f482cb6d43f2ecab53c61794a4ae
      SHA256: 49b885f8ce8d8a973501250b33f3bc739add488c89c28b53becd27c39b0ef908
      SHA512: 3ba006e93aaa7c6403770b406d5aba3c7200df86f0d740ade67d563e9728408b6492e6f2df8eaa722f4302c4977d82ca39e727a12c81e8592c8cc4a8cb07dd40

## リリースコメント

リリースに協力してくれた皆様、また、脆弱性情報を報告してくれた皆様に感謝します。