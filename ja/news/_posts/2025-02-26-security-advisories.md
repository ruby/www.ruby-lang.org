---
layout: news_post
title: "セキュリティアドバイザリ: CVE-2025-27219, CVE-2025-27220 および CVE-2025-27221"
author: "hsbt"
translator: "teeta32"
date: 2025-02-26 07:00:00 +0000
tags: security
lang: ja
---

CVE-2025-27219, CVE-2025-27220 および CVE-2025-27221 のセキュリティアドバイザリが公開されました。詳細は以下をお読みください。

## CVE-2025-27219: `CGI::Cookie.parse` におけるDOS脆弱性

cgi gem に DoS 脆弱性が発見されました。本脆弱性に CVE ID[CVE-2025-27219](https://www.cve.org/CVERecord?id=CVE-2025-27219) が割り当てられています。cgi gem のアップグレードを推奨します。

### 詳細

`CGI::Cookie.parse` に悪意を持って作られたクッキー文字列が与えられると線形を超える時間がかかる場合があります。

cgi gem をバージョン 0.3.5.1, 0.3.7, または 0.4.2 以降にアップデートしてください。

### 影響を受けるバージョン

* cgi gem 0.3.5 以前と 0.3.6, 0.4.0 および 0.4.1

### クレジット

本脆弱性は [lio346](https://hackerone.com/lio346) 氏により報告され、[mame](https://github.com/mame) 氏により修正されました。

## CVE-2025-27220: `CGI::Util#escapeElement` におけるReDoS脆弱性

cgi gem にReDoS脆弱性が発見されました。本脆弱性に CVE ID [CVE-2025-27220](https://www.cve.org/CVERecord?id=CVE-2025-27220) が割り当てられています。cgi gem のアップグレードを推奨します。

### 詳細

`CGI::Util#escapeElement` で使われる正規表現が ReDoS に対して脆弱です。細工された入力によって CPU が高負荷になる可能性があります。

本脆弱性は Ruby 3.1 と 3.2 のみに影響します。Ruby 3.1 または 3.2 を利用している場合は、cgi gem をバージョン 0.3.5.1, 0.3.7, または 0.4.2 以降にアップデートしてください。

### 影響を受けるバージョン

* cgi gem 0.3.5 以前と 0.3.6, 0.4.0 および 0.4.1

### クレジット

本脆弱性は [svalkanov](https://hackerone.com/svalkanov) 氏により報告され、[nobu](https://github.com/nobu) 氏により修正されました。

## CVE-2025-27221: `URI#join`, `URI#merge` と `URI#+`. におけるユーザー情報の漏洩

uri gem に ユーザー情報の漏洩の可能性が発見されました。本脆弱性に CVE ID [CVE-2025-27221](https://www.cve.org/CVERecord?id=CVE-2025-27221) が割り当てられています。uri gem のアップグレードを推奨します。

### 詳細

`URI#join`, `URI#merge` と `URI#+` メソッドはホストを変更した後も `user:password` のようなユーザー情報を保持します。これらのメソッドで作成した秘密のユーザー情報を含む URL から悪意のあるホストへの URL を生成し、この生成した URL を使って悪意のあるホストにアクセスすると意図しないユーザー情報の漏洩が起きる可能性があります。

uri gem をバージョン 0.11.3, 0.12.4, 0.13.2 または 1.0.3 以降にアップデートしてください。

### 影響を受けるバージョン

* uri gem 0.11.3 よりも前, 0.12.0 から 0.12.3, 0.13.0, 0.13.1 および 1.0.0 から 1.0.2

### クレジット

本脆弱性は [Tsubasa Irisawa (lambdasawa)](https://hackerone.com/lambdasawa) により報告されました。
また、[nobu](https://github.com/nobu) 氏により本脆弱性の追加の修正がなされました。

## 更新履歴

* 2025-02-26 16:00:00 (JST) 初版
