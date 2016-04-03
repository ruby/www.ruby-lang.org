---
layout: page
title: "20分ではじめるRuby"
lang: ja

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>20分ではじめるRuby</h1>

---

この新しいプログラムを調べようとすると、最初の行がハッシュマーク(#)で
始まっていることに気づきます。Rubyでは、ハッシュマークで始まる行の内容は
コメントになり、インタプリタからは無視されます。このファイルの最初の行は
特別な行で、Unix系のOSではファイルをどう実行するかをシェルに知らせてくれます。
その他のコメントは処理内容の説明になっています。

この`say_hi`メソッドはちょっと複雑になっています。

{% highlight ruby %}
# Say hi to everybody
def say_hi
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("each")
    # @names is a list of some kind, iterate!
    @names.each do |name|
      puts "Hello #{name}!"
    end
  else
    puts "Hello #{@names}!"
  end
end
{% endhighlight %}

インスタンス変数の`@names`によって判断が行われているように見えます。
もしこれがnilなら、ドットを3つ表示するだけです。誰もいなければ誰にも挨拶しない、
ということでよいですね？

## サイクルとループ - 別名: イテレーション

`@names`オブジェクトが`each`メソッドを持っている場合、
イテレーションできる何かであるということで、それぞれの人に対して
挨拶をするイテレーションを行います。最後に、
`@names`がそれ以外であれば、自動的に文字列へ変換させてデフォルトの挨拶を行います。

このイテレーションを詳しく見てみましょう。

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each`はコードブロックをとるメソッドで、リストにある要素それぞれに対して
ブロック内のコードを実行します。`do` と `end`で囲われている部分がそのブロックです。
ブロックは無名関数や`lambda`に似ています。
パイプ文字の挟まれた変数がこのブロックのパラメタになります。

ここでは、リスト内のすべての要素の値について、1つずつnameという変数に代入され、
そして`puts "Hello #{name}!"`という表現がそのnameの値を使って実行されます。

他の多くのプログラミング言語では`for`ループを使ってリストを扱います。
たとえばCでは以下のようになります。

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

これは動作しますが、あまりエレガントではありません。
`i`のような使い捨ての変数が必要ですし、そのリストがどのくらいの長さになるか
計算する必要がありますし、どのようにリストを走査するか説明する必要があります。
Rubyのやり方はもっとエレガントです。
細かな扱い方は`each`メソッドの中に隠されていて、それを使う側は
それぞれの要素をどう扱うかだけ書くだけで済みます。
内部では、`each`は基本的に
`yield "Albert"`を実行し、続いて`yield "Brenda"`、`yield "Charles"`などと
実行していきます。

## ブロック、まばゆく輝くRubyの極み

ブロックが真の力を発揮するのはリストよりももっと複雑なものを扱うときです。
簡単な処理だけではなく、準備、後始末、あるいはエラーといったものごとを、
ユーザが気にしなくて済むように、見えないところで処理してくれます。

{% highlight ruby %}
# Say bye to everybody
def say_bye
  if @names.nil?
    puts "..."
  elsif @names.respond_to?("join")
    # Join the list elements with commas
    puts "Goodbye #{@names.join(", ")}.  Come back soon!"
  else
    puts "Goodbye #{@names}.  Come back soon!"
  end
end
{% endhighlight %}

`say_bye`メソッドは`each`を使いません。その代わり、`@names`が`join`メソッドを
処理できるかをチェックしています。もし処理できることがわかれば、それを使います。
そうでなければ、変数の値を文字列として出力します。
このメソッドは実際の変数の*型*を意識せず、サポートしているメソッドに頼っています。
これは“Duck Typing”という名前で知られている、「もしアヒルのように歩き、
アヒルのように鳴くものは……」というものです。この方法の良いところは、
対応する変数の型に不要な制約を課さずにすむことです。
もし誰かが新たな種類のリストクラスを持ち出してくれば、
`join`メソッドが他のリストと同様の意味を持っている限り、
すべては期待した通り動きます。

## スクリプトの実行

以上がMegaGreeterクラスになります。
ファイルの残りの部分はこのクラスをメソッドを呼び出すものです。
最後のトリックは以下の行になります。

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` は現在のファイル名を返す特別な変数です。
`$0`はプログラムを実行するときに使われるファイル名です。
このチェックは、「もしこれがメインファイルとして実行されているならば……」
という意味になります。
これは、ライブラリとして使われる場合には実行されないけれど、
実行ファイルとして使われる場合には実行されるコードを書くために
使われます。

## もっと知るために

以上、駆け足でRubyを紹介してきました。
Rubyにはこの他にもたくさんの異なる制御構造や、ブロックと`yield`の使い方、
モジュールとmixin、その他の興味深いしくみがあります。
この短いRubyの紹介をお読みになったことで、
もっと知りたい気持ちを持っていただければうれしいです。

もしも興味があれば、[ドキュメント](/ja/documentation/)ページから、
ネットで提供されているマニュアルやチュートリアルなどへのリンクを
辿ってみてください。

あるいは、書籍で探してみたいのであれば、
ネット書店やリアル書店で購入できる書籍の[ブックガイド][1]を
（訳注: これは2016年4月現在の関連書籍紹介ページに置き換えています）
チェックしてみてください。

[1]: http://magazine.rubyist.net/?0053-ForeWord
