---
layout: news_post
title: "Ruby 2.1.1 に含まれる Hash#reject の不具合について"
author: "sorah"
translator: "sorah"
date: 2014-03-10 14:00:00 +0000
lang: ja
---

Ruby 2.1.0 まで、`Hash` を継承したクラスの `reject` メソッドはその継承したクラスのオブジェクトを返す挙動になっていました。
しかし、Ruby 2.1.1 で意図せずその挙動が変更され、継承したクラスの場合でも必ず Hash クラスのオブジェクトが返る挙動に変更されてしまっています。

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(正確にはインスタンス変数など他の属性もコピーされなくなっています。)

Ruby 2.1.0 から[バージョニングポリシーを変更している](https://www.ruby-lang.org/ja/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/)ため、Ruby 2.1.1 はパッチレベルリリースにあたります。パッチレベルリリースは後方互換性を維持すべきなため、本来 Ruby 2.1.1 にこのような挙動の変更が入るべきではありません。

この意図しない挙動変更はいくつかのライブラリに影響を与えてしまう可能性があります。一つ観測されている事例は
Rails の `HashWithIndifferentAccess` と `OrderedHash` です: [Rails issue #14188](https://github.com/rails/rails/issues/14188)

この挙動変更は Ruby 2.1.2 で元に戻るよう修正される予定です。しかし、これは [Feature #9223](https://bugs.ruby-lang.org/issues/9223) で議論されていたもので、Ruby 2.2.0 で導入される予定です。
われわれはあなたのコードをこの仕様変更を想定したものに修正する事を推奨します。

また、この不具合はあるコミットのバックポート漏れで発生してしまいました。対策などを含めた詳細はこちらの記事を参照してください: [http://diary.sorah.jp/2014/02/28/ruby211-hash-reject](http://diary.sorah.jp/2014/02/28/ruby211-hash-reject)

ご不便をおかけします。
