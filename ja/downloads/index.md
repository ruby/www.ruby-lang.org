---
layout: page
title: "ダウンロード"
lang: ja
---

ここでは、Rubyインタプリタの代表的な入手方法を説明します。

## Rubyのソースコード

Rubyの各バージョンのソースコードは、以下から入手できます。

* 最新の安定版であるruby
  {{ site.downloads.stable.version }}\[[tar.bz2][1]\|[tar.gz][2]\|[zip][3]\]が各ミラーサイトから入手できます。
* 前世代の安定版であるruby
  {{ site.downloads.previous.version }}\[[tar.bz2][4]\|[tar.gz][5]\|[zip][6]\]が各ミラーサイトから入手できます。
* 現時点での最新版スナップショット\[[tar.bz2][10]\|[tar.gz][11]\|[zip][12]\]が各ミラーサイトから入手できます。これはSubversionレポジトリのtrunkの先端(HEAD)から自動的にスナップショットを取ったものです。スナップショットの取得はある時刻に問答無用で行っているので、何らかの問題が残っている可能性があります。自己責任でどうぞ。
* 現時点での安定版スナップショット\[[tar.bz2][13]\|[tar.gz][14]\|[zip][15]\]が各ミラーサイトから入手できます。これはSubversionレポジトリのruby
  2.0系のブランチ(ruby\_2\_0\_0ブランチ)の先端から自動的にスナップショットを取ったものです。
* 最新のソースをAnonymous
  SVNで入手する方法については、[レポジトリガイド](/ja/documentation/repository-guide)を参照ください。

## 各環境用バイナリ

各種の環境向けのバイナリが有志により配布されています。

* Windows版Rubyバイナリ
  * どれをダウンロードすればいいのかは[Microsoft Windows版のビルド環境による違い][16]を参考にしてください。
  * [ActiveScriptRuby][17]
    安定版に幾つか便利なライブラリを加え、さらにRubyをCOMサーバとしても利用可能にしたもの。ベースはmswin32版
  * [One-Click Ruby Installer for Windows][18] (英語)
    安定版に多数の便利なライブラリを加えたもの。ベースはmingw32版
  * [Ruby-mswin32][19] mswin32版の安定版・開発版を随時提供
  * [cygwin,djgpp,mingw,mswin32][20]

## ミラーサイト

Rubyのソースコードや、それを含めた当サイトの内容が、有志によりミラーされています。

### FTPミラーサイト

* [日本 1][21]及び[ミラー][22] (RingServer)
* [日本 2][23] (IIJ)
* [日本 3][24] (idaemons.org)
* [日本 4][25] (マスターサイト) - 低速
* [韓国][26] (Korea FreeBSD Users Group)
* [ドイツ][27] (FU Berlin)
* [イギリス][28] (The Mirror Service)
* [ベルギー][29] (Easynet)
* [ロシア][30] (ChgNet)
* [ギリシャ][31] (アテネ工科大)
* [デンマーク][32] (sunsite.dk)
* [アメリカ 1][33] (ibiblio.org)
* [アメリカ 2][34] (lcs.mit.edu)
* [オーストリア][35] (tuwien.ac.at)
* [台湾 1][36] (cdpa.nsysu.edu.tw)
* [台湾 2][37] (ftp.cs.pu.edu.tw)
* [カナダ][38] (mirror.cs.mun.ca)

### HTTPミラーサイト

* [イギリス][39] (The Mirror Service)
* [日本][40]及び[ミラー][22] (RingServer)
* [ドイツ][41] (AmbiWeb GmbH)
* [ベルギー][42] (Easynet)
* [デンマーク][43] (sunsite.dk)
* [オランダ][44] (XS4ALL) - リリース版のみ
* [アメリカ 1][45] (ibiblio.org)
* [アメリカ 2][46] (lcs.mit.edu)
* [アメリカ 3][47] (binarycode.org)
* [アメリカ 4][48] (online-mirror.org)
* [アメリカ 5][49] (trexle.com)
* [オーストリア][50] (tuwien.ac.at)
* [台湾 1][51] (cdpa.nsysu.edu.tw)
* [台湾 2][52] (ftp.cs.pu.edu.tw)

### Rsyncミラーサイト

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (イギリス)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (デンマーク)
* rsync://rsync.idaemons.org/ftp/mirror/ftp.ruby-lang.org/ruby/ (日本)
* rsync://gd.tuwien.ac.at/languages/ruby/ (オーストリア)
* rsync://mirror.cs.mun.ca/ruby/ (カナダ)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (台湾)

Posted by Shugo Maeda on 26 May 2006
{: .post-info}

[1]: {{ site.downloads.stable.url.bz2 }}
[2]: {{ site.downloads.stable.url.gz }}
[3]: {{ site.downloads.stable.url.zip }}
[4]: {{ site.downloads.previous.url.bz2 }}
[5]: {{ site.downloads.previous.url.gz }}
[6]: {{ site.downloads.previous.url.zip }}
[10]: {{ site.downloads.nightly_snapshot.url.bz2 }}
[11]: {{ site.downloads.nightly_snapshot.url.gz }}
[12]: {{ site.downloads.nightly_snapshot.url.zip }}
[13]: {{ site.downloads.stable_snapshot.url.bz2 }}
[14]: {{ site.downloads.stable_snapshot.url.gz }}
[15]: {{ site.downloads.stable_snapshot.url.zip }}
[16]: /ja/install.cgi?cmd=view;name=Microsoft+Windows%C8%C7%A4%CE%A5%D3%A5%EB%A5%C8%B4%C4%B6%AD%A4%CB%A4%E8%A4%EB%B0%E3%A4%A4
[17]: http://www.artonx.org/data/asr/
[18]: http://rubyinstaller.org/
[19]: http://www.garbagecollect.jp/ruby/mswin32/
[20]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/
[21]: ftp://core.ring.gr.jp/pub/lang/ruby/
[22]: http://www.t.ring.gr.jp/
[23]: ftp://ftp.iij.ad.jp/pub/lang/ruby/
[24]: ftp://ftp.idaemons.org/pub/mirror/ftp.ruby-lang.org/ruby/
[25]: ftp://ftp.ruby-lang.org/pub/ruby/
[26]: ftp://ftp.kr.freebsd.org/pub/ruby/
[27]: ftp://ftp.fu-berlin.de/unix/languages/ruby/
[28]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[29]: ftp://ftp.easynet.be/ruby/ruby/
[30]: ftp://ftp.chg.ru/pub/lang/ruby/
[31]: ftp://ftp.ntua.gr/pub/lang/ruby/
[32]: ftp://sunsite.dk/mirrors/ruby/
[33]: ftp://www.ibiblio.org/pub/languages/ruby/
[34]: ftp://xyz.lcs.mit.edu/pub/ruby/
[35]: ftp://gd.tuwien.ac.at/languages/ruby/
[36]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/
[37]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
[38]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/
[39]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/
[40]: http://core.ring.gr.jp/archives/lang/ruby/
[41]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/
[42]: http://ruby.mirror.easynet.be/
[43]: http://mirrors.sunsite.dk/ruby/
[44]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/
[45]: http://www.ibiblio.org/pub/languages/ruby/
[46]: http://xyz.lcs.mit.edu/ruby/
[47]: http://www.binarycode.org/ruby/
[48]: http://www.online-mirror.org/ruby/
[49]: http://ruby.trexle.com/
[50]: http://gd.tuwien.ac.at/languages/ruby/
[51]: http://pluto.cdpa.nsysu.edu.tw/ruby/
[52]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/
