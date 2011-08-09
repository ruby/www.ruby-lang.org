---
layout: page
title: "セキュリティ"
lang: ja
---

Rubyのセキュリティ問題に関連する情報を紹介します。

## 

Rubyのセキュリティに関する問題の報告は、[security@ruby-lang.org](mailto:security@ruby-lang.org)
([PGP公開鍵](/security.asc)) までお願いします。

security@ruby-lang.orgは非公開MLで、報告された問題が確認され、対策が講じられた後に、問題が一般に公開されます。

## 

新しいものから順に並べています。

* [Exceptionのメソッドの$SAFE機構をバイパス可能な脆弱性について][1] 2011年2月18日公開
* [FileUtilsのsymlink race attack脆弱性について][2] 2011年2月18日公開
* [WEBrickのXSS脆弱性 (CVE-2010-0541)][3] 2010年8月16日公開
* [ARGF.inplace\_mode=にバッファーオーバーフロー][4] 2010年7月2日公開
* [WEBrickにエスケープシーケンス挿入の脆弱性](/ja/news/2010/01/10/webrick-escape-sequence-injection/)
  2010年1月10日公開
* [Stringのヒープオーバーフロー](/ja/news/2009/12/07/string/) 2009年12月7日公開
* [BigDecimalのDoS脆弱性](/ja/news/2009/06/10/dos-vulnerability-in-bigdecimal/)
  2009年6月10日公開
* [DLで汚染チェックが行われない脆弱性](/ja/news/2009/05/12/ruby-1-9-1-p129-released/)
  2009年5月12日公開
* [REXMLのDoS脆弱性](/ja/news/2008/08/23/dos-vulnerability-in-rexml/)
  2008年8月23日公開
* [Rubyに複数の脆弱性][5] 2008年8月8日公開
* [任意のコードが実行される脆弱性について](/ja/news/2008/06/20/arbitrary-code-execution-vulnerabilities)
  2008年6月20日公開
* [WEBrickの非公開ファイルにアクセスされる脆弱性について](/ja/news/2008/03/03/webrick-file-access-vulnerability/)
  2008年3月3日公開
* [net/httpsライブラリにおける「中間者によるなりすまし攻撃」に対する脆弱性について](/ja/news/2007/10/04/isecpartners-com-2007-006-rubyssl/)
  2007年10月4日公開
* [もう一つのCGIライブラリのDoS脆弱性について](/ja/news/2006/12/04/another-dos-vulnerability-in-cgi-library/)
  2006年12月4日公開
* [CGIライブラリのDoS脆弱性について](/ja/news/2006/11/02/CVE-2006-5467/) 2006年11月2日公開
* [alias機能の問題でセーフレベル4がサンドボックスとして機能しない脆弱性について](/ja/news/2006/09/13/JVN83768862/)
  2006年9月13日公開
* [特定メソッドの問題でセーフレベル 4
  がサンドボックスとして機能しない脆弱性について](/ja/news/2006/09/13/JVN13947696/)
  2006年9月13日公開
* [XMLRPC DoS脆弱性について](/ja/news/2005/11/22/20051122) 2005年11月21日公開
* [WEBrick DoS脆弱性について](/ja/news/2005/11/21/20051121) 2005年11月21日公開
* [セーフレベルの設定が回避可能となる脆弱性について](/ja/news/2005/09/22/20050922) 2005年9月22日公開
* [XMLRPC.iPIMethodsの脆弱性について](/ja/news/2005/07/01/20050701) 2005年7月1日公開

Posted by usa on 02 Jun 2006
{: .post-info}



[1]: http://www.ruby-lang.org/ja/news/2011/02/18/exception-methods-can-bypass-safe/ 
[2]: http://www.ruby-lang.org/ja/news/2011/02/18/fileutils-is-vulnerable-to-symlink-race-attacks/ 
[3]: http://www.ruby-lang.org/ja/news/2010/08/16/xss-in-webrick-cve-2010-0541/ 
[4]: http://www.ruby-lang.org/ja/news/2010/07/02/ruby-1-9-1-p429-is-released/ 
[5]: http://www.ruby-lang.org/ja/news/2008/08/08/multiple-vulnerabilities-in-ruby/ 
