---
layout: news_post
title: "Datadogがruby-lang.orgに対してOSSコミュニティサポートを提供"
author: "hsbt"
translator: "01hayakawa"
date: 2024-05-30 00:00:00 +0000
lang: ja
---

Rubyの公式サイトであるruby-lang.orgが、[Datadog OSSコミュニティサポート](https://opensource.datadoghq.com/projects/oss-program/)によりモニタリングにDatadogを採用しました。

これにより、サイトのパフォーマンスと可用性をリアルタイムで効果的に監視することができます。Datadogを使用する主な利点は以下の通りです。

## CDNの可視性

Fastlyが提供するcache.ruby-lang.orgは、Rubyエコシステムの最も重要なインフラです。DatadogはContent Delivery Network (CDN)のパフォーマンスを監視することができます。キャッシュカバレッジ、エラー率を追跡し、ユーザ体験を向上させます。

## 統一されたデータビジュアライゼーション

ruby-lang.orgにはさまざまなWebサービスが存在します。Datadogを使用することで、ログ分析データをメトリクスやアプリケーションパフォーマンス監視（APM）データと同じダッシュボードで視覚化することができます。

## JITトレースの可視化

Datadogのトレース機能を活用することで、リクエストがWebサーバーやデータベースを通過する際のトレースをキャプチャできます。
これはボトルネックや問題のあるリクエストを特定するのに役立ちます。

主要なメトリクスの[公開ダッシュボード](https://p.ap1.datadoghq.com/sb/1271b83e-af90-11ee-9072-da7ad0900009-01633a8fa8c0b0c0051f1889afdf55dc)を公開しました。
ダッシュボードは、モニタリングの改善を続けながら随時更新していきます。特に、YJITのパフォーマンスモニタリングに注力する予定です。

今回のDatadogの採用が、Rubyコミュニティのサイトパフォーマンスの向上に寄与することを期待しています。引き続きruby-lang.orgをご利用いただき、より快適なユーザ体験をお楽しみください。
