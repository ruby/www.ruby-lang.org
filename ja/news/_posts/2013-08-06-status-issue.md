---
layout: news_post
title:  "ruby-lang.org のサーバーの障害報告"
author: "hsbt"
translator:
date:   2013-08-06 04:00:00 +0000
lang:   ja
---

ruby-lang.org を稼働させているサーバーに障害が発生したため、ruby-lang.org が提供しているサービスのいくつかが停止しています。影響範囲は以下の通りです。

 * ruby-lang.org が提供していたメーリングリスト全てが停止しています。
 * ftp.ruby-lang.org が配布していたパッケージが取得不能となっています。
 * 使用している DNS のキャッシュ状況によっては www.ruby-lang.org の閲覧が不可能になっています。

現在、バックアップからファイルを取得し、サービスを復旧しています。

## 更新情報(2013-08-06 18:33 JST)

今回の障害はハードウェアの障害によるものです。現在、以下のサービスが復旧しています。

 * 全てのメーリングリスト、ただし配信に関する問題がいくつか残っているので、引き続き復旧中です。
 * ftp.ruby-lang.org に存在していたパッケージの http と ftp 経由の配布

もし、何か問題を見つけた場合は https://github.com/ruby/www.ruby-lang.org/issues まで報告して頂けると幸いです。

## 更新情報(2013-08-06 22:18 JST)

いくつかの古い Ruby パッケージの MD5 が公表しているものと不一致の状態にあるということがわかったため、 ftp.ruby-lang.org を停止しました。

現在復旧作業中です。詳細情報は以下の issue を参照してください。
https://github.com/ruby/www.ruby-lang.org/issues/259

## 更新情報(2013-08-07 14:08 JST)

バックアップから復旧した以下のファイルが壊れていることを確認したため http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/ より該当ファイルを取得し直しました。

<pre>
ruby-1.9.3-p426.tar.bz2
ruby-1.9.3-p426.tar.gz
ruby-1.9.3-p426.zip
ruby-1.9.3-p429.tar.bz2
ruby-1.9.3-p429.tar.gz
ruby-1.9.3-p429.zip
ruby-2.0.0-p0.tar.bz2
ruby-2.0.0-p0.tar.gz
ruby-2.0.0-p0.zip
ruby-2.0.0-p195.tar.bz2
ruby-2.0.0-p195.tar.gz
ruby-2.0.0-p195.zip
</pre>

開発チームでこれらのファイルの MD5 が公表されているものと一致していることを確認済みです。現在、ftp.ruby-lang.org の http と ftp のサービスは再開しています。

## 更新情報(2013-08-09 19:30 JST)

2013-08-06 に発生したサーバーの障害によるサービスの停止は以下の通り復旧しています。

  * ruby-lang.org が提供していたメーリングリストは FML から Mailman へとソフトウェアを変更し再開しました。
    * 詳細は http://lists.ruby-lang.org をご参照ください。
  * ftp.ruby-lang.org からのパッケージ配布を http と ftp 共に再開しました。
  * 毎日のスナップショットパッケージの作成・配布を再開しました。

もし、何か問題を見つけた場合は https://github.com/ruby/www.ruby-lang.org/issues まで報告して頂けると幸いです。
