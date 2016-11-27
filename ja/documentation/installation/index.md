---
layout: page
title: "Rubyのインストール"
lang: ja
---

いくつかのツールを使ってRubyをインストールできます。
このページでは、Rubyの管理とインストールのための、メジャーなパッケージ管理ツールとサードパーティツールについて解説します。


## システムごとのインストール方法

利用可能なインストール方法を解説します。
お好みの使いやすい方法を選んでください。

* OS X

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Homebrew](#homebrew)
  * [ソースからのビルド](#building-from-source)

* Linux/UNIX

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [パッケージ管理システム](#package-management-systems)
  * [ソースからのビルド](#building-from-source)

* Windows

  * [ActiveScriptRuby](#activescriptruby)
  * [RubyInstaller](#rubyinstaller)
  * [RailsInstaller](#railsinstaller)

## サードパーティツール

多くのRubyistたちは様々な特徴を持つサードパーティツールを使ってRubyをインストールしています。

各ツールには様々な利点がありますが、オフィシャルにサポートしている方法ではありません。
しかし、それぞれのコミュニティが心強い助けになるでしょう。


### rbenv
{: #rbenv}

rbenv では複数の Ruby を管理することができます。

rbenv は Ruby のインストール自体はサポートしていませんが、
ruby-build というポピュラーなプラグインを使うことで Ruby をインストールすることができます。

それぞれのツールは OS X、Linux およびその他 UNIX-like なオペレーティングシステムに対応しています。

rbenv をインストールする方法は [rbenvのページ][rbenv] に記述されています。

rbenv と似たツールとして、次に説明する RVM があります。
そちらも確認して、良い方を選んでください。


### RVM ("Ruby Version Manager")
{: #rvm}

RVM は複数の Ruby のインストールと管理を行うことができます。
このツールは OS X、Linux およびその他 UNIX-like なオペレーティングシステムに対応しています。

RVM をインストールする方法は [rvm.io][rvm] に記述されています。

### ActiveScriptRuby
{: #activescriptruby }

[ActiveScriptRuby][active-script-ruby] はインストーラを実行するだけで Windows 上に Ruby 開発環境を構築します。安定版 Ruby に幾つかの便利なライブラリを加え、さらに Ruby を COM サーバとしても利用可能にしたものです。

### RubyInstaller
{: #rubyinstaller}

もしあなたが Windows を使っているなら [RubyInstaller][rubyinstaller] を使って Ruby をインストールすることができます。
これは、完全な Ruby 開発環境を Windows 上にセットアップしてくれます。

RubyInstaller を使うには、[RubyInstaller のページ][rubyinstaller] からダウンロードしてください。
そしてこのインストーラを実行するだけです！

### RailsInstaller
{: #railsinstaller}

[RailsInstaller][railsinstaller] を利用すると、インストーラを実行するだけで Windows 上に Rails 開発環境を構築できます。

## パッケージ管理システム
{: #package-management-systems}

もしあなたが Ruby をコンパイルできず、サードパーティツールを使いたくないのであれば、
あなたのシステムのパッケージマネージャを使って Ruby をインストールすることができます。

Ruby コミュニティの中の一部のメンバーは Ruby をインストールするのに、
パッケージマネージャを使わず、代わりに専用のツールを使うべきであると強く考えています。
その利点・欠点を詳述するのはこのページの範囲から逸脱するため割愛しますが、
最大の理由は大半のパッケージマネージャは公式リポジトリに古いバージョンの Ruby しかないからです。
もしあなたが新しい Ruby を使いたければ、パッケージ名が正しいか確認するか、
上述した専用ツールを使ってください。

このページには以下のパッケージマネージャが記述されています。

* [apt (Debian or Ubuntu)](#apt)
* [yum (CentOS, Fedora, or RHEL)](#yum)
* [portage (Gentoo)](#gentoo)
* [pacman (Arch Linux)](#pacman)
* [Homebrew (OS X)](#homebrew)
* [Solaris, OpenIndiana](#solaris)


### apt (Debian or Ubuntu)
{: #apt}

Debian GNU/Linux および Ubuntu は apt というパッケージマネージャを使っています。
これはこのように実行することができます:

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

これを書いている時点では、 Debian と Ubuntu の `ruby` パッケージは古い Ruby 1.9.3 を提供しています。


### yum (CentOS, Fedora, or RHEL)
{: #yum}

CentOS、Fedora、および RHEL は yum というパッケージマネージャを使っています。
これはこのように実行することができます:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

インストールされるバージョンは、一般に、特定のディストリビューションのバージョンがリリースされた時点での、Ruby の最新バージョンです。


### portage (Gentoo)
{: #portage}

Gentoo は portage というパッケージマネージャを使っています。

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

デフォルトでは、このコマンドはすべての利用可能なバージョン (1.8、1.9 および 2.0) をインストールしようとします。
特定のバージョンをインストールするには、 `RUBY_TARGETS` を `make.conf` に設定してください。
詳しくは、[Gentoo Ruby Project][gentoo-ruby] を参照してください。


### pacman (Arch Linux)
{: #pacman}

Arch Linux は pacman というパッケージマネージャを使っています。
Ruby を手に入れるには、次のようにしてください:

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew (OS X)
{: #homebrew}

Ruby 2.0.0 は OS X El Capitan、Yosemite および Mavericks に含まれています。
また、OS X Mountain Lion、Lion および Snow Leopard には 1.8.7 が含まれています。

すでに 2.0 も 1.8 も古いバージョンです。
そのため、Ruby の最新バージョンをインストールするためのいくつかの方法があります。

Ruby コミュニティにいる大半の OS X ユーザは Ruby をインストールするためにサードパーティ製のツールを使用しています。
しかし、いくつかのパッケージマネージャが Ruby をサポートしています。

多くの OS X ユーザはパッケージマネージャとして [Homebrew][homebrew] を使っています。
これを使うと本当に簡単に Ruby を手に入れることができます:

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

また、 OS X は Unix ベースなので、ソースコードをダウンロードしてインストールするのも、
他の方法と同じように簡単で効果的な方法です。
OS X 上で新しい Ruby のバージョンをインストールする手助けのために、
サードパーティ製ツールを使うことも良い方法だと考えられます。


### Solaris と OpenIndiana での Ruby
{: #solaris}

[Sunfreeware][sunfreeware] で Solaris 8 から 10 用の Ruby 1.8.7 が使用できます。
[Blastwave][blastwave] で Ruby 1.8.7 が使用できます。
[Sunfreeware][sunfreeware] で Ruby 1.9.2p0 も使用できますが、これは古いバージョンです。
サードパーティ製ツールを使用することで最新バージョンの Ruby を手に入れることができます。

[OpenIndiana][openindiana] で Ruby をインストールするには、
[Image Packaging System (IPS)][opensolaris-pkg] クライアントを使ってください。
これは Ruby バイナリと RubyGems を直接 OpenSolaris ネットワークリポジトリからインストールします:

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

前述の通り、サードパーティツールを使うことが最新バージョンの Ruby を手に入れるための良い方法です。


### 他のディストリビューション

他のシステム上でも、あなたの Linux ディストリビューションのパッケージマネージャ用のパッケージリポジトリから
Ruby を探すことができる可能性があります。
また、サードパーティ製ツールを使うことがおそらくは正しい選択です。


## ソースからのビルド
{: #building-from-source}

もちろん、Ruby をソースからインストールすることができます。
ダウンロードして tarball を展開し、次のようにしてください:

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

デフォルトでは、Ruby は `/usr/local` にインストールされます。
これを変更するには、`--prefix=DIR` オプションを `./configure` スクリプト実行時に付けてください。

しかしながら、サードパーティ製ツールかパッケージマネージャを使う方が良い考えです。
何故なら、ソースからインストールされた Ruby はどのツールからも管理されないからです。


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[active-script-ruby]: http://www.artonx.org/data/asr/
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
