---
layout: page
title: "下载 Ruby - Ruby 官方网站"
lang: zh_cn
---

在这里可以下载到适合您的最新的 Ruby 版本，当前稳定的版本是
{{ site.downloads.stable.version }} 。下载前请先阅读 [Ruby 开源许可][1] 。

### Ruby 源代码

如果您欲使之与您的平台更为兼容或者需要专一设置您的环境，那么从源代码安装是最好的解决方案。如果有预先做好的 packages
需要安装到您的平台上，这也是一个好的方法。

* [Ruby {{ site.downloads.stable.version }}][2]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) 稳定版 (*推荐*)
* [稳定版快照][3] 这里的 tar’ed 和 gzip’ed 文件是最新稳定的 CVS。它应该比上次发布的版本更稳定。
* [开发版快照][4] 这里的 tar’ed 和 gzip’ed 文件是最新的 CVS。它可能包含一些没有解决的问题。

更多信息见 [Ruby Core](/zh_cn/community/ruby-core/) 页。

### 镜像站

在世界各地的镜像站上面已经有 Ruby 的源代码了，你可以选择就近的地方下载。

#### HTTP 镜像站

* [CDN][64] (fastly.com)
* [Japan 1][63] (Master) - HTTPS
* [Japan 2][50] and [mirror][32] (RingServer)
* [Britain][49] (The Mirror Service)
* [Germany][51] (AmbiWeb GmbH)
* [Belgium][52] (Easynet)
* [Denmark][53] (sunsite.dk)
* [Holland][54] (XS4ALL) - only release packages
* [USA 1][55] (ibiblio.org)
* [USA 2][56] (lcs.mit.edu)
* [USA 3][57] (binarycode.org)
* [USA 4][58] (online-mirror.org)
* [USA 5][59] (trexle.com)
* [Austria][60] (tuwien.ac.at)
* [Taiwan 1][61] (cdpa.nsysu.edu.tw)
* [Taiwan 2][62] (ftp.cs.pu.edu.tw)
* [China 1][65] (ruby.taobao.org)

#### FTP 镜像站

* [Japan 1][35] (Master: ruby-lang.org)
* [Japan 2][31] and [mirror][32] (RingServer)
* [Japan 3][33] (IIJ)
* [South Korea][36] (Korea FreeBSD Users Group)
* [Germany][37] (FU Berlin)
* [Britain][38] (The Mirror Service)
* [Belgium][39] (Easynet)
* [Russia][40] (ChgNet)
* [Greece][41] (ntua.gr)
* [Denmark][42] (sunsite.dk)
* [USA 1][43] (ibiblio.org)
* [USA 2][44] (lcs.mit.edu)
* [Austria][45] (tuwien.ac.at)
* [Taiwan 1][46] (cdpa.nsysu.edu.tw)
* [Taiwan 2][47] (ftp.cs.pu.edu.tw)
* [Canada][48] (mirror.cs.mun.ca)

#### rsync 镜像

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (Britain)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (Denmark)
* rsync://gd.tuwien.ac.at/languages/ruby/ (Austria)
* rsync://mirror.cs.mun.ca/ruby/ (Canada)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (Taiwan)

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

Ruby 1.8.7 已经完全支持 Mac OS X Lion 以及许多流行的 Ruby gems (packages)。细节参考 [Ruby
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



[1]: {{ site.license.url }}
[2]: {{ site.downloads.stable.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
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
[15]: http://hivelogic.com/articles/2005/12/01/ruby_rails_lighttpd_mysql_tiger
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
[31]: ftp://core.ring.gr.jp/pub/lang/ruby/
[32]: http://www.t.ring.gr.jp/
[33]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[35]: ftp://ftp.ruby-lang.org/pub/ruby/
[36]: ftp://ftp.kr.freebsd.org/pub/ruby/
[37]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[38]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[39]: ftp://ftp.easynet.be/ruby/ruby/
[40]: ftp://ftp.chg.ru/pub/lang/ruby/
[41]: ftp://ftp.ntua.gr/pub/lang/ruby/
[42]: ftp://sunsite.dk/mirrors/ruby/
[43]: ftp://www.ibiblio.org/pub/languages/ruby/
[44]: ftp://xyz.lcs.mit.edu/pub/ruby/
[45]: ftp://gd.tuwien.ac.at/languages/ruby/
[46]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[47]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[48]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
[49]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[50]: http://www.dnsbalance.ring.gr.jp/archives/lang/ruby/
[51]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[52]: http://ruby.mirror.easynet.be/
[53]: http://mirrors.sunsite.dk/ruby/
[54]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[55]: http://www.ibiblio.org/pub/languages/ruby/
[56]: http://xyz.lcs.mit.edu/ruby/
[57]: http://www.binarycode.org/ruby/
[58]: http://www.online-mirror.org/ruby/
[59]: http://ruby.trexle.com/
[60]: http://gd.tuwien.ac.at/languages/ruby/
[61]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[62]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[63]: https://ftp.ruby-lang.org/pub/ruby/
[64]: http://cache.ruby-lang.org/pub/ruby/
[65]: http://ruby.taobao.org/mirrors/ruby/
