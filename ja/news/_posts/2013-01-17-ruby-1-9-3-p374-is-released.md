---
layout: news_post
title: "Ruby 1.9.3-p374 リリース"
author: "usa"
date: 2013-01-17 08:39:33 +0000
lang: ja
---

このところ毎月で恐縮ですが、Ruby 1.9.3-p374 がリリースされました。

このリリースでは、以下の修正が取り込まれています。

* (特に Rails 使用時に) ランダムに起きる SEGV の修正
* Windows 8 対応 (たぶん今度こそ)
* その他多数のバグ修正

詳しくは、対応する[チケット][1]および [ChangeLog][2] を確認して下さい。

なお、今回のリリースには、脆弱性対応は特に含まれていません。 が、前回のリリース (p362) を使っている方には、更新を特に強くお勧めします。

## ダウンロード

以下の URL から本リリースをダウンロードできます。

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p374.tar.bz2&gt;][3]
  * SIZE: 10017658 bytes
  * MD5: 944e73eba9ee9e1f2647ff32ec0b14b2
  * SHA256: 712944f691b79f22f655547826400c26b13bc8c9e7bdc73a4abea45d5e766d85

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p374.tar.gz&gt;][4]
  * SIZE: 12555429 bytes
  * MD5: 90b6c327abcdf30a954c2d6ae44da2a9
  * SHA256: 0d0e32a3554867e3eddbb23fbf30a72c4748622e010c23e31302d899fc005574

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p374.zip&gt;][5]
  * SIZE: 13871394 bytes
  * MD5: c0001d5d36ad2e3e6a84810abe585b79
  * SHA256: 058af4cf409c93cce1de74a6b3355ddcf740f3efae1ab02d63471fcdbed19088

## リリースに寄せて

今回のリリースも、コミッタの皆さん、テストに協力してくださった方々、そしてバグを報告してくれたユーザーの皆さんに大いに助けられました。
この場を借りてお礼申し上げます。ありがとうございました。

Happy Hacking!



[1]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_3_374
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p374.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p374.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p374.zip
