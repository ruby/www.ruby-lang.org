---
layout: page
title: "リポジトリガイド"
lang: ja
---

## SVNリポジトリ

RubyのソースコードはSVNリポジトリに保存されており、ViewVC経由で参照できます:

* [&lt;URL:http://svn.ruby-lang.org/cgi-bin/viewvc.cgi?root=ruby&gt;][1]

また、Anonymous SVNも利用可能です:

trunkの場合:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

1\.8の場合:

{% highlight sh %}
$ svn co http://svn.ruby-lang.org/repos/ruby/branches/ruby_1_8 ruby
{% endhighlight %}

その他のブランチ・タグなどは[&lt;URL:http://svn.ruby-lang.org/repos/ruby/&gt;][2]から確認してください。

## Gitリポジトリ

Gitをお使いの方は、[githubにあるRubyのリポジトリ][3]も利用可能です。

また、これを使ってRubyの開発に参加したい方は、以下のHowto(英語)を読まれるとよいでしょう。

* [非コミッター向け][4]
* [コミッター向け][5]

それではみなさん、楽しいハックを！

Posted by usa on 30 May 2006
{: .post-info}



[1]: http://svn.ruby-lang.org/cgi-bin/viewvc.cgi?root=ruby
[2]: http://svn.ruby-lang.org/repos/ruby/
[3]: http://github.com/ruby/ruby
[4]: http://wiki.github.com/shyouhei/ruby/noncommitterhowto
[5]: http://wiki.github.com/shyouhei/ruby/committerhowto
