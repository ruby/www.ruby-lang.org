---
layout: news_post
title: "Вышел Ruby 2.5.0"
author: "naruse"
translator: "badalloff"
date: 2017-12-25 00:00:00 +0000
lang: ru
---

Мы рады объявить о выходе Ruby 2.5.0.

Ruby 2.5.0 является первой стабильной версией в серии Ruby 2.5. Эта версия дает
много новых возможностей и улучшений производительности.
Значимые изменения следующие:

## Новые возможности

* `rescue`/`else`/`ensure`  теперь допускается использовать непосредственно
  с блоками `do`/`end`.
  [[Feature #12906]](https://bugs.ruby-lang.org/issues/12906)
* Добавьте `yield_self`, чтобы получить данный блок в его контексте.
  В отличие от `tap`, он возвращает результат блока.
  [[Feature #6721]](https://bugs.ruby-lang.org/issues/6721)
* Поддержка метрики покрытия тестами ветвления и покрытия тестами метода.
  Покрытие ветвления указывает какая ветка была запущена а какая нет.
  Покрытие метода указывает, какой метод вызывается, а какой нет.
  Запустив набор тестов с этими функциями, вы узнаете какие
  ветви и методы запущены, а также более точно оцените общий уровень
  покрытия тестами.
  [[Feature #13901]](https://bugs.ruby-lang.org/issues/13901)
* Hash#slice [[Feature #8499]](https://bugs.ruby-lang.org/issues/8499)
  и Hash#transform_keys [[Feature #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new может создавать классы, принимающие именованные аргументы.
  [[Feature #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none?, и one? принимают шаблон в качестве аргумента.
  [[Feature #11286]](https://bugs.ruby-lang.org/issues/11286)
* Поиск констант высшего уровня больше недоступен.
  [[Feature #11547]](https://bugs.ruby-lang.org/issues/11547)
* Одна из наших самых любимых библиотек, pp.rb, теперь автоматически
  загружается. Вам больше не нужно писать`require "pp"`.
  [[Feature #14123]](https://bugs.ruby-lang.org/issues/14123)
* Печать трассировки и сообщений об ошибках в обратном порядке
  (старейший вызов первым, новейший последним).
  Когда в вашем терминале появляется длинная трассировка,
  вы можете с лёгкостью найти строку с причиной в нижней части трассировки.
  Учтите, что трассировка будет в обратном порядке только когда выводится на
  прямую в терминал.
  [[Feature #8661]](https://bugs.ruby-lang.org/issues/8661) [экспериментальный]

## Улучшения производительности

* Примерно 5-10% улучшения производительности достигнуто благодаря удалению всех инструкций
  `trace` из всего байт-кода (последовательности инструкций).
  Инструкция `trace` была добавлена для поддержки `TracePoint`,
  Тем не менее, в большинстве случаев `TracePoint` не используется и инструкции
  `trace` это чрезмерные накладные расходы. Вместо этого теперь мы
  используем технологию динамического инструментария. Больше информации об этом
  по ссылке [[Feature #14104]](https://bugs.ruby-lang.org/issues/14104).
* Передача блока по параметру блока (прим. `def foo(&b); bar(&b); end`)
  в 3 раза быстрее чем в Ruby 2.4 благодаря методу "Lazy Proc allocation".
  [[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)
* Mutex переписан чтобы быть меньше и быстрее.
  [[Feature #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB теперь генерирует код из шаблона в два раза быстрее, чем Ruby 2.4.
* Улучшена производительность некоторых встроенных методов, включая
  `Array#concat`, `Enumerable#sort_by`, `String#concat`, `String#index`,
  `Time#+`, и других.
* IO.copy_stream использует copy_file_range(2) для копирования разгрузки.
  [[Feature #13867]](https://bugs.ruby-lang.org/issues/13867)

## Другие значимые изменения со времени 2.4 версии

* SecureRandom теперь предпочитает источники, предоставленные ОС нежели OpenSSL.
  [[Bug #9569]](https://bugs.ruby-lang.org/issues/9569)
* cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr,
  scanf, sdbm, stringio, strscan, webrick, zlib перемещены из стандартной
  библиотеки в гемы по умолчанию.
* [Onigmo](https://github.com/k-takata/Onigmo/) обновлен до версии 6.1.3.
  * Он добавляет [оператор отсутствия](https://github.com/k-takata/Onigmo/issues/87).
  * Учтите, что [Ruby 2.4.1](https://www.ruby-lang.org/en/news/2017/03/22/ruby-2-4-1-released/)
  также включает эти изменения.
* Обновлен до Psych 3.0.2.
* Обновлен до RubyGems 2.7.3.
* Обновлен до RDoc 6.0.1.
  * [Переключен лексер с IRB на Ripper](https://github.com/ruby/rdoc/pull/512).
    Это значительно улучшает производительность генерации документов.
  * Исправлено значительное количество ошибок, которые существовали более
    десяти лет.
  * Добавлена поддержка нового синтаксиса Ruby из последних версий.
* Обновление поддерживаемой версии Unicode до 10.0.0.
* `Thread.report_on_exception` теперь установлено значение true по умолчанию.
  Это изменение помогает отлаживать многопоточные программы.
  [[Feature #14143]](https://bugs.ruby-lang.org/issues/14143)
* IO#write теперь принимает множество аргументов.
  [[Feature #9323]](https://bugs.ruby-lang.org/issues/9323)

Подробности находятся в файле [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS)
или в [логах коммитов](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0).

Включая эти изменения, реализовано
[6158 изменений файлов, 348484 добавлений(+), 82747 удалений(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)
с момента выхода Ruby 2.4.0!

Желаем всем счастливого Рождества, прекрасных каникул, и наслаждайтесь
программированием с Ruby 2.5!

## Скачать

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
