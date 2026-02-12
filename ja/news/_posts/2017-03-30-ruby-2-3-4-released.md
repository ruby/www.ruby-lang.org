---
layout: news_post
title: "Ruby 2.3.4 リリース"
author: "nagachika"
translator:
date: 2017-03-30 00:00:00 +0000
lang: ja
---

Ruby 2.3.4 がリリースされました。
これは安定版 2.3 系列の TEENY リリースです。

今回のリリースでは、前回リリースからおよそ 80 件のバグ修正が行われ、安定性のさらなる向上が図られています。
詳しくは、対応する [コミットログ](https://github.com/ruby/ruby/compare/v2_3_3...v2_3_4) を参照してください。

また今回のリリースに Symbol#hash の非決定性が失なわれているという不具合の修正が含まれています。
これは 2.3.3 以前の 2.3 系列に固有の不具合です。
詳細は [Bug #13376](https://bugs.ruby-lang.org/issues/13376) を参照してください。

## 既知の不具合について (2017年4月11日追記)

Ruby 2.3.4 において、拡張ライブラリ向け API の非互換性問題が発見されています。
具体的には `rb_thread_fd_close` という API が誤って削除されています。
次回リリース時には修正される予定ですが、この API を利用している拡張ライブラリを使用しており、緊急に対応が必要なユーザーは、以下のパッチを利用してください。

* [rb_thread_fd_close 対応パッチ](https://git.ruby-lang.org/ruby.git)

## ダウンロード

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.tar.bz2)

      SIZE:   14434361 bytes
      SHA1:   f5b18e7149ec7620444c91962e695708829d0216
      SHA256: cd9808bb53824d6edb58beaadd3906cb23b987438ce75ab7bb279b2229930e2f
      SHA512: ad1f16142615498232d0de85149585be1d2c5de2bc40ec160d272a09e098ef6f317d8b25026001735261fd1c5bc0d1f8513a8474e89f0d86eed5b2fe7338d64e

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.tar.gz)

      SIZE:   17820518 bytes
      SHA1:   d064b9c69329ca2eb2956ad57b7192184178e35d
      SHA256: 98e18f17c933318d0e32fed3aea67e304f174d03170a38fd920c4fbe49fec0c3
      SHA512: 23b68ff1f7ab0323876d6135f232f895a5d5009b4128711a685003563828492afb330e589ca614581a49e43027c34e251d96a3fc10330cdfdd11a2537af0233f

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.tar.xz)

      SIZE:   11450108 bytes
      SHA1:   8ee952fa7c2466d53868143e867dc08a153e20df
      SHA256: 341cd9032e9fd17c452ed8562a8d43f7e45bfe05e411d0d7d627751dd82c578c
      SHA512: 9e3adc2de6703e50e75db37db2981006d4c69759929d61db6a0d63627cfe5977d0ad66d2c69d7161cfc0c0d1c2cb38e5181a06ccd2790df2f72ec25c2ad01e02

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.4.zip)

      SIZE:   19869837 bytes
      SHA1:   47a926289e4f007b1a338617f925dd858ea3da97
      SHA256: e70b716982be704375129d4fc0ef305fd8d8151f64e0fcb12de791ab956a526d
      SHA512: 6fab3a737f494d33f91a40881d4ab16a938e98cf0f344fba90104d5cf9e6d02d7c17f64512c2f1ffd67f64ad5dd38477fab0d17614c1ff22627f18232186315a

## リリースコメント

このリリースにあたり、コミッター、開発者、バグ報告をしてくれたユーザーの皆様に感謝を申し上げます。
