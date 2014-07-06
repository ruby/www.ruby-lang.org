---
layout: page
title: "安裝 Ruby"
lang: zh_tw
---

安裝 Ruby 有很多工具。本頁介紹如何使用主流的套件管理工具以及第三方工具來管理、安裝 Ruby 以及如何從原始碼編譯 Ruby。
{: .summary}


## 各平台安裝方法

以下是各平台可用安裝方法的綜覽清單。選擇自己覺得最合適的安裝方式。

* OS X

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Homebrew](#homebrew)
  * [從原始碼編譯](#building-from-source)

* Linux/UNIX

  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [Package management systems](#package-management-systems)
  * [從原始碼編譯](#building-from-source)

* Windows

  * [RubyInstaller](#rubyinstaller)
  * [pik][pik]


## 第三方工具

許多 Rubyists 使用第三方工具來安裝 Ruby。
這些工具各有各的好處，但官方不負責支援這些工具。
但這些出色的社群工具確實很有用。


### rbenv
{: #rbenv}

[rbenv][rbenv] 可以在系統上安裝多個版本的 Ruby。rbenv 本身不能安裝 Ruby，但有一個流行的插件，叫做 ruby-build，可以用來安裝 Ruby。兼容 OS X、Linux 以及其它類 Unix 作業系統。


### RVM（“Ruby Version Manager”）
{: #rvm}

[RVM][rvm] 可以在系統上安裝多個版本的 Ruby。也可以管理不同的 Gem 包（gemset）。兼容 OS X、Linux 以及其它類 Unix 作業系統。


### RubyInstaller
{: #rubyinstaller}

Windows 使用者，可以使用這個很棒的專案來安裝 Ruby：
[RubyInstaller][rubyinstaller]。提供 Windows 平台完整的 Ruby 開發環境所需的一切。

下載、執行，搞定！


### RailsInstaller 與 Ruby Stack

若安裝 Ruby 是要開發 Ruby on Rails，則可用下列的安裝工具：

* [RailsInstaller][railsinstaller]
  背後使用的是 RubyInstaller，但帶有 Rails 開發環境所需的工具。
  兼容 OS X 與 Windows。
* [Bitnami Ruby Stack][rubystack]
  提供完整的 Rails 開發環境。
  兼容 OS X、Linux、Windows、虛擬機器以及雲鏡像。


## 套件管理系統
{: #package-management-systems}

若無法自行編譯 Ruby，也不想使用第三方工具，可以使用系統的套件管理工具來安裝 Ruby。Ruby 社群成員強烈建議永遠不要使用套件管理工具來安裝 Ruby，應該使用第三方工具。但第三方工具的好壞超出本文的範疇。最主要的理由是多數的套件管理工具的 Ruby 版本老舊。若想使用最新版的 Ruby，請確定安裝了正確的套件，或使用上面介紹的第三方工具。

以下各自介紹如何使用各平台的套件管理工具來安裝 Ruby：

* [apt（Debian 或 Ubuntu）](#apt)
* [yum（CentOS, Fedora 或 RHEL）](#yum)
* [portage（Gentoo）](#gentoo)
* [pacman（Arch Linux）](#pacman)
* [Homebrew（OS X）](#homebrew)
* [Solaris、OpenIndiana](#solaris)


### apt（Debian 或 Ubuntu）
{: #apt}

Debian GNU/Linux 和 Ubuntu 的使用者可以使用 apt。
用法：

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

撰文當下 `ruby` 套件所提供的版本是 Ruby 1.9.3，是 Debian 與 Ubuntu 平台上最老的穩定版本。


### yum（CentOS、Fedora 或 RHEL）
{: #yum}

CentOS、Fedora 和 RHEL 使用 yum。
用法：

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

安裝的版本通常是發行版當下最新版的 Ruby。


### portage（Gentoo）
{: #portage}

Gentoo 使用 portage。

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

預設會試著安裝所有可用的版本（1.8、1.9 以及 2.0）。要安裝特定版本，在 `make.conf` 設定 `RUBY_TARGETS`。參考 [Gentoo Ruby 專案網站][gentoo-ruby]來了解更多細節。


### pacman（Arch Linux）
{: #pacman}

Arch Linux 使用 pacman。
用法：

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}


### Homebrew（OS X）
{: #homebrew}

OS X Mavericks 內建 Ruby 2.0。
OS X Mountain Lion、Lion 以及 Snow Leopard 出廠內建 Ruby 1.8.7。

安裝新版 Ruby 有許多選擇。Ruby 社群多數 OS X 的使用者使用第三方工具來安裝 Ruby，但某些套件管理工具也可以安裝 Ruby。

OS X 的使用者使用 [Homebrew][homebrew] 作為套件管理工具。
用法：

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

同時 OS X 是基於 Unix，下載原始碼並安裝 Ruby 和其它平台上的作法相同，簡單高效。
在 OS X 平台要安裝新版的 Ruby，最好還是使用第三方工具。


### Solaris 和 OpenIndiana 平台
{: #solaris}

[Sunfreeware][sunfreeware] 上的 Solaris 8 到 10 版有 Ruby 1.8.7 可用，同時 [Blastwave][blastwave] 上也有 Ruby 1.8.7。

Ruby 1.9.2p0 在 [Sunfreeware][sunfreeware] 也有，但是過時版本。
使用第三方工具來獲取最新版本的 Ruby。

要在 [OpenIndiana][openindiana] 安裝 Ruby，請使用：
[Image Packaging System (IPS)][opensolaris-pkg] 客戶端。
這會直接從 OpenSolaris 網路的原始碼庫安裝最新的 Ruby 1.9：

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

如前所述，用第三方工具是獲得最新版本 Ruby 的好方法。


### 其它發行版

其它作業系統可以在套件庫上搜尋 Ruby，使用第三方工具可能會比較好。


## 從原始碼編譯
{: #building-from-source}

當然從原始碼編譯 Ruby 也可以。
[下載 Ruby](/en/downloads/)並解壓縮，接著執行：

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

預設會將 Ruby 安裝到 `/usr/local`。要更改請在使用 `./configure` 腳本時傳入 `--prefix=DIR` 選項。

使用第三方工具可能會更好，因為安裝的 Ruby 不受任何工具影響。


[rvm]: http://rvm.io/
[rbenv]: https://github.com/sstephenson/rbenv
[rubyinstaller]: http://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[pik]: https://github.com/vertiginous/pik
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
