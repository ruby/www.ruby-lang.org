---
layout: page
title: "安装 Ruby"
lang: zh_cn
---

可以使用多种工具安装 Ruby。本页介绍如何使用主流的包管理系统和第三方工具管理和安装 Ruby，以及如何通过源码编译安装。
{: .summary}


## 选择安装方式

安装 Ruby 的方式有多种：

* 如果使用的是类 UNIX 操作系统，使用系统的**包管理器**是最简单的安装方式。但是，包管理器中的 Ruby 版本通常都不是最新的。
* **安装工具**能够安装指定的一个或多个 Ruby 版本。有针对 Windows 的安装包。
* **管理工具**能帮助你在系统中安装的多个 Ruby 版本之间切换。
* 最后，也可以**通过源码编译安装 Ruby**。

下面概述针对不同需求和不同平台的安装方式。

* [包管理系统](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [macOS](#homebrew)
  * [OpenIndiana](#openindiana)
  * [其他发行版](#other-systems)
* [安装工具](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller 和 Ruby Stack](#railsinstaller)
* [管理工具](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [通过源码编译安装](#building-from-source)


## 包管理系统
{: #package-management-systems}

如果不能自己编译 Ruby，也不想使用第三方工具，可以使用系统中的包管理器安装 Ruby。

许多 Ruby 社区的成员强烈建议，应该使用第三方工具来安装 Ruby，不要用系统的包管理器。详细的优缺点超出了本页的讨论范畴，基本原因是大多数系统包管理器里的 Ruby 版本比较老。如果想使用最新的 Ruby 版本，要确保包的名称正确，或者使用后面列出的工具。


### apt（Debian 或 Ubuntu）
{: #apt}

Debian GNU/Linux 和 Ubuntu 使用 apt 包管理器。用法如下：

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

### yum（CentOS、Fedora 或 RHEL）
{: #yum}

CentOS、Fedora 和 RHEL 使用 yum 包管理器。用法如下：

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

安装的 Ruby 版本通常是发行版发行日能打包的最新版。


### portage（Gentoo）
{: #portage}

Gentoo 使用 portage 包管理器。

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

安装指定的版本，要在 `make.conf` 文件中设置 `RUBY_TARGETS`。详见 [Gentoo Ruby Project 网站][gentoo-ruby]。


### pacman（Arch Linux）
{: #pacman}

Arch Linux 使用 pacman 包管理器。要安装 Ruby，只需要执行下述命令：

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

这将安装最新的 Ruby 稳定版。


### Homebrew（macOS）
{: #homebrew}

macOS (High) Sierra 和 OS X El Capitan 已内置了 Ruby 2.0。

许多 macOS 用户使用 [Homebrew][homebrew] 作为包管理器。用 Homebrew 能够非常简单地获取到最新版的 Ruby：

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

这将安装最新版的 Ruby。


### OpenIndiana
{: #openindiana}

若想在 [OpenIndiana][openindiana] 上安装 Ruby，要使用 Image Packaging System (IPS) 客户端。这将直接从 OpenIndiana 代码库安装 Ruby 和 RubyGems：

{% highlight sh %}
$ pkg install runtime/ruby
{% endhighlight %}

然而，第三方工具或许是获取最新版 Ruby 更好的方法。


### 其它发行版
{: #other-systems}

在其它操作系统中，可以使用包管理器在包仓库中搜索 Ruby，或许使用第三方工具是更好的选择。


## 安装工具
{: #installers}

如果系统或者包管理器提供的 Ruby 版本已经过时，可以使用第三方安装工具来安装更新的版本。其中许多工具允许在同一个系统中安装多个 Ruby 版本，相关的工具能帮你在不同的版本之间切换。如果打算用 [RVM](#rvm) 作为版本管理工具，不需要其它的安装工具，它自己就具有这些功能。


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] 是 [rbenv](#rbenv) 的一个插件，能在任意目录中编译和安装不同版本的 Ruby。ruby-build 也可以不依赖 rbenv 而单独使用。支持的平台有 macOS、Linux 和其它类 UNIX 操作系统。


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] 能在任意目录中编译和安装不同版本的 Ruby。还有个兄弟工具，[chruby](#chruby)，可以用来切换不同的 Ruby 版本。支持的平台有 macOS、Linux 和其它类 UNIX 操作系统。


### RubyInstaller
{: #rubyinstaller}

如果使用 Windows，有个不错的项目能帮你安装 Ruby：[RubyInstaller][rubyinstaller]。它能帮你在 Windows 中安装所需的所有 Ruby 开发环境。

下载、运行，即可!


### RailsInstaller 和 Ruby Stack
{: #railsinstaller}

如果是为了使用 Ruby on Rails 而安装 Ruby，可以使用下列安装工具：

* [RailsInstaller][railsinstaller]，使用的是 RubyInstaller，但包括了其它能够帮助 Rails 开发的工具。支持 OS X 和 Windows。
* [Bitnami Ruby Stack][rubystack]，提供了完整的 Rails 开发环境。支持 macOS、Linux、Windows、虚拟机和云镜像。


## 管理工具
{: #managers}

许多 Ruby 程序员使用 Ruby 管理工具管理不同版本的 Ruby。这些管理工具有很多额外的优点，但没有官方支持。不过，这些工具背后的社群都乐于助人。


### chruby
{: #chruby}

[chruby][chruby] 用于在不同的 Ruby 版本之间切换。chruby 能够管理用 [ruby-install](#ruby-install) 或者通过源码编译安装的 Ruby。


### rbenv
{: #rbenv}

[rbenv][rbenv] 用于管理系统中安装的多个 Ruby 版本。它不能直接安装 Ruby，但有个流行的插件叫 [ruby-build](#ruby-build) 能够安装 Ruby。这两个工具都支持 macOS、Linux 和其它类 UNIX 操作系统。


### rbenv for Windows
{: #rbenv-for-windows}

[rbenv for Windows][rbenv-for-windows] 用于在Windows上下载安装并管理系统中的多个 Ruby 版本。它使用PowerShell编写，由此为Windows用户提供了一个使用Ruby的原生方法。除此之外，它的命令行接口与类 UNIX 系统上的 [rbenv][rbenv] 兼容。


### RVM（“Ruby Version Manager”）
{: #rvm}

[RVM][rvm] 能在系统中安装和管理多个 Ruby 版本。同时还能管理不同的 gem 集。支持 macOS、Linux 和其它类 UNIX 操作系统。


### RVM 4 Windows
{: #rvm-windows}

[RVM 4 Windows][rvm-windows]允许您在 Windows 上安装和管理多个 Ruby 安装。它是原始 RVM 的克隆版，通过提供与原始 RVM 相同的命令行界面，支持经典命令行和 Powershell。


### uru
{: #uru}

[Uru][uru] 是一个轻量级的命令行工具，支持多平台，能够帮你在 macOS、Linux 和 Windows 上使用不同的 Ruby 版本。


## 通过源码编译安装
{: #building-from-source}

当然，也可以通过源码安装 Ruby。[下载](/zh_cn/downloads/)，解压，然后执行：

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

默认情况下，Ruby 安装到 `/usr/local` 目录。如果想使用其他目录，可以把 `--prefix=DIR` 选项传给 `./configure` 脚本。

因为无法使用任何工具来管理通过源码编译安装的 Ruby，所以使用第三方工具或者包管理器或许是更好的选择。


[rvm]: http://rvm.io/
[rvm-windows]: https://github.com/magynhard/rvm-windows#readme
[rbenv]: https://github.com/rbenv/rbenv#readme
[rbenv-for-windows]: https://github.com/ccmywish/rbenv-for-windows#readme
[ruby-build]: https://github.com/rbenv/ruby-build#readme
[ruby-install]: https://github.com/postmodern/ruby-install#readme
[chruby]: https://github.com/postmodern/chruby#readme
[uru]: https://bitbucket.org/jonforums/uru
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rubystack]: http://bitnami.com/stack/ruby/installer
[openindiana]: http://openindiana.org/
[gentoo-ruby]: http://www.gentoo.org/proj/en/prog_lang/ruby/
[homebrew]: http://brew.sh/
