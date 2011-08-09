---
layout: page
title: "下載安裝"
lang: zh_TW
---

你可以在這裡下載適合您的最新 Ruby 發佈版本。目前最新的穩定版本是 1.9.2。另外，請先看看 [Ruby 版權說明][1]。

### Ruby 原始碼

如果您非常熟悉您的作業系統，或是您需要特別設定的環境，那麼直接使用原始碼來安裝是個不錯的方式。如果您的平台沒有編譯好的套件，那麼也必須透過原始碼來安裝。

* [Ruby 1.9.2-p0][2] (md5:  755aba44607c580fddc25e7c89260460) 穩定版本
  (*推薦*)
* [Stable Snapshot][3] 這是 SVN 中最新的穩定版本，它應該比上一個穩定版本更好。
* [Nightly Snapshot][4] 這是 SVN 中最新的開發版本，它也許包含了一些已知尚未解決的問題。

關於更多 Ruby Subversion repository 的資訊，請參考 [Ruby
Core](/en/community/ruby-core/) 頁面。

### Windows 上的 Ruby

在 Windows 平台上有幾個選擇。第一個選項是使用 [RubyInstaller][5]
，這是一個編譯好的安裝包(Installer)。第二個選項則是編譯好的執行檔。如果您不確定怎麼安裝，那麼建議您用安裝包(Installer)的方式。

* [Ruby 1.8.6-p398 RubyInstaller][6]
  (md5: 233d6b3ddc4c61436b075b51254cd138) 穩定版本 (*推薦*)
* [Ruby 1.8.7-p302 RubyInstaller][7]
  +(md5: 9391a3dddbbda3ee8aa3bb368fdc5279) 穩定版本 (*推薦*)
* [Ruby 1.9.1-p430 RubyInstaller][8]
  (md5: 86ac589a955898c3163b161d81750a05) 穩定版本 (*推薦*)
* [Ruby 1.8.7-p249 Binary][9] (md5: 4fd37b0b4b21a042cae7f5f0a8daad16)
  穩定版本
* [Ruby 1.9.1-p378 Binary][10] (md5: 7d14a918cc8d243d3e2c409aff41f454)
  穩定版本

請注意以上的 Binaries 執行檔除了需要您手動下載，還需要一些額外的元件，請參考 [這一篇][11] 一步步執行。

安裝包 [RubyInstaller][5] 則不需要額外的步驟。

如果你需要在 Windows 安裝不同版本的 Ruby 和 gems，請試試 [pik][12] 。

### Linux 上的 Ruby

根據不同的 Linux 發佈版本，有不同的安裝方式。第一個選擇是下載原始碼，然後手動編譯。不過在許多平台上，有套件管理工具可以幫助你很簡單地安裝
Ruby。

例如，在 Debian 或 Ubuntu 上的 `apt-get` 提供了簡單又優雅的解決方案：

    % sudo apt-get install ruby1.9.1-full
{: .code .sh-code}

以上的指令會安裝 Ruby 1.9.1 穩定版本。如果你偏好安裝 Ruby 1.8，請執行：

    % sudo apt-get install ruby-full
{: .code .sh-code}

對於 irb 和 rdoc 你需要啟動 universe repository。

如果你需要安裝不同版本的 Ruby 和 gems，請試試 `rvm`， [Ruby Version Manager][13] 。

### OS X 上的 Ruby

Mac OS X Snow Leopard 預設安裝了 Ruby 1.8.7、Ruby on Rails、Mongrel、Capistrano
和許多熱門的 Ruby gems 套件。詳細資訊請參考 [Ruby wiki at MacOS Forge][14].

Mac OS X Leopard 預設安裝了 Ruby 1.8.6、Mac OS X Tiger 則安裝了 Ruby
1.8.2，如果你沒有升級到 Snow Leopard，也有許多選項可以安裝最新的 Ruby，例如使用 [Homebrew][15] 、
[MacPorts][16] 或 [Fink][17] 等這些 Mac 套件管理工具都不錯。

使用 MacPorts 的話，你可以這樣安裝 Ruby …

    % port install ruby
{: .code .sh-code}

Fink 則有圖型化介面(使用 Fink 指令)來安裝 Ruby。

另外，因為 OS X 也是基於 Unix，所以下載原始碼，手動編譯安裝也是一種方式。

關於更詳細安裝 Ruby (和Rails) 的文件，可以參考 Dan Benjamin 的文章 [給 Tiger][18] 、 [給
Leopard][19] 以及 [給 Snow Leopard][20] 都可以幫助你很快地安裝起來。

如果你需要安裝不同版本的 Ruby 和 gems，請試試 `rvm`， [Ruby Version Manager][13] 。

### Solaris 和 OpenSolaris 上的 Ruby

從 Solaris 8 到 Solaris 10 的 [Sunfreeware][21] 都有提供 Ruby
1.8.7，[Blastwave][22] 也有提供 Ruby 1.8.7。Sun 的 Cooltools 專案則提供了 Solaris 10
一個最佳化過的 Ruby on Rails 套件叫做 [Coolstack][23] 。

要在 [OpenSolaris][24] 上安裝 Ruby，請使用 [Image Packaging System 或 IPS][25]
。這會從 OpenSolaris network repository 安裝最新的 Ruby 和 Rubygems，很簡單：

    % pfexec pkg install SUNWruby18
{: .code .sh-code}

這會安裝 Ruby、Rubygems、常見的擴充以及支援函式庫。這個套件也包括 DTrace 和效能最佳化。進一步的資訊請參考 [Ruby
OpenSolaris ARC Case][26] 。

其他的 OpenSolaris 發佈版本如 [Solaris Express Community Edition 或 SXCE][27]
則預設安裝了 Ruby 1.8.7。關於版本位置等都和 vanilla OpenSolaris 發佈版本相同，請參考上述的 ARC case。

要手動安裝 SVR4 套件，請參考 [RubyOpenSolaris project @ Rubyforge][28] 。

### 其他 Ruby 環境

除了上述由 C 語言實作的官方版 Ruby (又叫做 CRuby 或 MRI, Matz’s Ruby
Interpreter)，也有其他不同實作的 Ruby 環境。這些實作都以 [RubySpec][29] 作為其語法的標準：

[JRuby][30] 是由 [Java][31] 實作的 Ruby，運行在高效能、支援系統執行緒及有非常多函數庫的 Java
虛擬機器(JVM)上。

[IronRuby][32] 是由 [.NET][33] 實作的 Ruby，使用了 [Dynamic Language
Runtime.][34] 技術。

[MacRuby][35] 是由 [Objective-C][36] 實作的 Ruby，直接運作在 Mac OS X 作業系統上。它使用了
[LLVM][37] 編譯器技術。

[Ruby Enterprise Edition][38] (簡稱REE) 是個非常流行的 CRuby 分支版本，適合用來搭配 [Ruby on
Rails][39] 和 [Phusion Passenger][40] 使用。

其他有趣的 Ruby 實作還包括 [Rubinuis][41] 和 [MagLev][42] 。



[1]: http://www.ruby-lang.org/en/about/license.txt 
[2]: ftp://ftp.ruby-lang.org:21//pub/ruby/1.9/ruby-1.9.2-p0.tar.gz 
[3]: ftp://ftp.ruby-lang.org:21//pub/ruby/ruby-1.9-stable.tar.gz 
[4]: ftp://ftp.ruby-lang.org/pub/ruby/snapshot.tar.gz 
[5]: http://rubyinstaller.org/ 
[6]: http://rubyforge.org/frs/download.php/71066/rubyinstaller-1.8.6-p398.exe 
[7]: http://rubyforge.org/frs/download.php/72085/rubyinstaller-1.8.7-p302.exe 
[8]: http://rubyforge.org/frs/download.php/72075/rubyinstaller-1.9.1-p430.exe 
[9]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/mswin32/ruby-1.8.7-p249-i386-mswin32.zip 
[10]: ftp://ftp.ruby-lang.org:21/pub/ruby/binaries/mswin32/ruby-1.9.1-p378-i386-mswin32.zip 
[11]: http://www.garbagecollect.jp/ruby/mswin32/en/documents/install.html 
[12]: http://github.com/vertiginous/pik 
[13]: http://rvm.beginrescueend.com 
[14]: http://trac.macosforge.org/projects/ruby/wiki 
[15]: http://mxcl.github.com/homebrew/ 
[16]: http://www.macports.org/ 
[17]: http://fink.sourceforge.net/ 
[18]: http://hivelogic.com/articles/ruby-rails-mongrel-mysql-osx 
[19]: http://hivelogic.com/articles/ruby-rails-leopard 
[20]: http://hivelogic.com/articles/compiling-ruby-rubygems-and-rails-on-snow-leopard/ 
[21]: http://www.sunfreeware.com 
[22]: http://www.blastwave.org 
[23]: http://cooltools.sunsource.net/coolstack 
[24]: http://www.opensolaris.org 
[25]: http://opensolaris.org/os/project/pkg/ 
[26]: http://jp.opensolaris.org/os/community/arc/caselog/2007/600/ 
[27]: http://opensolaris.org/os/downloads 
[28]: http://rubyforge.org/projects/rubyopensolaris 
[29]: http://github.com/rubyspec/rubyspec 
[30]: http://jruby.org/ 
[31]: http://www.java.com/zh_TW/ 
[32]: http://ironruby.net/ 
[33]: http://www.microsoft.com/NET/ 
[34]: http://codeplex.com/dlr 
[35]: http://www.macruby.org/ 
[36]: http://developer.apple.com/mac/library/documentation/Cocoa/Conceptual/ObjectiveC/Introduction/introObjectiveC.html 
[37]: http://llvm.org/ 
[38]: http://www.rubyenterpriseedition.com/ 
[39]: http://rubyonrails.org.tw 
[40]: http://www.modrails.com/ 
[41]: http://rubini.us/ 
[42]: http://ruby.gemstone.com/ 
