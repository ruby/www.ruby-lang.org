---
layout: news_post
title: "Вийшов Ruby 3.4.0"
author: "naruse"
translator: "Andrii Furmanets"
date: 2024-12-25 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
Раді повідомити про вихід Ruby {{ release.version }}. Ruby 3.4 додає посилання на параметр блоку `it`,
змінює Prism на парсер за замовчуванням, додає підтримку Happy Eyeballs Version 2 до бібліотеки сокетів, покращує YJIT,
додає модульний GC тощо.

## Введено `it`

`it` додано для посилання на параметр блоку без імені змінної. [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it` поводиться майже так само, як `_1`. Коли намір - використати в блоці лише `_1`, можливість появи інших
нумерованих параметрів, таких як `_2`, створює додаткове когнітивне навантаження для читачів. Тому `it`
введено як зручний псевдонім. Використовуйте `it` у простих випадках, де `it` говорить саме за себе,
наприклад в однорядкових блоках.

## Prism тепер парсер за замовчуванням

Перемкнуто парсер за замовчуванням з parse.y на Prism. [[Feature #20564]]

Це внутрішнє поліпшення, і для користувача має бути мало помітних змін. Якщо ви помітите проблеми сумісності,
будь ласка, повідомте нам.

Щоб використати традиційний парсер, передайте параметр командного рядка `--parser=parse.y`.

## Бібліотека сокетів тепер підтримує Happy Eyeballs Version 2 (RFC 8305)

Бібліотека сокетів тепер підтримує [Happy Eyeballs Version 2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305),
останню стандартизовану версію широко застосовуваного підходу для кращої мережевої взаємодії у багатьох мовах програмування,
у `TCPSocket.new` (`TCPSocket.open`) та `Socket.tcp`.
Це покращення дозволяє Ruby забезпечувати ефективні та надійні мережеві з'єднання, адаптовані до сучасних інтернет-умов.

До Ruby 3.3 ці методи виконували розв'язання імен і спроби з'єднання послідовно. За цим алгоритмом тепер вони працюють так:

1. Виконують розв'язання імен IPv6 і IPv4 паралельно
2. Підключаються до розв'язаних IP-адрес, віддаючи пріоритет IPv6, із паралельними спробами з інтервалом 250 мс
3. Повертають перше успішне з'єднання, скасовуючи всі інші

Це мінімізує затримки підключення, навіть якщо певний протокол або IP-адреса затримується чи недоступні.
Цю функцію увімкнено за замовчуванням, тож додаткових налаштувань не потрібно. Щоб вимкнути її глобально,
встановіть змінну середовища `RUBY_TCP_NO_FAST_FALLBACK=1` або викличте `Socket.tcp_fast_fallback=false`.
А щоб вимкнути її для окремого виклику, використайте ключовий аргумент `fast_fallback: false`.

## YJIT

### TL;DR

* Краща продуктивність у більшості бенчмарків на платформах x86-64 та arm64.
* Зменшене використання пам'яті завдяки стисненим метаданим та єдиній межі пам'яті.
* Різні виправлення помилок: YJIT став надійнішим і ретельніше протестованим.

### Нові можливості

* Параметри командного рядка
    * `--yjit-mem-size` запроваджує єдину межу пам'яті (типово 128MiB) для відстеження загального споживання пам'яті YJIT,
      забезпечуючи інтуїтивнішу альтернативу старому параметру `--yjit-exec-mem-size`.
    * `--yjit-log` увімкнює журнал компіляції, щоб відстежувати, що компілюється.
* API Ruby
    * `RubyVM::YJIT.log` надає доступ до хвоста журналу компіляції під час виконання.
* Статистика YJIT
    * `RubyVM::YJIT.runtime_stats` тепер завжди надає додаткову статистику щодо
       інвалідизації, інлайнінгу та кодування метаданих.

### Нові оптимізації

* Стиснений контекст зменшує пам'ять, потрібну для зберігання метаданих YJIT
* Виділення регістрів для локальних змінних і аргументів методів Ruby
* Коли YJIT увімкнено, більше базових примітивів реалізовано на Ruby:
    * `Array#each`, `Array#select`, `Array#map` переписано на Ruby для кращої продуктивності [[Feature #20182]].
* Можливість інлайнити невеликі або тривіальні методи, такі як:
    * Порожні методи
    * Методи, що повертають константу
    * Методи, що повертають `self`
    * Методи, що безпосередньо повертають аргумент
* Спеціалізована генерація коду для значно більшої кількості методів часу виконання
* Оптимізація `String#getbyte`, `String#setbyte` та інших рядкових методів
* Оптимізація бітових операцій для прискорення низькорівневих маніпуляцій з бітами/байтами
* Підтримка розділюваних констант у режимі multi-ractor
* Різні інші інкрементальні оптимізації

## Модульний GC

* Альтернативні реалізації збирача сміття (GC) можуть завантажуватися динамічно
  через функцію модульного GC. Щоб увімкнути цю функцію,
  сконфігуруйте Ruby з `--with-modular-gc` під час збірки. Бібліотеки GC можна
  завантажувати під час виконання, використовуючи змінну середовища `RUBY_GC_LIBRARY`.
  [[Feature #20351]]

* Вбудований збирач сміття Ruby винесено в окремий файл
  `gc/default/default.c` і він взаємодіє з Ruby через API, визначений у
  `gc/gc_impl.h`. Вбудований збирач сміття тепер також можна зібрати як
  бібліотеку, використовуючи `make modular-gc MODULAR_GC=default`, і увімкнути
  через змінну середовища `RUBY_GC_LIBRARY=default`. [[Feature #20470]]

* Експериментальна бібліотека GC на основі [MMTk](https://www.mmtk.io/).
  Цю бібліотеку GC можна зібрати командою `make modular-gc MODULAR_GC=mmtk` і
  увімкнути через змінну середовища `RUBY_GC_LIBRARY=mmtk`. Для цього потрібен
  інструментарій Rust на машині збірки. [[Feature #20860]]

## Зміни мови

* Рядкові літерали у файлах без коментаря `frozen_string_literal` тепер видають попередження про застаріле використання
  при їх зміні.
  Ці попередження можна увімкнути за допомогою `-W:deprecated` або встановивши `Warning[:deprecated] = true`.
  Щоб вимкнути цю зміну, можна запустити Ruby з параметром командного рядка `--disable-frozen-string-literal`.
  [[Feature #20205]]

* Тепер підтримується розпаковування ключових аргументів з `nil` під час виклику методів.
  `**nil` обробляється подібно до `**{}`, не передаючи ключових аргументів
  і не викликаючи жодних методів перетворення. [[Bug #20064]]

* Передавання блоку більше не дозволено в операції індексації. [[Bug #19918]]

* Ключові аргументи більше не дозволені в операції індексації. [[Bug #20218]]

* Глобальне ім'я `::Ruby` тепер зарезервоване, і при його визначенні буде попередження,
  якщо увімкнено `Warning[:deprecated]`. [[Feature #20884]]

## Оновлення основних класів

Примітка: наведено лише помітні оновлення основних класів.

* Exception

  * `Exception#set_backtrace` тепер приймає масив `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` та `Fiber#raise` також приймають цей новий формат. [[Feature #13557]]

* GC

    * Додано `GC.config`, щоб дозволити встановлювати конфігураційні змінні
      збирача сміття. [[Feature #20443]]

    * Запроваджено параметр конфігурації GC `rgengc_allow_full_mark`. Коли `false`,
      GC позначає лише молоді об'єкти. Типово `true`. [[Feature #20443]]

* Ractor

    * `require` у Ractor дозволено. Процес `require` буде виконано в
      основному Ractor.
      Додано `Ractor._require(feature)` для виконання процесу `require` в
      основному Ractor.
      [[Feature #20627]]

    * Додано `Ractor.main?`. [[Feature #20627]]

    * Додано `Ractor.[]` і `Ractor.[]=`, щоб отримувати доступ до локального сховища ractor
      поточного Ractor. [[Feature #20715]]

    * Додано `Ractor.store_if_absent(key){ init }` для ініціалізації локальних змінних ractor
      у thread-safety. [[Feature #20875]]

* Range

  * `Range#size` тепер викликає `TypeError`, якщо діапазон не є ітерованим. [[Misc #18984]]


## Оновлення стандартної бібліотеки

Примітка: наведено лише помітні оновлення стандартних бібліотек.

* RubyGems
    * Додано параметр `--attestation` до `gem push`. Це дозволяє зберігати підпис у [sigstore.dev]

* Bundler
    * Додано налаштування `lockfile_checksums` для включення контрольних сум у нові lockfile
    * Додано `bundle lock --add-checksums`, щоб додати контрольні суми до наявного lockfile

* JSON

    * Покращення продуктивності `JSON.parse` приблизно у 1.5 раза швидше, ніж json-2.7.x.

* Tempfile

    * Реалізовано ключовий аргумент `anonymous: true` для Tempfile.create.
      `Tempfile.create(anonymous: true)` одразу видаляє створений тимчасовий файл.
      Тож застосункам не потрібно видаляти файл.
      [[Feature #20497]]

* win32/sspi.rb

    * Цю бібліотеку винесено з репозиторію Ruby до [ruby/net-http-sspi].
      [[Feature #20775]]

Наступні bundled gems підвищено зі статусу default gems.

- mutex_m 0.3.0
- getoptlong 0.2.1
- base64 0.2.0
- bigdecimal 3.1.8
- observer 0.1.2
- abbrev 0.1.2
- resolv-replace 0.1.1
- rinda 0.2.0
- drb 2.2.1
- nkf 0.2.0
- syslog 0.2.0
- csv 3.3.2
- repl_type_completor 0.1.9

## Проблеми сумісності

* Змінено повідомлення про помилки та відображення стеків викликів.
  * Як початкову лапку використовують одинарну лапку замість зворотної. [[Feature #16495]]
  * Перед назвою методу відображають назву класу (лише коли клас має постійну назву). [[Feature #19117]]
  * Методи `Kernel#caller`, `Thread::Backtrace::Location` тощо також змінено відповідно.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* Змінено формат виводу `Hash#inspect`. [[Bug #20433]]

    * Ключі-символи відображаються з використанням сучасного синтаксису ключів символів: `"{user: 1}"`
    * Інші ключі тепер мають пробіли навколо `=>`: `'{"user" => 1}'`, тоді як раніше їх не було: `'{"user"=>1}'`

* `Kernel#Float()` тепер приймає десятковий рядок без дробової частини. [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (раніше було виключення ArgumentError)
  Float("1.E-1") #=> 0.1 (раніше було виключення ArgumentError)
  ```

* `String#to_f` тепер приймає десятковий рядок без дробової частини. Зверніть увагу, що результат змінюється, якщо вказано експоненту. [[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (раніше поверталося 1.0)
  ```

* `Refinement#refined_class` було вилучено. [[Feature #19714]]

## Проблеми сумісності стандартної бібліотеки

* DidYouMean

    * `DidYouMean::SPELL_CHECKERS[]=` та `DidYouMean::SPELL_CHECKERS.merge!` вилучено.

* Net::HTTP

    * Вилучено такі застарілі константи:
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

      Ці константи були застарілими з 2012 року.

* Timeout

    * Відхиляє від'ємні значення для Timeout.timeout. [[Bug #20795]]

* URI

    * Парсер за замовчуванням перемкнено на сумісний з RFC 3986 замість RFC 2396.
      [[Bug #19266]]

## Оновлення C API

* `rb_newobj` та `rb_newobj_of` (і відповідні макроси `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) вилучено. [[Feature #20265]]
* Вилучено застарілу функцію `rb_gc_force_recycle`. [[Feature #18290]]

## Інші зміни

* Передавання блоку в метод, який не використовує переданий блок, показуватиме
  попередження в режимі verbose (`-w`).
  [[Feature #15554]]

* Перевизначення деяких базових методів, які спеціально оптимізовані інтерпретатором
  та JIT, таких як `String.freeze` або `Integer#+`, тепер видає попередження про
  клас продуктивності (`-W:performance` або `Warning[:performance] = true`).
  [[Feature #20429]]

Детальніше див. [NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
для подробиць.

Унаслідок цих змін [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
з часу Ruby 3.3.0!

З Різдвом, зі святами, і приємного програмування з Ruby 3.4!

## Завантаження

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Що таке Ruby

Ruby уперше розробив Matz (Yukihiro Matsumoto) у 1993 році,
і зараз вона розвивається як Open Source. Вона працює на багатьох платформах
і використовується по всьому світу, особливо для веброзробки.

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19266]:     https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: https://www.sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
