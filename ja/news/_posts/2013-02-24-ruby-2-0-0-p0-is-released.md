---
layout: news_post
title: "Ruby 2.0.0-p0 リリース"
author: "Yusuke Endoh"
date: 2013-02-24 09:06:12 +0000
lang: ja
---

Ruby 2.0.0-p0 がリリースされました。

Ruby 2.0.0 は Ruby 2.0 系列の最初の安定版リリースです。 Ruby
への要求の多様化・大規模化に対応するため、数多くの新機能や改善が搭載されています。

Ruby 2.0.0 でプログラミングを楽しんでください。

## ダウンロード

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      SIZE:   10814890 bytes
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      SIZE:   13608925 bytes
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      SIZE:   15037340 bytes
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## 特徴

### 主要な新機能

主要な変更点は以下のとおりです。

* 言語コア機能
  * キーワード引数: API 設計の新しい柔軟性
  * Module#prepend: クラス拡張の新しい方法
  * シンボルの配列を簡単に作るリテラル %i
  * \_\_dir\_\_: 実行中のファイルのあるディレクトリ名
  * default UTF-8 encoding: 多くのマジックコメントが不要に

* 組み込みライブラリ
  * Enumerable#lazy / Enumertor::Lazy: 無限の遅延ストリーム
  * Enumerable#size: 遅延サイズ評価
  * \#to\_h: Hash への変換メソッド
  * Onigmo (鬼雲): 新しい正規表現エンジン (鬼車の fork)
  * 非同期例外を安全にハンドリングする API

* デバッグサポート
  * DTrace サポート: 本番環境での実行時診断を可能にする機能
  * TracePoint: 改善されたトレース API

* 性能改善
  * bitmap marking による GC 最適化
  * Rails の起動時間を大幅に短縮する Kernel#require の最適化
  * メソッドディスパッチなどの VM 最適化
  * 浮動小数演算の最適化

また、実験的機能としてではありますが、Ruby のモジュール性に対する新しい 概念となる refinement も提供されています。

新機能の詳しい情報については NEW ファイルもご参照ください。

### 互換性

2\.0.0 の設計では 1.9 と互換であることに非常に注意を払っています。 1.9 から 2.0 への移行は、1.8 から 1.9
の移行より苦労しないと思います。 (大きめの非互換については後述します)

実際、サードパーティの献身的な活動によって、Rails や tDiary など、 いくつかの広く使われているアプリケーションが 2.0.0 の
Release Candidate 版で動作することが報告されています。

### ドキュメント

長年の懸案であったドキュメント不足についても、rdoc が大幅に追加され、 1.9.3 のときはドキュメント率が 60%
だったのに対し、2.0.0 では 75% と なり、大きく改善しています。また、Ruby の構文の説明も追加されています。

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

で読むことができます。

### 安定性

TEENY が 0 ですが、1.9.0 と違い、2.0.0 は「安定版」リリースであることに ご注意ください。ライブラリ作者には 2.0.0
をサポートすることを推奨します。 上述の通り、1.9 から 2.0 への移行は比較的容易なはずです。

Ruby 2.0.0 は実用可能な状態であり、あなたの Ruby 生活を確実に改善します。

## 注意点

### 紹介記事

サードパーティによる新機能の紹介記事があります。

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  (包括的、おすすめ)
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  (包括的、おすすめ)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  (概要のみ、日本語)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  (Enumerator::Lazy のみ、日本語)

以下の記事も参考になりますが、refinement に関しての記述が古いです。

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

また、\"Rubyist Magazine\" の最新号で 2.0.0 の一部の新機能を紹介する記事が 掲載されています。

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

日本語で書かれていますが、後日英訳もされる見込みです。

### 非互換について

特筆すべき非互換を 5 つ把握しています。

* デフォルトのスクリプトエンコーディングが UTF-8 になりました \[#6679\] 。
  これは既存のプログラムに影響を与えることが報告されています。例えば、 ベンチマークプログラムが非常に遅くなるなど
  \[ruby-dev:46547\] 。
* iconv が削除されました。元々 M17N が導入された 1.9 の時点で非推奨の ものでした。String#encode
  などを使って書き換えてください。
* ABI 互換性がなくなっています \[ruby-core:48984\] 。通常のユーザは、拡張
  ライブラリを再インストールするだけでよいはすです。「1.9 の .so, .bundle ファイルをコピーするな」とだけ気をつけてください。
* \#lines, #chars, #codepoints, #bytes メソッドが Enumerator ではなく
  配列を返すようになりました \[#6670\]。この変更によって、\"lines.to\_a\" というイディオムを書く必要がなくなります。
  Enumerator が必要な場合は #each\_line などを利用して下さい。
* Object#inspect は #to\_s を呼び出さず、常に #&lt;ClassName:0x...&gt; のような
  文字列を返すようになりました。 \[#2152\]

他にも比較的小さな非互換があります。\[ruby-core:49119\]

### Refinements の扱い

Ruby のモジュール性に新しい概念を与える Refinement と呼ばれる機能を追加しました。 しかし、Refinement
は「実験的機能」であることに注意してください。将来仕様が変化 する可能性があります。 それでも、ぜひお試し頂き、感想をお聞かせください。
あなたのフィードバックによってこの機能を進化させていきたいと思っています。

## 謝辞

2\.0.0 は非常に多くの人々の貢献によって成り立っています。 貢献のごく一部の不完全な謝辞ですら、ここに掲載するには大きくなりすぎました。
special thanks のページヘのリンクを貼ることでその代わりとさせてください。

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][13]



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[5]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[6]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[7]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[8]: http://rubysource.com/a-look-at-ruby-2-0/
[9]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[10]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[11]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[12]: http://jp.rubyist.net/magazine/?0041-200Special
[13]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
