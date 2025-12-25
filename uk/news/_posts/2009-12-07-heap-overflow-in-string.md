---
layout: news_post
title: "Переповнення купи в String (CVE-2009-4124)"
author: "Yugui"
translator: "Andrii Furmanets"
lang: uk
---

Є вразливість переповнення купи в `String#ljust`,
`String#center` та `String#rjust`. Це дозволило зловмиснику запускати
довільний код у деяких рідкісних випадках.

* [CVE-2009-4124][1]

## Вразливі версії

* Всі випуски Ruby 1.9.1.

Ця вразливість не впливає на серію Ruby 1.8.

## Рішення

Будь ласка, оновіться до Ruby 1.9.1-p376.

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2&gt;][2]

## Подяка

Подяка Emmanouel Kellinis, KPMG London за розкриття проблеми
команді безпеки Ruby.

## Зміни

* 2009-12-07 14:52 +0900 додано посилання на CVE (але ще не відкрито, коли
  писався цей документ)




[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-4124
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2

