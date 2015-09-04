---
layout: news_post
title: "任意のコードが実行される脆弱性について"
author: "Shugo Maeda"
lang: ja
---

信頼できない入力がRubyプログラムの入力として与えられた場合に、DoS攻撃を受け たり、任意のコードが実行される脆弱性が発見されました。

## 影響

攻撃者に以下の脆弱性を利用されることにより、DoS攻撃を受けたり、任意のコード が実行される危険性があります。

* [CVE-2008-2662][1]
* [CVE-2008-2663][2]
* [CVE-2008-2725][3]
* [CVE-2008-2726][4]
* [CVE-2008-2664][5]

## 脆弱性の存在するバージョン

1.8系
: * 1\.8.4以前の全てのバージョン
  * 1\.8.5-p230以前の全てのバージョン
  * 1\.8.6-p229以前の全てのバージョン
  * 1\.8.7-p21以前の全てのバージョン

1.9系
: * 1\.9.0-1以前の全てのバージョン

## 各バージョンでの対応方法

各バージョンでの対応方法を以下に記載します。

1.8系
: 1\.8.5-p231または1.8.6-p230・1.8.7-p22に更新してください。

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz&gt;][6]
    (md5sum: e900cf225d55414bffe878f00a85807c)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz&gt;][7]
    (md5sum: 5e8247e39be2dc3c1a755579c340857f)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz&gt;][8]
    (md5sum: fc3ede83a98f48d8cb6de2145f680ef2)

1.9系
: 1\.9.0-2に更新してください。

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz&gt;][9]
    (md5sum: 2a848b81ed1d6393b88eec8aa6173b75)

これらのバージョンでは、[CVE-2008-1891][10]のWEBrickの脆弱性も同時に修正しています。

Rubyのパッケージを配布している各ベンダから、この脆弱性を修正 した版のパッケージが提供されている場合もあります。詳細につい
ては各ベンダにお問い合わせください。

## クレジット

この脆弱性はApple Product SecurityのDrew Yao氏によりRuby Security Teamに報告されました。

## 変更履歴

* 2008-06-21 00:32 +09:00 誤ったCVE ID(CVE-2008-2727・CVE-2008-2728)を削除しました。



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2662
[2]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2663
[3]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2725
[4]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2726
[5]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2664
[6]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz
[10]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1891
