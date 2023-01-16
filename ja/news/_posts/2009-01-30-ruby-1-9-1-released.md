---
layout: news_post
title: "Ruby 1.9.1 リリース!!"
author: "maki"
lang: ja
---

たいへんお待たせしました。Ruby 1.9.1 が、ついにリリースされました
(リリースについてのアナウンス:[\[ruby-list:45836\]][1])。 本リリースは、Ruby
1.9系統の、初めての公式な安定版のリリースとなります。

    Ruby 1.9はRubyの新しい系統です。近代的に、高速に、文法も明確に、多言語化
    され、多くの改善がなされました。Ruby 1.8系統は2003年以来利用され、多くの
    素晴らしい製品を生み出しました。本日、1.9の歴史が始まります。
    　——[ruby-list:45836]より引用

## 変更点

Ruby 1.9.1は1.8から数多くの改良が加えられています。 1.8.7以来の主な変更点は下記URLから参照できます。

* [&lt;URL:https://svn.ruby-lang.org/repos/ruby/tags/v1\_9\_1\_0/NEWS&gt;][2]
  (英語)

また、1.9.1 RC2と比較しても、7つのバグが修正され、より安定度が増しています。

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby-19/issues?query\_id=11&gt;][3]

もしバグや問題を発見なさいましたら、[公式課題追跡システム][4]を通じてお知らせください。

(2009/02/01 追記) なお、Ruby
1.9.1で加えられた改良により、1.8で動いていたプログラムやライブラリが1.9で動かないことがあります。
その場合は、プログラムやライブラリを1.9に対応するよう修正するか、1.8の最新版である1.8.7の利用を検討してください。
1.8系の保守も、しばらくは継続される予定です。

## 入手方法

ソースコードは以下のURLから入手できます。3種類のフォーマットから選んでください。

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p0.tar.bz2&gt;][5]

      SIZE:   7190271 bytes
      MD5:    0278610ec3f895ece688de703d99143e
      SHA256: de7d33aeabdba123404c21230142299ac1de88c944c9f3215b816e824dd33321

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p0.tar.gz&gt;][6]

      SIZE:   9025004 bytes
      MD5:    50e4f381ce68c6de72bace6d75f0135b
      SHA256: a5485951823c8c22ddf6100fc9e10c7bfc85fb5a4483844033cee0fad9e292cc

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p0.zip&gt;][7]

      SIZE:   10273609 bytes
      MD5:    3377d43b041877cda108e243c6b7f436
      SHA256: 00562fce4108e5c6024c4152f943eaa7dcc8cf97d5c449ac102673a0d5c1943b



[1]: https://blade.ruby-lang.org/ruby-list/45836
[2]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_1_0/NEWS
[3]: https://bugs.ruby-lang.org/projects/ruby-19/issues?query_id=11
[4]: https://bugs.ruby-lang.org
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p0.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p0.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p0.zip
