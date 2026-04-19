---
layout: news_post
title: "Вийшов Ruby 3.2.0 RC 1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2022-12-06 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.2.0-rc1" | first %}

Ми раді повідомити про вихід Ruby {{ release.version }}. Ruby 3.2 додає багато функцій та покращень продуктивності.


## Підтримка WebAssembly на основі WASI

Це початковий порт підтримки WebAssembly на основі WASI. Це дозволяє бінарному файлу CRuby бути доступним у веб-браузері, середовищі Serverless Edge або інших вбудовувачах WebAssembly/WASI. Наразі цей порт проходить базові та bootstrap тестові набори без використання Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Передумови

[WebAssembly (Wasm)](https://webassembly.org/) спочатку був представлений для безпечного та швидкого запуску програм у веб-браузерах. Але його мета - ефективне виконання програм з безпекою в різних середовищах - довго бажана не лише для веб, але й для загальних додатків.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) розроблений для таких випадків використання. Хоча такі додатки потребують спілкування з операційними системами, WebAssembly працює на віртуальній машині, яка не мала системного інтерфейсу. WASI стандартизує це.

Підтримка WebAssembly/WASI в Ruby має на меті використати ці проекти. Це дозволяє розробникам Ruby писати додатки, які працюють на таких перспективних платформах.

### Випадок використання

Ця підтримка заохочує розробників використовувати CRuby в середовищі WebAssembly. Прикладом використання є підтримка CRuby в [TryRuby playground](https://try.ruby-lang.org/playground/). Тепер ви можете спробувати оригінальний CRuby у своєму веб-браузері.

### Технічні моменти

Сьогоднішні WASI та WebAssembly самі по собі не мають деяких функцій для реалізації Fiber, винятків та GC, оскільки вони ще розвиваються, а також з міркувань безпеки. Тому CRuby заповнює цю прогалину, використовуючи Asyncify, який є технікою бінарного перетворення для керування виконанням у користувацькому просторі.

Крім того, ми створили [VFS поверх WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby), щоб ми могли легко упакувати додатки Ruby в один файл .wasm. Це трохи спрощує розповсюдження додатків Ruby.


### Пов'язані посилання

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Покращення Regexp проти ReDoS

Відомо, що зіставлення Regexp може займати несподівано багато часу. Якщо ваш код намагається зіставити можливо неефективний Regexp з ненадійним вводом, зловмисник може використати це для ефективної атаки типу "Відмова в обслуговуванні" (так званий Regular expression DoS, або ReDoS).

Ми впровадили два покращення, які значно пом'якшують ReDoS.

### Покращений алгоритм зіставлення Regexp

Починаючи з Ruby 3.2, алгоритм зіставлення Regexp значно покращено завдяки використанню техніки мемоїзації.

```
# Це зіставлення займає 10 сек. в Ruby 3.1, і 0.003 сек. в Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

Покращений алгоритм зіставлення дозволяє більшості зіставлень Regexp (близько 90% у наших експериментах) завершуватися за лінійний час.

(Для користувачів preview: ця оптимізація може споживати пам'ять пропорційно довжині вводу для кожного зіставлення. Ми очікуємо, що практичних проблем не виникне, оскільки це виділення пам'яті зазвичай відкладене, і нормальне зіставлення Regexp повинно споживати максимум у 10 разів більше пам'яті, ніж довжина вводу. Якщо у вас закінчується пам'ять під час зіставлення Regexp у реальному додатку, будь ласка, повідомте про це.)

Оригінальна пропозиція: https://bugs.ruby-lang.org/issues/19104

### Таймаут Regexp

Оптимізація вище не може бути застосована до деяких видів регулярних виразів, таких як ті, що включають розширені функції (наприклад, зворотні посилання або look-around), або з великою фіксованою кількістю повторень. Як запасний захід, також впроваджено функцію таймауту для зіставлень Regexp.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError виникає через одну секунду
```

Зауважте, що `Regexp.timeout` є глобальною конфігурацією. Якщо ви хочете використовувати різні налаштування таймауту для деяких спеціальних Regexp, ви можете використовувати ключове слово `timeout` для `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Цей regexp не має таймауту
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # ніколи не переривається
```

Оригінальна пропозиція: https://bugs.ruby-lang.org/issues/17837

## Інші помітні нові функції

### SyntaxSuggest

* Функція `syntax_suggest` (раніше `dead_end`) інтегрована в Ruby. Це допомагає вам знайти позицію помилок, таких як відсутні або зайві `end`, щоб швидше повернутися до роботи, як у наступному прикладі:

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 4    end
    5  end
  ```

  [[Feature #18159]]


### ErrorHighlight

* Тепер він вказує на відповідний(і) аргумент(и) для TypeError та ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

### Мова

* Анонімні rest та keyword rest аргументи тепер можуть передаватися як
  аргументи, замість того, щоб використовуватися лише в параметрах методу.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Proc, який приймає один позиційний аргумент та ключові слова, більше
  не буде автоматично розпаковуватися. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 та раніше
  # => 1
  # Ruby 3.2 та пізніше
  # => [1, 2]
  ```

* Порядок оцінки присвоєння констант для констант, встановлених на явних
  об'єктах, зроблено узгодженим з порядком оцінки присвоєння одного атрибута.
  З цим кодом:

    ```ruby
    foo::BAR = baz
    ```

  `foo` тепер викликається перед `baz`. Аналогічно, для множинних присвоєнь
  константам використовується порядок оцінки зліва направо. З цим
  кодом:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Тепер використовується наступний порядок оцінки:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Патерн find більше не є експериментальним.
  [[Feature #18585]]

* Методи, які приймають rest параметр (як `*args`) та бажають делегувати ключові
  аргументи через `foo(*args)`, тепер повинні бути позначені `ruby2_keywords`
  (якщо це ще не так). Іншими словами, всі методи, які бажають делегувати
  ключові аргументи через `*args`, тепер повинні бути позначені `ruby2_keywords`,
  без винятків. Це спростить перехід до інших способів
  делегування, коли бібліотека може вимагати Ruby 3+. Раніше прапорець `ruby2_keywords`
  зберігався, якщо метод, що приймає, приймав `*args`, але це була помилка та
  неузгодженість. Хороша техніка для пошуку потенційно відсутніх `ruby2_keywords`
  - це запустити тестовий набір, знайти останній метод, який повинен
  отримувати ключові аргументи для кожного місця, де тестовий набір не проходить, і використати `puts nil, caller, nil` там. Потім перевірте, що кожен
  метод/блок у ланцюжку викликів, який повинен делегувати ключові слова, правильно позначений
  `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Випадково працювало без ruby2_keywords в Ruby 2.7-3.1, ruby2_keywords
    # потрібен в 3.2+. Так само, як (*args, **kwargs) або (...) були б потрібні на
    # обох #foo та #bar при міграції від ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Покращення продуктивності

### YJIT

* YJIT тепер підтримує як x86-64, так і arm64/aarch64 процесори на Linux, MacOS, BSD та інших UNIX платформах.
    * Цей випуск додає підтримку для Mac M1/M2, AWS Graviton та Raspberry Pi 4 ARM64 процесорів.
* Побудова YJIT вимагає Rust 1.58.0+. [[Feature #18481]]
    * Для забезпечення того, щоб CRuby був побудований з YJIT, будь ласка, встановіть rustc >= 1.58.0 та
      запустіть `./configure` з `--enable-yjit`.
    * Будь ласка, зверніться до команди YJIT, якщо у вас виникнуть проблеми.
* Фізична пам'ять для JIT коду виділяється ліниво. На відміну від Ruby 3.1,
  RSS процесу Ruby мінімізовано, оскільки віртуальні сторінки пам'яті
  виділені `--yjit-exec-mem-size` не будуть відображені на фізичні
  сторінки пам'яті, поки вони не будуть фактично використані JIT кодом.
* Впроваджено Code GC, який звільняє всі сторінки коду, коли споживання пам'яті
  JIT кодом досягає `--yjit-exec-mem-size`.
    * RubyVM::YJIT.runtime_stats повертає метрики Code GC на додаток до
      існуючих ключів `inline_code_size` та `outlined_code_size`:
      `code_gc_count`, `live_page_count`, `freed_page_count`, та `freed_code_size`.
* Більшість статистики, що виробляється RubyVM::YJIT.runtime_stats, тепер доступна в release збірках.
    * Просто запустіть ruby з `--yjit-stats` для обчислення статистики (спричиняє деяку накладну витрату під час виконання).
* YJIT тепер оптимізовано для використання переваг форм об'єктів. [[Feature #18776]]
* Використовуйте переваги більш деталізованої інвалідації констант для інвалідації меншої кількості коду при визначенні нових констант. [[Feature #18589]]

### MJIT

* Компілятор MJIT реалізовано в Ruby як стандартна бібліотека `mjit`.
* Компілятор MJIT виконується під форкованим процесом Ruby замість
  виконання в нативному потоці, що називається MJIT worker. [[Feature #18968]]
    * В результаті Microsoft Visual Studio (MSWIN) більше не підтримується.
* MinGW більше не підтримується. [[Feature #18824]]
* Перейменувати `--mjit-min-calls` на `--mjit-call-threshold`.
* Змінити значення за замовчуванням `--mjit-max-cache` назад з 10000 на 100.

### PubGrub

* Bundler 2.4 тепер використовує резолвер [PubGrub](https://github.com/jhawthorn/pub_grub) замість [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub - це алгоритм вирішення наступного покоління, що використовується менеджером пакетів `pub` для мови програмування Dart.
  * Ви можете отримати інший результат резолюції після цієї зміни. Будь ласка, повідомте про такі випадки в [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)

* RubyGems все ще використовує резолвер Molinillo в Ruby 3.2. Ми плануємо замінити його на PubGrub у майбутньому.

## Інші помітні зміни з 3.1

* Hash
    * Hash#shift тепер завжди повертає nil, якщо хеш
      порожній, замість повернення значення за замовчуванням або
      виклику default proc. [[Bug #16908]]

* MatchData
    * MatchData#byteoffset додано. [[Feature #13110]]

* Module
    * Module.used_refinements додано. [[Feature #14332]]
    * Module#refinements додано. [[Feature #12737]]
    * Module#const_added додано. [[Feature #17881]]

* Proc
    * Proc#dup повертає екземпляр підкласу. [[Bug #17545]]
    * Proc#parameters тепер приймає ключове слово lambda. [[Feature #15357]]

* Refinement
    * Refinement#refined_class додано. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Додано опцію `error_tolerant` для `parse`, `parse_file` та `of`. [[Feature #19013]]

* Set
    * Set тепер доступний як вбудований клас без необхідності `require "set"`. [[Feature #16989]]
      Наразі він автоматично завантажується через константу `Set` або виклик `Enumerable#to_set`.

* String
    * String#byteindex та String#byterindex додано. [[Feature #13110]]
    * Оновлено Unicode до версії 15.0.0 та Emoji Version 15.0. [[Feature #18639]]
      (також застосовується до Regexp)
    * String#bytesplice додано.  [[Feature #18598]]

* Struct
    * Клас Struct також може ініціалізуватися з ключовими аргументами
      без `keyword_init: true` на `Struct.new` [[Feature #16806]]

## Проблеми сумісності

Примітка: Виключаючи виправлення помилок функцій.

### Видалені константи

Наступні застарілі константи видалено.

* `Fixnum` та `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Видалені методи

Наступні застарілі методи видалено.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Проблеми сумісності стандартної бібліотеки

### Більше не включаються джерела сторонніх розробників

* Ми більше не включаємо джерела сторонніх розробників, такі як `libyaml`, `libffi`.

    * Джерело libyaml видалено з psych. Вам може знадобитися встановити `libyaml-dev` на платформі Ubuntu/Debian. Назва пакета відрізняється для кожної платформи.

    * Включене джерело libffi також видалено з `fiddle`

* Psych та fiddle підтримували статичні збірки з конкретними версіями джерел libyaml та libffi. Ви можете зібрати psych з libyaml-0.2.5 так:

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    І ви можете зібрати fiddle з libffi-3.4.4 так:

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## Оновлення C API

### Оновлені C API

Наступні API оновлено.

* Оновлення PRNG
  `rb_random_interface_t` оновлено та версіоновано.
  Бібліотеки розширень, які використовують цей інтерфейс та зібрані для старіших версій.
  Також потрібно визначити функцію `init_int32`.

### Видалені C API

Наступні застарілі API видалено.

* Змінна `rb_cData`.
* Функції "taintedness" та "trustedness". [[Feature #16131]]

### Оновлення стандартної бібліотеки

*   Наступні геми за замовчуванням оновлено.
    * RubyGems 3.4.0.dev
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.0.dev
    * cgi 0.3.6
    * date 3.3.0
    * delegate 0.3.0
    * did_you_mean 1.6.2
    * digest 3.1.1
    * drb 2.1.1
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.1
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.5.11
    * io-nonblock 0.2.0
    * io-wait 0.3.0.pre
    * ipaddr 1.2.5
    * irb 1.5.1
    * json 2.6.2
    * logger 1.5.2
    * mutex_m 0.1.2
    * net-http 0.3.1
    * net-protocol 0.2.0
    * nkf 0.1.2
    * open-uri 0.3.0
    * openssl 3.1.0.pre
    * optparse 0.3.0
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.0
    * racc 1.6.1
    * rdoc 6.5.0
    * reline 0.3.1
    * resolv 0.2.2
    * securerandom 0.2.1
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 1.0.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * win32ole 1.8.9
    * zlib 3.0.0
*   Наступні включені геми оновлено.
    * minitest 5.16.3
    * power_assert 2.0.2
    * test-unit 3.5.5
    * net-ftp 0.2.0
    * net-imap 0.3.1
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.1
    * typeprof 0.21.3
    * debug 1.7.0

Див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
для більш детальної інформації.

З цими змінами, [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} додано(+), {{ release.stats.deletions }} видалено(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
з моменту Ruby 3.1.0!

## Завантаження

* <{{ release.url.gz }}>

      РОЗМІР: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      РОЗМІР: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      РОЗМІР: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Що таке Ruby

Ruby спочатку розроблено Matz (Yukihiro Matsumoto) у 1993 році,
і тепер розробляється як Open Source. Він працює на кількох платформах
і використовується по всьому світу, особливо для веб-розробки.




[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18639]: https://bugs.ruby-lang.org/issues/18639
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18589]: https://bugs.ruby-lang.org/issues/18589
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Feature #18776]: https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Bug #19100]:     https://bugs.ruby-lang.org/issues/19100
[Bug #19013]:     https://bugs.ruby-lang.org/issues/19013
