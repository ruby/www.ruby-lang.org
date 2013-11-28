---
layout: page
title: "Безопасность"
lang: ru
---

Здесь вы найдете информацию по вопросам безопасности Ruby.

## Как сообщить об уязвимости

Информация об уязвимости должна быть отправлена по почте на
security@ruby-lang.org ([публичный ключ PGP](/security.asc)). Данный
адрес является частной почтовой рассылкой. Сообщенная информация будет
опубликована сразу после того как уязвимость будет исправлена.

## Известные проблемы

Ниже перечислены недавние проблемы.

* [Уязвимость проверки имени хоста в SSL клиенте
  (CVE-2013-4073)](/ru/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)
  опубликовано 27 июня 2013.
* [Уязвимость объектов через DL и Fiddle в Ruby
  (CVE-2013-2065)](/ru/news/2013/05/14/taint-bypass-dl-fiddle-cve-2013-2065/)
  опубликовано 14 мая 2013.
* [Суть DoS уязвимости в REXML (XML bomb,
  CVE-2013-1821)][1] опубликовано 22 февраля 2013.
* [Недоступность сервиса и небезопасное создание объекта в JSON
  (CVE-2013-0269)][2] опубликовано 22 февраля 2013.
* [XSS эксплоит RDoc документации, сгенерированной rdoc
  (CVE-2013-0256)][3] опубликовано 6 февраля 2013.
* [Hash-flooding DoS vulnerability for ruby 1.9 (CVE-2012-5371)][4]
  опубликовано 10 ноября 2012.
* [Unintentional file creation caused by inserting a illegal NUL
  character (CVE-2012-4522)][5] опубликовано 12 октября 2012.
* [$SAFE escaping vulnerability about Exception#to\_s / NameError#to\_s
  (CVE-2012-4464, CVE-2012-4466)][6] опубликовано 12 октября 2012.
* [Security Fix for RubyGems: SSL server verification failure for remote
  repository][7] опубликовано 20 апреля 2012.
* [Security Fix for Ruby OpenSSL module: Allow 0/n splitting as a
  prevention for the TLS BEAST attack][8] published at 16 Feb, 2012.
* [Denial of service attack was found for Ruby\'s Hash algorithm
  (CVE-2011-4815)][9] опубликовано 28 декабря 2011.
* [Exception methods can bypass $SAFE][10] опубликовано 18 февраля 2011.
* [FileUtils is vulnerable to symlink race attacks][11] опубликовано 18
  февраля 2011.
* [XSS in WEBrick (CVE-2010-0541)][12] опубликовано 16 августа 2010.
* [Buffer over-run in ARGF.inplace\_mode=][13] опубликовано 2 июля 2010.
* [WEBrick has an Escape Sequence Injection vulnerability][14] опубликовано 10
  января 2010.
* [Heap overflow in String (CVE-2009-4124)][15] опубликовано 7 декабря 2009.
* [DoS vulnerability in
  BigDecimal](/en/news/2009/06/09/dos-vulnerability-in-bigdecimal/)
  опубликовано 9 июня 2009.
* [DoS vulnerability in
  REXML](/en/news/2008/08/23/dos-vulnerability-in-rexml/) опубликовано
  23 августа 2008.
* [Multiple vulnerabilities in
  Ruby](/en/news/2008/08/08/multiple-vulnerabilities-in-ruby/)
  опубликовано 8 августа 2008.
* [Arbitrary code execution
  vulnerabilities](/en/news/2008/06/20/arbitrary-code-execution-vulnerabilities/)
  опубликовано 20 июня 2008.
* [File access vulnerability of
  WEBrick](/en/news/2008/03/03/webrick-file-access-vulnerability/)
  опубликовано 3 марта 2008.
* [Net::HTTPS
  Vulnerability](/en/news/2007/10/04/net-https-vulnerability/) опубликовано 4
  октября 2007.
* [Another DoS Vulnerability in CGI
  Library](/en/news/2006/12/04/another-dos-vulnerability-in-cgi-library/)
  опубликовано 4 декабря 2006.
* [DoS Vulnerability in CGI Library (CVE-2006-5467)](/en/news/2006/11/03/CVE-2006-5467/)
  опубликовано 3 ноября 2006.
* [Ruby vulnerability in the safe level
  settings](/en/news/2005/10/03/ruby-vulnerability-in-the-safe-level-settings/)
  опубликовано 2 октября 2005.



[1]: /ru/news/2013/02/22/rexml-dos-2013-02-22/
[2]: /ru/news/2013/02/22/json-dos-cve-2013-0269/
[3]: /ru/news/2013/02/06/rdoc-xss-cve-2013-0256/
[4]: /en/news/2012/11/09/ruby19-hashdos-cve-2012-5371/
[5]: /en/news/2012/10/12/poisoned-NUL-byte-vulnerability/
[6]: /en/news/2012/10/12/cve-2012-4464-cve-2012-4466/
[7]: /en/news/2012/04/20/ruby-1-9-3-p194-is-released/
[8]: /en/news/2012/02/16/security-fix-for-ruby-openssl-module-allow-0n-splitting-as-a-prevention-for-the-tls-beast-attack-/
[9]: /en/news/2011/12/28/denial-of-service-attack-was-found-for-rubys-hash-algorithm-cve-2011-4815/
[10]: /en/news/2011/02/18/exception-methods-can-bypass-safe/
[11]: /en/news/2011/02/18/fileutils-is-vulnerable-to-symlink-race-attacks/
[12]: /en/news/2010/08/16/xss-in-webrick-cve-2010-0541/
[13]: /en/news/2010/07/02/ruby-1-9-1-p429-is-released/
[14]: /en/news/2010/01/10/webrick-escape-sequence-injection/
[15]: /en/news/2009/12/07/heap-overflow-in-string/
