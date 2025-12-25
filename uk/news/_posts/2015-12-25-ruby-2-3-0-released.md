---
layout: news_post
title: "Вийшов Ruby 2.3.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2015-12-25 17:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.3.0.

Це перший стабільний випуск серії Ruby 2.3.
Він вводить багато нових функцій, наприклад:

Впроваджено [pragma замороженого літералу рядка](https://bugs.ruby-lang.org/issues/11473).
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
Зверніть увагу, що це поводиться як [try! з Active Support](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21),
який спеціально обробляє лише `nil`.

[Gem did_you_mean включено](https://bugs.ruby-lang.org/issues/11252).
Gem did_you_mean
показує кандидатів на `NameError` та `NoMethodError` для полегшення
налагодження.

[RubyVM::InstructionSequence#to_binary та .load_from_binary](https://bugs.ruby-lang.org/issues/11788) впроваджено як експериментальні функції. З цими функціями, ми можемо зробити систему попередньої компіляції ISeq (bytecode).

Ruby 2.3 також включає багато покращень продуктивності, наприклад
[переосмислення структури даних входу методу](https://bugs.ruby-lang.org/issues/11278),
[впровадження нової структури даних таблиці](https://bugs.ruby-lang.org/issues/11420),
[оптимізація Proc#call](https://bugs.ruby-lang.org/issues/11569),
налаштування на рівні машинного коду для виділення об'єктів та коду виклику методу,
[розумніша структура даних змінної екземпляра](https://bugs.ruby-lang.org/issues/11170),
[підтримка аргументу ключового слова `exception: false` на методах Socket#*_nonblock](https://bugs.ruby-lang.org/issues/11229),
та так далі. Перевірте розділ "Покращення реалізації" у файлі NEWS.

Для повного списку нових функцій та приміток про сумісність, будь ласка, див.
[NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS) та
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog).

З цими змінами, [2946 файлів змінено, 104057 додано(+), 59478 видалено(-)](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0) з Ruby 2.2.0!

Веселого Різдва, щасливих свят, та насолоджуйтеся програмуванням з Ruby 2.3!

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      РОЗМІР:   14185617 байтів
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      РОЗМІР:   17648682 байтів
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      РОЗМІР:   11294412 байтів
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      РОЗМІР:   19840511 байтів
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
