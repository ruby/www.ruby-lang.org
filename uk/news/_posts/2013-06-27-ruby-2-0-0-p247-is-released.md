---
layout: news_post
title: "Вийшов Ruby 2.0.0-p247"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2013-06-27 11:00:03 +0000
lang: uk
---

Тепер Ruby 2.0.0-p247 випущено.

Цей випуск включає виправлення безпеки щодо включеного OpenSSL.

* [Вразливість обходу перевірки імені хоста в SSL клієнті
  (CVE-2013-4073)](/uk/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

І деякі виправлення помилок також включені.

## Завантаження

Ви можете завантажити цей випуск з:

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2)

      РОЗМІР:   10804581 байтів
      MD5:    60913f3eec0c4071f44df42600be2604
      SHA256: 08e3d4b85b8a1118a8e81261f59dd8b4ddcfd70b6ae554e0ec5ceb99c3185e8a

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz)

      РОЗМІР:   13652782 байтів
      MD5:    c351450a0bed670e0f5ca07da3458a5b
      SHA256: 3e71042872c77726409460e8647a2f304083a15ae0defe90d8000a69917e20d3

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip)

      РОЗМІР:   15100206 байтів
      MD5:    7548f781d868456e84afcd0327c7f894
      SHA256: 40c938238075b1e7e8df5d7ebfd069a45b93066318d91da9024d81b20a1c5a8a

## Зміни

Основні виправлення перелічені нижче.

Див. [тікети](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5)
та [ChangeLog](https://svn.ruby-lang.org/repos/ruby/tags/v2_0_0_247/ChangeLog) для деталей.

### Ключові аргументи

* [#8040](https://bugs.ruby-lang.org/issues/8040) зміна пріоритету між ключовими аргументами та обов'язковими аргументами.
* [#8416](https://bugs.ruby-lang.org/issues/8416) super не пересилає ні названі, ні анонімні `**`
* [#8463](https://bugs.ruby-lang.org/issues/8463) Помилка Proc auto-splat з названими аргументами

### VM/Обробка мови

* [#8424](https://bugs.ruby-lang.org/issues/8424) виправлення нескінченного циклу, коли переповнення стеку з TH_PUSH_TAG()
* [#8436](https://bugs.ruby-lang.org/issues/8436) \__dir__ не працює в eval з binding
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API: B_RETURN_EVENT не викликається, коли використовується "next"
* [#8341](https://bugs.ruby-lang.org/issues/8341) block_given? (та фактичний блок) зберігаються між викликами до proc, створеного з методу (використовуючи method().to_proc()).
* [#8531](https://bugs.ruby-lang.org/issues/8531) block_given? (та фактичний блок) зберігаються між викликами до proc, створеного Symbol#to_proc.

### RubyGems

Версія включеного RubyGems оновлена до 2.0.3

### Кодування

* [#8516](https://bugs.ruby-lang.org/issues/8516) IO#readchar повертає неправильні кодові точки при перетворенні кодування

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) File.read() збій на Win32SP3 32bit

### Бібліотеки

* [#8467](https://bugs.ruby-lang.org/issues/8467) Перемотування та ітерація через gzipped IO призводить до segmentation fault
* [#8415](https://bugs.ruby-lang.org/issues/8415) Net::IMAP#capability_response викликає "Net::IMAP::ResponseParseError: unexpected token CRLF" для загального CAPABILITY

## Коментар до випуску

Багато комітерів, тестувальників та користувачів, які надали звіти про помилки, допомогли мені
зробити цей випуск. Дякую за їхній внесок.

