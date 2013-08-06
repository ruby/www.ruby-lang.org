---
layout: news_post
title:  "ruby-lang.org のサーバーの障害報告"
author: "hsbt"
translator:
date:   2013-08-06 04:00:00 UTC
lang:   ja
---

ruby-lang.org を稼働させているサーバーに障害が発生したため、ruby-lang.org が提供しているサービスのいくつかが停止しています。影響範囲は以下の通りです。

 * ruby-lang.org が提供していたメーリングリスト全てが停止しています。
 * ftp.ruby-lang.org が配布していたパッケージが取得不能となっています。
 * 使用している DNS のキャッシュ状況によっては www.ruby-lang.org の閲覧が不可能になっています。

現在、バックアップからファイルを取得し、サービスを復旧しています。

## 更新情報(18:33 JST)

今回の障害はハードウェアの障害によるものです。現在、以下のサービスが復旧しています。

 * 全てのメーリングリスト、ただし配信に関する問題がいくつか残っているので、引き続き復旧中です。
 * ftp.ruby-lang.org に存在していたパッケージの http と ftp 経由の配布

もし、何か問題を見つけた場合は https://github.com/ruby/www.ruby-lang.org/issues まで報告して頂けると幸いです。
