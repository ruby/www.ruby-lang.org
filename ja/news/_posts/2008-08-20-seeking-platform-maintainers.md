---
layout: news_post
title: "プラットフォームメンテナ募集のお知らせ"
author: "Shugo Maeda"
lang: ja
---

Rubyコア開発陣はいくつかのプラットフォームにおけるRuby 1.9のメンテナを募集しています。

## 

* cygwin
* Interix
* Itanium platforms (Windows, GNU/Linux, ...)
* PPC platforms
* x64 GNU/Linux
* \*BSD
* BeOS (Haiku)
* OpenVMS
* WinCE
* OS/2
* bcc32
* Classic MacOS

メンテナにお願いしたいのは次の内容です。

* ruby-core@ruby-lang.org と ruby-dev@ruby-lang.org を購読する
* そのプラットフォームが pthread 実装を持っていない場合は thread\_\{win32, pthread}.c を移植する。
* その他のビルドエラーやプラットフォーム固有の問題を解決する
* 日々Rubyのtrunkをビルド・テストする
* 12月20日までに\"make test-all\"に成功するように努力する

もしお願いできますなら、ruby-dev@ruby-lang.org にメールを送って立候補してください。

## 

次のプラットフォームではかつてRubyがメンテナンスされていましたが今はされていません。誰かがメンテナにならない限りRuby
1.9はそのプラットフォームで は動作しなくなるでしょう。

* OpenVMS
* WinCE
* OS/2
* Classic MacOS
* bcc32
* djgpp
* human68k

## 

* [\[ruby-list:45267\]][1] \[ANN\] Ruby 1.9.0-3リリース
* [\[ruby-list:45345\]][2] 「サポートレベル」の定義、1.9.1のサポート予定プラットフォーム、メンテナ募集

Posted by maki on 20 Aug 2008
{: .post-info}



[1]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-list/45267 
[2]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-list/45345 
