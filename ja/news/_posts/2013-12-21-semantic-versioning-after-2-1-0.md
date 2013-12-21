---
layout: news_post
title: "Ruby 2.1.0以降のバージョンの付け方"
author: "zzak"
translator: "znz"
date: 2013-12-21 2:00:00 UTC
lang: ja
---

Ruby 2.1.0 以降は [セマンティックバージョニング](http://semver.org/)型の
ポリシーに移行することを決定しました。

より明確に定義されていて適切に利用できるバージョン体系を
Ruby に提供するために、段階的に以下のポリシーに移行します。

## ポリシー変更

このポリシーは ruby-lang.org のシステム管理者の
柴田博志 ([@hsbt](https://twitter.com/hsbt))
の提案に基づいています。

### バージョン体系

* `MAJOR`: `MINOR` リリースできないような非互換な変更の時に増加
  * 特別な出来事のために予約
* `MINOR`: API 非互換の可能性があり、クリスマスごとに増加
* `TEENY`: API 互換性を維持したセキュリティやバグ修正
  * 10 以上になる可能性あり (例: `2.1.11`)
  * 2から3ヶ月ごとにリリース予定
* `PATCH`: 直近の `MINOR` リリース以降のコミット数 (`MINOR` リリースで 0 に戻る)

### ブランチ体系

以下のブランチをメンテナンス予定です:

* `trunk`
* `ruby_{MAJOR}_{MINOR}`

`ruby_{MAJOR}_{MINOR}` ブランチは複数の `TENNY` リリースに
渡ってメンテナンスされます。
リリースごとにはタグを打ちます。

### API 互換性

`MINOR` バージョンを増加させる非互換の変更としては
以下のような変更があげられます:

* C レベル API の削除
* 後方互換性のない変更や追加

### ABI 互換性

ABI バージョンは `{MAJOR}.{MINOR}.0` という体系です。

同じ `MINOR` レベルリリースの間は
ABI 互換性を維持するよう最大限の努力をするので、
`TINY` は 0 に固定します。

## 参考

この提案についてもっと調べるには以下のリンクを参照してください:

* [Introducing a semantic versioning scheme and branching policy](http://bugs.ruby-lang.org/issues/8835)
* [承認された提案 (英語)](https://gist.github.com/sorah/7803201)
* [承認された提案 (日本語)](https://gist.github.com/hsbt/7719305)

## 謝辞

個人的にこの議論に貢献してくださったみなさんに感謝したいと思います。
各手順でより安定していて効果的な Ruby に近づけていきます。
