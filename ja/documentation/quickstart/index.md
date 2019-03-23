---
layout: page
title: "20分ではじめるRuby"
lang: ja

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Part 4">4</a>
  </div>
  <h1>20分ではじめるRuby</h1>

---

## はじめに

これは20分程度で一通り読み通せる、簡単なRubyチュートリアルです。
Rubyはあらかじめインストールされていることとします
（もしお使いのマシンにRubyが入っていない場合、始める前に
[インストール][installation]しておいてください）。

## インタラクティブRuby

Rubyの処理系には、入力したRubyの文を実行して結果を出力するプログラムが付属しています。
このように対話的なセッションでRubyのコードを試してみるのは、新しい言語を学ぶのに最適です。

IRBを立ち上げましょう(IRBはInteractive Rubyの略です)。

* **macOS** をお使いの場合、`Terminal`を立ち上げて`irb`と入力し、enterキーを押して下さい。
* **Linux** をお使いの場合、shellを立ち上げて`irb`と入力し、enterキーを押して下さい。
* **Windows** をお使いの場合、スタートメニューのRubyから`Interactive Ruby`を起動してください。

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

実行するとこのようになります。この次はどうしましょうか？

`"Hello World"` と入力してください。

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Rubyはあなたの言うとおりにします！

何が起こったのでしょうか。世界一短い “Hello World” プログラムを書いたのでしょうか？
ちょっと違います。2行目はIRBが最後の式を実行した結果を教えてくれているのです。
“Hello World”と出力したいのであれば、もう少し書き加えます:

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts`はRubyで何かを出力する基本的なコマンドです。
では、`=> nil`は何でしょうか？ これはこのコマンドの評価結果です。
`puts`は必ずnilを返します。nilは、「まったく何もない」ことを表すRubyの「値」です。

## 好きなだけ使える計算機をどうぞ

ここまで来れば、IRBを簡単な計算機として使いこなせるはずです。

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

3足す2。簡単ですね。3 *かける* 2はどうでしょうか？
短いのでそのまま入力し直してもよいですが、先ほど入力したところに戻って
変更することもできます。その場合、キーボードの **上向き矢印**(↑) キーを押して、
その行に `3+2` と表示されているのを確認します。確認できたら、
左向き矢印(←)キーを使って、 `+` の直後まで動かし、
バックスペースキーを使って `*` 記号に変更します。

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

続いて、3を2乗してみましょう。

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Rubyでは、 `**` はべき乗するときに使います。
では、平方根(square root)を求めるにはどうすればいいでしょうか？

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

これは一体何なんでしょうか？ 「9の平方根を計算しているのでは」と
思った方は、それで正解です。しかし、もうちょっと詳しく見てみましょう。
まず、 `Math` は一体なんでしょうか？

## 関連コードをグループ化するモジュール

`Math` は数学のためのビルトインモジュール(標準で組み込まれているモジュール)です。
Rubyでは、モジュールには2通りの役割があります。これはその1つ目の役割、
関連するメソッドを馴染みのある名前でグループ化するものです。
`Math` は `sin()` や `tan()` といったメソッドも持っています。

その次はドット（.）です。このドットは何でしょうか？
これは、レシーバの「メッセージ」を指定するためのものです。
では「メッセージ」とは何でしょうか？ この例では、`sqrt(9)`がメッセージになります。
これは「平方根(square root)」の省略形、
`sqrt`というメソッドにパラメータとして`9`を与えて呼び出しています。
このメソッド呼び出しの実行結果は`3.0`という値になります。
`3` ではないことに気づいたかもしれません。
平方根はたいてい整数にならないためです。
そのため、このメソッドは必ず小数（浮動小数点数）を返します。

この計算結果を覚えさせるにはどうすればいいでしょうか？ 実行結果を変数に代入しましょう。

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

たいへん素晴らしい計算機を紹介してきましたが、素晴らしすぎてチュートリアルの冒頭で触れた
伝統的な `Hello World` メッセージからはだいぶ脱線してしまいました……。
[そろそろ本題に戻りましょう。](2/)

[installation]: /ja/documentation/installation/
