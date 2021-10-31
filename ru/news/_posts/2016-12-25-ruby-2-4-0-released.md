---
layout: news_post
title: "Вышел Ruby 2.4.0"
author: "naruse"
translator: "arbox"
date: 2016-12-25 00:00:00 +0000
lang: ru
---

Мы рады объявить о выходе Ruby 2.4.0!

Ruby 2.4.0 является первой стабильной версией в серии Ruby 2.4. Эта версия дает
много интересных новых возможностей, которые мы перечислим ниже.

## [Улучшения хеш-таблиц (благодаря Владимиру Макарову)](https://bugs.ruby-lang.org/issues/12142)

Внутренняя структура хеш-таблиц (st_table) была улучшена благодаря открытой
адресации и внедрению порядковых массивов.
Эти улучшения открыто обсуждались, особые благодарности Юре Соколову.

## `Binding#irb`: интерактивные сессии по примеру `binding.pry`

При поиске ошибок многие из нас используют `p`, чтобы видеть значение переменных.
При помощи [pry](https://github.com/pry/pry) (`binding.pry`) уже давно было
возможно запустить интерактивную сессию и вызывать произвольный код на Ruby.
Патч [r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
реализует `binding.irb`, так что теперь можно добиться похожего поведения
при помощи irb.

## [Объединение `Fixnum` и `Bignum` в `Integer`](https://bugs.ruby-lang.org/issues/12005)

Хотя стандарт [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
не уточняет детали реализации класса `Integer`, Ruby имел два видимых класса:
`Fixnum` и `Bignum`. Ruby 2.4 объединяет эти классы в `Integer`.
Все расширения на С, которые работают с классами `Fixnum` или `Bignum` нуждаются
в исправлениях.

Смотрите также эту [заявку](https://bugs.ruby-lang.org/issues/12005) и
[слайды akr'а](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf).

## [Поддержка изменения регистра знаков юникода для `String`](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` теперь поддерживают
смену регистра для всех знаков Unicode, а не только для знаков ASCII.

## Улучшения производительности

Ruby 2.4 также реализует следующие улучшения производительности, включая
расширения в спецификации языка:

### [`Array#max`, `Array#min`](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` и `[x, y].min` теперь оптимизированы и не создают временный
массив в некоторых ситуациях.

### [`Regexp#match?`](https://bugs.ruby-lang.org/issues/8110)

Добавлен метод `Regexp#match?`, который проводит сравнение с регулярным выражением,
не создает обратных ссылок и не меняет значение переменной `$~`,
чтобы не создавать дополнительные объекты.

### Прочие улучшения производительности

* [ускорение доступа к переменным экземпляров класса](https://bugs.ruby-lang.org/issues/12274)

## Поиск ошибок

### [`Thread#report_on_exception` и `Thread.report_on_exception`](https://bugs.ruby-lang.org/issues/6647)

Ruby игнорирует исключения в потоках до тех пор, пока другие потоки не сливаются
с ними явно. Теперь можно задать `report_on_exception = true` и видеть, когда поток
обрывается из-за необработанных исключений.

Нас интересует ваше мнение о том, какое поведение `report_on_exception`
должно быть стандартным, а также о реализации `report-on-GC`, уведомляющем
о неприсоединенных потоках, собранных сборщиком мусора.

### [Детектор блокировок потоков показывает бэктрейс и зависимости](https://bugs.ruby-lang.org/issues/8214)

В Ruby реализован детектор блокировки ждущих потоков, но в его сообщениях не было
достаточной информации для поиска ошибок. В Ruby 2.4 детектор блокировок показывает
потоки вместе с бэктрейсами и зависимыми потоками.

## Другие значимые изменения с момента выхода 2.3

* Поддержка OpenSSL 1.1.0 (поддержка прекращена для версий 0.9.7 и меньше)
* ext/tk удалена из stdlib [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC удалена из stdlib [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

Подробности находятся в файле [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)
и логах добавлений.

Включая эти изменения реализовано
[2523 изменения файлов, 289129 добавлений (+), 84670 удалений (-)](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)
с момента выхода Ruby 2.3.0!

Мы желаем всем счастливого Рождества и прекрастных каникул. Наслаждайтесь
программированием с Ruby 2.4!

## Скачать

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
