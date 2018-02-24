---
layout: news_post
title: "Ruby 2.6.0-preview1 リリース"
author: "naruse"
translator:
date: 2018-02-24 00:00:00 +0000
lang: ja
---

Ruby 2.6.0に向けた最初のプレビューである、Ruby 2.6.0-preview1がリリースされました。

Ruby 2.6.0-preview1は、重要な新機能であるJITを含むため、例年よりも早期にリリースすることにしました。
その一部を以下に紹介します。

## JIT

Ruby 2.6ではJIT (Just-in-time) コンパイラが導入されました。

JITコンパイラはあらゆるRubyプログラムの実行を高速化することを目的としています。
他言語の一般的なJITコンパイラと異なり、RubyのJITコンパイラはC言語のソースコードをファイルとしてディスクに書き、通常のCコンパイラを用いてネイティブコードに変換することでJITコンパイルを行うという手法を用いています。(参考: [Vladimir MakarovのMJIT organization](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization))

JITコンパイルを有効にするには `--jit` オプションをコマンドラインまたは`$RUBYOPT`環境変数を指定します。`--jit-verbose=1`を指定すれば実行中のJITコンパイルの基本的な情報を表示します。その他のオプションについては `ruby --help` を参照ください。

今回のリリースはこのJITコンパイル機能を皆さんの環境で動作を確認して頂くとともに、セキュリティ上の問題が無いかを早期に確認するために行っています。
現在のJITコンパイラはいくつか制限があり、まずgccまたはclangによってビルドされたRubyでかつ、そのコンパイラが実行時に利用可能である必要があります。また、現在はJITコンパイルの基盤を準備している段階で、少数の最適化のみ実装しています。そのため現在でもいくつかのマイクロベンチマークでは潜在的な速度改善が見られるものの、より大きなプログラム、特にRailsアプリケーションなどではJITコンパイラの性能を計測出来る段階ではありません。

今後はインライン化等を実装することでRubyの性能を桁違いに向上させます。また、Visual Studioを筆頭に、サポートする環境も増やしていきます。

引き続き新時代のRubyの実効性能にご期待ください。

## 新機能

* `Random.bytes` の追加 [Feature #4938]
* `Binding#source_location` の追加 [Feature #14230]

  `binding`のソースコード上の位置を `__FILE__` と `__LINE__` の二要素配列として返します。従来でも `eval("[__FILE__, __LINE__]", binding)` とすることでこれらの情報は得られましたが、将来的に `Kernel#eval` は`binding`のソースコード行を無視する変更を予定しているため [Bug #4352]、この新しいメソッドを用いることが今後は推奨されます。

* `Kernel#system` の失敗時に、`false`を返す代わりに例外を上げさせる `:exception` オプションを追加 [Feature #14386]

## パフォーマンスの改善

* 後述の`$SAFE`の変更に伴って考慮すべきことが減ったため、`Proc#call`が高速化されました [Feature #14318]

  `Proc#call` を大量に呼び出す `lc_fizzbuzz` ベンチマークにおいては、1.4倍高速化されています [Bug #10212].

* `block` がブロックパレメータである時、`block.call`が高速化されました [Feature #14330]

  Ruby 2.5ではブロック渡しの性能が改善されましたが [Feature #14045]、加えてRuby 2.6では渡されたブロックの呼び出しも改善されました。
  マイクロベンチマークにおいては2.6倍高速化されています。

## その他の注目すべき 2.5 からの変更点

* `$SAFE` はプロセスグローバルで扱われることになると共に、`0`以外を設定した後に`0`に戻せるようになりました [Feature #14250]
* `ERB.new`に`safe_level`を渡すのは非推奨になりました。また、`trim_mode`と`eoutvar`はキーワード引数に変更されました。 [Feature #14256]
* RubyGems 2.7.6 をマージしました

その他詳細については、[NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview1/NEWS) ファイルまたは[コミットログ](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)を参照してください。

なお、こうした変更により、Ruby 2.5.0 以降では [1115 個のファイルに変更が加えられ、23023 行の追加と 14748 行の削除が行われました](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1) !

今日、2月24日はRubyの25年目の誕生日です。
誕生日おめでとう！ みなさんもRuby 2.6.0-preview1で楽しいプログラミングを！

## ダウンロード

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.gz>

      SIZE:   16082501 bytes
      SHA1:   94b4a2f5f992dc9855364284e9c64316bf129c90
      SHA256: 2023c42676d9237481e1a97157d5e2ecc10db5e320d5b9cf872ec1d293265d61
      SHA512: 004696c4f087333ba7cb2285418dcce70f399966ae8fed817aab9759fd2d75beb088c4aeb294fcd4260112e8422f490cd4dbdfce402d73f96bb679b8bb3e1607

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.zip>

      SIZE:   19807007 bytes
      SHA1:   24d76f67bf913348eca783a2ecf6f3faf37299ae
      SHA256: 6c883927e80430cf07f2d90728d6c2c71164223f378a48ebf964d3b66319f623
      SHA512: 1e7f318cec1b7875fd9891df671078de7585b556695a2a85708483ddcacfd6e0b63b70ec2535e92ff981b4f72063721ed552df49688e066666fcd7ae520ae667

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.bz2>

      SIZE:   14104578 bytes
      SHA1:   9f0fb79643a4673a839b0c8496eccc6e1dbd022d
      SHA256: 8bd6c373df6ee009441270a8b4f86413d101b8f88e8051c55ef62abffadce462
        SHA512: d9cb270529a97670d54f43a0236fab072714e715c39277dab70b7a1843ec818e6700e47e1384c7256f9e0ae41ab2c0b768a0de38a5ecf4f4fff5da6ef5ad4944

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.xz>

      SIZE:   11423984 bytes
      SHA1:   bbbc89d760cdaadbca3cbff587295864edeff0af
      SHA256: 1d99139116e4e245ce543edb137b2a8873c26e9f0bde88d8cee6789617cc8d0e
      SHA512: d12ff29778d8d940344619881b4d8247c2fb6b44ac2b2dbddb7078828e893cfac9a5a95b5588f0afdbed52bdb6dea95cff1b9ce3ad47dfa62209e97dab8810b6
