---
layout: news_post
title: "Ruby 2.4.7 リリース"
author: "usa"
translator:
date: 2019-08-28 09:00:00 +0000
lang: ja
---

Ruby 2.4.7 がリリースされました。
これは 2.4 系列のセキュリティ修正リリースです。

今回のリリースでは、以下のセキュリティ上の問題に対する対応が含まれています。

* [RDoc における jQuery の脆弱性について](/ja/news/2019/08/28/multiple-jquery-vulnerabilities-in-rdoc/)への対応

Ruby 2.4 系列は、現在、セキュリティメンテナンスフェーズにあります。
このフェーズ中は、重大なセキュリティ上の問題への対応のみが行われます。
現在の予定では、2020 年 3 月末頃を目処に、2.4 系列のセキュリティメンテナンスならびに公式サポートは終了する見込みです。
現在、2.4 系列を利用しているユーザーの皆さんは、なるべく早く、2.6 系列等のより新しいバージョン系列の Ruby への移行を検討されるよう、お勧めします。

## ダウンロード

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.7.tar.bz2>

      SIZE:   12826941 bytes
      SHA1:   9eac11cd50a2c11ff310e88087f25a0ceb5d0994
      SHA256: c10d6ba6c890aacdf27b733e96ec3859c3ff33bfebb9b6dc8e96879636be7bf5
      SHA512: 2665bca5f55d4b37f100eec0e2e632d41158139b85fcb8d5806c6dc1699e64194f17b9fe757b5afd6aa2c6e7ccabba8710a9aa8182a2d697add11f2b76cf6958

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.7.tar.gz>

      SIZE:   16036496 bytes
      SHA1:   607384450348bd87028cd8d1ebf09f21103d0cd2
      SHA256: cd6efc720ca6a622745e2bac79f45e6cd63ab0f5a53ad7eb881545f58ff38b89
      SHA512: 2fbada1cf92dc3b1cbdaf05186ff2e5d8e0ce4ac9dc736148116e365bec6d557a2115838404c982b527adbb27677340acfbbb7c873004f0cb4be8a07857e6473

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.7.tar.xz>

      SIZE:   10118948 bytes
      SHA1:   6ed0e943bfcbf181384b48e7873361f1acaf106d
      SHA256: a249193c7e79b891a4783f951cad8160fa5fe985c385b4628db8e9913bff1f98
      SHA512: df637c5803ddd83f759e9c24b0e7ca1f6cae7c7b353409583d92dbffece0d9d02b48905d6552327a1522a4a37d4e2d22c6c11bd991383835be35e2f31739d649

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.7.zip>

      SIZE:   17659539 bytes
      SHA1:   3f991d6b5296e9d0df405033e336bb973d418354
      SHA256: 1016797925e55c78d9c15633da8ddbd19daed2993a99d35377d2a16c3175cfe5
      SHA512: 1bddd5616edb1a671224bc1c22cc3ac6f70e96e41cb2937efb437e8920fe09ce2ef0f29c591499d3682ac547e1d3eb7474f89ff86a3834d25724329e4927ed76

## リリースコメント

リリースに協力してくれた皆様、また、脆弱性情報を報告してくれた皆様に感謝します。
