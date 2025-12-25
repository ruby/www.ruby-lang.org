---
layout: news_post
title: "Вразливості виконання довільного коду"
author: "Shugo Maeda"
translator: "Andrii Furmanets"
lang: uk
---

Кілька вразливостей у Ruby можуть призвести до умови відмови в обслуговуванні (DoS)
або дозволити виконання довільного коду.

## Вплив

З наступними вразливостями зловмисник може призвести до відмови в
обслуговуванні або виконати довільний код.

* [CVE-2008-2662][1]
* [CVE-2008-2663][2]
* [CVE-2008-2725][3]
* [CVE-2008-2726][4]
* [CVE-2008-2664][5]

## Вразливі версії

Серія 1.8
: * 1\.8.4 та всі попередні версії
  * 1\.8.5-p230 та всі попередні версії
  * 1\.8.6-p229 та всі попередні версії
  * 1\.8.7-p21 та всі попередні версії

Серія 1.9
: * 1\.9.0-1 та всі попередні версії

## Рішення

Серія 1.8
: Будь ласка, оновіться до 1.8.5-p231, або 1.8.6-p230, або 1.8.7-p22.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz&gt;][6]
    (md5sum: e900cf225d55414bffe878f00a85807c)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz&gt;][7]
    (md5sum: 5e8247e39be2dc3c1a755579c340857f)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz&gt;][8]
    (md5sum: fc3ede83a98f48d8cb6de2145f680ef2)

Серія 1.9
: Будь ласка, оновіться до 1.9.0-2.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz&gt;][9]
    (md5sum: 2a848b81ed1d6393b88eec8aa6173b75)

Ці версії також виправляють вразливість WEBrick
([CVE-2008-1891][10]).

Будь ласка, зверніть увагу, що пакет, який виправляє цю слабкість, може вже бути
доступний через ваше програмне забезпечення управління пакетами.

## Подяка

Подяка Drew Yao з Apple Product Security за розкриття проблеми
команді безпеки Ruby.

## Зміни

* 2008-06-21 00:29 +09:00 видалено неправильні CVE ID (CVE-2008-2727,
  CVE-2008-2728).




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

