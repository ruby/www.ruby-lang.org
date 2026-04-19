---
layout: news_post
title: "CVE-2021-32066: Вразливість StartTLS stripping в Net::IMAP"
author: "shugo"
translator: "Andrii Furmanets"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: uk
---

Була виявлена вразливість StartTLS stripping в Net::IMAP.
Цій вразливості присвоєно ідентифікатор CVE [CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066).
Ми настійно рекомендуємо оновити Ruby.

net-imap є default gem в Ruby 3.0.1, але він має проблему з пакуванням, тому будь ласка, оновіть Ruby.

## Деталі

Net::IMAP не піднімає виняток, коли StartTLS
зазнає невдачі з невідомою відповіддю, що може дозволити зловмисникам man-in-the-middle
обійти захист TLS, використовуючи мережеву
позицію між клієнтом та реєстром для блокування команди StartTLS,
також відомо як "StartTLS stripping атака."

## Зачеплені версії

* Серія Ruby 2.6: 2.6.7 та раніше
* Серія Ruby 2.7: 2.7.3 та раніше
* Серія Ruby 3.0: 3.0.1 та раніше

## Подяка

Дякую [Alexandr Savca](https://hackerone.com/chinarulezzz) за повідомлення про проблему.

## Історія

* Спочатку опубліковано 2021-07-07 09:00:00 UTC
