---
layout: news_post
title: "Ruby 1.9.3-p194 リリース"
author: "maki"
lang: ja
---

Ruby 1.9.3-p194 がリリースされました。

このリリースはRubyGemsに対するセキュリティフィックスを含んでいます。これは、リモートリポジトリへのSSLサーバ検証についてのものです。それ以外にも、多くの修正が含まれています。

## RubyGemsに関するセキュリティフィックス: リモートリポジトリへのSSLサーバ検証の修正

このリリースはRubyGemsに関する2つのセキュリティフィックスを含んでいます。

* SSLサーバ証明書の検証を実行するように修正
* httpsからhttpへのリダイレクトを許さないよう修正

.gemrcや/etc/gemrcにhttpsのソースを使用しているユーザは、1.9.3-p194にアップグレードすることを推奨します。

以下はRubyGems 1.8.23のリリースノート\[1\]からの引用です。

「このリリースはRubyGemsがhttpsサーバと通信する際の安全性を高めます。もし、SSL上のカスタムRubyGemsサーバを使われているなら、このリリースはSSL証明書がグローバルに有効なものでなければRubyGemsが接続できなくなります。

RubyGemsがSSL証明書をどのように使うかは、~/.gemrcファイルや/etc/gemrcファイルでの:ssl\_ca\_cert
オプションと
:ssl\_verify\_modeオプションで設定することができます。:ssl\_ca\_certにはあなたのサーバのCA証明書か、あなたのCA証明書を含む証明書のバンドルファイルを指定することをお勧めします。

なお、:ssl\_verify\_mode を0にしてSSL証明書のチェックをしないようにすることもできますが、こちらはお勧めしません。」

この問題はJohn Firebaugh氏によって報告されました。

\[1\]
[&lt;URL:https://github.com/rubygems/rubygems/blob/1.8/History.txt&gt;][1]

## 修正点

* RubyGemsに関するセキュリティフィックス: リモートリポジトリへのSSLサーバ検証の誤りを修正
* その他のバグ修正

詳しくは[チケット][2]もしくは[ChageLog][3]をご覧ください。

## ダウンロード

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2&gt;][4]
  * SIZE: 9841223 bytes
  * MD5: 2278eff4cfed3cbc0653bc73085caa34
  * SHA256: a9d1ea9eaea075c60048369a63b35b3b5a06a30aa214a3d990e0bb71212db8fa

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz&gt;][5]
  * SIZE: 12432239 bytes
  * MD5: bc0c715c69da4d1d8bd57069c19f6c0e
  * SHA256: 46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip&gt;][6]
  * SIZE: 13898712 bytes
  * MD5: 77e67b15234e442d4a3dcc450bc70fea
  * SHA256: 77474cfb92385b3a0b4c346553048bc65bfe68d4f220128329671a0234cb124d



[1]: https://github.com/rubygems/rubygems/blob/1.8/History.txt
[2]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[3]: https://github.com/ruby/ruby/blob//v1_9_3_194/ChangeLog
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip
