---
layout: news_post
title: "Ruby 1.9.1-p429リリース"
author: "Yugui"
lang: ja
---

Ruby 1.9.1-p429をリリースしました。これはRuby 1.9.1のパッチレベルリリースです。このリリースにより多くのバグが修正され、特に攻撃者が任意のコードを実行できるセキュリティ脆弱性を修正しました。

### 脆弱性

Windows上でARGF.inplace\_modeに危険な値を代入するとバッファーオーバーフ
ローを起こすセキュリティ脆弱性が1件発見されました。これは攻撃者に任意の コードの実行を許す虞があります。

影響するバージョンは、

* Ruby 1.9.1 p378およびそれ以前のすべてのリリース
* Ruby 1.9.2 preview 3およびそれ以前のすべてのリリース
* Ruby 1.9開発版 (1.9.3dev).

Ruby 1.9を1.9.1-p429または1.9.2-rc1に更新することを推奨します。

この脆弱性はRuby 1.8系統に直接は影響しません。

#### 謝辞

この脆弱性は樽家昌也さんにより発見・報告されました。

### 所在

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.bz2&gt;][1]
  SIZE
  : 7300923 bytes

  MD5
  : 09df32ae51b6337f7a2e3b1909b26213

  SHA256
  : e0b9471d77354628a8041068f45734eb2d99f5b5df08fe5a76d785d989a47bfb

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.gz&gt;][2]
  SIZE
  : 9078126 bytes

  MD5
  : 0f6d7630f26042e00bc59875755cf879

  SHA256
  : fdd97f52873b70f378ac73c76a1b2778e210582ce5fe1e1c241c37bd906b43b2

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.zip&gt;][3]
  SIZE
  : 10347659 bytes

  MD5
  : fcd031414e5e4534f97aa195bb586d6c

  SHA256
  : c9fe2364b477ad004030f4feeb89aeaa2a01675ff95db1bed31a932806f85680



[1]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p429.zip
