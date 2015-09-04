---
layout: news_post
title: "FileUtilsのsymlink race attack脆弱性について"
author: "Shugo Maeda"
lang: ja
---

symlink race condition
脆弱性がFileUtils.remove\_entry\_secureに発見されました。この脆弱性によって、ローカルユーザが任意のファイルやディレクトリを削除可能です。

### 影響のあるバージョン

* Ruby 1.8.6 patchlevel 420 以前のバージョン
* Ruby 1.8.7 patchlevel 330 以前のバージョン
* Ruby 1.8の開発バージョン (1.8.8dev)
* Ruby 1.9.1 patchlevel 430 以前のバージョン
* Ruby 1.9.2 patchlevel 136 以前のバージョン
* Ruby 1.9の開発バージョン (1.9.3dev)

### 解決策

この脆弱性の影響を受けるすべてのユーザは、修正されたバージョンにアップグレードしてください。

ただし、削除対象の上位ディレクトリのうちのどれかが信頼されないユーザに所有されている場合は、symlink race
attackを回避できない点に注意してください。
安全に処理を行うためには、**すべての**親ディレクトリが他の信頼されないユーザによって移動できないことを確認する必要があります。
例えば、親ディレクトリが信頼できないユーザに所有されている場合は問題があります。また、sticky
bitが設定されている場合を除き、親ディレクトリがworld writableである場合も問題です。

### 更新情報

* 本脆弱性の修正を含む1.8.7-334がリリースされました。 1.8.7をお使いの方にはアップグレードを推奨します。
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz][1]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2][2]
  * [https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip][3]

* 本脆弱性の修正を含む1.9.1-p431がリリースされました。 1.9.1をお使いの方にはアップグレードを推奨します。
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz][4]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2][5]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip][6]

* 本脆弱性の修正を含む1.9.2-p180がリリースされました。 1.9.2をお使いの方にはアップグレードを推奨します。
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz][7]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2][8]
  * [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip][9]

* 「影響のあるバージョン」の「Ruby 1.9.1 patchlevel 136 以前のバージョン」を「Ruby 1.9.2
  patchlevel 136 以前のバージョン」に修正しました。



[1]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.gz
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.tar.bz2
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p334.zip
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p431.zip
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.tar.bz2
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p180.zip
