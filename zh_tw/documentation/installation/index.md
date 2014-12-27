---
layout: page
title: "安裝 Ruby"
lang: zh_tw
---

有很多工具可以安裝 Ruby。本頁介紹如何使用主流的套件管理工具以及第三方工具來管理、安裝 Ruby 以及如何從原始碼來編譯 Ruby。
{: .summary}


## 選擇安裝方式

有許多種方式可以安裝 Ruby：

* 在類 Unix 平台上，使用系統的**套件管理工具**是最簡單的安裝方式。但套件管理工具安裝的 Ruby 可能不是最新的版本。
* **安裝工具** 可以用來安裝特定版本或多版本的 Ruby。Windows 也有一個安裝工具。
* **版本管理工具** 用來切換系統已安裝的 Ruby 之用。
* 最後，也可以從**原始碼編譯** Ruby。

以下是不同平台與需求可用安裝方式一覽。

* [套件管理系統](#package-management-systems)
  * [Debian、Ubuntu](#apt)
  * [CentOS、Fedora、RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [OS X](#homebrew)
  * [Solaris、OpenIndiana](#solaris)
  * [其他發行版](#other-systems)
* [安裝工具](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller 和 Ruby 安裝包](#railsinstaller)
* [版本管理](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [從原始碼編譯](#building-from-source)


## 系統套件管理工具
{: #package-management-systems}

若無法編譯 Ruby，也不想使用第三方工具，可以使用系統的套件管理工具來安裝 Ruby。

許多 Ruby 社群的成員強烈建議不要使用套件管理工具來安裝 Ruby，應該使用下面羅列的工具來取代。完整的優缺點超出了本文的範疇，最簡單的理由是，多數的套件管理工具安裝的 Ruby 版本老舊，如果想要使用最新版的 Ruby，確認你安裝了正確名稱的套件，或使用下面其他的工具吧。


### apt（Debian 或 Ubuntu）
{: #apt}

Debian GNU/Linux 和 Ubuntu 的使用者可以使用 apt。
用法：

{% highlight sh %}
$ sudo apt-get install ruby
{% endhighlight %}

撰文當下 `ruby` 套件在 Debian 與 Ubuntu 平台上所提供的版本是老舊的穩定版 Ruby 1.9.3。


### yum（CentOS、Fedora 或 RHEL）
{: #yum}

CentOS、Fedora 和 RHEL 使用 yum 套件管理工具。
用法：

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

安裝的版本通常是作業系統發行版發行日所打包的最新版 Ruby。


### portage（Gentoo）
{: #portage}

Gentoo 使用 portage 套件管理工具。

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

預設會試著安裝 1.9 和 2.0，但還能安裝更多版本。要安裝特定版本，在 `make.conf` 設定 `RUBY_TARGETS`。進一步了解請參考 [Gentoo Ruby 專案網站][gentoo-ruby]。


### pacman (Arch Linux)
{: #pacman}

Arch Linux 使用 pacman 套件管理工具。
用法：

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

會安裝最新穩定版的 Ruby。


### Homebrew（OS X）
{: #homebrew}

OS X Mavericks 內建 Ruby 2.0。
OS X Mountain Lion、Lion 以及 Snow Leopard 出廠內建 Ruby 1.8.7。

OS X 的使用者使用 [Homebrew][homebrew] 作為套件管理工具。
用法：

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

會安裝最新穩定版的 Ruby。


### Solaris 和 OpenIndiana 平台
{: #solaris}

[Sunfreeware][sunfreeware] 上的 Solaris 8 到 10 版有 Ruby 1.8.7 可用，同時 [Blastwave][blastwave] 上也有 Ruby 1.8.7。Ruby 1.9.2p0 在 [Sunfreeware][sunfreeware] 也有，但版本已經過時了。

要在 [OpenIndiana][openindiana] 安裝 Ruby，請使用：
[Image Packaging System (IPS)][opensolaris-pkg] 客戶端。
這會直接從 OpenSolaris 網路的原始碼庫安裝最新的 Ruby 1.9 以及 RubyGems：

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

但用第三方工具來獲得最新版本 Ruby 可能比較好。


### 其它發行版

其它作業系統可以在發行版的套件庫上搜尋 Ruby，或是使用第三方工具可能會比較好。


## 安裝工具
{: #installers}

若系統或套件管理員提供的 Ruby 版本過時的話，可以使用第三方的安裝工具來安裝。有些工具允許在系統上安裝多個版本的 Ruby；相關的版本管理工具可以用來切換不同版本的 Ruby。若計畫要使用 [RVM](#rvm) 作為版本管理工具，則不需要獨立安裝版本管理工具，RVM 內建了版本管理功能。


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] 是 [rbenv](#rbenv) 的一個插件，可以編譯及安裝不同版本的 Ruby 到任意目錄下。ruby-build 也可以不搭配 rbenv 使用。ruby-build 在 OS X、Linux 以及類 UNIX 平台下都可使用。


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] 可以編譯及安裝不同版本的 Ruby 到任意目錄下。還有一個姊妹工具叫做 [chruby](#chruby)，可以用來切換不同版本的 Ruby。ruby-install 在 OS X、Linux 以及類 UNIX 平台下都可使用。


### RubyInstaller
{: #rubyinstaller}

Windows 使用者，可以使用這個很棒的專案來幫助您安裝 Ruby：
[RubyInstaller][rubyinstaller]。提供 Windows 平台完整的 Ruby 開發環境所需的一切。

下載、執行，即可！


### RailsInstaller 和 Ruby 安裝包
{: #railsinstaller}

若安裝 Ruby 是為了要開發 Ruby on Rails，則可用下列的安裝工具：

* [RailsInstaller][railsinstaller],
  背後使用的是 RubyInstaller，但帶有 Rails 開發環境所需的工具。
  支援 OS X 與 Windows。
* [Bitnami Ruby Stack][rubystack],
  提供完整的 Rails 開發環境。
  兼容 OS X、Linux、Windows、虛擬機器以及雲鏡像。


## 版本管理工具
{: #managers}

許多 Rubyists 使用 Ruby 版本管理工具來管理多版本的 Ruby。版本管理工具有很多優點，但要注意 Ruby 官方並不提供技術支援。但要提的是每個工具背後的社群都非常有幫助。


### chruby
{: #chruby}

[chruby][chruby] 可以切換 Ruby 版本。chruby 可以管理由 [ruby-install](#ruby-install) 所安裝的 Ruby，或是從原始碼所編譯的 Ruby。


### rbenv
{: #rbenv}

[rbenv][rbenv] 可以在系統上安裝多個版本的 Ruby。rbenv 本身不能安裝 Ruby，但有一個流行的插件，叫做 ruby-build，可以用來安裝 Ruby。支援 OS X、Linux 和其它類 Unix 的作業系統。


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] 可以在系統上安裝多個版本的 Ruby。也可以管理不同的 Gem 包（gemset）。兼容 OS X、Linux 和其它類 Unix 的作業系統。


## uru
{: #uru}

[Uru][uru] 是一個輕量、支援多平台的命令列工具，幫助您在 OS X、Linux 以及 Windows 上安裝多版本的 Ruby。


## 從原始碼編譯
{: #building-from-source}

當然從原始碼編譯 Ruby 也可以。
[下載 Ruby](/zh_tw/downloads/) 並解壓縮 tarball，接著執行：

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

預設會安裝 Ruby 到 `/usr/local` 目錄。要更改安裝目錄請在使用 `./configure` 腳本時傳入 `--prefix=DIR` 選項。

使用第三方工具或套件管理工具來安裝可能比較好，因為從原始碼編譯安裝的 Ruby 無法用任何工具管理。


[rvm]: http://rvm.io/
[rbenv]: https://github.com/sstephenson/rbenv#readme
[ruby-build]: https://github.com/sstephenson/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: http://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[sunfreeware]: http://www.sunfreeware.com
[blastwave]: http://www.blastwave.org
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
