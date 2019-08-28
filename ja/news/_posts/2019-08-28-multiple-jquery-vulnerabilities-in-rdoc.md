---
layout: news_post
title: "RDoc における jQuery の脆弱性について"
author: "aycabta"
translator:
date: 2019-08-28 09:00:00 +0000
tags: security
lang: ja
---

Ruby の標準添付ライブラリである RDoc に、jQuery に関するクロスサイトスクリプティング（XSS）の脆弱性が発見されました。
全ての ruby ユーザーは、この問題に対するセキュリティフィックスが含まれた RDoc をバンドルするバージョンに更新することが推奨されます。
また、現在、RDoc が生成した HTML ドキュメントを公開している場合は、セキュリティフィックスが含まれた RDoc を使用して HTML ドキュメントを再生成する必要があります。

## 詳細

以下の脆弱性が報告されています。

* [CVE-2012-6708](https://nvd.nist.gov/vuln/detail/CVE-2012-6708)
* [CVE-2015-9251](https://nvd.nist.gov/vuln/detail/CVE-2015-9251)

この問題の影響を受けるバージョンの Ruby のユーザーは、最新の Ruby に更新するか、下記の回避策を取ってください。

また、現在、RDoc が生成した HTML ドキュメントには、XSS 脆弱性が存在している可能性があります。
そのため、これらの HTML ドキュメントを公開している場合は、その HTML ドキュメント自体を再生する必要があります。

## 影響を受けるバージョン

* Ruby 2.3 系列の全てのリリース
* Ruby 2.4.6 以前の全ての Ruby 2.4 系列
* Ruby 2.5.5 以前の全ての Ruby 2.5 系列
* Ruby 2.6.3 以前の全ての Ruby 2.6 系列
* commit f308ab2131ee675000926540cbb8c13c91dc3be5 より前の開発版

## 回避策

原則としては、Ruby 自体を最新のリリースに更新してください。それができない場合は、以下のコマンドを実行することにより、RDoc を最新版 (6.1.2 以降) に更新することによって、各脆弱性が修正されます。

```
gem install rdoc -f
```

その際に以下のようなメッセージが出るので、 `Overwrite the executable? [yN]` と出る度に随時 `y` を入力し Enter で確定することで更新を続行してください。

```
Updating installed gems
Updating rdoc
Fetching: rdoc-6.1.1.gem (100%)
rdoc's executable "rdoc" conflicts with /home/aycabta/.rbenv/versions/2.5.3/bin/rdoc
Overwrite the executable? [yN]  y
rdoc's executable "ri" conflicts with /home/aycabta/.rbenv/versions/2.5.3/bin/ri
Overwrite the executable? [yN]  y
Successfully installed rdoc-6.1.1
Parsing documentation for rdoc-6.1.1
Installing ri documentation for rdoc-6.1.1
Installing darkfish documentation for rdoc-6.1.1
Done installing documentation for rdoc after 6 seconds
Parsing documentation for rdoc-6.1.1
Done installing documentation for rdoc after 3 seconds
Gems updated: rdoc
```

開発版については、HEAD に更新してください。

なお、RDoc は静的ドキュメント生成ツールです。
したがって、RDoc 自体を修正しても、既に生成済みの HTML ドキュメントの脆弱性は解消されません。
これらの HTML ドキュメントを公開している場合は、以上いずれかの対策を行った上で、該当の HTML ドキュメントを再生成してください。

## クレジット

この脆弱性情報は、[Chris Seaton](https://hackerone.com/chrisseaton) 氏によって報告されました。

## 更新履歴

* 2019-08-28 09:00:00 (JST) 初版
