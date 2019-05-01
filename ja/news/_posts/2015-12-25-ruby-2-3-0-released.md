---
layout: news_post
title: "Ruby 2.3.0 リリース"
author: "naruse"
translator: "sorah"
date: 2015-12-25 17:00:00 +0000
lang: ja
---

Ruby 2.3 シリーズの最初の安定版である、Ruby 2.3.0 のリリースをお知らせします。

Ruby 2.3.0 には以下に示すようなたくさんの新機能が含まれています:

[Frozen String Literal プラグマ](https://bugs.ruby-lang.org/issues/11473) が導入されました。
Ruby 2.1 では既に、オブジェクトアロケーション削減のために `"str".freeze` が最適化されていましたが、Ruby 2.3 では 1 ファイル中の全 String リテラルを freeze する新しいマジックコメントとコマンドラインオプションが導入されました。
また、`can't modify frozen String` エラーのデバッグを容易にするため、当該エラーにおいてどこで対象の String オブジェクトが作成されたかを表示する `--debug=frozen-string-literal` コマンドラインオプションが追加されました。

[safe navigation operator](https://bugs.ruby-lang.org/issues/11537) ([lonely operator](https://instagram.com/p/-M9l6mRPLR/) `&.` とも呼ばれています) が導入されました。これは `nil` の扱いをやりやすくするものです。既に C#, Groovy, Swift などでも同様の機能が存在します。
また、`Array#dig`, `Hash#dig` も追加されました。
safe navigation operator は、`nil` のみを取り扱う [Active Support における try!](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21) と同様の挙動をする事について注意してください。

[did_you_mean gem がバンドル](https://bugs.ruby-lang.org/issues/11252) されました。
この gem は `NameError` と `NoMethodError` の発生時、デバッグを容易にするため、正しい名前と思われる候補を合わせて表示します。

[RubyVM::InstructionSequence#to_binary と .load_from_binary](https://bugs.ruby-lang.org/issues/11788) が experimental feature として追加されました。
これらを活用することにより、ISeq (バイトコード) をプリコンパイルする仕組みを実装することができます。

また、Ruby 2.3.0 にはさまざまなパフォーマンス改善が含まれています。例えば、
[method entry データ構造の再検討](https://bugs.ruby-lang.org/issues/11278),
[新しい table data 構造](https://bugs.ruby-lang.org/issues/11420),
[Proc#call 最適化](https://bugs.ruby-lang.org/issues/11569),
オブジェクトアロケーションとメソッド呼び出しのコードにおけるマシンコードレベルでの最適化,
[よりスマートな instance variable データ構造](https://bugs.ruby-lang.org/issues/11170),
[Socket#*_nonblock メソッド群における exception: false キーワード引数のサポート](https://bugs.ruby-lang.org/issues/11229)
などが上げられます。その他の改善については NEWS ファイルの Implementation improvements セクションをごらんください。

その他、全新機能のリストや互換性については、[NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS) と [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog) をごらんください。

なお、Ruby 2.2.0 から [2946 ファイルが変更され, 104057 行追加, 59478 行の削除](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0) が行われました!

メリークリスマス。Ruby とともに良き休日をおすごしください。

## ダウンロード

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
