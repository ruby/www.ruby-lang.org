---
layout: news_post
title: "WEBrickにエスケープシーケンス挿入の脆弱性"
author: "Yugui"
lang: ja
---

Ruby添付ライブラリの一部であるWEBrickに脆弱性が発見されました。
WEBrickは攻撃者が悪意のあるエスケープシーケンスをログに挿入することを許してしまうので、ログを閲覧する際に端末エミュレータで危険な制御文字を実行されることがあります。

この問題は既に修正済みです。直ちにすべてのアクティブなブランチのリリースが行われます。
WEBrickプロセスを更新するまでは、WEBrickのログを閲覧しないことをお奨めします。

## 詳細

端末エスケープシーケンスは端末とその内部のプロセスとの間の様々なやりとりに用いられます。
ここで、ネットワーク入力のような信頼されていない情報源からシーケンスが発行されることは想定されていません。そのため外部の攻撃者がエスケープシーケンスをWEBrickのログに挿入しそのログを閲覧したとすると、攻撃者は端末エミュレータを攻撃する目的に利用することができます\[1\]。

WEBrickはそのようなエスケープシーケンスをフィルタできていませんでした。

例:

    % xterm -e ruby -rwebrick -e 'WEBrick::HTTPServer.new(:Port=>8080).start' &
    % wget http://localhost:8080/%1b%5d%32%3b%6f%77%6e%65%64%07%0a

xtermのウィンドウタイトルを見てください。

## 影響するバージョン

* Ruby 1.8.6 patchlevel 383およびそれ以前のすべてのバージョン
* Ruby 1.8.7 patchlevel 248およびそれ以前のすべてのバージョン
* Ruby 1.8の開発版(1.8.8dev)
* Ruby 1.9.1 patchlevel 376およびそれ以前のすべてのバージョン
* Ruby 1.9の開発版 (1.9.2dev)

## 解決法

* 1\.8.6, 1.8.7, および1.9.1のリリースは続報をお待ちください。
  * **更新** 1.8.7 pl. 249がリリースされました。 1.8.7利用者には更新を推奨します。
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz][1]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2][2]
    * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip][3]

  * **Update** 1.9.1 pl. 378がリリースされました。 1.9.1利用者には更新を推奨します。
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz][4]
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2][5]
    * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip][6]

* 開発版については、各ブランチの最新リビジョンに更新してください。

## クレジット

Giovanni \"evilaliv3\" Pellerano, Alessandro \"jekil\" Tanasi, および
Francesco \"ascii\" Ongaroがこの脆弱性を発見しました。



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p249.zip
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p378.zip
