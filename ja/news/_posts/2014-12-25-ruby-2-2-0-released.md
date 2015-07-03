---
layout: news_post
title: "Ruby 2.2.0 リリース"
author: "naruse"
translator: "makimoto"
date: 2014-12-25 09:00:00 +0000
lang: ja
---

Ruby 2.2.0 がリリースされたことをお知らせします。

Ruby 2.2.0 には Ruby への多種多様な要望のための多くの新機能と改善が含まれています。

たとえば、新しい Ruby のガーベージコレクタは Symbol オブジェクトのガーベージコレクトができるようになりました。
2.2 以前の GC は Symbol オブジェクトのガーベージコレクトに対応していなかったため、この新しい GC によって Symbol オブジェクトについてのメモリ使用が削減されます。
Rails 5.0 ではこの Ruby 2.2 以降でのみサポートされる Symbol GC が必須とされる予定です。
(詳細は [Rails 4.2 のリリースについてのポスト](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) を参照してください)

また、新たなインクリメンタル GC がガーベージコレクションの休止時間を減少させます。
これも、 Rails アプリケーションを動かすのに役立ちます。

メモリ管理に関するもう一つの機能は、 jemalloc を使用できるように `configure.in` に追加されたオプションです。 [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
これは現段階では実験的な機能で、われわれがパフォーマンスデータとユースケースを確認できるまで、デフォルトでは動作しないように設定されています。
この機能の有効性が確認でき次第、デフォルトで有効にする予定です。

system() と spawn() における vfork(2) の使用を実験的にサポートしました。
この件についての詳細は [田中哲氏のブログエントリ](http://www.a-k-r.org/d/2014-09.html#a2014_09_06) を参照してください。
この機能によって外部コマンドを多数呼び出す際の大幅な高速化が期待されます。
しかし、vfork(2) は使い方によっては有害たりうるシステムコールであり、完全に理解されているわけではありません。
そのため、われわれはこのシステムコールを利用する事によるパフォーマンス上の利点やユースケースを確認していきたいと思っています。

Ruby 2.2.0 でのプログラミングをお楽しみください。また、ぜひ気付いた事があれば報告してください！

## Notable Changes since 2.1

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634) ([RubyKaigi 2014 におけるプレゼンテーション](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* コアライブラリ:
  * Unicode 7.0 のサポート[#9092](https://bugs.ruby-lang.org/issues/9092)
  * 新しいメソッド:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float, Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* バンドルされるライブラリ:
  * Psych 2.0.8 アップデート
  * Rake 10.4.2 アップデート
  * RDoc 4.2.0 アップデート
  * RubyGems 2.4.5 アップデート
  * test-unit 3.0.8 アップデート (レポジトリからは削除されたが tarball にはバンドルされています)
  * minitest 5.4.3 アップデート (レポジトリからは削除されたが tarball にはバンドルされています)
  * mathn を非推奨化
* C API
  * 非推奨な API の削除

詳細は [Ruby レポジトリの NEWS](https://github.com/ruby/ruby/blob/v2_2_0/NEWS) を参照してください。

これらの変更によって、v2.1.0 と比較して、1557 個のファイルが修正され、125039 行が追加され、74376 行が削除されました。

## ダウンロード

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
