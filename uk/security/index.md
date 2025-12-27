---
layout: page
title: "Безпека"
lang: uk
---

Тут ви знайдете інформацію про питання безпеки Ruby.
{: .summary}

## Повідомлення про вразливості безпеки

Вразливості безпеки в мові програмування Ruby слід повідомляти через нашу
[сторінку bounty-програми на HackerOne](https://hackerone.com/ruby).
Будь ласка, перед поданням уважно ознайомтеся з деталями щодо сфери
охоплення нашої програми. Усі коректно повідомлені проблеми будуть
опубліковані після виправлень.

Якщо ви знайшли проблему, що стосується одного з наших вебсайтів,
будь ласка, повідомте про неї [через GitHub](https://github.com/ruby/www.ruby-lang.org/issues/new)
або перегляньте наші [Google Groups](https://groups.google.com/g/ruby-security-ann)
для оголошень про безпеку.

Якщо ви знайшли проблему, що стосується gem-а спільноти Ruby, дотримуйтесь
[інструкцій на RubyGems.org](http://guides.rubygems.org/security/#reporting-security-vulnerabilities).

Щоб напряму зв’язатися з командою безпеки поза HackerOne,
можна надіслати лист на security@ruby-lang.org
([публічний PGP-ключ](/security.asc)), що є приватною поштовою розсилкою.

Членами цієї розсилки є люди, які надають Ruby
(комітери Ruby та автори інших реалізацій Ruby,
дистриб’ютори, постачальники PaaS-платформ).
Членами мають бути окремі люди, поштові списки не допускаються.

## Відомі проблеми

{% comment %}
Translations should include the following notice:

_See the [English page](/en/security/) for a complete and up-to-date
list of security vulnerabilities.
The following list only includes the as yet translated
security announcements, it might be incomplete or outdated._
{% endcomment %}

_Дивіться [англійську сторінку](/en/security/) для повного та актуального
списку вразливостей безпеки.
Нижче наведено лише вже перекладені оголошення про безпеку; список може
бути неповним або застарілим._

Ось нещодавні проблеми:

{% include security_posts.html %}

Більше відомих проблем:

* [DoS-вразливість через розширення сутностей у REXML (XML bomb,
  CVE-2013-1821)][1]
  опубліковано 22 лютого 2013.
* [Вразливість DoS і небезпечне створення об’єктів у JSON
  (CVE-2013-0269)][2]
  опубліковано 22 лютого 2013.
* [XSS-експлойт документації RDoc, згенерованої rdoc
  (CVE-2013-0256)][3]
  опубліковано 6 лютого 2013.
* [DoS-вразливість hash-flooding для Ruby 1.9 (CVE-2012-5371)][4]
  опубліковано 10 листопада 2012.
* [Ненавмисне створення файлів через вставку некоректного NUL-символу
  (CVE-2012-4522)][5]
  опубліковано 12 жовтня 2012.
* [Вразливість обходу $SAFE у Exception#to_s / NameError#to_s
  (CVE-2012-4464, CVE-2012-4466)][6]
  опубліковано 12 жовтня 2012.
* [Виправлення безпеки RubyGems: збій перевірки SSL-сервера для віддаленого
  репозиторію][7] опубліковано 20 квітня 2012.
* [Виправлення безпеки модуля Ruby OpenSSL: дозволити розділення 0/n як
  захист від атаки TLS BEAST][8]
  опубліковано 16 лютого 2012.
* [Виявлено DoS-атаку на алгоритм хешування Ruby
  (CVE-2011-4815)][9]
  опубліковано 28 грудня 2011.
* [Методи Exception можуть обходити $SAFE][10]
  опубліковано 18 лютого 2011.
* [FileUtils вразливий до атак на гонку символічних посилань][11]
  опубліковано 18 лютого 2011.
* [XSS у WEBrick (CVE-2010-0541)][12]
  опубліковано 16 серпня 2010.
* [Переповнення буфера в ARGF.inplace_mode=][13]
  опубліковано 2 липня 2010.
* [WEBrick має вразливість ін’єкції escape-послідовностей][14]
  опубліковано 10 січня 2010.
* [Heap overflow у String (CVE-2009-4124)][15]
  опубліковано 7 грудня 2009.
* [DoS-вразливість у
  BigDecimal](/en/news/2009/06/09/dos-vulnerability-in-bigdecimal/)
  опубліковано 9 червня 2009.
* [DoS-вразливість у
  REXML](/en/news/2008/08/23/dos-vulnerability-in-rexml/)
  опубліковано 23 серпня 2008.
* [Кілька вразливостей у
  Ruby](/en/news/2008/08/08/multiple-vulnerabilities-in-ruby/)
  опубліковано 8 серпня 2008.
* [Вразливості виконання довільного коду](/en/news/2008/06/20/arbitrary-code-execution-vulnerabilities/)
  опубліковано 20 червня 2008.
* [Вразливість доступу до файлів у
  WEBrick](/en/news/2008/03/03/webrick-file-access-vulnerability/)
  опубліковано 3 березня 2008.
* [Вразливість Net::HTTPS](/en/news/2007/10/04/net-https-vulnerability/)
  опубліковано 4 жовтня 2007.
* [Ще одна DoS-вразливість у бібліотеці
  CGI](/en/news/2006/12/04/another-dos-vulnerability-in-cgi-library/)
  опубліковано 4 грудня 2006.
* [DoS-вразливість у бібліотеці CGI (CVE-2006-5467)](/en/news/2006/11/03/CVE-2006-5467/)
  опубліковано 3 листопада 2006.
* [Вразливість Ruby у налаштуваннях рівня
  safe](/en/news/2005/10/03/ruby-vulnerability-in-the-safe-level-settings/)
  опубліковано 2 жовтня 2005.



[1]: /en/news/2013/02/22/rexml-dos-2013-02-22/
[2]: /en/news/2013/02/22/json-dos-cve-2013-0269/
[3]: /en/news/2013/02/06/rdoc-xss-cve-2013-0256/
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
