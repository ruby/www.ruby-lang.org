---
layout: news_post
title: "RubyGems の複数の脆弱性について"
author: "usa"
translator:
date: 2017-08-29 12:00:00 +0000
tags: security
lang: ja
---

Ruby の標準添付ライブラリである RubyGems に、複数の脆弱性が発見されました。
RubyGems の公式ブログにて[報告されています](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)。

## 詳細

以下の脆弱性が報告されています。

* a DNS request hijacking vulnerability. (CVE-2017-0902)
* an ANSI escape sequence vulnerability. (CVE-2017-0899)
* a DoS vulnerability in the query command. (CVE-2017-0900)
* a vulnerability in the gem installer that allowed a malicious gem to overwrite arbitrary files. (CVE-2017-0901)

この問題の影響を受けるバージョンの Ruby のユーザーは、速やかに問題の修正されたバージョンに更新するか、または下記の回避策を取ってください。

## 影響を受けるバージョン

* Ruby 2.2.7 以前の全ての Ruby 2.2 系列
* Ruby 2.3.4 以前の全ての Ruby 2.3 系列
* Ruby 2.4.1 以前の全ての Ruby 2.4 系列
* revision 59672 より前の開発版

## 回避策

Ruby 自体を更新できない場合は、以下のコマンドを実行することにより、RubyGems を最新版(2.6.13 以降)に更新することによって、各脆弱性が修正されます。

```
gem update --system
```

もし何らかの事情で RubyGems 全体を更新できない場合は、脆弱性対応のみを行うパッチが公開されています。
各バージョン用に用意されていますので、以下より入手・適用してください。

* [Ruby 2.2.7 用](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [Ruby 2.3.4 用](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* Ruby 2.4.1 用: 両方のパッチを順次適用してください。
  1. [RubyGems 2.6.11 から 2.6.12 へのパッチ](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 から 2.6.13 へのパッチ](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

開発版については、最新のリビジョンに更新してください。

## クレジット

この脆弱性情報は、[RubyGems 公式ブログ](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)に基づいています。

## 更新履歴

* 2017-08-29 21:00:00 (JST) 初版
* 2017-08-31 11:00:00 (JST) CVE 番号を追加
* 2017-09-14 21:00:00 (JST) Ruby 自体の更新でも対応可能である旨を追記
