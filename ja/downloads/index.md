---
layout: page
title: "ダウンロード"
lang: ja
---

ここでは、Rubyインタプリタの代表的な入手方法を説明します。
現在の安定版は {{ site.data.downloads.stable[0] }}です。
[Ruby’sライセンス][license]を必ずお読み下さい。
{: .summary}

### Rubyのインストール方法

メジャーなプラットフォームでは Ruby をインストールする方法はいくつかあります。

* Linux/UNIX マシンでは、そのシステムのパッケージ管理ツールや、[rbenv][rbenv]、[RVM][rvm]などのサードパーティツールが使えます。
* macOSマシンでは、[rbenv][rbenv]、[RVM][rvm]などのサードパーティのパッケージ管理ツールが使えます。
* Windowsマシンでは、[RubyInstaller][rubyinstaller]といったツールが使えます。

各パッケージマネージャ及びサードパーティーツールの詳細は、[インストールガイド][installation] ページを参照して下さい。

もちろん、メジャーなプラットフォームでソースからRubyをインストールすることも可能です。

### ソースコードからRubyをコンパイルする

ソースコードからのインストールは、利用したいプラットフォームや環境に合った設定を使うことができる、いい方法です。
また、利用したいプラットフォーム向けのパッケージが存在しない場合にも使えるいい方法でもあります。

もしコンパイルで問題がある場合、[インストールガイド][installation] ページで解説しているサードパーティーツールの利用が助けになるかもしれません。

* **安定版:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **プレビュー版:**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **セキュリティ修正のみの安定版 (まもなく EOL):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **メンテナンス終了 (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **スナップショット:**
  * [安定版のスナップショット]({{ site.data.downloads.stable_snapshot.url.gz }}):
    最も新しい現在の安定版ブランチのスナップショットのtarballです。
  * [ナイトリースナップショット]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    毎晩Gitから作成しているtarballです。
    バグやその他の問題があるかもしれません。利用する場合は自己責任でお願いします！

RubyのSubversionやGitリポジトリについての情報は、[リポジトリガイド](/ja/documentation/repository-guide)を参照してください。

Rubyのソースコードは、世界各国の[ミラーサイト][mirrors]からダウンロードできます。
お近くのミラーサイトをお使いください。

### Windows版Rubyバイナリ

Windows向けのバイナリが有志により配布されています。

* [ActiveScriptRuby][active-script-ruby]
  安定版に幾つかの便利なライブラリを加え、さらにRubyをCOMサーバとしても利用可能にしたもの。ベースはmswin32版
* [RubyInstaller][rubyinstaller] (英語)
  安定版に多数の便利なライブラリを加えたもの。ベースはmingw32版
* [RailsInstaller][railsinstaller] (英語)
  RubyInstaller に Rails の開発に必要なものを加えたもの。



[license]: {{ site.license.url }}
[installation]: /ja/documentation/installation/
[mirrors]: /en/downloads/mirrors/
[active-script-ruby]: http://www.artonx.org/data/asr/
[rubyinstaller]: https://rubyinstaller.org/
[railsinstaller]: http://railsinstaller.org/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
