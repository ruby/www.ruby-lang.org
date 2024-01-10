---
layout: page
title: "Rubyとは"
lang: ja
---

なぜRubyはこんなに人気なのでしょうか？Rubyのファンは、Rubyを美しく芸術的な言語だと言います。
なおかつ、便利で実用的だとも言います。
一体どういうことでしょうか？
{: .summary}

### Rubyの作者の理念

Rubyは絶妙にバランスのとれた言語です。
Rubyの作者である、Matzこと[まつもと ゆきひろ][matz]氏は、好みの言語(Perl、Smalltalk、Eiffel、Ada、Lisp)の一部をブレンドし、
関数型プログラミングと命令型プログラミングが絶妙に調和された新しい言語を作りました。

Matzはよく、「Rubyをシンプルなものではなく、自然なものにしようとしている」と言います。

付け加えて、こんな風にも言っています。

> Rubyの外観はシンプルです。けれど、内側はとても複雑なのです。
> それはちょうど私たちの身体と同じようなものです<sup>[1](#fn1)</sup>。

### Rubyの成長について

1995年の一般公開以来、Rubyは世界中から熱心なプログラマーを集めています。
2006年になると、Rubyは大量の支持を集めました。
現在では、世界中の主要都市に活発なユーザーグループが形成され、
そしてRubyに関する大規模なカンファレンスが開かれています。

英語でRubyについて会話するための[メーリングリスト](/ja/community/mailing-lists/)であるruby-talkでは、
2006年には平均して日に200通ものメッセージがやりとりされていました。
最近ではそういった大きな場所での流量は低下しているものの、
たくさんの小さなグループに分かれて、さまざまな会話がされています。

[TIOBE指標][tiobe]のような、人気や成長の度合いからプログラミング言語を測る指標のほとんどで、
Rubyはトップ10内にランクインしています。
こうした成長は、Rubyで書かれたソフトウェア、
とりわけWebアプリケーションフレームワーク[Ruby on Rails][ror]の人気に起因しています。

また、Rubyは[フリーソフトウェア]({{ site.license.url }})です。
無料とか自由に使えるといったことだけでなく、コピー、変更、および再配布の自由を約束しています。

### すべてがオブジェクト

理想的な構文を見つけようと、Matzは当初、他の言語を調査したそうです。
その時のことを思い出して、Matzは「Perlよりも強力で、Python2よりもオブジェクト指向な言語が欲しかったんだ<sup>[2](#fn2)</sup>」と語っています。

Rubyでは、すべてのものはオブジェクトです。
すべての情報の塊・コードには、固有のプロパティとアクションを与えることができます。
オブジェクト指向プログラミングでは、プロパティはインスタンス変数、アクションはメソッドと呼ばれます。
Rubyによる純粋なオブジェクト指向のアプローチは、
最もよくみられる、数にアクションを与える以下のようなコード片で確認できます。

{% highlight ruby %}
5.times { print "We *love* Ruby -- it's outrageous!" }
{% endhighlight %}

多くの言語では、数やそれ以外のプリミティブな型はオブジェクトではありません。
ですが、RubyはSmalltalkの影響を受け、すべての型がメソッドやインスタンス変数を与えられるようになっています。
これがRubyが使いやすい理由の一つです。
Rubyの世界では、オブジェクトに適用できることは、すべてのものに対して適用できるのです。

### Rubyの柔軟性

Rubyは柔軟な言語として知られています。
Rubyでは、ユーザーが自由にその一部を変更することができます。
やろうと思えば、Rubyのコアな部分でさえ、削除したり再定義したりできます。
既存の部品をその上に追加することすらできます。
Rubyはプログラマを制限しない言語なのです。

たとえば、加算は加算演算子(`+`)を用いて行われますが、
`plus`という単語の方が読み取りやすいというのであれば、
Rubyの組み込みクラスである`Numeric`クラスに次のようなメソッドを追加できます。

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y は 11 になります
{% endhighlight %}

Rubyの演算子はメソッドの糖衣構文(シンタックスシュガー)ですので、
演算子もまた同様に再定義できます。

### ブロック: 表現力豊かな機能

Rubyのブロックもまた、偉大な柔軟性の源泉として知られています。
プログラマーは、どんなメソッドへも、メソッドがどのように振る舞うべきかを記述したクロージャを付け加えることができます。
このクロージャは *ブロック* と呼ばれます。
ブロックは、PHPやVisual Basicなどの命令型言語からRubyの世界に新しく入ってきた人たちにもっとも人気のある機能の一つになっています。

ブロックは関数型言語に影響された機能です。Matzは「Rubyのクロージャでは、Lispの文化に敬意を表したかった」と語っています<sup>[3](#fn3)</sup>。

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

上のコードで、ブロックは`do...end`の内側に書かれています。
`map`メソッドは定義された単語のリストに与えられたブロックを適用します。
Rubyのメソッドの多くは、メソッドを使用するプログラマーが処理の詳細を埋めれるような独自のブロックをかけるように定義されています。

### RubyとMixin

多くのオブジェクト指向言語と異なり、Rubyは **わざと** 単一継承しか備えていません。
けれど、Rubyはモジュール(Objective-Cではカテゴリと呼ばれているもの)の概念を持ちます。モジュールとはメソッドの集合です。

クラスはモジュールをミックスイン(Mixin)し、モジュールのすべてのメソッドを自由に受け取ることができます。
たとえば、`each`メソッドが実装されたクラスは、`Enumerable`モジュールをミックスインして、
繰り返し処理に`each`を使うメソッド群を追加することができます。

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

一般的にこちらの方が、複雑で制限の強い多重継承よりもRubyistにとって明瞭な表現です。

### Rubyの外観

Rubyはとても限られた句読法を使い、英語のキーワードを好みます。
いくつかの句読法はRubyを修飾するためだけに使われます。
Rubyは変数宣言を必要としません。
変数のスコープを示すためには単純な命名規則が使われます。

* `var` はローカル変数になります。
* `@var` はインスタンス変数です。
* `$var` はグローバル変数です。

上記の印は、プログラマがそれぞれの変数の役割を識別することを容易にし、読みやすさを向上させます。
また、すべてのインスタンスのメンバの前に付く億劫な`self.`をつける必要も無くなります。

### 基礎を超えて

Rubyは次に示すような豊富な機能を持っています。

* Rubyは、JavaやPythonのような、エラーを処理するための例外処理機構を備えています。

* Rubyには、すべてのRubyオブジェクトを扱うマークスイープ方式のガベージコレクション機能(GC)があります。
  拡張ライブラリ内の参照カウンタを管理する必要はありません。Matzは「これは健康に良い」と言っています。

* RubyでC拡張を書くことは、PerlやPythonで同じことをやるよりも簡単です。CからRubyを呼び出すためのよくできたAPIがあるからです。
  このAPIはソフトウェア内に組み込まれたRubyを呼び出し、スクリプト言語のように使います。SWIGインターフェイスも存在しています。

* OSが許すなら、Rubyは動的なライブラリ拡張をロードすることもできます。

* RubyはOSに依存しないスレッド機構を備えています。これによって、Rubyが動作するすべてのプラットフォーム上で、
  OSのサポートなしに(MS-DOSだとしても！)マルチスレッド処理を扱えます。

* Rubyにはとても高い可搬性があります。Rubyは主にGNU/Linux上で開発されていますが、
  UNIX、macOS、Windows、DOS、BeOS、OS/2など、多くのOSで動作します。

### さまざまなRuby処理系

言語としてのRubyには、いくつか別の処理系が存在しています。
このページでは、**MRI** (Matz Ruby Interpreter)あるいは **CRuby** (Cで書かれていることに由来する）と呼ばれる
Rubyのリファレンス実装について記載していますが、別のRuby処理系も存在します。
他の言語や環境と統合したりMRIにはないような特別な機能を使いたい場合など、
ある特定の状況でそうしたRuby処理系は役に立ちます。

MRI以外のRuby処理系には以下のようなものがあります。

* [JRuby][jruby]は、JVM(Java仮想マシン)上に構築されたRubyです。
  JVMの最適化されたJITコンパイラやGC、並行スレッド、ツール群、そして膨大なコレクションのライブラリを使うことができます。
* [mruby][mruby]はRubyの軽量実装です。アプリケーションにリンクし、組み込むことができます。Rubyの作者であるまつもと ゆきひろ氏によって開発が進められています。
* [truffleruby][truffleruby]はGraalVM上に構築された高速なRuby実装です。

#### 以下のバージョンはここ数年ほとんどまたは全く更新されていませんが、引き続き利用可能です。

* [Rubinius][rubinius]は「Rubyで書かれたRuby」です。LLVM上に構築されています。LLVMは他の言語も構築されるよくできた仮想マシンです。
* [IronRuby][ironruby]は、.Netフレームワークにしっかりと統合されたRuby処理系です。
* [MagLev][maglev]は、オブジェクトの永続化と分散共有キャッシュを持った、高速で安定したRuby処理系です。
* [Cardinal][cardinal]はPerl6用の仮想マシンである[Parrot][parrot]上のRubyコンパイラです。

### 参照リンク

<sup>1</sup> Matz, ruby-talk メーリングリスト上での会話, [2000年5月12日][blade]。
{: #fn1}

<sup>2</sup> Matz, [An Interview with the Creator of Ruby][linuxdevcenter]から, 2001年11月29日。
{: #fn2}

<sup>3</sup> Matz, [Blocks and Closures in Ruby][artima]から, 2003年12月22日。
{: #fn3}


[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[jruby]: http://jruby.org
[rubinius]: http://rubini.us
[mruby]: http://www.mruby.org/
[truffleruby]: https://github.com/oracle/truffleruby
[ironruby]: http://www.ironruby.net
[maglev]: http://maglev.github.io
[cardinal]: https://github.com/parrot/cardinal
[parrot]: http://parrot.org
