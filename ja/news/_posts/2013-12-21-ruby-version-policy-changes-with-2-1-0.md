---
layout: news_post
title: "Ruby 2.1.0 以降のセマンティックバージョニングについて"
author: "zzak"
translator: "makimoto"
date: 2013-12-21 2:00:00 +0000
lang: ja
---
Ruby 2.1.0 以降、[Semantic Versioning](http://semver.org/) ([日本語訳](http://semver.org/lang/ja/))
に寄せたバージョニングに移行することを決定しました。

Ruby に、より明確で適切なバージョニングスキーマを提供するため、われわれは以下のポリシーに段階的に移行します。

## ポリシーの変更

このポリシーは、 ruby-lang.org の管理者である柴田博志 ([@hsbt](https://twitter.com/hsbt)) の提案にもとづくものです。

### バージョンスキーマ

* `MAJOR`: `MINOR` リリースで対応できない互換性のない変更がある場合に増加する。
  * 特別なイベントのために予約される。
* `MINOR`: クリスマスごとに増加する。 API レベルでの非互換がありえる。
* `TEENY`: API 互換性を維持するセキュリティフィックスやバグフィックス。
  * `2.1.11` のように10以上の値になりえる。2、3ヶ月おきにリリースされる。
* `PATCH`: 直前の `MINOR` リリースからのコミット数。 (`MINOR` がリリースされるごとに 0 に戻る)

### ブランチスキーマ

われわれは以下のブランチを管理することにします。

* trunk
* `ruby_{MAJOR}_{MINOR}`

`ruby_{MAJOR}_{MINOR}` ブランチは `TEENY` リリースにわたって管理されます。
それぞれのリリースにはタグを用います。

### API 互換性

以下のことが行われた際は非互換であるとして、 `MINOR` バージョンを増加させるものとします。

* C レベルの API 機能の削除
* 下位互換性のない変更および追加

### ABI 互換性

ABI は `{MAJOR}.{MINOR}.0` のスキーマに従うものとします。

われわれは同一の `MINOR` レベルのリリースにおける ABI 互換性の維持に最大限注力します。
したがって `TEENY` は0に固定されます。

## 参考文献

この提案についてのより詳しい情報は以下のリンクを参照してください。

* [Introducing a semantic versioning scheme and branching policy](https://bugs.ruby-lang.org/issues/8835)
* [受理された提案](https://gist.github.com/hsbt/7719305)
* [受理された提案 (英語訳)](https://gist.github.com/sorah/7803201)

## ありがとう！

この議論に参加してくれたすべての方々に感謝します。
われわれの一つ一つの歩みは Ruby をより安定した効果的なものにしていくでしょう。
