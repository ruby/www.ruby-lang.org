---
layout: page
title: "Rubyコア開発"
lang: ja
---

ここでは、Ruby自体の開発を追いかけるための情報源について述べます。
{: .summary}

## Wiki

Rubyの開発に関連する文書は現在主に[GitHubのWiki][1]に集められています。

## 質疑応答

Rubyの開発についての議論は、主に、メーリングリストruby-dev(日本語)およびruby-core(英語)で行われています。
詳しくは[メーリングリスト](/ja/community/mailing-lists/)のページを参照してください。

## 問題追跡システム

Rubyの不具合や機能追加の要望などは[Redmine(問題追跡システム)][2]で管理されています。

また、[GitHubのWiki][1]では、Rubyの開発を追いかけるにあたって役に立つ情報が集積されています。 そちらも参照してください。

## ソースコード

開発中のソースコードを取得できます。

また、毎日、日本時間の午後10時頃に、開発版系列(現在はRuby
{{ site.data.downloads.nightly_snapshot.version }})および安定版系列(現在はRuby
{{ site.data.downloads.stable_snapshots[0].version }})のソースコードのスナップショットを作成しています。
それぞれ、以下のリンクからダウンロードできます。

* [開発版スナップショット][3]
* [安定版スナップショット][4]

## 開発への参加

Rubyの開発に参加したいと思ったならば、ぜひ上記の開発メーリングリストを購読して、開発の議論に加わってください。
バグの報告、仕様の改善案、機能の追加案、パッチの投稿などはいつでも受け付けています(実際に受け入れられるかどうかは内容によりますが...)。

また、比較的マイナーなプラットフォームでの動作報告、修正、継続的なメンテナンスの提供なども募集しています。

Rubyの開発に興味を持たれたならば、まずは開発メーリングリストにその旨を投稿して下さい。

Posted by usa on 13 Aug 2008
{: .post-info}



[1]: https://github.com/ruby/ruby/wiki
[2]: https://bugs.ruby-lang.org/
[3]: {{ site.data.downloads.nightly_snapshot.url.gz }}
[4]: {{ site.data.downloads.stable_snapshots[0].url.gz }}
