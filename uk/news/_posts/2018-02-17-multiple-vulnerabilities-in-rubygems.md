---
layout: news_post
title: "Множинні вразливості в RubyGems"
author: "usa"
translator: "Andrii Furmanets"
date: 2018-02-17 03:00:00 +0000
tags: security
lang: uk
---

Є множинні вразливості в RubyGems, включеному в Ruby.
Це [повідомлено в офіційному блозі RubyGems](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Деталі

Були повідомлені наступні вразливості.

* Запобігання path traversal при записі до символічного посилання basedir поза коренем.
* Виправлення можливої вразливості небезпечної десеріалізації об'єкта в gem owner.
* Строга інтерпретація восьмеричних полів у заголовках tar.
* Підняття помилки безпеки, коли є дублікати файлів у пакеті.
* Застосування валідації URL на атрибут spec homepage.
* Пом'якшення вразливості XSS в атрибуті homepage при відображенні через gem server.
* Запобігання проблемі Path Traversal під час встановлення gem.

Настійно рекомендується користувачам Ruby оновити вашу установку Ruby або застосувати один з наступних обхідних шляхів якнайшвидше.

## Зачеплені версії

* Серія Ruby 2.2: 2.2.9 та раніше
* Серія Ruby 2.3: 2.3.6 та раніше
* Серія Ruby 2.4: 2.4.3 та раніше
* Серія Ruby 2.5: 2.5.0 та раніше
* до ревізії trunk 62422

## Обхідні шляхи

В принципі, ви повинні оновити вашу установку Ruby до останньої версії.
RubyGems 2.7.6 або пізніші включають виправлення для вразливостей, тому оновіть RubyGems до останньої версії, якщо ви не можете оновити Ruby.

```
gem update --system
```

Якщо ви не можете оновити RubyGems, ви можете застосувати наступні патчі як обхідний шлях.

* [для Ruby 2.2.9](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [для Ruby 2.3.6](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [для Ruby 2.4.3](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [для Ruby 2.5.0](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

Щодо trunk, оновіть до останньої ревізії.

## Подяка

Цей звіт базується на [офіційному блозі RubyGems](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Історія

* Спочатку опубліковано 2018-02-17 03:00:00 UTC
* Згадка про оновлення Rubies 2018-03-29 01:00:00 UTC
