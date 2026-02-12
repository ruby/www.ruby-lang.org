---
layout: news_post
title: "Ruby 1.9.2リリース"
author: "Yugui"
lang: ja
---

Ruby 1.9.2をリリースしました。これはRuby 1.9系統の最新版です。

### Ruby 1.9.2について

Ruby 1.9.2は下記を除いておおよそ1.9.1と互換となります。

* 多くの追加メソッド
* 新しいsocket API (より透過的なIPv6サポート)
* 新しいエンコーディング
* 幾つかの乱数生成アルゴリズムをサポートするRandomクラス
* 再実装されたTime。2038年問題は解消しました。
* いくつかの正規表現拡張
* `$:`はカレントディレクトリを含みません
* dlはlibffi上に再実装されました。
* libyamlをラップした新しいpsychライブラリ。syckの代わりに使えます。

詳しくは[NEWS][1]および[ChangeLog][2]をご覧ください。

Ruby 1.9.2は[RubySpec][3]の99%超にパスしています。

### サポートされるプラットフォーム

Ruby 1.9は4段階のサポートレベルを持ちます。

Supported
: このプラットフォームにおいてRuby 1.9.2が正しく動作することが検証されています。Ruby
  1.9.2はこのプラットフォームで継続的にメンテナンスされます。

  * Debian GNU/Linux 5.0 on IA32.

Best Effort
: これらのプラットフォームにおいてRuby 1.9.2がおおよそ正しく動作することが検証されています。Ruby
  1.9.2はこれらのプラットフォームで継続的にメンテナンスされると信じています。

  * mswin32, x64-mswin64, mingw32
  * MacOS X 10.5 (Intel) および 10.6
  * FreeBSD 6以降 (amd64, IA32)
  * Solaris 10
  * Symbian OS

Perhaps
: これらのプラットフォームにおいてRuby 1.9.2は小さな修正で正しく動作すると思いますが、未検証です。パッチを歓迎します。

  * その他のLinuxディストリビューション
  * MacOS Xのその他のバージョン
  * cygwin
  * AIX 5
  * その他のPOSIX互換システム
  * BeOS (Haiku)

Not supported
: Ruby 1.9.2はこれらのプラットフォームで動作しないでしょう。移植は歓迎します。

  * 上記以外のすべてのシステム

### FAQ

標準ライブラリが/usr/local/lib/ruby/1.9.1にインストールされる
: このバージョン番号は「ライブラリ互換バージョン」です。Ruby
  1.9.2は1.9.1とおおよそ互換なので、ライブラリはこのディレクトリにインストールされます。

LoadErrorが発生する
: `$:`はカレントディレクトリを含まなくなりました。そのためスクリプトは修正を要することがあります。ともあれ、もともとスクリプトはできるだけカレントディレクトリに依存しないように書いた方がよいでしょう。

### ダウンロード

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  SIZE
  : 8495472 bytes

  MD5
  : d8a02cadf57d2571cd4250e248ea7e4b

  SHA256
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  SIZE
  : 10787899 bytes

  MD5
  : 755aba44607c580fddc25e7c89260460

  SHA256
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  SIZE
  : 12159728 bytes

  MD5
  : e57a393ccd62ddece4c63bd549d8cf7f

  SHA256
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_0
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_0
[3]: https://github.com/ruby/spec
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip
