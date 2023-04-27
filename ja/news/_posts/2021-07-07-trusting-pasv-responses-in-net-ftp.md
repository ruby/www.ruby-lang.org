---
layout: news_post
title: "CVE-2021-31810: Net::FTP における信頼性のある FTP PASV 応答の脆弱性について"
author: "shugo"
translator: "jinroq"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: ja
---

信頼性のある FTP PASV 応答の脆弱性が Net::FTP で発見されました。
この脆弱性は [CVE-2021-31810](https://www.cve.org/CVERecord?id=CVE-2021-31810) として登録されています。
Ruby をアップグレードすることを強く推奨します。

net-ftp は Ruby 3.0.1 の デフォルト gem ですが、パッケージ化の問題があるため、Ruby 自体をアップグレードしてください。

## 詳細

悪意のある FTP サーバーが、PASV 応答を利用して Net::FTP を偽装し、特定の IP アドレスとポートに接続し直す可能性があります。
これにより Net::FTP は本来では抽出できない非公開なサービスに関する情報を抽出する可能性があります
（例: 攻撃者はポートスキャンやサービスバナーの抽出を実行できます）。

## 影響を受けるバージョン

* Ruby 2.6 系列: 2.6.7 およびそれ以前のバージョン
* Ruby 2.7 系列: 2.7.3 およびそれ以前のバージョン
* Ruby 3.0 系列: 3.0.1 およびそれ以前のバージョン

## クレジット

この脆弱性情報は、[Alexandr Savca](https://hackerone.com/chinarulezzz) 氏によって報告されました。

## 更新履歴

* 2021-07-07 18:00:00 (JST) 初版
