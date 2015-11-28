---
layout: page
title: "安装 Ruby"
lang: zh_cn
---

你可以使用多种工具来安装 Ruby。
此页面介绍了如何使用主流的包管理系统和第三方工具来管理和安装 Ruby，
以及如何通过源码来编译安装。
{: .summary}


## 选择你的安装方式

这里有多种方法来安装 Ruby：

* 如果你使用的是类 UNIX 操作系统，
  用你系统的**包管理器**是最简单的安装方式。
  但是，包管理器下的 Ruby 版本通常都不是最新的。
* **安装工具**能够安装指定或者多个 Ruby 版本。这里有针对 Windows 的安装包。
* **管理工具**能帮助你在已经安装在你系统中的多个 Ruby 版本中切换。
* 最后，你也可以**通过源码来编译安装 Ruby**。

下面是对于不同需求和平台的安装方式的列表。

* [包管理系统](#package-management-systems)
  * [Debian, Ubuntu](#apt)
  * [CentOS, Fedora, RHEL](#yum)
  * [Gentoo](#portage)
  * [Arch Linux](#pacman)
  * [OS X](#homebrew)
  * [Solaris, OpenIndiana](#solaris)
  * [Other Distributions](#other-systems)
* [安装工具](#installers)
  * [ruby-build](#ruby-build)
  * [ruby-install](#ruby-install)
  * [RubyInstaller](#rubyinstaller) (Windows)
  * [RailsInstaller and Ruby Stack](#railsinstaller)
* [管理工具](#managers)
  * [chruby](#chruby)
  * [rbenv](#rbenv)
  * [RVM](#rvm)
  * [uru](#uru)
* [通过源码来编译安装](#building-from-source)


## 包管理系统
{: #package-management-systems}

如果你无法编译 Ruby，也不想使用第三方工具，
你可以使用你系统的包管理器来安装 Ruby。

许多 Ruby 社区的成员强烈建议，应该使用第三方工具来安装 Ruby，
而不是系统的包管理软件。
详细的优缺点讨论超出了本页面讨论的范围，
基本原因是大多数系统包管理软件里的 Ruby 版本比较老。
如果你想要使用最新的 Ruby，确保你使用了正确名字的包，
或者使用下列的这些工具。


### apt（Debian 或 Ubuntu）
{: #apt}

Debian GNU/Linux 和 Ubuntu 使用 apt 包管理工具。
用法：

{% highlight sh %}
$ sudo apt-get install ruby-full
{% endhighlight %}

撰文时，在 Debian 和 Ubuntu 下，`ruby-full` 包提供的是老旧的 Ruby 1.9.3。

### yum（CentOS、Fedora 或 RHEL）
{: #yum}

CentOS、Fedora 和 RHEL 使用 yum 包管理工具.
用法:

{% highlight sh %}
$ sudo yum install ruby
{% endhighlight %}

安装的 Ruby 版本通常是发行版发行日能打包的最新版。


### portage（Gentoo）
{: #portage}

Gentoo 使用 portage 包管理工具.

{% highlight sh %}
$ sudo emerge dev-lang/ruby
{% endhighlight %}

一般来说，这将安装 1.9 和 2.0 版本。
但是更多版本也是可以安装的。
如果要安装指定版本，请在你的 `make.conf` 中设置 `RUBY_TARGETS`。
详见 [Gentoo Ruby Project website][gentoo-ruby]。


### pacman（Arch Linux）
{: #pacman}

Arch Linux 使用 pacman 包管理器。
要安装 Ruby，只需要：

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

这将安装最新的 Ruby 稳定版。


### Homebrew（OS X）
{: #homebrew}

在 OS X Yosemite 和 Mavericks 中内置 Ruby 2.0。
OS X Mountain Lion、Lion 和 Snow Leopard 出厂内置 Ruby 1.8.7.

许多 OS X 用户使用 [Homebrew][homebrew] 作为包管理器。
用 Homebrew 能够非常简单地获取到最新版的 Ruby：

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

这将安装最新版的 Ruby。


### Solaris 和 OpenIndiana
{: #solaris}

[Sunfreeware][sunfreeware] 上的 Solaris 8 到 10 内置 Ruby 1.8.7，
[Blastwave][blastwave] 同样如此。
Ruby 1.9.2p0 在 [Sunfreeware][sunfreeware] 上也有，但版本已经过时。

要在 [OpenIndiana][openindiana] 上安装 Ruby，
请使用 [Image Packaging System (IPS)][opensolaris-pkg] 客户端。
这将直接从 OpenSolaris 代码库安装 Ruby 1.9 和 RubyGems：

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

然而，第三方工具或许是获取最新版 Ruby 更好的方法。


### 其它发行版
{: #other-systems}

在其它操作系统上，你可以在包管理器中搜索 Ruby 来安装，
或者使用第三方工具是个更好的选择。


## 安装工具
{: #installers}

如果你的系统或者包管理器提供的 Ruby 版本已经过时，
你可以使用第三方安装工具来安装更新的版本。
其中许多工具允许你在同一个系统中安装多个 Ruby 版本，
相关的工具能帮你在不同版本间进行切换。
如果你打算用 [RVM](#rvm) 作为版本管理工具，
你不需要其它的安装工具，它自己就有这些功能。


### ruby-build
{: #ruby-build}

[ruby-build][ruby-build] 是 [rbenv](#rbenv) 的一个插件，
能够编译和安装不同版本的 Ruby 到任意目录下。
ruby-build 也可以不依赖 rbenv 而单独使用。
支持的平台有 OS X、Linux 和其它类 UNIX 操作系统。


### ruby-install
{: #ruby-install}

[ruby-install][ruby-install] 允许你编译和安装不同版本的 Ruby 到任意目录。
还有个兄弟工具，[chruby](#chruby)，可以用来切换不同的 Ruby 版本。
支持的平台有 OS X、Linux 和其它类 UNIX 操作系统。


### RubyInstaller
{: #rubyinstaller}

如果你使用的 Windows，这个不错的项目能帮你安装 Ruby：[RubyInstaller][rubyinstaller]。
它能帮你安装在 Windows 上所需的所有 Ruby 开发环境。
下载、执行，即可!


### RailsInstaller 和 Ruby Stack
{: #railsinstaller}

如果你是为了使用 Ruby on Rails 而安装 Ruby，
你可以使用下列安装工具：

* [RailsInstaller][railsinstaller]，
  使用的是 RubyInstaller，但包括了其它能够帮助 Rails 开发的工具。
  支持 OS X 和 Windows。
* [Bitnami Ruby Stack][rubystack]，
  提供了完整的 Rails 开发环境。
  支持 OS X、Linux、Windows、虚拟机和云镜像。


## 管理工具
{: #managers}

许多 Rubyist 使用 Ruby 管理工具来管理不同版本的 Ruby。
这些管理工具有很多额外的优点，但没有官方支持。
这些工具背后的社群都很有帮助。


### chruby
{: #chruby}

[chruby][chruby] 允许你在不同版本的 Ruby 之间进行切换。
chruby 能够管理用 [ruby-install](#ruby-install) 或者通过源码编译安装的 Ruby。


### rbenv
{: #rbenv}

[rbenv][rbenv] 能让你管理在系统中安装的多个 Ruby。
它不能直接用来安装 Ruby，
但有个流行的插件叫 [ruby-build](#ruby-build) 能够用来安装 Ruby。
这两个工具都支持 OS X、Linux 和其它类 UNIX 操作系统。


### RVM（“Ruby Version Manager”）
{: #rvm}

[RVM][rvm] 能让你在系统中安装和管理多个版本的 Ruby。
同时还能管理不同的 gemsets。
支持 OS X、Linux 和其它类 UNIX 操作系统。


## uru
{: #uru}

[Uru][uru] 是一个轻量的、支持多平台的命令行工具，
能够帮助你在 OS X、Linux 和 Windows 上使用不同版本的 Ruby。


## 通过源码来编译安装
{: #building-from-source}

当然，你也可以通过源码来安装 Ruby。
[下载](/en/downloads/)，解压 tarball，然后执行：

{% highlight sh %}
$ ./configure
$ make
$ sudo make install
{% endhighlight %}

默认会将 Ruby 安装到 `/usr/local`。
通过传 `--prefix=DIR` 选项给 `./configure` 脚本可以改变安装路径。

因为无法使用任何工具来管理通过源码编译安装的 Ruby，
所以使用第三方工具或者包管理器或许是更好的选择。


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
