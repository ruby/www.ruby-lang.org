---
layout: news_post
title: "Ruby 2.3.0-preview2 リリース"
author: "naruse"
translator: "makimoto"
date: 2015-12-11 14:00:00 +0000
lang: ja
---

Ruby 2.3.0-preview2 がリリースされました。

Ruby 2.3.0-preview2 は Ruby 2.3.0 の2つ目のプレビューです。
多くの新機能と改善が含まれます。

[Frozen String Literal Pragma](https://bugs.ruby-lang.org/issues/11473) が導入されました。
Ruby 2.1 から `"str".freeze` はオブジェクトアロケーションを削減するように最適化されています。
Ruby 2.3 はソースファイル内の全ての文字列リテラルを不変にする新しいマジックコメントとコマンドラインオプションが導入されます。

またデバッグ用に、`--debug=frozen-string-literal` コマンドラインオプションによって、
`"can't modify frozen String"` エラーが発生したときにそのオブジェクトがどこで生成されたかを知ることができます。

[safe navigation operator](https://bugs.ruby-lang.org/issues/11537) `&.` (またの名を[ぼっちオペレータ](https://instagram.com/p/-M9l6mRPLR/)) が導入されました。
safe navigation operator は C# や Groovy、Swift にも存在し、`obj&.foo` のように `nil` のハンドリングを簡単にするためのものです。
他にも `Array#dig` と `Hash#dig` が追加されました。

[did_you_mean gem がバンドルされました](https://bugs.ruby-lang.org/issues/11252)。
did_you_mean gem は、デバッグを容易にするために `NameError` や `NoMethodError` 発生時に候補を表示させます。

[RubyVM::InstructionSequence#to_binary と .load_from_binary](https://bugs.ruby-lang.org/issues/11788) は実験的機能として導入されます。
これらの機能によって、われわれは ISeq (バイトコード) プリコンパイルシステムを作ることができます。

Ruby 2.3 は多くのパフォーマンスチューニングの修正を含みます。
例えば以下のものがあります。
[Proc#call の最適化](https://bugs.ruby-lang.org/issues/11569)、
[メソッドエントリデータ構造の再考](https://bugs.ruby-lang.org/issues/11278)、
[新しいテーブルデータ構造の導入](https://bugs.ruby-lang.org/issues/11420)、
オブジェクトアロケーションとメソッド呼び出しコードのマシンコードレベルのチューニングなど、
その他多くの最適化が行なわれています。

Ruby 2.3.0-preview2 を試してプログラミングをお楽しみください。
そして、ぜひあなたの知見を報告してください！

## 2.2 からの主な変更

詳細は [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS) および
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
をご覧ください。

これらの変更によって、[1097 ファイルの更新、97466 行の追加 (+), 58685 行の削除 (-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2) が Ruby 2.2.0 から行なわれました。

## ダウンロード

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## リリースコメント

リリーススケジュールやその他の情報もご覧ください：

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
