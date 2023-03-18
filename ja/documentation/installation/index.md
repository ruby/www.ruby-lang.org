---
layout: page
title: "Rubyのインストール"
lang: ja
---

いくつかのツールを使ってRubyをインストールできます。
このページでは、Rubyの管理とインストールのための、メジャーなパッケージ管理ツールとサードパーティツールについて解説します。

あなたのコンピューターにはすでにRubyがインストールされているかもしれません。[ターミナルソフト][terminal]で以下のように打つと確認することができます。

{% highlight sh %}
ruby -v
{% endhighlight %}

インストールされているRubyのバージョンに関する情報が出力されるはずです。
## インストール方法を選択
Rubyをインストールするには、いくつかの方法があります。

* UNIX系のOSでは、システムの ***パッケージマネージャ*** を利用するのが最も簡単です。ただし、パッケージ化されたRubyのバージョンが最新であるとは限りません。
* ***インストーラ*** を使えば、特定の、あるいは複数のRubyバージョンをインストールすることができます。また、Windows用のインストーラもあります。
* ***マネージャ*** は、システム上で複数のRubyのバージョンを切り替えるのに役立ちます。
* 最後に、***Rubyをソースからビルドする***こともできます。

Windows 10 では、[Windows Subsystem for Linux][wsl] を使用して、サポートされている Linux ディストリビューションの 1 つをインストールし、そのシステムで利用可能なインストール方法のいずれかを使用することもできます。

以下は、利用可能なインストール方法です。

* [Package Management Systems](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenBSD](#openbsd)
  * [OpenIndiana](#openindiana)
  * [Windows Package Manager](#winget)
  * [Chocolatey package manager for Windows](#chocolatey)
  * [Other Distributions](#other-systems)
* [Installers](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [Managers](#managers)
  * [asdf-vm](#asdf-vm)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [rbenv for Windows](#rbenv-for-windows)
  * [RVM](#rvm)
  * [uru](#uru)
* [Building from source](#building-from-source)

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

SnapはCanonialによって開発されたパッケージ管理システムです。こちらはUbuntu上で利用が可能な点に加えて他の多数のLinux distributionでも動かすことができます。
以下のように利用できます:

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

マイナーシリーズごとの channel が用意されています。例えば以下を実行するとRuby 2.3に切り替えることが可能です。

{% highlight sh %}
$ sudo snap switch ruby --channnel=2.3/stable
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
[Homebrew](https://brew.sh/) は macOS で広く利用されているパッケージ管理システムです。Homebrew で Ruby をインストールするのは下記のように簡単です:


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

ports を利用してソースコードからインストールする場合、[Ports Collection](https://docs.freebsd.org/en/books/handbook/ports/#ports-using) を利用してください。この方法はビルド設定をカスタマイズする場合に便利です。

FreeBSDにおけるRubyとそのエコシステムの詳しい情報は [FreeBSD Ruby Projects website](https://wiki.freebsd.org/Ruby) で確認できます。

### OpenBSD
{: #doas}
OpenBSDやそのディストリビューションであるadJには、Rubyの3つの主要なバージョンに対応したパッケージが用意されています。以下のコマンドで、利用可能なバージョンを確認し、インストールすることができます。

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

複数のメジャーバージョンを共存させインストールすることができます。それらのバイナリは異なる名前を持っているからです (例: ruby27, ruby26)。

リリース間も無い最新版の Ruby は OpenBSD の ports collection の `HEAD` ブランチで提供されている場合があります。 [最新 ports collections の lang/ruby](https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD) もあわせて確認してください。

### Ruby on OpenIndiana
{: #openindiana}
[OpenIndiana](https://www.openindiana.org/) に Ruby をインストールするには、Image Packaging System (IPS) クライアントを利用してください。これは、 Ruby バイナリと RubyGems  をOpenIndiana のリポジトリから直接インストールするものです。簡単です:

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
もしくはサードパーティのインストーラを使うこともできます。

## インストーラ
{: #installers}

システムやパッケージマネージャが提供するRubyのバージョンが古い場合、サードパーティ製のインストーラを使って新しいものをインストールすることができます。

インストーラの中には、同じシステム上に複数のバージョンをインストールできるものもあり、関連するマネージャは、異なるRubyを切り替えるのに役立ちます。

[RVM](#rvm)をバージョン管理として使用する場合は、別途インストーラを用意する必要はなく、インストーラが付属しています。

### ruby-build
{: #ruby-build}

[ruby-build][ruby-build]は[rbenv](#rbenv)のプラグインで、異なるバージョンのRubyのコンパイルとインストールを可能にします。ruby-buildはrbenvなしでスタンドアロンプログラムとして使用することも可能です。macOS、Linux、その他のUNIX系OSで利用可能です。

### ruby-install
{: #ruby-install}

[ruby-install][ruby-install]は、異なるバージョンのRubyをコンパイルし、任意のディレクトリにインストールすることができます。 [chruby](#chruby) は、Rubyのバージョンを切り替えるために使用される補完的なツールです。macOS、Linux、その他のUNIX系OSで利用可能です。
### RubyInstaller
{: #rubyinstaller}

もしあなたが Windows を使っているならRubyInstallerを使って Ruby をインストールすることができます。
これは、完全な Ruby 開発環境を Windows 上にセットアップしてくれます。

RubyInstaller を使うには、[RubyInstaller のページ][rubyinstaller] からダウンロードしてください。
そしてインストーラを実行するだけです！
### Ruby Stack
{: #rubystack}

Ruby on Railsを利用するためにRubyをインストールする場合は、以下のインストーラを利用することができます。

* [Bitnami Ruby Stack][rubystack]は、Railsのための完全な開発環境を提供します。macOS、Linux、Windows、仮想マシン、クラウドイメージをサポートしています。

## マネージャ
{: #managers}

多くのRubyistは、複数のRubyを管理するためにRubyマネージャを使用しています。プロジェクトに応じてRubyのバージョンを簡単に、あるいは自動的に切り替えることができるなどの利点がありますが、公式にはサポートされていません。しかし、それぞれのコミュニティでサポートを見つけることができます。

### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm]は拡張可能なバージョンマネージャで、複数の言語のランタイムバージョンをプロジェクト単位で管理することができる。Rubyをインストールするには、[asdf-ruby][asdf-ruby]プラグイン（これは[ruby-build][ruby-build]を使用します）が必要です。
### chruby
{: #chruby}

chruby では複数の Ruby を管理することができます。

chruby は Ruby のインストール自体はサポートしていませんが、
[ruby-install](https://github.com/postmodern/ruby-install) や [ruby-build][ruby-build] というポピュラーなプラグインを使うことで Ruby をインストールすることができます。

それぞれのツールは macOS、Linux およびその他 UNIX-like なオペレーティングシステムに対応しています。

chruby をインストールする方法は [chrubyのページ][chruby] に記述されています。

### rbenv
{: #rbenv}

rbenv では複数の Ruby を管理することができます。

rbenv は Ruby のインストール自体はサポートしていませんが、
[ruby-build][ruby-build] というポピュラーなプラグインを使うことで Ruby をインストールすることができます。

それぞれのツールは macOS、Linux およびその他 UNIX-like なオペレーティングシステムに対応しています。

rbenv をインストールする方法は [rbenvのページ][rbenv] に記述されています。

### rbenv for Windows
{: #rbenv-for-windows}

[rbenv for Windows][rbenv-for-windows]は、WindowsにRubyを複数インストールし、管理することができます。PowerShellで書かれているため、WindowsユーザーにとってRubyを使うためのネイティブな方法を提供します。また、コマンドラインインターフェースはUNIX系システムの[rbenv][rbenv]と互換性があります。

### RVM ("Ruby Version Manager")
{: #rvm}

RVM は複数の Ruby のインストールと管理を行うことができます。
このツールは macOS、Linux およびその他 UNIX-like なオペレーティングシステムに対応しています。

RVM をインストールする方法は [rvm.io][rvm] に記述されています。

### uru
{: #uru}

[Uru][uru]は、macOS、Linux、Windowsシステム上で複数のRubieを使用するのに役立つ、軽量でマルチプラットフォーム対応のコマンドラインツールです。

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
[terminal]: https://en.wikipedia.org/wiki/List_of_terminal_emulators
[wsl]: https://learn.microsoft.com/ja-jp/windows/wsl/about
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[rubyinstaller]: https://rubyinstaller.org/
[rubystack]: https://bitnami.com/stack/ruby/virtual-machine
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[rbenv-for-windows]: https://github.com/ccmywish/rbenv-for-windows#readme
[uru]: https://bitbucket.org/jonforums/uru/src/master/
