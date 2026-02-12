---
layout: news_post
title: "Ruby 1.9.3-p385 リリース"
author: "usa"
date: 2013-02-06 13:36:49 +0000
lang: ja
---

今月だけは出したくなかったのですが、やんごとなき事情により、 Ruby 1.9.3-p385 がリリースされました。

今回は、バンドルされている [RDoc の脆弱性対応][1]が含まれています。 Ruby 1.9 利用者の皆様には、更新を強くお勧めします。

このリリースでは、以下の修正が取り込まれています。

* [RDoc で生成した HTML ドキュメントにおける XSS 脆弱性への対応 (CVE-2013-0256)][1]
* その他いくつかのバグ修正

詳しくは、[対応するチケット][2]および [ChangeLog][3] を確認して下さい。

## ダウンロード

以下の URL から本リリースをダウンロードできます。

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p385.tar.bz2&gt;][4]

      SIZE:   10021486 bytes
      MD5:    5ec9aff670f4912b0f6f0e11e855ef6c
      SHA256: f991ee50414dc795696bad0fc5c7b0b94d93b9b38fed943326d20ce4e9dda42b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p385.tar.gz&gt;][5]

      SIZE:   12546003 bytes
      MD5:    3e0d7f8512400c1a6732327728a56f1d
      SHA256: 4b15df007f5935ec9696d427d8d6265b121d944d237a2342d5beeeba9b8309d0

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p385.zip&gt;][6]

      SIZE:   13862147 bytes
      MD5:    044564fe519a2c8e278472c4272b3ff2
      SHA256: 0cb389fcc1ac9fccf32f3db27497908b7365aa910b6dd1559389416e828addc5

## リリースコメント

今回のリリースも、いつもと同じように、コミッタの皆さん、テストに協力してくださった方々、そしてバグを報告してくれたユーザーの皆さんに大いに助けられました。
この場を借りてお礼申し上げます。ありがとうございました。

Happy Hacking!



[1]: {{ site.url }}/ja/news/2013/02/06/rdoc-xss-cve-2013-0256/
[2]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[3]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_3_385
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p385.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p385.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p385.zip
