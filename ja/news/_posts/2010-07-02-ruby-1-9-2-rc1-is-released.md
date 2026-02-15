---
layout: news_post
title: "Ruby 1.9.2 RC1リリース"
author: "Yugui"
lang: ja
---

Ruby 1.9.2 RC1をリリースしました。これはRuby 1.9.2のリリース候補です。 Ruby 1.9.2は下記を除いておおよそ1.9.1と互換となります。

* 多くの追加メソッド
* 新しいsocket API (IPv6サポート)
* 新しいエンコーディング
* 幾つかの乱数生成をサポートするRandomクラス
* 再実装されたTime。2038年問題は解消しました。
* いくつかの正規表現拡張
* $:はカレントディレクトリを含みません
* dlはlibffi上に再実装されました。
* libyamlをラップした新しいpsychライブラリ。syckの代わりに使えます。

詳細は[NEWS][1]および[ChangeLog][2]をご覧ください。

Ruby 1.9.2 preview 3以来約130のバグが修正されました。Ruby
1.9.2の主な既知のバグは、[#3462][3]を除いて修正されました。

Ruby 1.9.2は8月初旬にリリースされる予定です。1.9.2リリーススケジュール
は、1.9.2がRubySpecにパスすることを保証する目的で一度はキャンセルされま したが、現在はRubySpecの99%超にパスしています。
どうぞお試しください。何が問題があれば[課題追跡システム][4]にてお知らせください。

### 所在

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2&gt;][5]
  SIZE
  : 8479087 bytes

  MD5
  : 242dcfaed8359a6918941b55d0806bf0

  SHA256
  : c2a680aa5472c8d04a71625afa2b0f75c030d3655a3063fe364cfda8b33c1480

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz&gt;][6]
  SIZE
  : 10779309 bytes

  MD5
  : fdedd5b42ae89a9a46797823ad2d9acf

  SHA256
  : 3e90036728342ce8463be00d42d4a36de70dabed96216c5f8a26ec9ba4b29537

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip&gt;][7]
  SIZE
  : 12158992 bytes

  MD5
  : 3da59c5d3567f6e1f1697abbef71f507

  SHA256
  : 4f593a3d0873cea8f371a7fc7484cad7bc03acac0ada1970cb9f83a89bc27997



[1]: https://github.com/ruby/ruby/blob//v1_9_2_rc1/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_rc1/ChangeLog
[3]: https://bugs.ruby-lang.org/issues/show/3462
[4]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip
