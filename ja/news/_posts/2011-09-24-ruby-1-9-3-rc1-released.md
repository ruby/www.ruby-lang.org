---
layout: news_post
title: "Ruby 1.9.3 rc1 リリース"
author: "Shota Fukumori"
lang: ja
---

Ruby 1.9.3 の最初の Release Candidate 版である ruby-1.9.3-rc1 がリリースされました。

これは ruby-1.9.3-preview1 に続く 2 つ目の試作見本になります。 まだ小さな既知の問題が残っていますが
ruby-1.9.3-p0 のリリースにむけて修正が続けられています。

どうぞお試しください。もし何か問題があればお知らせ下さい。

## 所在

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.bz2&gt;][1]
  SIZE: 9552727 bytes
  MD5: 26f0dc51ad981e12c58b48380112fa4d
  SHA256: 951a8810086abca0e200f81767a518ee2730d6dc9b0cc2c7e3587dcfc3bf5fc8

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.gz&gt;][2]
  SIZE: 12224459 bytes
  MD5: 46a2a481536ca0ca0b80ad2b091df68e
  SHA256: bb1ae474d30e8681df89599520e766270c8e16450efdc01e099810f5e401eb94

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.zip&gt;][3]
  SIZE: 13696517 bytes
  MD5: 9c787f5e4963e54d1a11985a73467342
  SHA256: 8e9219b7e6f78a9e171740cbbb3787047383c281c290504dd0e4d8318607a74b

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



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.zip
[4]: http://en.wikipedia.org/wiki/BSD_licenses#2-clause_license_.28.22Simplified_BSD_License.22_or_.22FreeBSD_License.22.29
[5]: {{ site.url }}{{ site.license.url }}
[6]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_3_rc1
[7]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_3_rc1
