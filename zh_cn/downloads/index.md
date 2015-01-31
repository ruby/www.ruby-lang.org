---
layout: page
title: "下载 Ruby - Ruby 官方网站"
lang: zh_cn
---

在这里可以下载到适合您的最新的 Ruby 版本，当前稳定的版本是
{{ site.downloads.stable.version }} 。下载前请先阅读 [Ruby 开源许可][license] 。

### Ruby 源代码

如果您欲使之与您的平台更为兼容或者需要专一设置您的环境，那么从源代码安装是最好的解决方案。如果有预先做好的 packages
需要安装到您的平台上，这也是一个好的方法。

* [Ruby {{ site.downloads.stable.version }}][stable-gz]
  (sha256:&nbsp;{{ site.downloads.stable.sha256.gz }}) 稳定版 (*推荐*)
* [稳定版快照][stable-snapshot-gz] 这里的 tar’ed 和 gzip’ed 文件是最新稳定的 CVS。它应该比上次发布的版本更稳定。
* [开发版快照][nightly-gz] 这里的 tar’ed 和 gzip’ed 文件是最新的 CVS。它可能包含一些没有解决的问题。

更多信息见 [Ruby Core](/zh_cn/community/ruby-core/) 页。

### 镜像站

在世界各地的[镜像站][mirrors]上面已经有 Ruby 的源代码了，你可以选择就近的地方下载。

### Windows 系统

在 Windows 平台下安装 Ruby
有几个选择。第一个选择是仅安装编译好的二进制文件。第二个选择是直接执行“一步安装”程序，假如您不知道如何安装
Ruby,[RubyInstaller][5]将是您最好的选择。（这种安装方式除 Ruby 之外，捆绑一些额外的资源库。）

* [Ruby 1.8.6 一步安装][6] (md5:&nbsp;00540689d1039964bc8d844b2b0c7db6) 稳定版
  (*推荐*)
* [Ruby 1.8.6 二进制][7] (md5:&nbsp;3ec2a8a34d5db1f09cc8cad3f8305c28) 稳定版 (*推荐*)
* [Ruby 1.9.0 二进制][8] (md5:&nbsp;489ee1bcd72e97f50b38b64fb354e661) 开发版 (*实验*)
* [Ruby 1.9.1-p0 二进制][9] (md5:&nbsp;921db53c709ce20106610f7d229e24e1) 稳定版
  (*推荐*)

### Linux 系统

许多 Linux 发行版中已经预装了 Ruby，如果您的系统上没有安装
Ruby，这里提供几个方式来安装。第一个方式是仅下载源代码，然后手工编译安装。
如果您不想从源代码编译浪费时间的话，许多平台都提供相应的机器体系结构的发行包，它们使 Ruby 的安装相当容易。

例如，在 Debian 或 Ubuntu 使用 `apt-get` 提供了一个简单而优雅的解决方案 ：

{% highlight sh %}
$ sudo apt-get install ruby irb rdoc
{% endhighlight %}

对于 irb 和 rdoc ，您需要激活 universe repository 。

### OS X 系统

Mac OS X Lion 完全支持 Ruby 1.8.7 以及许多常见的 Ruby gems (packages)。细节参考 [Ruby
wiki at MacOS Forge][10] 。

Mac OS X Leopard 完全支持 Ruby 1.8.6 以及 Ruby on Rails, Mongrel, Capistrano
和其他流行的 Ruby gems （库）。细节请参考 [Ruby MacOS Forge 上的 Ruby 维基][10] 。

Mac OS X Tiger 安装了 1.8.2 版本的 Ruby，如果您没有升级到 Leopard，Tiger 平台下安装最新版本的 Ruby
仍有多个选择。您可以使用为 OS X 定做的[一步安装][11] 。如果您正在寻找且能够快速运行 Rails
环境的安装包，[Locomotive][12] 是一个不错的选择。使用 [MacPorts][13] 或 [Fink][14]
在技术上的可能会比较好一些。

使用 MacPorts，您可以这样来安装 Ruby …

{% highlight sh %}
$ port install ruby
{% endhighlight %}

Fink 为安装 Ruby 提供了图形接口（使用 Fink 命令）。

同时，由于 OS X 是基于 Unix，因此从源代码或采取其它有效的方法来安装也是相当的容易。

更为详细的安装 Ruby 及 Rails，详见 Dan Benjamin 写的优秀文章： [*Building Ruby, Rails,
LightTPD, and MySQL on Tiger*][15] 将快速的教您启动和运行。



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
[5]: http://rubyinstaller.org/
[6]: http://rubyforge.org/frs/download.php/29263/ruby186-26.exe
[7]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.6-p111-i386-mswin32.zip
[8]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/unstable/ruby-1.9.0-0-i386-mswin32.zip
[9]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.9.1-p0-i386-mswin32.zip
[10]: http://trac.macosforge.org/projects/ruby/wiki
[11]: http://rubyosx.rubyforge.org/
[12]: http://locomotive.raaum.org/
[13]: http://www.macports.org/
[14]: http://fink.sourceforge.net/
[15]: http://hivelogic.com/articles/ruby_rails_lighttpd_mysql_tiger
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
