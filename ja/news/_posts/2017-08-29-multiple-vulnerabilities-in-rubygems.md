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

* a DNS request hijacking vulnerability
* an ANSI escape sequence vulnerability
* a DOS vulernerability in the query command
* a vulnerability in the gem installer that allowed a malicious gem to overwrite arbitrary files

Ruby ユーザには、以下に示すいずれかの対策を速やかに行うことを強く推奨します。

## 影響を受けるバージョン

* Ruby 2.2.7 以前の全ての Ruby 2.2 系列
* Ruby 2.3.4 以前の全ての Ruby 2.3 系列
* Ruby 2.4.1 以前の全ての Ruby 2.4 系列
* revision 59672 より前の開発版

## 回避策

現時点では、本件に対応した Ruby はリリースされていませんが、以下のコマンドを実行することにより、RubyGems を最新版(2.6.13 以降)に更新することによって、各脆弱性が修正されます。

```
gem update --system
```

もし何らかの事情で RubyGems 全体を更新できない場合は、脆弱性対応のみを行うパッチが公開されています。
各バージョン用に用意されていますので、以下より入手・適用してください。
なお、Ruby 2.4.1 用については、両方のパッチを順次適用してください。

* [Ruby 2.2.7 用](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [Ruby 2.3.4 用](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* [Ruby 2.4.1 用(RubyGems 2.6.11 から 2.6.12 へのパッチ)](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
* [Ruby 2.4.1 用(RubyGems 2.6.12 から 2.6.13 へのパッチ)](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

## クレジット

この脆弱性情報は、[RubyGems 公式ブログ](http://blog.rubygems.org/2017/08/27/2.6.13-released.html)に基づいています。

## 更新履歴

* 2017-08-29 21:00:00 (JST) 初版
