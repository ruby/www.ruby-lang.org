---
layout: page
title: "ライブラリ"
lang: ja
---

多くのプログラミング言語と同様に、Ruby にも幅広いサードパーティのライブラリが提供されています。

それらのほとんどは "gem" という形式で公開されています。[RubyGems][1] は (Ruby に特化した `apt-get` と同じようなパッケージングシステムで) ライブラリの作成や公開、インストールを助けるシステムです。Ruby のバージョン 1.9 以降 RubyGems は標準添付となっていますが、それ以前のバージョンの Ruby の場合は[自分でインストール][2]する必要があります。

他のライブラリは .zip や .tar.gz のようなアーカイブの形式で公開されています。インストール方法は様々で、一般的には `README` や `INSTALL` ファイルに方法が書かれています。

ではライブラリを探してインストールする方法を見てみましょう。

### ライブラリを探す

Ruby のライブラリは主に [RubyGems.org][1] に gem として置かれています。直接ウェブサイトを閲覧したり、`gem` コマンドを使用してそれらを探すことができます。

`gem search -r` を使うと RubyGems のリポジトリを調べることが出来ます。例えば、`gem search -r rails` は Rails に関係のある gem を返します。
`--local` (`-l`) オプションを使うと、インストール済みの gem に対してローカルで検索をすることが出来ます。gem をインストールするには `gem install [gem]` を使います。インストール済みの gem を見るには `gem list` を使います。さらに `gem` コマンドについて知りたい場合は、先に進むか[RubyGems' docs][3] を参照してください。

他にもライブラリの配布元があります。
[RubyForge][4]はかつて Ruby のライブラリの保管場所として広く使われていたものです。
しかし近年では [GitHub][5] が ruby 関連のリポジトリとして台頭してきました。
gem としては RubyGems.org に公開されますが、gem のソースコードのほとんどは GitHub 上で見ることが出来ます。

[Ruby Application Archive][6] (または RAA) はあらゆる Ruby のソフトウェアが機能ごとにカテゴリ分けされていた場所です。しかし既に全く使われていません。おそらくもう見る必要はないでしょう。

### RubyGems についてもう少し

普段使いのために `gem` コマンドについて軽く見ておきましょう。
このパッケージ管理システムについて全般的に述べられた[もっと詳しいドキュメント][7]もあります。

#### 入手可能な gem を検索する

この **search** コマンドを使うと文字列で gem を検索することができます。指定された文字列で始まる名前の gem が返ります。例えば "html" 関連の gem を探したければ以下のようにします。

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

`--remote` / `-r` フラグは公式の RubyGems.org リポジトリを検索することを表しています。(そしてこれはデフォルトの動作です。)
`--local` / `-l` フラグをつけるとインストール済みの gem に対して検索をかけることができます。

#### gem をインストールする

インストールしたい gem が見つかったなら、**install** コマンドでインストールできます。例えば人気のある Rails でしたら以下のようになります。

{% highlight sh %}
$ gem install rails
{% endhighlight %}

`--version` / `-v` フラグを使うと、ライブラリの特定のバージョンを指定してインストールすることも出来ます。

{% highlight sh %}
$ gem install rails --version 3.0
{% endhighlight %}

#### 全ての gem を一覧にする

ローカルにインストール済みの gem の一覧を見たいときは **list** コマンドを使います。

{% highlight sh %}
$ gem list
{% endhighlight %}

(とても長いですが) RubyGems.org で入手可能な全ての gem の一覧を見るには以下のようにします。

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### Help!

ドキュメントをターミナルで参照することが出来ます。

{% highlight sh %}
$ gem help
{% endhighlight %}

たとえば、`gem help commands` は `gem` の全てのコマンドを出力するのでとても便利です。

#### 自分で gem を作る

RubyGems.org に [いくつかのガイド][3] があります。
[Bundler][9] について調べてみるのもいいでしょう。Bundler は RubyGems と一緒に使われる、アプリケーションの依存関係を管理するための一般的なツールです。



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[4]: http://rubyforge.org/
[5]: https://github.com/
[6]: http://raa.ruby-lang.org/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
