---
layout: news_post
title: "Ruby 1.9.3 preview1リリース"
author: "Moru"
lang: ja
---

Ruby 1.9.3 preview1をリリースしました。これはRuby 1.9.3の最初の試作見本 です。

まだ既知の小さな問題もいくつか残ってはいますが、これらは1.9.3-p0のリリー スまでには修正されることでしょう。

どうぞお試しください。もし何か問題がありましたらお知らせください。

## 所在

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2&gt;][1]
  SIZE: 9507455 bytes
  MD5: 7d93dc773c5824f05c6e6630d8c4bf9b
  SHA256: a15d7924d74a45ffe48d5421c5fc4ff83b7009676054fa5952b890711afef6fc

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz&gt;][2]
  SIZE: 12186410 bytes
  MD5: 0f0220be4cc7c51a82c1bd8f6a0969f3
  SHA256: 75c2dd57cabd67d8078a61db4ae86b22dc6f262b84460e5b95a0d8a327b36642

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip&gt;][3]
  SIZE: 13696708 bytes
  MD5: 960e08b2dc866c9987f17d0480de63a1
  SHA256: 249483f88156b4ae65cd45742c6f6316660f793b78739657596c63b86f76aaeb

## 1.9.2からの変更点

ライセンスが変更されました。

* RubyはGPLv2と\"Ruby\'s\"ライセンスでリリースされてきました。Ruby 1.9.3は[2-clause
  BSDL][4]と[Ruby\'sライセンス][5]でリリースされます。

### エンコーディング

* Ruby 1.9.\[0-2\]ではSJISはShift\_JISのaliasでしたが、Windows-31Jのaliasになりました。

### ライブラリ

* io/console: 新しいライブラリです
* openssl: 活発なメンテナを得たお陰で特段に改善してきています。
* test/unit: テストの並列実行をサポートします。

### 実装

* pathnameライブラリとdateライブラリはCで再実装されました。これによりパフォーマンスが向上します。
* VMのロック戦略が変わりました。

詳しくは[NEWS][6]や[ChangeLog][7]をご覧ください。



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip
[4]: http://en.wikipedia.org/wiki/BSD_licenses#2-clause_license_.28.22Simplified_BSD_License.22_or_.22FreeBSD_License.22.29
[5]: {{ site.url }}{{ site.license.url }}
[6]: https://github.com/ruby/ruby/blob//v1_9_3_preview1/NEWS
[7]: https://github.com/ruby/ruby/blob//v1_9_3_preview1/ChangeLog
