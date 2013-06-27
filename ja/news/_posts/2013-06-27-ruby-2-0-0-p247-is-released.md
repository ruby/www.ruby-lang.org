---
layout: news_post
title: "Ruby 2.0.0-p247 リリース"
author: "nagachika"
translator:
date: 2013-06-27 11:00:00 UTC
lang: ja
---

Ruby 2.0.0-p247 をリリースします。

このリリースには拡張ライブラリ OpenSSL のセキュリティフィックスが含まれます。

 * [OpenSSL クライアントにおけるホスト名検証バイパス脆弱性 (CVE-2013-4073)](/ja/news/2013/06/25/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

その他にもいくつかのバグフィックスや最適化、ドキュメントの修正が含まれています。主な変更点は以下の「変更点」を参考にしてください。

## ダウンロード

* [ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2](ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2)

      SIZE:   ######## bytes
      MD5:    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      SHA256: SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

* [ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz](ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz)

      SIZE:   ######## bytes
      MD5:    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      SHA256: SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

* [ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip](ftp://ftp.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip)

      SIZE:   ######## bytes
      MD5:    MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM
      SHA256: SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS

## 変更点

主な変更点は以下にあります。より詳細な変更点は
[ChangeLog](http://svn.ruby-lang.org/repos/ruby/tags/v2_0_0_247/ChangeLog) ファイルや[チケット](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&status_id=5)を参照してください。

### キーワード引数

* [#8040](https://bugs.ruby-lang.org/issues/8040) change pirority between keyword arguments and mandatory arguments.
* [#8416](https://bugs.ruby-lang.org/issues/8416) super does not forward either named or anonymous **
* [#8463](https://bugs.ruby-lang.org/issues/8463) Proc auto-splat bug with named arguments

### VM/処理系

* [#8424](https://bugs.ruby-lang.org/issues/8424) fix infinite loop when stack overflow with TH_PUSH_TAG()
* [#8436](https://bugs.ruby-lang.org/issues/8436) \__dir__ not working in eval with binding
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API: B_RETURN_EVENT not triggered when "next" used
* [#8341](https://bugs.ruby-lang.org/issues/8341) block_given? (and the actual block) persist between calls to a proc created from a method (using method().to_proc()).
* [#8531](https://bugs.ruby-lang.org/issues/8531) block_given? (and the actual block) persist between calls to a proc created by Symbol#to_proc.

### RubyGems

同梱している RubyGems のバージョンを 2.0.3 にアップデートしました。

### Encoding

* [#8516](https://bugs.ruby-lang.org/issues/8516) IO#readchar returns wrong codepoints when converting encoding

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) File.read() crash on Win32SP3 32bit

### ライブラリ

* [#8467](https://bugs.ruby-lang.org/issues/8467) Rewinding and iterating through gzipped IO leads to segmentation fault
* [#8415](https://bugs.ruby-lang.org/issues/8415) Net::IMAP#capability_response raises "Net::IMAP::ResponseParseError: unexpected token CRLF" for common CAPABILITY

## リリースコメント

リリースにご協力頂いたコミッタ/開発者の皆様に感謝致します。ありがとうございました。
