---
layout: news_post
title: "Ruby 1.8.7 リリース!"
author: "maki"
lang: ja
---

Ruby 1.8.7がリリースされました。 (リリースについてのアナウンス:[\[ruby-list:44986\]][1])

ソースコードは以下のURLから入手できます。 3種類のフォーマットから選んでください。

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.tar.bz2&gt;][2]
  * md5: f17f14c8d55e731b3ce1bc35c42f0a6c
  * sha256:
    65f2a862ba5e88bac7a78cff15bcb88d7534e741b51a1ffb79a0136c7041359a
  * size: 4100024

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.tar.gz&gt;][3]
  * md5: de906850f9a012c12ffc6e9f56fb1b66
  * sha256:
    600dccf13bca3e4179fa6ff554220ce4ba67ffc72bce1ac3bf74c2599c03a0ca
  * size: 4799732

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.zip&gt;][4]
  * md5: 14d3eb37b32e4a26966bdd80f361ccd2
  * sha256:
    805987ad167d8f9cac90e4b9342686e96a7708664111be27a3c6d680ce21d6c1
  * size: 5851408

1.8.6 との互換性情報を含む変更点のリストは、同梱の NEWS および ChangeLog
を参照してください。以下のURLでも閲覧できます。

* [&lt;URL:https://git.ruby-lang.org/ruby.git/plain/NEWS&gt;][5]?id=refs/tags/v1\_8\_7
* [&lt;URL:https://git.ruby-lang.org/ruby.git/plain/ChangeLog&gt;][6]?id=refs/tags/v1\_8\_7

なお、本リリースからは、新たに[RubySpec][7]を活用しての互換性の検証も行われています。

今後、 1.8.8 の開発とは別に「ruby\_1\_8\_7」ブランチで 致命的な不具合とセキュリティ脆弱性の修正に絞った保守が行われ、
都度パッチリリースが公開されます。1.8.7 へのアップグレード後は そちらのチェックもお願いします。



[1]: https://blade.ruby-lang.org/ruby-list/44986
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.tar.gz
[4]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7.zip
[5]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_8_7
[6]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_8_7
[7]: https://github.com/ruby/spec
