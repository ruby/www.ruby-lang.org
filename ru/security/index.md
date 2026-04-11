---
layout: page
title: "Безопасность"
lang: ru
---

Здесь вы найдёте информацию об уязвимостях Ruby.
{: .summary}

## Сообщение об уязвимостях

Об уязвимостях в языке программирования Ruby следует сообщать через нашу [страницу программы HackerOne](https://hackerone.com/ruby) или по электронной почте security@ruby-lang.org ([открытый PGP-ключ](/security.asc)), которая является закрытым списком рассылки. Пожалуйста, ознакомьтесь с подробностями о рамках нашей программы перед сообщением о проблеме. Любые подтверждённые проблемы будут опубликованы после исправления.

Если вы обнаружили проблему, затрагивающую один из наших веб-сайтов, пожалуйста, сообщите об этом [через GitHub](https://github.com/ruby/www.ruby-lang.org/issues/new).

Если вы нашли проблему, которая затрагивает конкретный гем сообщества Ruby, следуйте [инструкциям на RubyGems.org](http://guides.rubygems.org/security/#reporting-security-vulnerabilities).

## Список рассылки по безопасности

В список рассылки security@ruby-lang.org входят люди, которые предоставляют Ruby (коммиттеры Ruby и авторы других реализаций Ruby, дистрибьюторы, PaaS-платформы).

Участниками должны быть отдельные люди, списки рассылки не допускаются. Если вы представляете одну из этих организаций, пожалуйста, свяжитесь с нами, чтобы присоединиться к списку.

## Известные проблемы

_Смотрите [английскую версию страницы](/en/security/) для получения полного и актуального списка уязвимостей.
Ниже приведен список только переведенных объявлений о безопасности, он может быть неполным или устаревшим._

Последние проблемы:

{% include security_posts.html %}

Другие известные проблемы:

* [Уязвимость DoS через расширение сущностей в геме REXML (XML-бомба,
  CVE-2013-1821)][1]
  опубликовано 22 февраля 2013 г.
* [Уязвимость к отказу в обслуживании (DoS) и небезопасному созданию объектов в JSON
  (CVE-2013-0269)][2]
  опубликовано 22 февраля 2013 г.
* [XSS-эксплойт в документации RDoc, сгенерированной rdoc
  (CVE-2013-0256)][3]
  опубликовано 6 февраля 2013 г.
* [Hash-flooding DoS vulnerability for ruby 1.9 (CVE-2012-5371)][4]
  published at 10 Nov, 2012.
* [Unintentional file creation caused by inserting a illegal NUL
  character (CVE-2012-4522)][5]
  published at 12 Oct, 2012.
* [$SAFE escaping vulnerability about Exception#to_s / NameError#to_s
  (CVE-2012-4464, CVE-2012-4466)][6]
  published at 12 Oct, 2012.
* [Security Fix for RubyGems: SSL server verification failure for remote
  repository][7] published at 20 Apr, 2012.
* [Security Fix for Ruby OpenSSL module: Allow 0/n splitting as a
  prevention for the TLS BEAST attack][8]
  published at 16 Feb, 2012.
* [Denial of service attack was found for Ruby\'s Hash algorithm
  (CVE-2011-4815)][9]
  published at 28 Dec, 2011.
* [Exception methods can bypass $SAFE][10]
  published at 18 Feb, 2011.
* [FileUtils is vulnerable to symlink race attacks][11]
  published at 18 Feb, 2011.
* [XSS in WEBrick (CVE-2010-0541)][12]
  published at 16 Aug, 2010.
* [Buffer over-run in ARGF.inplace_mode=][13]
  published at 2 Jul, 2010.
* [WEBrick has an Escape Sequence Injection vulnerability (CVE-2009-4492)][14]
  published at 10 Jan, 2010.
* [Heap overflow in String (CVE-2009-4124)][15]
  published at 7 Dec, 2009.
* [DoS vulnerability in
  BigDecimal](/en/news/2009/06/09/dos-vulnerability-in-bigdecimal/ "CVE-2009-1904")
  published at 9 Jun, 2009.
* [DoS vulnerability (CVE-2008-3790) in
  REXML](/en/news/2008/08/23/dos-vulnerability-in-rexml/)
  published at 23 Aug, 2008.
* [Multiple vulnerabilities in
  Ruby](/en/news/2008/08/08/multiple-vulnerabilities-in-ruby/)
  published at 8 Aug, 2008.
* [Arbitrary code execution
  vulnerabilities](/en/news/2008/06/20/arbitrary-code-execution-vulnerabilities/)
  published at 20 Jun, 2008.
* [File access vulnerability of
  WEBrick](/en/news/2008/03/03/webrick-file-access-vulnerability/)
  published at 3 Mar, 2008.
* [Net::HTTPS
  Vulnerability](/en/news/2007/10/04/net-https-vulnerability/)
  published at 4 Oct, 2007.
* [Another DoS Vulnerability in CGI
  Library](/en/news/2006/12/04/another-dos-vulnerability-in-cgi-library/)
  published at 4 Dec, 2006.
* [DoS Vulnerability in CGI Library (CVE-2006-5467)](/en/news/2006/11/03/CVE-2006-5467/)
  published at 3 Nov, 2006.
* [Ruby vulnerability in the safe level
  settings](/en/news/2005/10/03/ruby-vulnerability-in-the-safe-level-settings/)
  published at 2 Oct, 2005.

[1]: /ru/news/2013/02/22/rexml-dos-2013-02-22/
[2]: /ru/news/2013/02/22/json-dos-cve-2013-0269/
[3]: /ru/news/2013/02/06/rdoc-xss-cve-2013-0256/
[4]: /en/news/2012/11/09/ruby19-hashdos-cve-2012-5371/
[5]: /en/news/2012/10/12/poisoned-NUL-byte-vulnerability/
[6]: /en/news/2012/10/12/cve-2012-4464-cve-2012-4466/
[7]: /en/news/2012/04/20/ruby-1-9-3-p194-is-released/
[8]: /en/news/2012/02/16/security-fix-for-ruby-openssl-module/
[9]: /en/news/2011/12/28/denial-of-service-attack-was-found-for-rubys-hash-algorithm-cve-2011-4815/
[10]: /en/news/2011/02/18/exception-methods-can-bypass-safe/
[11]: /en/news/2011/02/18/fileutils-is-vulnerable-to-symlink-race-attacks/
[12]: /en/news/2010/08/16/xss-in-webrick-cve-2010-0541/
[13]: /en/news/2010/07/02/ruby-1-9-1-p429-is-released/
[14]: /en/news/2010/01/10/webrick-escape-sequence-injection/
[15]: /en/news/2009/12/07/heap-overflow-in-string/
