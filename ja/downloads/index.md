---
layout: page
title: "ダウンロード"
lang: ja
---

ここでは、Rubyインタプリタの代表的な入手方法を説明します。

## Rubyのソースコード

Rubyの各バージョンのソースコードは、以下から入手できます。

* 最新の安定版であるruby {{ site.downloads.stable.version }}\[[tar.bz2][stable-bz2]\|[tar.gz][stable-gz]\|[zip][stable-zip]\]が各ミラーサイトから入手できます。
* 前世代の安定版であるruby {{ site.downloads.previous.version }}\[[tar.bz2][previous-bz2]\|[tar.gz][previous-gz]\|[zip][previous-zip]\]が各ミラーサイトから入手できます。
* 前々世代の安定版であるruby {{ site.downloads.previous19.version }}\[[tar.bz2][previous-but-one-bz2]\|[tar.gz][previous-but-one-gz]\|[zip][previous-but-one-zip]\]が各ミラーサイトから入手できます。
* 現時点での安定版スナップショット\[[tar.bz2][stable-snapshot-bz2]\|[tar.gz][stable-snapshot-gz]\|[zip][stable-snapshot-zip]\]が各ミラーサイトから入手できます。これはSubversionリポジトリのruby 2.1系のブランチ(ruby\_2\_1ブランチ)の先端から自動的にスナップショットを取ったものです。
* 現時点での最新版スナップショット\[[tar.bz2][nightly-bz2]\|[tar.gz][nightly-gz]\|[zip][nightly-zip]\]が各ミラーサイトから入手できます。これはSubversionリポジトリのtrunkの先端(HEAD)から自動的にスナップショットを取ったものです。最新版スナップショットには、何らかの問題や不具合が残っている可能性があります。自己責任でご利用下さい。

最新のソースを Subversion と Git のリポジトリから入手する方法については、[リポジトリガイド](/ja/documentation/repository-guide)を参照してください。

## Windows版Rubyバイナリ

Windows向けのバイナリが有志により配布されています。

* [ActiveScriptRuby][active-script-ruby]
  安定版に幾つかの便利なライブラリを加え、さらにRubyをCOMサーバとしても利用可能にしたもの。ベースはmswin32版
* [RubyInstaller][rubyinstaller] (英語)
  安定版に多数の便利なライブラリを加えたもの。ベースはmingw32版
* [RailsInstaller][railsinstaller] (英語)
  RubyInstaller に Rails の開発に必要なものを加えたもの。

## ミラーサイト

Rubyのソースコードや、それを含めた当サイトの内容が、有志によりミラーされています。

### HTTPミラーサイト

* [CDN][mirror-http-cdn] (fastly.com)
* [日本 1][mirror-https-jp] (マスターサイト) - HTTPS
* 日本 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-http-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-http-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-http-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-http-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-http-jp-ring-airnet]
  * [maffin.ad.jp][mirror-http-jp-ring-maffin]
* [イギリス][mirror-http-uk] (The Mirror Service)
* [ドイツ][mirror-http-de] (AmbiWeb GmbH)
* [ベルギー][mirror-http-be] (Easynet)
* [デンマーク][mirror-http-dk] (sunsite.dk)
* [オランダ][mirror-http-nl] (XS4ALL) - リリース版のみ
* [アメリカ 1][mirror-http-us1] (ibiblio.org)
* [アメリカ 2][mirror-http-us2] (lcs.mit.edu)
* [アメリカ 3][mirror-http-us3] (binarycode.org)
* [アメリカ 4][mirror-http-us4] (online-mirror.org)
* [アメリカ 5][mirror-http-us5] (trexle.com)
* [オーストリア][mirror-http-at] (tuwien.ac.at)
* [台湾 1][mirror-http-tw1] (cdpa.nsysu.edu.tw)
* [台湾 2][mirror-http-tw2] (ftp.cs.pu.edu.tw)
* [中国][mirror-http-cn] (ruby.taobao.org)

### FTPミラーサイト

* [日本 1][mirror-ftp-jp1] (マスターサイト)
* 日本 2 (RingServer)
  * [shibaura-it.ac.jp][mirror-ftp-jp-ring-shibaura-it]
  * [tohoku.ac.jp][mirror-ftp-jp-ring-tohoku]
  * [u-toyama.ac.jp][mirror-ftp-jp-ring-u-toyama]
  * [yamanashi.ac.jp][mirror-ftp-jp-ring-yamanashi]
  * [airnet.ne.jp][mirror-ftp-jp-ring-airnet]
  * [maffin.ad.jp][mirror-ftp-jp-ring-maffin]
* [日本 3][mirror-ftp-jp3] (IIJ)
* [韓国][mirror-ftp-kr] (Korea FreeBSD Users Group)
* [ドイツ][mirror-ftp-de] (FU Berlin)
* [イギリス][mirror-ftp-uk] (The Mirror Service)
* [ベルギー][mirror-ftp-be] (Easynet)
* [ロシア][mirror-ftp-ru] (ChgNet)
* [ギリシャ][mirror-ftp-gr] (アテネ工科大)
* [デンマーク][mirror-ftp-dk] (sunsite.dk)
* [アメリカ 1][mirror-ftp-us1] (ibiblio.org)
* [アメリカ 2][mirror-ftp-us2] (lcs.mit.edu)
* [オーストリア][mirror-ftp-at] (tuwien.ac.at)
* [台湾 1][mirror-ftp-tw1] (cdpa.nsysu.edu.tw)
* [台湾 2][mirror-ftp-tw2] (ftp.cs.pu.edu.tw)
* [カナダ][mirror-ftp-ca] (mirror.cs.mun.ca)

### Rsyncミラーサイト

* rsync://rsync.mirrorservice.org/ftp.ruby-lang.org/pub/ruby/ (イギリス)
* rsync://sunsite.dk/ftp/mirrors/ruby/ (デンマーク)
* rsync://gd.tuwien.ac.at/languages/ruby/ (オーストリア)
* rsync://mirror.cs.mun.ca/ruby/ (カナダ)
* rsync://ftp.cs.pu.edu.tw/Ruby/ (台湾)

Posted by Shugo Maeda on 26 May 2006
{: .post-info}

[stable-bz2]: {{ site.downloads.stable.url.bz2 }}
[stable-gz]: {{ site.downloads.stable.url.gz }}
[stable-zip]: {{ site.downloads.stable.url.zip }}
[previous-bz2]: {{ site.downloads.previous.url.bz2 }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous-zip]: {{ site.downloads.previous.url.zip }}
[previous-but-one-bz2]: {{ site.downloads.previous19.url.bz2 }}
[previous-but-one-gz]: {{ site.downloads.previous19.url.gz }}
[previous-but-one-zip]: {{ site.downloads.previous19.url.zip }}
[nightly-bz2]: {{ site.downloads.nightly_snapshot.url.bz2 }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[nightly-zip]: {{ site.downloads.nightly_snapshot.url.zip }}
[stable-snapshot-bz2]: {{ site.downloads.stable_snapshot.url.bz2 }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[stable-snapshot-zip]: {{ site.downloads.stable_snapshot.url.zip }}
[active-script-ruby]: http://www.artonx.org/data/asr/
[rubyinstaller]: http://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
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
