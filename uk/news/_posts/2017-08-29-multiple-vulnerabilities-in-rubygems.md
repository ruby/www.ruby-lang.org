---
layout: news_post
title: "Множинні вразливості в RubyGems"
author: "usa"
translator: "Andrii Furmanets"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: uk
---

Є множинні вразливості в RubyGems, включеному в Ruby.
Це [повідомлено в офіційному блозі RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Деталі

Були повідомлені наступні вразливості.

* вразливість перехоплення DNS запиту. (CVE-2017-0902)
* вразливість ANSI escape послідовності. (CVE-2017-0899)
* вразливість DoS в команді query. (CVE-2017-0900)
* вразливість в встановлювачі gem, яка дозволяла зловмисному gem перезаписувати довільні файли. (CVE-2017-0901)

Настійно рекомендується користувачам Ruby оновитися або застосувати один з наступних обхідних шляхів якнайшвидше.

## Зачеплені версії

* Серія Ruby 2.2: 2.2.7 та раніше
* Серія Ruby 2.3: 2.3.4 та раніше
* Серія Ruby 2.4: 2.4.1 та раніше
* до ревізії trunk 59672

## Обхідні шляхи

Якщо ви не можете оновити Ruby, оновіть RubyGems до останньої версії.
RubyGems 2.6.13 або пізніші включають виправлення для вразливостей.

```
gem update --system
```

Якщо ви не можете оновити RubyGems, ви можете застосувати наступні патчі як обхідний шлях.

* [для Ruby 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [для Ruby 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* для Ruby 2.4.1: потрібно 2 патчі. Застосуйте послідовно наступним чином:
  1. [RubyGems 2.6.11 до 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 до 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

Щодо trunk, оновіть до останньої ревізії.

## Подяка

Цей звіт базується на [офіційному блозі RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Історія

* Спочатку опубліковано 2017-08-29 12:00:00 UTC
* Додано номери CVE 2017-08-31 2:00:00 UTC
* Згадка про оновлення Rubies 2017-09-15 12:00:00 UTC
