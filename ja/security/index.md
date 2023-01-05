---
layout: page
title: "セキュリティ"
lang: ja
---

Ruby のセキュリティ問題に関連する情報を紹介します。
{: .summary}

## セキュリティ問題の報告窓口

Ruby のセキュリティに関する問題の報告は、[HackerOne](https://hackerone.com/ruby) へ issue を登録することによって行えます。
報告の際には、該当ページに記されている取り扱われる問題の範囲について、よく確認してください。
報告された内容については、それが確認され、対策が講じられた後に、一般に公開されます。

また、何らかの理由で HackerOne を使えないあるいは使いたくない場合は、[security@ruby-lang.org](mailto:security@ruby-lang.org) ([PGP 公開鍵](/security.asc)) でも報告を受け付けています。
security@ruby-lang.org は非公開 ML で、報告された問題が確認され、対策が講じられた後に、問題が一般に公開されます。

このメーリングリストのメンバーは Ruby を提供している人々 (Ruby コミッタやその他 Ruby 処理系の作者、ディストリビュータ、PaaS プラットフォーム提供者など) です。
メンバーは必ず個人である必要があり、メーリングリストは許可されておりません。

## 既知のセキュリティ問題

_See the [English page](/en/security/) for a complete and up-to-date
list of security vulnerabilities.
The following list only includes the as yet translated
security announcements, it might be incomplete or outdated._

新しいものから順に並べています。

{% include security_posts.html %}

* [REXML におけるエンティティ展開に伴うサービス不能攻撃について][1] 2013年02月22日公開
* [JSON におけるサービス不能攻撃および安全でないオブジェクトの生成について (CVE-2013-0269)][2]
  2013年02月22日公開
* [RDoc で生成した HTML ドキュメントにおける XSS 脆弱性 (CVE-2013-0256)][3] 2013年02月06日公開
* [ruby 1.9 におけるハッシュ飽和攻撃による DoS 脆弱性 (CVE-2012-5371)][4] 2012年11月10日公開
* [不当な NUL 文字挿入によって意図しないファイルが生成されうる脆弱性の対応][5] 2012年10月12日公開
* [Exception#to\_s 等による $SAFE 機構をバイパス可能な脆弱性の対応 (CVE-2012-4464,
  CVE-2012-4466)][6] 2012年10月12日公開
* [Security Fix for RubyGems: SSL server verification failure for remote
  repository][7] 2012年4月20日公開
* [Security Fix for Ruby OpenSSL module: Allow 0/n splitting as a
  prevention for the TLS BEAST attack][8] 2012年2月16日公開
* [ruby 1.8 におけるハッシュ飽和攻撃による DoS 脆弱性 (CVE-2011-4815)][9] 2011年12月28日公開
* [Exceptionのメソッドの$SAFE機構をバイパス可能な脆弱性について][10] 2011年2月18日公開
* [FileUtilsのsymlink race attack脆弱性について][11] 2011年2月18日公開
* [WEBrickのXSS脆弱性 (CVE-2010-0541)][12] 2010年8月16日公開
* [ARGF.inplace\_mode=にバッファーオーバーフロー][13] 2010年7月2日公開
* [WEBrickにエスケープシーケンス挿入の脆弱性](/ja/news/2010/01/10/webrick-escape-sequence-injection/)
  2010年1月10日公開
* [Stringのヒープオーバーフロー](/ja/news/2009/12/07/string/) 2009年12月7日公開
* [BigDecimalのDoS脆弱性](/ja/news/2009/06/10/dos-vulnerability-in-bigdecimal/)
  2009年6月10日公開
* [DLで汚染チェックが行われない脆弱性](/ja/news/2009/05/12/ruby-1-9-1-p129-released/)
  2009年5月12日公開
* [REXMLのDoS脆弱性](/ja/news/2008/08/23/dos-vulnerability-in-rexml/)
  2008年8月23日公開
* [Rubyに複数の脆弱性][14] 2008年8月8日公開
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



[1]: /ja/news/2013/02/22/rexml-dos-2013-02-22/
[2]: /ja/news/2013/02/22/json-dos-cve-2013-0269/
[3]: /ja/news/2013/02/06/rdoc-xss-cve-2013-0256/
[4]: /ja/news/2012/11/09/ruby19-hashdos-cve-2012-5371/
[5]: /ja/news/2012/10/12/poisoned-NUL-byte-vulnerability/
[6]: /ja/news/2012/10/12/cve-2012-4464-cve-2012-4466/
[7]: /en/news/2012/04/20/ruby-1-9-3-p194-is-released/
[8]: /en/news/2012/02/16/security-fix-for-ruby-openssl-module/
[9]: /en/news/2011/12/28/denial-of-service-attack-was-found-for-rubys-hash-algorithm-cve-2011-4815/
[10]: /ja/news/2011/02/18/exception-methods-can-bypass-safe/
[11]: /ja/news/2011/02/18/fileutils-is-vulnerable-to-symlink-race-attacks/
[12]: /ja/news/2010/08/16/xss-in-webrick-cve-2010-0541/
[13]: /ja/news/2010/07/02/ruby-1-9-1-p429-is-released/
[14]: /ja/news/2008/08/08/multiple-vulnerabilities-in-ruby/
