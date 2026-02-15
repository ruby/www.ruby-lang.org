---
layout: news_post
title: "Ruby 1.9.2 RC2リリース"
author: "usa"
lang: ja
---

Ruby 1.9.2 RC2をリリースしました。これはRuby 1.9.2の2つ目のリリース候補です。

前回のRCから、psychライブラリに修正が加えられました。 また、他にもいくつか細かいバグが修正されています。

詳細は[NEWS][1]および[ChangeLog][2]をご覧ください。

### Ruby 1.9.2 について

Ruby 1.9.2は下記を除いておおよそ1.9.1と互換となります。

* 多くの追加メソッド
* 新しいsocket API (IPv6サポート)
* 新しいエンコーディング
* 幾つかの乱数生成をサポートするRandomクラス
* 再実装されたTime。2038年問題は解消しました。
* いくつかの正規表現拡張
* $:はカレントディレクトリを含みません
* dlはlibffi上に再実装されました。
* libyamlをラップした新しいpsychライブラリ。syckの代わりに使えます。

Ruby 1.9.2は8月初旬にリリースされる予定です。1.9.2リリーススケジュール
は、1.9.2がRubySpecにパスすることを保証する目的で一度はキャンセルされま したが、現在はRubySpecの99%超にパスしています。
どうぞお試しください。何が問題があれば[課題追跡システム][3]にてお知らせください。

### 所在

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2&gt;][4]
  SIZE
  : 8480974 bytes

  MD5
  : 4e4906d0aab711286b31f5a834860cc3

  SHA256
  : 692ebae991b104482dc9f0d220c1afb6b690a338b3b815aaa4f62954d2fa1b4a

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz&gt;][5]
  SIZE
  : 10781884 bytes

  MD5
  : d12cd39eee4d99bc54b52aba5a0ba4e1

  SHA256
  : 5d523d99f928705ac1de84ade03283c468415c00f8b6755a8dd7a140828869b4

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip&gt;][6]
  SIZE
  : 12161233 bytes

  MD5
  : 05229b43981e4e5ce58b5fb2e98eee52

  SHA256
  : 33f7f4cdd8444c2594728f70ac07477575a7cba5e7756bd3645f23e52605618c



[1]: https://github.com/ruby/ruby/blob//v1_9_2_rc2/NEWS
[2]: https://github.com/ruby/ruby/blob//v1_9_2_rc2/ChangeLog
[3]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip
