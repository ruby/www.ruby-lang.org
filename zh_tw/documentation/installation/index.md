---
layout: page
title: "安裝 Ruby"
lang: zh_tw
---

有很多工具可以安裝 Ruby。本頁介紹如何使用主流的套件管理工具以及第三方工具來管理、安裝 Ruby 以及如何從原始碼來編譯 Ruby。
{: .summary}

如果您已經在您的電腦上安裝了 Ruby。您可以在 [terminal emulator][terminal] 中執行以下指令確認：

{% highlight sh %}
ruby -v
{% endhighlight %}

輸出結果應該會顯示已安裝的 Ruby 版本資訊。

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
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenBSD](#openbsd)
  * [OpenIndiana](#openindiana)
  * [Windows Package Manager](#winget)
  * [Chocolatey package manager for Windows](#chocolatey)
  * [其它發行版](#other-systems)
* [安裝工具](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [Ruby Stack](#rubystack)
* [版本管理](#managers)
  * [asdf-vm](#asdf-vm)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [rbenv for Windows](#rbenv-for-windows)
  * [RVM](#rvm)
  * [uru](#uru)
* [從原始碼編譯](#building-from-source)


## 系統套件管理工具
{: #package-management-systems}

若無法編譯 Ruby，也不想使用第三方工具，可以使用系統的套件管理工具來安裝 Ruby。

許多 Ruby 社群的成員強烈建議不要使用套件管理工具來安裝 Ruby，應該使用下面羅列的工具來取代。完整的優缺點超出了本文的範疇，最簡單的理由是，多數的套件管理工具安裝的 Ruby 版本老舊，如果想要使用最新版的 Ruby，確認你安裝了正確名稱的套件，或使用下面其他的工具吧。

本文包含以下套件管理工具說明：

  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora,RHEL](#yum)
  * [Snap](#snap)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [FreeBSD](#freebsd)
  * [OpenBSD](#openbsd)
  * [OpenIndiana](#openindiana)
  * [Windows Package manager](#winget)
  * [Chocolatey package manager for Windows](#chocolatey)
  * [Other Distribution](#other-systems)

### apt（Debian 或 Ubuntu）
{: #apt}

Debian GNU/Linux 和 Ubuntu 的使用者可以使用 apt 套件管理工具。
用法：

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}


### yum（CentOS、Fedora 或 RHEL）
{: #yum}

CentOS、Fedora 和 RHEL 使用 yum 套件管理工具。
用法：

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

安裝的版本通常是作業系統發行版發行日所打包的最新版 Ruby。

### snap (Ubuntu or other Linux distributions)
{: #snap}

Snap 是 Canonical 所開發的套件管理工具。內建於 Ubuntu，但 snap 也能在許多其他的 Linux 發行版上使用。
用法：

{% highlight sh %}
$ sudo snap install ruby --classic
{% endhighlight %}

我們為每個 Ruby 小版本提供了幾個 channel。
例如，使用以下指令切換到 Ruby 2.3：

{% highlight sh %}
$ sudo snap switch ruby --channel=2.3/stable
$ sudo snap refresh
{% endhighlight %}

### portage（Gentoo）
{: #portage}

Gentoo 使用 portage 套件管理工具。

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

要安裝特定版本，在 `make.conf` 設定 `RUBY_TARGETS`。進一步了解請參考 [Gentoo Ruby 專案網站][gentoo-ruby]。


### pacman (Arch Linux)
{: #pacman}

Arch Linux 使用 pacman 套件管理工具。
用法：

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

會安裝最新穩定版的 Ruby。


### Homebrew（macOS）
{: #homebrew}

從 macOS El Capitan(10.11) 以上內建 Ruby 2.0 以上版本。

macOS 使用者多數使用 [Homebrew][homebrew] 作為套件管理工具。
用法：

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

會安裝最新版的 Ruby。

### FreeBSD
{: #freebsd}

FreeBSD 提供以預編譯和從原始碼編譯的方法安裝 Ruby。
預編譯的套件可以透過 pkg 工具安裝：

{% highlight sh %}
$ pkg install ruby
{% endhighlight %}

從原始碼編譯的方法可以透過使用 [Ports Collection][freebsd-ports-collection] 來安裝 Ruby。
當您想要客製化建置設定選項時，這非常好用。

更多在 FreeBSD 上使用 Ruby 與其生態系的資訊，請參考 [FreeBSD Ruby Project website][freebsd-ruby]。

### OpenBSD
{: #openbsd}

OpenBSD 在發行版本 adJ 中有三個主要 Ruby 版本套件。以下指令可以看到可用的版本並進行安裝：

{% highlight sh %}
$ doas pkg_add ruby
{% endhighlight %}

您可以同時安裝多個主要版本，因為它們的執行檔的名稱不同 (例如：`ruby27`, `ruby26`)。

OpenBSD ports collection 的 `HEAD` 分支可能會在最新的 Ruby 版本釋出幾天後，在該平台提供，請參考 [最新 ports collections 的 lang/ruby][openbsd-current-ruby-ports]。

### Ruby on OpenIndiana
{: #openindiana}

在 [OpenIndiana][openindiana] 上安裝 Ruby，請使用 Image Packaging System (IPS) 客戶端。
這將會直接從 OpenIndiana repositories 安裝 Ruby 與 RubyGems。用法：

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

但用第三方工具來獲得最新版本 Ruby 可能比較好。

### Windows Package Manager
{: #winget}

在 Windows 上您可以使用 [Windows Package Manager CLI](https://github.com/microsoft/winget-cli) 來安裝 Ruby：

{% highlight sh %}
> winget install RubyInstallerTeam.Ruby.{MAJOR}.{MINOR}
# 範例
> winget install RubyInstallerTeam.Ruby.3.2
# 查看所有可用的版本
> winget search RubyInstallerTeam.Ruby
# 注意：如果你正在為專案安裝 ruby，你可能也希望安裝 RubyWithDevKit
> winget install RubyInstallerTeam.RubyWithDevKit.3.2
{% endhighlight %}

### Chocolatey package manager for Windows
{: #chocolatey}

在 Windows 上您也可以使用 [Chocolatey Package Manager](https://chocolatey.org/install) 來安裝 Ruby：

{% highlight sh %}
> choco install ruby
{% endhighlight %}

它會使用現有的 `msys2` 或是進行安裝以提供完整的 Ruby 開發環境。

### 其它發行版
{: #other-systems}

其它作業系統可以在發行版的套件庫上搜尋 Ruby，或是使用 [第三方工具](#installers) 可能會比較好。


## 安裝工具
{: #installers}

若系統或套件管理員提供的 Ruby 版本過時的話，可以使用第三方的安裝工具來安裝。有些工具允許在系統上安裝多個版本的 Ruby；相關的版本管理工具可以用來切換不同版本的 Ruby。若計畫要使用 [RVM](#rvm) 作為版本管理工具，則不需要獨立安裝版本管理工具，RVM 內建了版本管理功能。


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] 是 [rbenv](#rbenv) 的一個插件，可以編譯及安裝不同版本的 Ruby 到任意目錄下。ruby-build 也可以不搭配 rbenv 使用。ruby-build 在 macOS、Linux 以及類 UNIX 平台下都可使用。


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] 可以編譯及安裝不同版本的 Ruby 到任意目錄下。還有一個姊妹工具叫做 [chruby](#chruby)，可以用來切換不同版本的 Ruby。ruby-install 在 macOS、Linux 以及類 UNIX 平台下都可使用。


### RubyInstaller
{: #rubyinstaller}

Windows 使用者，可以使用這個很棒的專案來幫助您安裝 Ruby：
[RubyInstaller][rubyinstaller]。提供 Windows 平台完整的 Ruby 開發環境所需的一切。

下載、執行，即可！


### Ruby Stack
{: #rubystack}

若安裝 Ruby 是為了要開發 Ruby on Rails，則可用下列的安裝工具：

* [Bitnami Ruby Stack][rubystack],
  提供完整的 Rails 開發環境。
  兼容 macOS、Linux、Windows、虛擬機器以及雲鏡像。


## 版本管理工具
{: #managers}

許多 Rubyists 使用 Ruby 版本管理工具來管理多版本的 Ruby。版本管理工具有很多優點，但要注意 Ruby 官方並不提供技術支援。但要提的是每個工具背後的社群都非常有幫助。

### asdf-vm
{: #asdf-vm}

[asdf-vm][asdf-vm] 是一個可擴展的版本管理工具，可基於個別專案來管理多語言執行版本。您需要 [asdf-ruby][asdf-ruby] 插件 (使用 [ruby-build][ruby-build]) 來安裝 Ruby。


### chruby
{: #chruby}

[chruby][chruby] 可以在系統上管理多個版本的 Ruby。chruby 本身無法安裝 Ruby 但可以透過插件像是 [ruby-install][ruby-install] 或 [ruby-build][ruby-build] 安裝 Ruby。支援 macOS、Linux 和其他類 UNIX 的作業系統。

### rbenv
{: #rbenv}

[rbenv][rbenv] 可以在系統上管理多個版本的 Ruby。rbenv 本身不能安裝 Ruby，但可以使用插件 [ruby-build][ruby-build] 安裝 Ruby。支援 macOS、Linux 和其它類 Unix 的作業系統。

### rbenv for Windows
{: #rbenv-for-windows}

[rbenv for Windows][rbenv-for-windows] 可以在 Windows 作業系統上安裝多個版本的 Ruby。它是用 PowerShell 撰寫並提供 Windows 使用者原生方法來使用 Ruby。使用方式相容於在類 Unix 的作業系統上的 [rbenv][rbenv]。


### RVM ("Ruby Version Manager")
{: #rvm}

[RVM][rvm] 可以在系統上安裝多個版本的 Ruby。也可以管理不同的 Gem 包（gemset）。兼容 macOS、Linux 和其它類 Unix 的作業系統。


### uru
{: #uru}

[Uru][uru] 是一個輕量、支援多平台的命令列工具，幫助您在 macOS、Linux 以及 Windows 上安裝多版本的 Ruby。


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

您可以在 [Building Ruby instructions][building-ruby] 找到更多關於從原始碼編譯的資訊。

使用第三方工具或套件管理工具來安裝可能比較好，因為從原始碼編譯安裝的 Ruby 無法用任何工具管理。


[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rbenv-for-windows]: https://github.com/ccmywish/rbenv-for-windows#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby
[uru]: https://bitbucket.org/jonforums/uru/src/master/
[rubyinstaller]: https://rubyinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[openindiana]: http://openindiana.org/
[opensolaris-pkg]: http://opensolaris.org/os/project/pkg/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[freebsd-ruby]: https://wiki.freebsd.org/Ruby
[freebsd-ports-collection]: https://docs.freebsd.org/en/books/handbook/ports/#ports-using
[homebrew]: http://brew.sh/
[terminal]: https://en.wikipedia.org/wiki/List_of_terminal_emulators
[github-ruby]: https://github.com/ruby/ruby
[wsl]: https://learn.microsoft.com/zh-tw/windows/wsl/about
[asdf-vm]: https://asdf-vm.com/
[asdf-ruby]: https://github.com/asdf-vm/asdf-ruby
[openbsd-current-ruby-ports]: https://cvsweb.openbsd.org/cgi-bin/cvsweb/ports/lang/ruby/?only_with_tag=HEAD
