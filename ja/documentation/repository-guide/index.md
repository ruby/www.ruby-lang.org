---
layout: page
title: "リポジトリガイド"
lang: ja
---

## Gitリポジトリ

GitHubにミラーが用意されています。

* [&lt;URL:https://github.com/ruby/ruby.git&gt;][1]

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
{% endhighlight %}

コミッタ以外でRubyの開発に参加したい方は、GitHubのミラーを使うとよいでしょう。次のHowto(英語)もご覧ください。

* [&lt;URL:https://github.com/shyouhei/ruby/wiki/noncommitterhowto&gt;][2]

また、ミラーとは別に、RubyのソースコードはGitリポジトリに保存されています。コミッタはこちらを使います。

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][3]

{% highlight sh %}
$ git clone git@git.ruby-lang.org:ruby.git
{% endhighlight %}


## SVNリポジトリ

Rubyのソースコードは2019年4月22日までSVNリポジトリで管理されていたため、一部のブランチはまだSVNで管理されている場合があります。ViewVC経由で参照できます:

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][4]

また、Anonymous SVNも利用可能です:

2\.6の場合:

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
$ cd ruby
$ git checkout ruby_2_6
{% endhighlight %}

その他のブランチ・タグなどは[&lt;URL:https:

それではみなさん、楽しいハックを！

Posted by usa on 30 May 2006
Updated by mame on 12 May 2019
{: .post-info}



[1]: https://github.com/ruby/ruby
[2]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[3]: https://git.ruby-lang.org/ruby.git
[4]: https://git.ruby-lang.org/ruby.git
[5]: https://git.ruby-lang.org/ruby.git
