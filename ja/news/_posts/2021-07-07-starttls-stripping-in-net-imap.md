---
layout: news_post
title: "CVE-2021-32066: Net::IMAP 内の StartTLS ストリッピングの脆弱性について"
author: "shugo"
translator: "jinroq"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: ja
---

Net::IMAP 内の StartTLS ストリッピングに脆弱性が発見されました。
この脆弱性は [CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066) として登録されています。
Ruby をアップグレードすることを強く推奨します。

net-imap は Ruby 3.0.1 の デフォルト gem ですが、パッケージ化に問題があるため、Ruby 自体をアップグレードしてください。

## 詳細

Net::IMAP は、StartTLS が不明な応答で失敗した場合に例外を発生させません。これにより、中間者攻撃者がクライアントとレジストリ間のネットワーク位置を利用して StartTLS コマンドをブロックし、結果として、中間者攻撃者が TLS 保護をバイパスできる可能性があります。
これは「StartTLS ストリッピング攻撃」とも呼ばれています。

## 影響を受けるバージョン

* Ruby 2.6 系列: 2.6.7 およびそれ以前のバージョン
* Ruby 2.7 系列: 2.7.3 およびそれ以前のバージョン
* Ruby 3.0 系列: 3.0.1 およびそれ以前のバージョン

## クレジット

この脆弱性情報は、[Alexandr Savca](https://hackerone.com/sighook) 氏によって報告されました。

## 更新履歴

* 2021-07-07 18:00:00 (JST) 初版
