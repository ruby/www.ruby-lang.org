---
layout: news_post
title: "RubyGems の複数の脆弱性について"
author: "hsbt"
translator: "usa"
date: 2019-03-05 00:00:00 +0000
tags: security
lang: ja
---

Ruby の標準添付ライブラリである RubyGems に、複数の脆弱性が発見されました。RubyGems の公式ブログにて[報告されています](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html)。

## 詳細

以下の脆弱性が報告されています。

* CVE-2019-8320: Delete directory using symlink when decompressing tar
* CVE-2019-8321: Escape sequence injection vulnerability in `verbose`
* CVE-2019-8322: Escape sequence injection vulnerability in `gem owner`
* CVE-2019-8323: Escape sequence injection vulnerability in API response handling
* CVE-2019-8324: Installing a malicious gem may lead to arbitrary code execution
* CVE-2019-8325: Escape sequence injection vulnerability in errors

この問題の影響を受けるバージョンの Ruby のユーザーは、最新の Ruby に更新するか、下記の回避策を取ってください。

## 影響を受けるバージョン

* Ruby 2.3 系列の全てのリリース
* Ruby 2.4.5 以前の全ての Ruby 2.4 系列
* Ruby 2.5.3 以前の全ての Ruby 2.5 系列
* Ruby 2.6.1 以前の全ての Ruby 2.6 系列
* revision 67168 より前の開発版

## 回避策

原則としては、Ruby 自体を最新のリリースに更新してください。それができない場合は、以下のコマンドを実行することにより、RubyGems を最新版 (3.0.3 以降) に更新することによって、各脆弱性が修正されます。

```
gem update --system
```

もし何らかの理由で RubyGems 全体をも更新できない場合は、脆弱性対応のみを行うパッチが Ruby の各バージョン向けに用意されていますので、以下より入手・適用してください。

* [Ruby 2.4.5 用](https://bugs.ruby-lang.org/attachments/7669)
* [Ruby 2.5.3 用](https://bugs.ruby-lang.org/attachments/7670)
* [Ruby 2.6.1 用](https://bugs.ruby-lang.org/attachments/7671)

なお、開発版については、最新のリビジョンに更新してください。

## クレジット

この脆弱性情報は、[RubyGems 公式ブログ](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html)に基づいています。

## 更新履歴

* 2019-04-01 15:00:00 (JST) [en](/en/news/2019/03/05/multiple-vulnerabilities-in-rubygems/)第3版より訳出
