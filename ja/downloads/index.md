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

Rubyのソースコードや、それを含めた当サイトの内容が、有志によりミラーされています。
[ミラーサイト一覧](/en/downloads/mirrors/)を参照してください。

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
