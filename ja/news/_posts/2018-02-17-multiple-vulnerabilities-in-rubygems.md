---
layout: news_post
title: "RubyGems の複数の脆弱性について"
author: "usa"
translator:
date: 2018-02-17 03:00:00 +0000
tags: security
lang: ja
---

Ruby の標準添付ライブラリである RubyGems に、複数の脆弱性が発見されました。
RubyGems の公式ブログにて[報告されています](http://blog.rubygems.org/2018/02/15/2.7.6-released.html)。

## 詳細

以下の脆弱性が報告されています。

* Prevent path traversal when writing to a symlinked basedir outside of the root.
* Fix possible Unsafe Object Deserialization Vulnerability in gem owner.
* Strictly interpret octal fields in tar headers.
* Raise a security error when there are duplicate files in a package.
* Enforce URL validation on spec homepage attribute.
* Mitigate XSS vulnerability in homepage attribute when displayed via gem server.
* Prevent Path Traversal issue during gem installation.

この問題の影響を受けるバージョンの Ruby のユーザーは、最新の Ruby に更新するか、下記の回避策を取ってください。

## 影響を受けるバージョン

* Ruby 2.2.9 以前の全ての Ruby 2.2 系列
* Ruby 2.3.6 以前の全ての Ruby 2.3 系列
* Ruby 2.4.3 以前の全ての Ruby 2.4 系列
* Ruby 2.5.0 以前の全ての Ruby 2.5 系列
* revision 62422 より前の開発版

## 回避策

原則としては、Ruby 自体を最新のリリースに更新してください。
それができない場合は、以下のコマンドを実行することにより、RubyGems を最新版(2.7.6 以降)に更新することによって、各脆弱性が修正されます。

```
gem update --system
```

もし何らかの事情で RubyGems 全体を更新できない場合は、脆弱性対応のみを行うパッチが公開されています。
各バージョン用に用意されていますので、以下より入手・適用してください。

* [Ruby 2.2.9 用](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [Ruby 2.3.6 用](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [Ruby 2.4.3 用](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [Ruby 2.5.0 用](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

開発版については、最新のリビジョンに更新してください。

## クレジット

この脆弱性情報は、[RubyGems 公式ブログ](http://blog.rubygems.org/2018/02/15/2.7.6-released.html)に基づいています。

## 更新履歴

* 2018-02-17 12:00:00 (JST) 初版
* 2018-03-29 10:00:00 (JST) Ruby の最新リリースについて言及
