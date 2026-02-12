---
layout: news_post
title: "Ruby 2.0.0-rc2 リリース"
author: "Yusuke Endoh"
date: 2013-02-08 14:14:20 +0000
lang: ja
---

Ruby 2.0.0-rc2 がリリースされました。Ruby 2.0.0 の最後の Release Candidate 版の予定です。

どうぞお試しください。もし何か問題があればお知らせ下さい。

## 所在

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2&gt;][1]

      SIZE:   10822239 bytes
      MD5:    e92420131bd7994513e0bf09a3e2a19b
      SHA256: d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz&gt;][2]

      SIZE:   13616756 bytes
      MD5:    9d5e6f26db7c8c3ddefc81fdb19bd41a
      SHA256: 87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip&gt;][3]

      SIZE:   15118480 bytes
      MD5:    1a2d33f1c50e32ca1532f8dea4790d53
      SHA256: c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

## 2.0.0 の新機能

* キーワード引数
* Enumerable#lazy
* Module#prepend
* \#to\_h: Hash への変換メソッド
* %i: シンボルの配列のリテラル
* 正規表現エンジンを Onigmo に変更（鬼雲: 鬼車の派生版）
* Enumerator#size が導入された
* DTrace サポート
* TracePoint
* require 速度の向上(特に Windows において)
* NativeClient サポート
* ドキュメントの改善
* 非同期割り込み制御機能の改良
* 起動時のスタックサイズ設定機能
* Refinements \[実験的機能\]

その他改善多数。詳しくは [NEWS][4] をご覧あれ。 サードパーティによる紹介記事があります。

* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][5]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][6]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][7]
* [&lt;URL:http://timelessrepo.com/refinements-in-ruby&gt;][8]
  (Refinements)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][9]
  (in Japanese)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][10]
  (Enumerator::Lazy, in Japanese)

(他にも記事を書いて頂けると、今後のリリースアナウンスで引用や参照をさせて頂くかも)

## 注意点

### 非互換について

特筆すべき非互換を 3 つ把握しています。

* デフォルトのスクリプトエンコーディングが UTF-8 になりました [\[#6679\]][11]
  。これは既存のプログラムに影響を与えることが報告されています。例えば、ベンチマークプログラムが非常に遅くなるなど
  [\[ruby-dev:46547\]][12] 。公式リリースまでに仕様が変化するかもしれません。
* iconv が削除されました。元々 M17N が導入された 1.9 の時点で非推奨のものでした。String#encode
  などを使って書き換えてください。
* ABI 互換性がなくなっています [\[ruby-core:48984\]][13]
  。通常のユーザは、拡張ライブラリを再インストールするだけでよいはすです。「1.9 の .so, .bundle
  ファイルをコピーするな」とだけ気をつけてください。

他にも比較的小さな非互換があります [\[ruby-core:49119\]][14] 。 さらに非互換に気づいたらぜひ報告してください。

ご参考: 以下にアップグレードガイドを作成中ですが、すでに一部内容が古いです。

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft&gt;][15]

### refinements の扱い

2\.0.0 では refinement を「実験的機能」として提供します。仕様の詳細について合意に至らなかったためです。 挙動が Ruby
の将来のバージョンで変化する可能性があることに注意してください。

## special thanks

preview と rc1 を試してくれた皆さんに感謝します。 相変わらずたくさんのバグを直してくれているコントリビュータの皆さんに感謝します。
このリリースを支えてくれた皆さんに本当に感謝します。



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
[4]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v2_0_0_rc2
[5]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[6]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[7]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[8]: http://timelessrepo.com/refinements-in-ruby
[9]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[10]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[11]: https://bugs.ruby-lang.org/issues/6679
[12]: https://blade.ruby-lang.org/ruby-dev/46547
[13]: https://blade.ruby-lang.org/ruby-core/48984
[14]: https://blade.ruby-lang.org/ruby-core/49119
[15]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft
