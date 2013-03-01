---
layout: page
title: "ダウンロード"
lang: ja
---

ここでは、Rubyインタプリタの代表的な入手方法を説明します。

## Rubyのソースコード

Rubyの各バージョンのソースコードは、以下から入手できます。

* 最新の安定版であるruby
  2.0.0-p0\[[tar.bz2][1]\|[tar.gz][2]\|[zip][3]\]が各ミラーサイトから入手できます。
* 前世代の安定版であるruby
  1.9.3-p392\[[tar.bz2][4]\|[tar.gz][5]\|[zip][6]\]が各ミラーサイトから入手できます。
* 前々世代の安定版であるruby
  1.8.7-p371\[[tar.bz2][7]\|[tar.gz][8]\|[zip][9]\]も各ミラーサイトから入手できます。
* 現時点での[最新版スナップショット][10](2013/02/28
  04:09:14)をtar.gzで固めています。これはSubversionレポジトリのtrunkの先端(HEAD)から自動的にスナップショットを取ったものです。スナップショットの取得はある時刻に問答無用で行っているので、何らかの問題が残っている可能性があります。自己責任でどうぞ。
* 現時点での[安定版スナップショット][11](2013/03/01
  04:02:56)をtar.gzで固めています。これはSubversionレポジトリのruby
  1.8系のブランチ(ruby\_1\_8ブランチ)の先端から自動的にスナップショットを取ったものです。
* 最新のソースをAnonymous
  SVNで入手する方法については、[レポジトリガイド](/ja/documentation/repository-guide)を参照ください。

## 各環境用バイナリ

各種の環境向けのバイナリが有志により配布されています。

* Windows版Rubyバイナリ
  * どれをダウンロードすればいいのかは[Microsoft Windows版のビルド環境による違い][12]を参考にしてください。
  * [ActiveScriptRuby][13]
    安定版に幾つか便利なライブラリを加え、さらにRubyをCOMサーバとしても利用可能にしたもの。ベースはmswin32版
  * [One-Click Ruby Installer for Windows][14] (英語)
    安定版に多数の便利なライブラリを加えたもの。ベースはmingw32版
  * [Ruby-mswin32][15] mswin32版の安定版・開発版を随時提供
  * [cygwin,djgpp,mingw,mswin32][16]

## ミラーサイト

Rubyのソースコードや、それを含めた当サイトの内容が、有志によりミラーされています。

### FTPミラーサイト

* [日本 1][17]及び[ミラー][18] (RingServer)
* [日本 2][19] (IIJ)
* [日本 3][20] (idaemons.org)
* [日本 4][21] (マスターサイト) - 低速
* [韓国][22] (Korea FreeBSD Users Group)
* [ドイツ][23] (FU Berlin)
* [イギリス][24] (The Mirror Service)
* [ベルギー][25] (Easynet)
* [ロシア][26] (ChgNet)
* [ギリシャ][27] (アテネ工科大)
* [デンマーク][28] (sunsite.dk)
* [アメリカ 1][29] (ibiblio.org)
* [アメリカ 2][30] (lcs.mit.edu)
* [オーストリア][31] (tuwien.ac.at)
* [台湾 1][32] (cdpa.nsysu.edu.tw)
* [台湾 2][33] (ftp.cs.pu.edu.tw)
* [カナダ][34] (mirror.cs.mun.ca)

### HTTPミラーサイト

* [イギリス][35] (The Mirror Service)
* [日本][36]及び[ミラー][18] (RingServer)
* [ドイツ][37] (AmbiWeb GmbH)
* [ベルギー][38] (Easynet)
* [デンマーク][39] (sunsite.dk)
* [オランダ][40] (XS4ALL) - リリース版のみ
* [アメリカ 1][41] (ibiblio.org)
* [アメリカ 2][42] (lcs.mit.edu)
* [アメリカ 3][43] (binarycode.org)
* [アメリカ 4][44] (online-mirror.org)
* [アメリカ 5][45] (trexle.com)
* [オーストリア][46] (tuwien.ac.at)
* [台湾 1][47] (cdpa.nsysu.edu.tw)
* [台湾 2][48] (ftp.cs.pu.edu.tw)

### Rsyncミラーサイト

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (イギリス)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (デンマーク)
* rsync://rsync.idaemons.org/ftp/mirror/ftp.ruby-lang.org/ruby/ (日本)
* rsync://gd.tuwien.ac.at/languages/ruby/ (オーストリア)
* rsync://mirror.cs.mun.ca/ruby/ (カナダ)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (台湾)

Posted by Shugo Maeda on 26 May 2006
{: .post-info}



[1]: ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2 
[2]: ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz 
[3]: ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip 
[4]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.bz2 
[5]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.tar.gz 
[6]: ftp://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p392.zip 
[7]: ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p371.tar.bz2 
[8]: ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p371.tar.gz 
[9]: ftp://ftp.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p371.zip 
[10]: ftp://ftp.ruby-lang.org/pub/ruby/snapshot.tar.gz 
[11]: ftp://ftp.ruby-lang.org/pub/ruby/stable-snapshot.tar.gz 
[12]: http://www.ruby-lang.org/ja/install.cgi?cmd=view;name=Microsoft+Windows%C8%C7%A4%CE%A5%D3%A5%EB%A5%C8%B4%C4%B6%AD%A4%CB%A4%E8%A4%EB%B0%E3%A4%A4 
[13]: http://www.artonx.org/data/asr/ 
[14]: http://rubyinstaller.org/ 
[15]: http://www.garbagecollect.jp/ruby/mswin32/ 
[16]: ftp://ftp.ruby-lang.org/pub/ruby/binaries/ 
[17]: ftp://core.ring.gr.jp/pub/lang/ruby/ 
[18]: http://www.t.ring.gr.jp/ 
[19]: ftp://ftp.iij.ad.jp/pub/lang/ruby/ 
[20]: ftp://ftp.idaemons.org/pub/mirror/ftp.ruby-lang.org/ruby/ 
[21]: ftp://ftp.ruby-lang.org/pub/ruby/ 
[22]: ftp://ftp.kr.freebsd.org/pub/ruby/ 
[23]: ftp://ftp.fu-berlin.de/unix/languages/ruby/ 
[24]: ftp://ftp.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/ 
[25]: ftp://ftp.easynet.be/ruby/ruby/ 
[26]: ftp://ftp.chg.ru/pub/lang/ruby/ 
[27]: ftp://ftp.ntua.gr/pub/lang/ruby/ 
[28]: ftp://sunsite.dk/mirrors/ruby/ 
[29]: ftp://www.ibiblio.org/pub/languages/ruby/ 
[30]: ftp://xyz.lcs.mit.edu/pub/ruby/ 
[31]: ftp://gd.tuwien.ac.at/languages/ruby/ 
[32]: ftp://ruby.cdpa.nsysu.edu.tw/ruby/ 
[33]: ftp://ftp.cs.pu.edu.tw/Unix/lang/Ruby/ 
[34]: ftp://mirror.cs.mun.ca/pub/mirror/ruby/ 
[35]: http://www.mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/ 
[36]: http://core.ring.gr.jp/archives/lang/ruby/ 
[37]: http://dl.ambiweb.de/mirrors/ftp.ruby-lang.org/ 
[38]: http://ruby.mirror.easynet.be/ 
[39]: http://mirrors.sunsite.dk/ruby/ 
[40]: http://www.xs4all.nl/~hipster/lib/mirror/ruby/ 
[41]: http://www.ibiblio.org/pub/languages/ruby/ 
[42]: http://xyz.lcs.mit.edu/ruby/ 
[43]: http://www.binarycode.org/ruby/ 
[44]: http://www.online-mirror.org/ruby/ 
[45]: http://ruby.trexle.com/ 
[46]: http://gd.tuwien.ac.at/languages/ruby/ 
[47]: http://pluto.cdpa.nsysu.edu.tw/ruby/ 
[48]: http://ftp.cs.pu.edu.tw/Unix/lang/Ruby/ 
