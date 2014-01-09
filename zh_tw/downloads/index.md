---
layout: page
title: "下載安裝"
lang: zh_tw
---

您可以在這裡下載適合最新的 Ruby 發行版。目前最新的穩定版本是
{{ site.downloads.stable.version }}。另外，請先閱讀 [Ruby 版權說明]({{ site.license.url }})。
{: .summary}

### 三種方式可安裝 Ruby

多種方式可獲得 Ruby，每個人基於不同的理由，偏好不同的方式。下面會詳細說明每種方式，以下是各種方式的綜覽：

* **從原始碼編譯**是軟體業行之有年的安裝方式。對於多數的軟體開發者來說，這是再熟悉不過的方式了。

* 使用**第三方工具**來安裝 Ruby。不管你是完全新手或是進階使用者皆可用，安裝起來比較簡單。

* 最後，少數的**套件管理工具**支持 Ruby。這對於使用單一作業系統的人來說較為熟悉。

最後，若你想在計算機上同時安裝不同版本的 Ruby，閱讀[**第三方工具**](#third-party-tools)小節，並使用 RVM。這是目前管理多版本 Ruby 最好的工具。

### 從原始碼編譯 Ruby

如果您非常熟悉您的作業系統，或是您需要特別設定的環境，那麼直接使用原始碼來安裝是個不錯的方式。如果您的平台沒有編譯好的套件，那麼也必須透過原始碼來安裝。

若編譯 Ruby 時遇到任何問題，考慮看看使用下節羅列的第三方工具。

* [Ruby {{ site.downloads.stable.version }}][ruby21]
  (md5:&nbsp;{{ site.downloads.stable.md5.gz }}) 穩定版
* [Ruby {{ site.downloads.previous.version }}][ruby20]
  (md5:&nbsp;{{ site.downloads.previous.md5.gz }}) 穩定前一版
* [Ruby {{ site.downloads.previous19.version }}][ruby19]
  (md5:&nbsp;{{ site.downloads.previous19.md5.gz }}) 1.9 上一版
* [Stable Snapshot][3] 穩定版（ruby\_2\_1 分支）的最新快照。
* [Nightly Snapshot][4] 這是 SVN 上的 tarball，每晚更新，可能有問題或 bug，小心使用。

關於 Ruby Subversion 與 Git Repositories 的資訊，參見 [Ruby Core](/en/community/ruby-core/) 頁面。

### 鏡像站

Ruby 原始碼可從世界各地的鏡像站獲得。請嘗試離您最近的鏡像站。

#### 透過 HTTP 的鏡像站

* [CDN][mirror-http-cdn] (fastly.com)
* [Japan 1][mirror-https-jp] (Master) - HTTPS
* Japan 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-http-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-http-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-http-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-http-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-http-jp-ring-airnet]
  * [maffin.ad.jp][mirror-http-jp-ring-maffin]
* [Britain][mirror-http-uk] (The Mirror Service)
* [Germany][mirror-http-de] (AmbiWeb GmbH)
* [Belgium][mirror-http-be] (Easynet)
* [Denmark][mirror-http-dk] (sunsite.dk)
* [Holland][mirror-http-nl] (XS4ALL) - only release packages
* [USA 1][mirror-http-us1] (ibiblio.org)
* [USA 2][mirror-http-us2] (lcs.mit.edu)
* [USA 3][mirror-http-us3] (binarycode.org)
* [USA 4][mirror-http-us4] (online-mirror.org)
* [USA 5][mirror-http-us5] (trexle.com)
* [Austria][mirror-http-at] (tuwien.ac.at)
* [Taiwan 1][mirror-http-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-http-tw2] (ftp.cs.pu.edu.tw)
* [China][mirror-http-cn] (ruby.taobao.org)

#### 透過 FTP 的鏡像站

* [Japan 1][mirror-ftp-jp1] (Master: ruby-lang.org)
* Japan 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-ftp-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-ftp-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-ftp-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-ftp-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-ftp-jp-ring-airnet]
  * [maffin.ad.jp][mirror-ftp-jp-ring-maffin]
* [Japan 3][mirror-ftp-jp3] (IIJ)
* [South Korea][mirror-ftp-kr] (Korea FreeBSD Users Group)
* [Britain][mirror-ftp-uk] (The Mirror Service)
* [Germany][mirror-ftp-de] (FU Berlin)
* [Belgium][mirror-ftp-be] (Easynet)
* [Russia][mirror-ftp-ru] (ChgNet)
* [Greece][mirror-ftp-gr] (ntua.gr)
* [Denmark][mirror-ftp-dk] (sunsite.dk)
* [USA 1][mirror-ftp-us1] (ibiblio.org)
* [USA 2][mirror-ftp-us2] (lcs.mit.edu)
* [Austria][mirror-ftp-at] (tuwien.ac.at)
* [Taiwan 1][mirro-ftp-tw1] (cdpa.nsysu.edu.tw)
* [Taiwan 2][mirror-ftp-tw2] (ftp.cs.pu.edu.tw)
* [Canada][mirror-ftp-ca] (mirror.cs.mun.ca)

#### 透過 rsync 的鏡像站

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (Britain)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (Denmark)
* rsync://gd.tuwien.ac.at/languages/ruby/ (Austria)
* rsync://mirror.cs.mun.ca/ruby/ (Canada)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (Taiwan)

### 第三方工具
{: #third-party-tools}

許多 Ruby 開發者使用第三方工具來安裝 Ruby。各自有著些許的差異，Ruby 官方不支援這些工具。但每個工具的社群都相當友善。

#### RVM

安裝 Ruby 最流行方便的工具是 **RVM** （“Ruby Version Manager” ）。安裝 Ruby 不僅變得非常簡單，同時讓你可以在系統上安裝多個版本的 Ruby、亦可安裝不同的 Ruby 實作（Ruby Implementation）。

RVM 只可在 Mac OS X、Linux、或任何類 UNIX 的系統上使用。Windows 使用者請參考 [pik][5]，或考慮使用 RubyInstaller。

安裝 RVM：

{% highlight sh %}
$ \curl -L https://get.rvm.io | bash -s stable --ruby
{% endhighlight %}

關於安裝 RVM 的最新資訊，請參考 [RVM 官網的說明][7]。上面的命令會安裝 RVM 及最新版本的 Ruby。RVM 也可安裝下面所列出的多種 Ruby 實作，可輸入 `rvm list known` 來查看可安裝的 Ruby 實作。

另一個類似的工具是：[rbenv][rbenv]。

近來有新的 Ruby 安裝工具（輕量級）：[ruby-install][ruby-install] （安裝 ruby）與 [chruby][chruby] （切換 Ruby 版本）。

#### RubyInstaller

Windows 使用者可以使用 [RubyInstaller][8] 來安裝 Ruby。RubyInstaller 幫你在 Windows 上設定好一個完整的 Ruby 開發環境。

要使用 RubyInstaller，去 [RubyInstaller 的下載頁面][9] 下載安裝工具並安裝即可。

如果你是為了使用 Rails 而安裝 Ruby，你應該使用 [RailsInstaller][10]。

### 系統套件管理工具

若你不能自己編譯 Ruby，也不想使用第三方工具，可以使用系統的套件管理工具來安裝 Ruby。

許多 Ruby 社群的成員強烈建議不要使用套件管理工具來安裝 Ruby，應該使用 RVM。完整的優缺點超出了本文的範疇，最簡單的理由是，多數的套件管理工具安裝的 Ruby 版本老舊，要使用最新版的 Ruby，確定你使用了正確的套件名稱，或使用 RVM 吧。

#### Linux 上的 Ruby

Debian GNU/Linux 或 Ubuntu 使用 `apt` 套件管理工具，安裝 Ruby：

{% highlight sh %}
$ sudo apt-get install ruby1.9.1
{% endhighlight %}

這會安裝 1.9.2 或是更新的 Ruby。

如果你安裝 `ruby` 套件，根據不同的發行版，可能會安裝到比 1.8 還舊的 Ruby。

Arch Linux 的套件管理叫做 `pacman`，要獲得 Ruby，輸入：

{% highlight sh %}
$ sudo pacman -S ruby
{% endhighlight %}

其它 Linux 發行版可透過搜索套件的 Repository 來獲得 Ruby，不過 RVM 或許是更好的選擇。

#### Ruby on Mac OS X

Mac OS X Mavericks 系統內建 Ruby 2.0.0。OS X 的使用者可以使用 [Homebrew][12] （套件管理工具）來獲得更新版本的 Ruby：

{% highlight sh %}
$ brew install ruby
{% endhighlight %}

OS X 基於 Unix，手動編譯 Ruby 也非常簡單。但要安裝更新版本的 Ruby，可能使用 RVM 比較好。

#### Ruby On Solaris and OpenIndiana

[Sunfreeware][17] 有提供 Ruby
1.8.7 給 Solaris 7，Ruby 8 到 Solaris 10 提供了 Ruby 1.9.2p0，但這是個過時的版本，使用 RVM 來獲得最新版的 Ruby。

要在 [OpenIndiana][19] 安裝 Ruby，請使用 [Image Packaging
System (IPS)][20] 客戶端。這會從 OpenSolaris 網路 Repository 安裝 Ruby 1.9 與 RubyGems：

{% highlight sh %}
$ pkg install runtime/ruby-18
{% endhighlight %}

如前所述，RVM 是個獲得最新 Ruby 的好工具。

### 其它 Ruby 實作

Ruby 語言有許多不同的實作。官方使用 C 語言實作的 Ruby 叫做 **MRI** Ruby （“Matz 的 Ruby 直譯器”）或 CRuby，也有其它不同的實作。不同的實作適合不同的場合、整合了其它語言，擁有 MRI 沒有的特色。

以下是 Ruby 實作清單：

* [JRuby][21] 是構建於 JVM（Java Virtual Machine）之上的 Ruby，利用了 JVM 優化的 JIT 編譯器、垃圾蒐集器、並行執行緒、工具生態圈、其許多 Java 的函式庫。
* [Rubinius][22] 是用 Ruby 寫的 Ruby，構建於 LLVM。
* [MacRuby][23] 是與 Apple 的 Cocoa 函式庫高度整合的 Ruby 實作，允許你輕鬆寫出桌上型應用。
* [mruby][mruby] 是 Ruby 的輕量化實作，可嵌入或引用到應用程式裡。目前由松本行弘 “Matz” 領導開發。
* [IronRuby][26] 是與 .NET 框架高度整合的 Ruby 實現。
* [MagLev][27] 具有物件持久性、分布共享快取的特性，是個高速、穩定的 Ruby 實作。
* [Cardinal][24] 是給 [Parrot][25] 虛擬機用的 Ruby 編譯器。

MRI 與某些實作遵循 [RubySpec][28]，Ruby 程式語言的完整規格文件。

[ruby21]: {{ site.downloads.stable.url.gz }}
[ruby20]: {{ site.downloads.previous.url.gz }}
[ruby19]: {{ site.downloads.previous19.url.gz }}
[3]: {{ site.downloads.stable_snapshot.url.gz }}
[4]: {{ site.downloads.nightly_snapshot.url.gz }}
[5]: https://github.com/vertiginous/pik
[7]: https://rvm.io/rvm/install/
[8]: http://rubyinstaller.org/
[9]: http://rubyinstaller.org/downloads/
[10]: http://railsinstaller.org/
[11]: http://trac.macosforge.org/projects/ruby/wiki
[12]: http://brew.sh/
[13]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx
[14]: http://hivelogic.com/articles/ruby-rails-leopard
[15]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/
[16]: http://intridea.com/2011/7/26/setting-up-ruby-dev-on-lion?blog=company
[17]: http://www.sunfreeware.com
[18]: http://www.blastwave.org
[19]: http://openindiana.org/
[20]: http://opensolaris.org/os/project/pkg/
[21]: http://jruby.org
[22]: http://rubini.us
[23]: http://www.macruby.org
[mruby]: https://github.com/mruby/mruby
[24]: https://github.com/parrot/cardinal
[25]: http://parrot.org
[26]: http://www.ironruby.net
[27]: http://ruby.gemstone.com
[28]: http://rubyspec.org
[mirror-http-cdn]: http://cache.ruby-lang.org/pub/ruby/
[mirror-http-jp-ring-shibaura-it]: http://ring.shibaura-it.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-tohoku]: http://ring.tains.tohoku.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-u-toyama]: http://ring.u-toyama.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-yamanashi]: http://ring.yamanashi.ac.jp/archives/lang/ruby/
[mirror-http-jp-ring-airnet]: http://ring.airnet.ne.jp/archives/lang/ruby/
[mirror-http-jp-ring-maffin]: http://ring.maffin.ad.jp/archives/lang/ruby/
[mirror-https-jp]: https://ftp.ruby-lang.org/pub/ruby/
[mirror-http-uk]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-http-de]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[mirror-http-be]: http://ruby.mirror.easynet.be/
[mirror-http-dk]: http://mirrors.sunsite.dk/ruby/
[mirror-http-nl]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[mirror-http-us1]: http://www.ibiblio.org/pub/languages/ruby/
[mirror-http-us2]: http://xyz.lcs.mit.edu/ruby/
[mirror-http-us3]: http://www.binarycode.org/ruby/
[mirror-http-us4]: http://www.online-mirror.org/ruby/
[mirror-http-us5]: http://ruby.trexle.com/
[mirror-http-at]: http://gd.tuwien.ac.at/languages/ruby/
[mirror-http-tw1]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[mirror-http-tw2]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-http-cn]: http://ruby.taobao.org/mirrors/ruby/
[mirror-ftp-jp1]: ftp://ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-jp-ring-shibaura-it]: ftp://ring.shibaura-it.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-tohoku]: ftp://ring.tains.tohoku.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-u-toyama]: ftp://ring.u-toyama.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-yamanashi]: ftp://ring.yamanashi.ac.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-airnet]: ftp://ring.airnet.ne.jp/pub/lang/ruby/
[mirror-ftp-jp-ring-maffin]: ftp://ring.maffin.ad.jp/pub/lang/ruby/
[mirror-ftp-jp3]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[mirror-ftp-kr]: ftp://ftp.kr.freebsd.org/pub/ruby/
[mirror-ftp-de]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[mirror-ftp-uk]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[mirror-ftp-be]: ftp://ftp.easynet.be/ruby/ruby/
[mirror-ftp-ru]: ftp://ftp.chg.ru/pub/lang/ruby/
[mirror-ftp-gr]: ftp://ftp.ntua.gr/pub/lang/ruby/
[mirror-ftp-dk]: ftp://sunsite.dk/mirrors/ruby/
[mirror-ftp-us1]: ftp://www.ibiblio.org/pub/languages/ruby/
[mirror-ftp-us2]: ftp://xyz.lcs.mit.edu/pub/ruby/
[mirror-ftp-at]: ftp://gd.tuwien.ac.at/languages/ruby/
[mirror-ftp-tw1]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[mirror-ftp-tw2]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[mirror-ftp-ca]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/

[rbenv]: https://github.com/sstephenson/rbenv
[ruby-install]: https://github.com/postmodern/ruby-install
[chruby]: https://github.com/postmodern/chruby
