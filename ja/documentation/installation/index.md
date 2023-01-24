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

* macOS

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [chruby](#chruby)
  * [Homebrew](#homebrew)
  * [ソースからのビルド](#building-from-source)

* Linux/UNIX

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [chruby](#chruby)
  * [パッケージ管理システム](#package-management-systems)
  * [ソースからのビルド](#building-from-source)

* Windows

  * [WSL](#apt-wsl)
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
[ruby-build](https://github.com/rbenv/ruby-build) というポピュラーなプラグインを使うことで Ruby をインストールすることができます。

それぞれのツールは macOS、Linux およびその他 UNIX-like なオペレーティングシステムに対応しています。

rbenv をインストールする方法は [rbenvのページ][rbenv] に記述されています。

rbenv と似たツールとして、次に説明する RVM や chruby があります。
そちらも確認して、良い方を選んでください。


### RVM ("Ruby Version Manager")
{: #rvm}

RVM は複数の Ruby のインストールと管理を行うことができます。
このツールは macOS、Linux およびその他 UNIX-like なオペレーティングシステムに対応しています。

RVM をインストールする方法は [rvm.io][rvm] に記述されています。

### chruby
{: #chruby}

chruby では複数の Ruby を管理することができます。

chruby は Ruby のインストール自体はサポートしていませんが、
[ruby-install](https://github.com/postmodern/ruby-install) や [ruby-build](https://github.com/rbenv/ruby-build) というポピュラーなプラグインを使うことで Ruby をインストールすることができます。

それぞれのツールは macOS、Linux およびその他 UNIX-like なオペレーティングシステムに対応しています。

chruby をインストールする方法は [chrubyのページ][chruby] に記述されています。

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

  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora,RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#pkg)
  * [OpenBSD](#doas)
  * [OpenIndiana](#openindiana)
  * [Windows Package manager](#winget)
  * [Chocolatey package manager for Windows](#choco)
  * [Other Distribution](#other)


### apt (Debian or Ubuntu)
{: #apt}

Debian GNU/Linux および Ubuntu は apt というパッケージマネージャを使っています。
これはこのように実行することができます:

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

### yum (CentOS, Fedora, or RHEL)
{: #yum}

CentOS、Fedora、および RHEL は yum というパッケージマネージャを使っています。
これはこのように実行することができます:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

インストールされるバージョンは、一般に、特定のディストリビューションのバージョンがリリースされた時点での、Ruby の最新バージョンです。

### snap (Ubuntu やその他の Linux distribution)
{: #snap}

SnapはCanonialによって開発されたパッケージ管理システムです。こちらはUbuntu上で利用が可能な点に加えて他の多数のLinuc distributionでも動かすことができます。
以下のように実行します。

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

Rubyにはいくつかのマイナーシリーズがあります。例えば以下のように実行するとRuby2.3に切り替えることが可能です。

{% highlight sh %}
$ sudo snap switch ruby --channnell=2.3/stable
$ sudo snap refresh
{% endhighlight %}

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

こちらはRubyの最新の安定版をインストールすることを推奨します。

### Homebrew (macOS)
{: #homebrew}

El Capitan (10.11) のリリース以降、macOS には Ruby 2.0 以上が同梱されています。
[Homebrew](https://brew.sh/)はmacOSで利用されているパッケージ管理システムです。
Homebrewを使うことでRubyを簡単にインストールできます。


{% highlight sh %}
$ brew install ruby
{% endhighlight %}

こちらはRubyの最新の安定版をインストールすることを推奨します。

### FreeBSD
{: #pkg}
FreeBSDでは、Rubyをインストールする方法として、パッケージ化されたものとソースベースのものの両方が用意されています。プリビルドパッケージはpkgツールでインストールできます。

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

[Ports Collection](https://docs.freebsd.org/en/books/handbook/ports/#ports-using)を使用してRubyをインストールする場合、ソースベースの方法を使用することが可能です。
こちらはビルドの設定ツールをカスタマイズしたい場合に便利です。

FreeBSDにおけるRubyと関連するエコシステムのもっと詳しい情報は[FreeBSD Ruby Projects website](https://wiki.freebsd.org/Ruby) で確認が可能です。 

### OpenBSD
{: #doas}
OpenBSDやそのディストリビューションであるadJには、Rubyの3つの主要なバージョンに対応したパッケージが用意されています。以下のコマンドで、利用可能なバージョンを確認し、インストールすることができます。

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

複数のメジャーバージョンを並列でインストールすることができます。なぜかというと、それらのバイナリは異なる名前を持っているからです (例: ruby27, ruby26)。

`OpenBSD` のportsコレクションの `HEAD` ブランチには、このプラットフォーム用のRubyの最新版がリリースされてから一定期間経ったものが含まれている可能性があり、[directory lang/ruby in the most recent ports collection](https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD)を確認してください。

### Ruby on OpenIndiana
{: #openindiana}
[OpenIndiana](https://www.openindiana.org/)にRubyをインストールするには、ImagePackagingSystem(IPS)クライアントを利用してください。これは、RubyバイナリとRubyGemsをOpenIndianaのリポジトリから直接インストールするものです。簡単です。

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

しかし、最新版のRubyをインストールするにはサードパーティツールを使う方が良いかもしれません。

### Windows Package Manager
{: #winget}
WindowsでRubyをインストールするには[Windows Package Manager CLI](https://github.com/microsoft/winget-cli)を利用します。

{% highlight sh %}
> winget install RubyInstallTeam.Ruby
{% endhighlight %}

### Chocolatey package manager for Windows
{: #choco}
同じくWindowsでは[Chocolatey Package Manager](https://chocolatey.org/install) を利用してRubyのインストールが可能です。
 
{% highlight sh %}
> choco install ruby
{% endhighlight %}

既存のmsys2を再利用するか、独自のものをインストールして完全なRuby開発環境を構築します。

### その他のディストリビューション
{: #other}
その他のシステムでは，お使いのLinuxディストリビューションのマネージャのパッケージリポジトリを検索して，Rubyを探すことができます。
もしくはサードパーティのインストーラを使うこともできます．
 

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

ソースからのビルドに関する詳しい情報は [Building Ruby instructions][building-ruby] で見ることができます。

しかしながら、サードパーティ製ツールかパッケージマネージャを使う方が良い考えです。
何故なら、ソースからインストールされた Ruby はどのツールからも管理されないからです。


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[chruby]: https://github.com/postmodern/chruby
[active-script-ruby]: http://www.artonx.org/data/asr/
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[sunfreeware]: http://www.sunfreeware.com
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
[building-ruby]: https://github.com/ruby/ruby/blob/master/doc/contributing/building_ruby.md
