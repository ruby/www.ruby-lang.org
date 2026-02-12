---
layout: news_post
title: "Ruby 1.9.3-p286 リリース"
author: "usa"
lang: ja
---

Ruby 1.9.3-p286 がリリースされました。

このリリースには、脆弱性対応を含む以下の修正が取り込まれてい ます。

* [Exception#to\_s 等による $SAFE 機構をバイパス可能な脆弱性の対応 (CVE-2012-4464,
  CVE-2012-4466)][1]
* [不当な NUL 文字挿入によって意図しないファイルが生成されうる脆弱性の対応][2]
* その他多数のバグ修正

詳しくは、対応する[チケット][3]および [ChangeLog][4] を確認して下さい。

## ダウンロード

以下の URL から本リリースをダウンロードできます。

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.bz2&gt;][5]
  * SIZE: 9961862 bytes
  * MD5: e76848a86606a4fd5dcf14fc4b4e755e
  * SHA256: 5281656c7a0ae48b64f28d845a96b4dfa16ba1357a911265752787585fb5ea64

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.gz&gt;][6]
  * SIZE: 12459652 bytes
  * MD5: e2469b55c2a3d0d643097d47fe4984bb
  * SHA256: e94367108751fd6bce79401d947baa66096c757fd3a0856350a2abd05d26d89d

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.zip&gt;][7]
  * SIZE: 13906047 bytes
  * MD5: 8b3c2d6bd306804ed198260e4f5b6418
  * SHA256: 9d59c5885e66e6fbfbc49a2b6b80429141f8bdd2827747ec9a4eee7c2252b522

## おしらせ

今回のリリースより、Ruby 1.9.3 のメンテナンスが、成瀬さんから株式会社TOUAに引き継がれます。
この引継ぎは、一般財団法人Rubyアソシエーションの「Ruby安定版保守委託事業」に基づくものです。
詳細はRubyアソシエーションからの[アナウンス][8]をご確認下さい。
なお、実際の保守作業は、従来からのコミッタである、株式会社TOUAのなかむら(う)が主担当として行います。
今回のリリースは、成瀬さんおよびなかむらの両名で行いました。



[1]: {{ site.url }}/ja/news/2012/10/12/cve-2012-4464-cve-2012-4466/
[2]: {{ site.url }}/ja/news/2012/10/12/poisoned-NUL-byte-vulnerability/
[3]: https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5
[4]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_3_286
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p286.zip
[8]: http://www.ruby.or.jp/ja/news/20121011.html
