---
layout: news_post
title: "Вийшов Ruby 2.3.0-preview1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2015-11-11 14:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.3.0-preview1.

Ruby 2.3.0-preview1 - це перший preview Ruby 2.3.0.
Багато нових функцій та покращень включено.

Впроваджено [Pragma замороженого літералу рядка](https://bugs.ruby-lang.org/issues/11473).
З Ruby 2.1, `"str".freeze` було оптимізовано для зменшення виділення об'єктів.
Ruby 2.3 вводить новий магічний коментар та опцію командного рядка для
замороження всіх літералів рядків у вихідних файлах.
Додатково для налагодження, ви можете отримати, де об'єкт створено на
помилці `"can't modify frozen String"` за допомогою
`--enable-frozen-string-literal-debug`.

Впроваджено [оператор безпечної навігації](https://bugs.ruby-lang.org/issues/11537),
який вже існує в C#, Groovy, та Swift, для полегшення
обробки `nil` як `obj&.foo`. Також додано `Array#dig` та `Hash#dig`.

[Gem did_you_mean включено](https://bugs.ruby-lang.org/issues/11252).
Gem did_you_mean
показує кандидатів на `NameError` та `NoMethodError` для полегшення
налагодження.

Спробуйте та насолоджуйтеся програмуванням з Ruby 2.3.0-preview1, та повідомте нам ваші
знання!

## Помітні зміни з 2.2

* TBD

Див. [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview1/NEWS) та
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview1/ChangeLog)
для деталей.

З цими змінами, 1036 файлів змінено, 81312 додано(+), 51322
видалено(-) з Ruby 2.2.0.

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.bz2>

  * РОЗМІР:   14174035 байтів
  * SHA1:   55ad4f04d7a33ab780458ee0999de9f6124217ea
  * SHA256: 42b9c9e1740a5abe2855d11803524370bd95744c8dcb0068572ed5c969ac7f0f
  * SHA512: ae6d46c87f59e1fd3703b76dfc45bfcf208625f95ab9f4559f0b9f7050e8681f1a6e419f5fa06b704c83e56879c3a9ff1337dba443bcfca76fadb49c97d97a93

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.gz>

  * РОЗМІР:   17560800 байтів
  * SHA1:   6249572e5dca27d8c73a0cbf036e24e5d88fe82f
  * SHA256: dc8f9d48392a2bb226df5f4b4fd2074d81af155cdf3f3799139a6e31e012aefe
  * SHA512: 58384ef6e743dde20ea263692dab86ce9d6d22d722ef4c02a84396aa3128ce06d933d9b69078a3cd666d72320a8a6ffdc93296bc0d5338595b2a44c29d4db383

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.xz>

  * РОЗМІР:   11225228 байтів
  * SHA1:   85b4f631efa4b6435b2b41df6ce6c46da294c4d4
  * SHA256: a88e19d9dc001db8f49ca3986a8a4e69980affff876854585725e40de0eedcd8
  * SHA512: 3be0f3ed4de73509b2f6975fe3fbe28bb4d51df87db6e2c0019e8a107edf49be60b2127ba5b18bca91f9f5964b07f1adde3042dac6327017359eeb130760672b

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.zip>

  * РОЗМІР:   19777010 байтів
  * SHA1:   3458666c250dd333ac4b537be25f1913dd311ea1
  * SHA256: 0fc1d4450e9141f541038a4433f8fb49fb929e43c7bf5985685a4fa7b213a811
  * SHA512: f53653cf11d8dce1d627f7db3a15acca29c74c78735406a5d64bbbdc39fac232ef63110eb4d83521bef40c6f3006d55bbeaf54d1ddab1d4b6e5a13cee9247e85

## Коментар до випуску

Див. також розклад випуску та іншу інформацію:

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)

