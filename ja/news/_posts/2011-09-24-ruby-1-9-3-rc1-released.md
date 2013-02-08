---
layout: news_post
title: "Ruby 1.9.3 rc1 リリース"
author: "maki"
lang: ja
---

Ruby 1.9.3 の最初の Release Candidate 版である ruby-1.9.3-rc1 がリリースされました。

これは ruby-1.9.3-preview1 に続く 2 つ目の試作見本になります。 まだ小さな既知の問題が残っていますが
ruby-1.9.3-p0 のリリースにむけて修正が続けられています。

どうぞお試しください。もし何か問題があればお知らせ下さい。

## 

* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.bz2&gt;][1]


* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.gz&gt;][2]


* [&lt;URL:http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.zip&gt;][3]

## 

ライセンスが変更されました。

* RubyはGPLv2と\"Ruby\'s\"ライセンスでリリースされてきました。Ruby 1.9.3は[2-clause
  BSDL][4]と[Ruby\'sライセンス][5]でリリースされます。

### 

* Ruby 1.9.\[0-2\]ではSJISはShift\_JISのaliasでしたが、Windows-31Jのaliasになりました。

### 

* io/console: 新しいライブラリです
* openssl: 活発なメンテナを得たお陰で特段に改善してきています。
* test/unit: テストの並列実行をサポートします。

### 

* pathnameライブラリとdateライブラリはCで再実装されました。これによりパフォーマンスが向上します。
* VMのロック戦略が変わりました。

詳しくは[NEWS][6]や[ChangeLog][7]をご覧ください。

Posted by Shota Fukumori on 24 Sep 2011
{: .post-info}



[1]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.bz2 
[2]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.tar.gz 
[3]: http://ftp.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-rc1.zip 
[4]: http://en.wikipedia.org/wiki/BSD_licenses#2-clause_license_.28.22Simplified_BSD_License.22_or_.22FreeBSD_License.22.29 
[5]: http://www.ruby-lang.org/en/LICENSE.txt 
[6]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_rc1/NEWS 
[7]: http://svn.ruby-lang.org/repos/ruby/tags/v1_9_3_rc1/ChangeLog 
