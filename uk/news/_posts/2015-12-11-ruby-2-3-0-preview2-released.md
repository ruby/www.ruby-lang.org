---
layout: news_post
title: "Вийшов Ruby 2.3.0-preview2"
author: "naruse"
translator: "Andrii Furmanets"
date: 2015-12-11 14:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.3.0-preview2.

Ruby 2.3.0-preview2 - це другий preview Ruby 2.3.0.
Багато нових функцій та покращень включено.

Впроваджено [Pragma замороженого літералу рядка](https://bugs.ruby-lang.org/issues/11473).
З Ruby 2.1, `"str".freeze` було оптимізовано для зменшення виділення об'єктів.
Ruby 2.3 вводить новий магічний коментар та опцію командного рядка для
замороження всіх літералів рядків у вихідних файлах.
Додатково для налагодження, ви можете отримати, де об'єкт створено на
помилці `"can't modify frozen String"` за допомогою опції командного рядка
`--debug=frozen-string-literal`.

Впроваджено [оператор безпечної навігації](https://bugs.ruby-lang.org/issues/11537)
([так званий самотній оператор](https://instagram.com/p/-M9l6mRPLR/)) `&.`,
який вже існує в C#, Groovy, та Swift, для полегшення
обробки `nil` як `obj&.foo`. Також додано `Array#dig` та `Hash#dig`.

[Gem did_you_mean включено](https://bugs.ruby-lang.org/issues/11252).
Gem did_you_mean
показує кандидатів на `NameError` та `NoMethodError` для полегшення
налагодження.

[RubyVM::InstructionSequence#to_binary та .load_from_binary](https://bugs.ruby-lang.org/issues/11788)
впроваджено як експериментальні функції.
З цими функціями, ми можемо зробити систему попередньої компіляції ISeq (bytecode).

Ruby 2.3 включає багато виправлень налаштування продуктивності.
Наприклад,
[оптимізація Proc#call](https://bugs.ruby-lang.org/issues/11569),
[переосмислення структури даних входу методу](https://bugs.ruby-lang.org/issues/11278),
[впровадження нової структури даних таблиці](https://bugs.ruby-lang.org/issues/11420),
налаштування на рівні машинного коду для виділення об'єктів та коду виклику методу,
та багато інших оптимізацій.

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.3.0-preview2, та повідомте нам ваші
знання!

## Помітні зміни з 2.2

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS)
та [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
для деталей.

З цими змінами, [1097 файлів змінено, 97466 додано(+), 58685 видалено(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2) з Ruby 2.2.0!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * РОЗМІР:   14126752 байтів
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * РОЗМІР:   17623519 байтів
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * РОЗМІР:   11249780 байтів
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * РОЗМІР:   19841531 байтів
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## Коментар до випуску

Див. також розклад випуску та іншу інформацію:

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
