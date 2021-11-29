---
layout: news_post
title: "Ruby 3.0における位置引数とキーワード引数の分離について"
author: "mame"
translator: "hachi8833"
date: 2019-12-12 12:00:00 +0000
lang: ja
---

本記事では、Ruby 3.0で予定されているキーワード引数の非互換性について解説します。

## 概要

この文書では便宜上、必須引数、オプション引数、rest引数、後置引数（つまり、キーワード引数とブロック引数以外の引数）をまとめて「位置引数」と呼びます。

Ruby 3.0では、位置引数とキーワード引数が分離されます。Ruby 3.0で変更される振る舞いはRuby 2.7で警告を表示します。以下のいずれかの警告が表示される場合は、コードのアップデートが必要です。

* `Using the last argument as keyword parameters is deprecated`
* `Passing the keyword argument as the last hash parameter is deprecated`
* `Splitting the last argument into positional and keyword parameters is deprecated`

この非互換性は、double splat演算子（`**`）を追加することでほぼ回避できます。これにより、`Hash`オブジェクトではなくキーワード引数を渡すことが明示的に指定されます。同様に、キーワード引数ではなく`Hash`オブジェクトを明示的に渡したい場合は中かっこ（`{}`）を追加できます。詳しくは後述の「典型的なケース」をご覧ください。

Ruby 3では、すべての引数を委譲するメソッドで、位置引数の他に必ずキーワード引数も明示的に委譲しなければなりません。Ruby 2.7以前の委譲の振る舞いを変えたくない場合は、`ruby2_keywords`をお使いください。詳しくは後述の「引数の委譲の扱いについて」をご覧ください。

## よくあるケース
{: #typical-cases }

以下はもっともよくあるケースです。Hashではなくキーワードを渡すのにdouble splat演算子（`**`）を使えます。

{% highlight ruby %}
# このメソッドはキーワード引数のみを受け取る
def foo(k: 1)
  p k
end

h = { k: 42 }

# このメソッド呼び出しは位置引数としてHashを渡している
# Ruby 2.7: このHashは自動でキーワード引数に変換される
# Ruby 3.0: この呼び出しはArgumentErrorになる
foo(h)
  # => demo.rb:11: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
  #    demo.rb:2: warning: The called method `foo' is defined here
  #    42

# この振る舞いをRuby 3.0で変えたくない場合はdouble splatを用いる
foo(**h) #=> 42
{% endhighlight %}

別の例: キーワード引数ではなくHashを明示的に渡す場合は中かっこ（`{}`）を使います。

{% highlight ruby %}
# このメソッドは位置引数を1個、残りはキーワード引数を受け取る
def bar(h, **kwargs)
  p h
end

# この呼び出しではキーワード引数のみが渡され、位置引数は渡されない
# Ruby 2.7: このキーワード引数は自動でHash引数に変換される
# Ruby 3.0: この呼び出しはArgumentErrorになる
bar(k: 42)
  # => demo2.rb:9: warning: Passing the keyword argument as the last hash parameter is deprecated
  #    demo2.rb:2: warning: The called method `bar' is defined here
  #    {:k=>42}

# この振る舞いをRuby 3.0で変えたくない場合は
# 中かっこで明示的にHashにする
bar({ k: 42 }) # => {:k=>42}
{% endhighlight %}

## どの動作が非推奨になるか
{: #what-is-deprecated }

Ruby 2では、キーワード引数が末尾のハッシュ位置引数として扱われることがあります。また、末尾のハッシュ引数がキーワード引数として扱われることもあります。

この自動変換は場合によっては複雑になりすぎてしまい、本記事末尾で後述するようにトラブルの原因になることがあります。そのため、この自動変換をRuby 2.7で非推奨とし、Ruby 3.0で廃止する予定です。言い換えると、Ruby 3.0のキーワード引数は位置引数と完全に分離されることになります。つまり、キーワード引数を渡したい場合は、常に`foo(k: expr)`または`foo(**expr)`の形にすべきです。（メソッド定義で）キーワード引数を受け取りたい場合は、原則として常に以下のいずれかの形にすべきです。

* `def foo(k: default)`
* `def foo(k:)`
* `def foo(**kwargs)`

なお、キーワード引数を受け取らないメソッドを呼び出すときにキーワード引数を渡した場合の振る舞いは、Ruby 3.0でも変わらない点にご注意ください。たとえば、以下のケースは非推奨にはならず、Ruby 3.0でも引き続き動作します（このキーワード引数は引き続きHash位置引数として扱われます）。

{% highlight ruby %}
def foo(kwargs = {})
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

変わらない理由は、このスタイルが非常によく用いられていることと、この呼び出し方法では引数の扱いに曖昧な点がないためです。この振る舞いまで禁止してしまうと、得られるメリットが少ないうえに非互換性がさらに増えてしまいます。

ただし今後新しいコードを書く場合、このスタイルはおすすめできません（Hashを位置引数として渡す頻度が高く、かつキーワード引数も使う場合を除く）。代わりに、次のようにdouble splat（`**`）をお使いください。

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end

foo(k: 1) #=> {:k=>1}
{% endhighlight %}

## Q: 自分のコードはRuby 2.7で動かなくなりますか？
{: #break-on-ruby-2-7 }

A: たぶん動きます。

Ruby 2.7では、原則として、Ruby 3.0で変更される振る舞いについて警告を出すにとどめています。しかし、私たちが軽微とみなした非互換も少しだけ入っています。詳しくは後述の「その他の軽微な変更点」をご覧ください。

Ruby 2.7では、警告が表示される点と軽微な変更点以外を除いてRuby 2.6との互換性を保とうとしています。つまり、あなたのコードはRuby 2.7でもおそらく動作しますが、警告が表示される可能性はあります。あなたのコードをRuby 2.7で実行すれば、Ruby 3.0の準備ができているかどうかをチェックできます。

非推奨の警告を無効にしたい場合は、コマンドライン引数`-W:no-deprecated`を使うか、コードに`Warning[:deprecated] = false`を追加します。

## 引数の委譲の扱いについて
{: #delegation }

### Ruby 2.6以前の場合
{: #delegation-ruby-2-6-or-prior }

Ruby 2では、以下のように1個の`*rest`引数と1個の`&block`引数を受け付けて、この2つの引数を委譲先メソッド（以下の`target`）に渡すことで委譲メソッドを書けます。この振る舞いでは、（1つ以上の）キーワード引数も「位置引数<=>キーワード引数の自動変換」によって暗黙的に扱われます。

{% highlight ruby %}
def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

### Ruby 3の場合
{: #delegation-ruby-3 }

以下のようにキーワード引数を明示的に委譲する必要があります。

{% highlight ruby %}
def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end
{% endhighlight %}

別の方法として、Ruby 2.6以前との互換性を考慮する必要がなく、かつ引数を一切改変しないのであれば、以下のようにRuby 2.7で新しく導入される委譲構文（`...`）を利用できます。

{% highlight ruby %}
def foo(...)
  target(...)
end
{% endhighlight %}

### Ruby 2.7の場合
{: #delegation-ruby-2-7 }

手短かに言うと、以下のように`Module#ruby2_keywords`を用い、`*args, &block`を委譲します。

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

`ruby2_keywords`を指定すると、キーワード引数を末尾のHash引数として受け取れるようになり、他のメソッドを呼び出すときにそれをキーワード引数として渡せます。

実際、Ruby 2.7では多くの場面でこの新しい委譲のスタイルを利用できます。ただし1つ既知のエッジケースがあります。次をご覧ください。

### Ruby 2.6 / 2.7 / 3で互換性のある委譲スタイル
{: #a-compatible-delegation }

手短かに言うと、ここも「`Module#ruby2_keywords`を使う」となります。

{% highlight ruby %}
ruby2_keywords def foo(*args, &block)
  target(*args, &block)
end
{% endhighlight %}

残念ながら、Ruby 2.6以前では新しい委譲スタイルを正しく扱えないため、旧来の委譲スタイル（つまり、**kwargsを受け渡ししないスタイル）を使う必要があります。これは、キーワード引数を分離した理由のひとつでもあります（詳しくは本記事末尾をご覧ください）。`ruby2_keywords`を用いれば、Ruby 2.7や3.0でも旧来の委譲スタイルを引き続き利用できます。2.6以前のRubyでは`ruby2_keywords`が定義されていないので、[ruby2_keywords](https://rubygems.org/gems/ruby2_keywords) gemを使うか、以下を手動で定義します。

{% highlight ruby %}
def ruby2_keywords(*)
end if RUBY_VERSION < "2.7"
{% endhighlight %}

---

自分のコードがRuby 2.6以前で動かなくても構わないのであれば、Ruby 2.7で新しいスタイルを試してもよいでしょう。ほぼほぼ間違いなく動作しますが、以下のようなエッジケースを運悪く踏むこともあります。

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo({})       #=> Ruby 2.7: []  （{}を含んでいない）
foo({}, **{}) #=> Ruby 2.7: [{}] （{}を渡せば、キーワード引数が「ない」ことを明示できる）
{% endhighlight %}

上のコードでは、空のHash引数が自動的に変換されて`**kwargs`に吸い込まれ、この空のキーワードハッシュは委譲の呼び出しで削除されます。このため、`target`には引数がまったく渡されなくなります。私たちが把握している範囲では、これが唯一のエッジケースです。

上のコードの最下部に書いたように、`**{}`を渡すことでこの問題を回避できます。

移植性がどうしても不安な場合は`ruby2_keywords`をお使いください（Ruby 2.6以前ではキーワード引数周りで膨大なエッジケースが存在していることを知っておいてください）。`ruby2_keywords`は、今後Ruby 2.6がサポート切れになったあとで削除される可能性があります。そのときになったら、キーワード引数を明示的に委譲することをおすすめします（上述のRuby 3向けのコードを参照）。

## その他の軽微な変更点
{: #other-minor-changes }

Ruby 2.7のキーワード引数では、この他に以下の3つの軽微な変更が行われています。

### 1\. キーワード引数で非シンボルキーを利用できるようになった
{: #other-minor-changes-non-symbol-keys }

Ruby 2.6以前のキーワード引数では、シンボル形式のキーしか利用できませんでした。Ruby 2.7のキーワード引数では、以下のようにシンボル形式でないキーを利用できるようになります。

{% highlight ruby %}
def foo(**kwargs)
  kwargs
end
foo("key" => 42)
  #=> Ruby 2.6以前: ArgumentError: wrong number of arguments
  #=> Ruby 2.7以降: {"key"=>42}
{% endhighlight %}

あるメソッドがオプション引数とキーワード引数を両方とも受け付ける場合、Ruby 2.6では以下のようにシンボル形式のキーと非シンボルキーを両方持つHashオブジェクトが2つに分割されていました。Ruby 2.7では非シンボルキーを利用できるので、どちらも受け取れます。

{% highlight ruby %}
def bar(x=1, **kwargs)
  p [x, kwargs]
end

bar("key" => 42, :sym => 43)
  #=> Ruby 2.6: [{"key"=>42}, {:sym=>43}]
  #=> Ruby 2.7: [1, {"key"=>42, :sym=>43}]

# 振る舞いを変えたくない場合は中かっこ{}を使う
bar({"key" => 42}, :sym => 43)
  #=> Ruby 2.6 and 2.7: [{"key"=>42}, {:sym=>43}]
{% endhighlight %}

Ruby 2.7では、キーワード引数を明示的に受け付けるがキーワードrest引数（`**kwargs`）を受け取らないメソッドに対して、シンボル形式のキーと非シンボルキーが両方混じったHashやキーワード引数を渡すと、引き続きハッシュを分割して警告を表示します。この振る舞いはRuby 3で廃止されて`ArgumentError`にする予定です。

{% highlight ruby %}
def bar(x=1, sym: nil)
  p [x, sym]
end

bar("key" => 42, :sym => 43)
# Ruby 2.6と2.7: => [{"key"=>42}, 43]
# Ruby 2.7: warning: Splitting the last argument into positional and keyword parameters is deprecated
#           warning: The called method `bar' is defined here
# Ruby 3.0: ArgumentError
{% endhighlight %}

### 2\. double splatを付けた空ハッシュ（`**{}`）で引数を渡さないようになった
{: #other-minor-changes-empty-hash }

Ruby 2.6以前は、`**empty_hash`を渡すと位置引数に空のハッシュが渡されました（`[{}]`）。Ruby 2.7以降では引数を渡さなくなります。

{% highlight ruby %}
def foo(*args)
  args
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6以前: [{}]
  #=> Ruby 2.7以降: []
{% endhighlight %}

なお、`foo(**{})`はRuby 2.6以前とRuby 2.7のどちらの場合も引数を渡さず、`**{}`がパーサーによって削除される点にご注意ください。また、Ruby 2.7以降ではどちらも`**empty_hash`として同じに扱われるので、メソッドにキーワード引数を渡さないようにする指定が楽に行なえます。

Ruby 2.7では、あるメソッド呼び出しで必須とされる位置引数の個数が不足している場合、Ruby 2.6との互換性を保つために`foo(**empty_hash)`は空のハッシュを渡して警告を表示します。この振る舞いはRuby 3.0で廃止されます。

{% highlight ruby %}
def foo(x)
  x
end

empty_hash = {}
foo(**empty_hash)
  #=> Ruby 2.6以前: {}
  #=> Ruby 2.7: warning: Passing the keyword argument as the last hash parameter is deprecated
  #             warning: The called method `foo' is defined here
  #=> Ruby 3.0: ArgumentError: wrong number of arguments
{% endhighlight %}

### 3\. キーワード引数を受け取らないことを表す構文（`**nil`）が導入される
{: #other-minor-changes-double-splat-nil }

メソッド定義で`**nil`を用いることで、そのメソッドがキーワード引数を受け取らないことを明示的に示せるようになります。このメソッドを呼び出すときにキーワード引数を渡すと`ArgumentError`が表示されます（これは非互換性ではなく、新機能です）。

{% highlight ruby %}
def foo(*args, **nil)
end

foo(k: 1)
  #=> Ruby 2.7以降: no keywords accepted (ArgumentError)
{% endhighlight %}

この新構文は、メソッドがキーワード引数を受け取らないことを明示的に指定するのに有用です。これを使わない場合、キーワード引数は上述の例のrest引数に吸い込まれます。メソッドを拡張してキーワード引数を受け取るようにする場合、以下のような非互換性が発生する可能性があります。

{% highlight ruby %}
# メソッドは残りの引数を受け取るが、`**nil`はない状態
def foo(*args)
  p args
end

# キーワード引数はHashオブジェクトに変換される（Ruby 3.0でも同じ）
foo(k: 1) #=> [{:k=>1}]

# メソッドがキーワード引数を受け取るよう拡張した場合
def foo(*args, mode: false)
  p args
end

# 以下の呼び出しが壊れる可能性がある
foo(k: 1) #=> ArgumentError: unknown keyword k
{% endhighlight %}

## 自動変換を非推奨に変える理由
{: #why-deprecated }

当初、自動変換はうまいアイデアに思われていて、多くの場合問題なく機能していました。しかし、エッジケースがあまりにも多く、これまでこの振る舞いに関するバグレポートを山のように受け取りました。

自動変換は、オプション引数とキーワード引数をどちらも受け取るメソッドではうまく動きません。末尾のHashオブジェクトを位置引数として扱うことを期待する人々もいれば、末尾のHashオブジェクトをキーワード引数として扱うことを期待する人々もいました。

最も混乱を呼ぶケースのひとつを以下に示します。

{% highlight ruby %}
def foo(x, **kwargs)
  p [x, kwargs]
end

def bar(x=1, **kwargs)
  p [x, kwargs]
end

foo({}) #=> [{}, {}]
bar({}) #=> [1, {}]

bar({}, **{}) #=> 期待は: [{}, {}]だが実際はl: [1, {}]
{% endhighlight %}

Ruby 2の場合、`foo({})`は空のハッシュを通常の引数として1つ渡しますが（`x`に`{}`が代入されるなど）、`bar({})`はキーワード引数を1つ渡します（`kwargs`に`{}`が代入されるなど）。つまり、`any_method({})`は極めてあいまいになります。

「`bar({}, **{})`は`x`に明示的に空のハッシュを渡すのでは？」と考える人もいるかもしれませんが、驚いたことに、この期待は裏切られます。Ruby 2.6では`[1, {}]`が出力されるのです。理由は、`**{}`がRuby 2.6のパーサーで無視されるのと、1番目の引数`{}`が自動的にキーワード引数（`**kwargs`）に変換されるためです。この場合`bar({}, {})`という形で呼び出す必要がありますが、これではあまりに見苦しくなります。

同じ問題は、残りの引数とキーワード引数を受け取るメソッドにも当てはまります。そのせいで、以下のようなキーワード引数の明示的な委譲は動作しません。

{% highlight ruby %}
def target(*args)
  p args
end

def foo(*args, **kwargs, &block)
  target(*args, **kwargs, &block)
end

foo() #=> Ruby 2.6以前: [{}]
      #=> Ruby 2.7以降:  []
{% endhighlight %}

`foo()`には引数がありませんが、Ruby 2.6では空のハッシュ引数が`target`に渡されます。理由は、メソッド`foo`が明示的にキーワード（`**kwargs`）を委譲しているためです。`foo()`が呼び出されると、`args`は空のArrayになり、`kwargs`は空のHashになり、`block`は`nil`になります。そして`target(*args, **kwargs, &block)`は空のHashを引数として1つ渡します。理由は、`**kwargs`が自動的にHash位置引数に変換されるためです。

自動変換は開発者を混乱させるのみならず、メソッドの拡張性も弱めてしまいます。振る舞いが変更された理由や、特定の実装が選択された理由について詳しくは[Feature #14183](https://bugs.ruby-lang.org/issues/14183)をご覧ください。

## 謝辞

本記事はJeremy EvansとBenoit Dalozeによる丁寧なレビュー（共著と言ってもよいくらいです）をいただきました。

## 更新履歴

* 更新 2019-12-25: 2.7.0-rc2で警告メッセージが若干変更され、警告抑制APIが追加された。
