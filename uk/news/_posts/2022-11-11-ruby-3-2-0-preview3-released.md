---
layout: news_post
title: "Вийшов Ruby 3.2.0 Preview 3"
author: "naruse"
translator: "Andrii Furmanets"
date: 2022-11-11 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview3" | first %}

Ми раді оголосити випуск Ruby {{ release.version }}. Ruby 3.2 додає багато функцій та покращень продуктивності.


## Підтримка WASI на основі WebAssembly

Це початковий порт підтримки WASI на основі WebAssembly. Це дозволяє бінарному файлу CRuby бути доступним у веб-браузері, середовищі Serverless Edge та інших вбудовувачах WebAssembly/WASI. Зараз цей порт проходить базові та bootstrap тестові набори, які не використовують Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Передісторія

[WebAssembly (Wasm)](https://webassembly.org/) спочатку введено для запуску програм безпечно та швидко у веб-браузерах. Але його мета - запуск програм ефективно з безпекою на різних середовищах - довго бажана не лише вебом, але й загальними додатками.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) розроблено для таких випадків використання. Хоча такі додатки потребують спілкування з операційними системами, WebAssembly працює на віртуальній машині, яка не мала системного інтерфейсу. WASI стандартизує це.

Підтримка WebAssembly/WASI в Ruby має на меті використати ці проекти. Вона дозволяє розробникам Ruby писати додатки, які працюють на такій обіцяній платформі.

### Випадок використання

Ця підтримка заохочує розробників використовувати CRuby в середовищі WebAssembly. Приклад випадку використання - підтримка CRuby [TryRuby playground](https://try.ruby-lang.org/playground/). Тепер ви можете спробувати оригінальний CRuby у вашому веб-браузері.

### Технічні моменти

Сьогоднішні WASI та WebAssembly самі мають деякі відсутні функції для реалізації Fiber, винятків та GC, оскільки вони все ще розвиваються, а також з міркувань безпеки. Тому CRuby заповнює прогалину, використовуючи Asyncify, який є технікою бінарного перетворення для контролю виконання в userland.

Крім того, ми побудували [VFS поверх WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby), щоб ми могли легко упакувати додатки Ruby в один .wasm файл. Це робить розповсюдження додатків Ruby трохи простішим.


### Пов'язані посилання

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Покращення Regexp проти ReDoS

Відомо, що зіставлення Regexp може зайняти несподівано довго. Якщо ваш код намагається зіставити можливо неефективний Regexp з ненадійним вводом, зловмисник може використати це для ефективної Denial of Service (так звана Regular expression DoS, або ReDoS).

Ми ввели два покращення, які значно пом'якшують ReDoS.

### Покращений алгоритм зіставлення Regexp

З Ruby 3.2, алгоритм зіставлення Regexp значно покращено, використовуючи техніку мемоізації.

```
# Це зіставлення займає 10 сек. в Ruby 3.1, та 0.003 сек. в Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

Покращений алгоритм зіставлення дозволяє більшості зіставлень Regexp (близько 90% у наших експериментах) завершуватися за лінійний час.

(Для користувачів preview: ця оптимізація може споживати пам'ять пропорційно довжині вводу для кожного зіставлення. Ми очікуємо, що практичних проблем не виникне, оскільки це виділення пам'яті зазвичай відкладене, і нормальне зіставлення Regexp повинно споживати максимум у 10 разів більше пам'яті, ніж довжина вводу. Якщо у вас закінчується пам'ять при зіставленні Regexps у реальному додатку, будь ласка, повідомте про це.)

Оригінальна пропозиція: <https://bugs.ruby-lang.org/issues/19104>

### Regexp timeout

Оптимізація вище не може бути застосована до деяких видів регулярних виразів, таких як включення розширених функцій (наприклад, back-references або look-around), або з великою фіксованою кількістю повторень. Як запасна міра, також введено функцію таймауту для зіставлення Regexp.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError піднімається за одну секунду
```

Зауважте, що `Regexp.timeout` є глобальною конфігурацією. Якщо ви хочете використовувати різні налаштування таймауту для деяких спеціальних Regexps, ви можете використати ключове слово `timeout` для `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Цей regexp не має таймауту
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # ніколи не переривається
```

Оригінальна пропозиція: <https://bugs.ruby-lang.org/issues/17837>

## Інші помітні нові функції

### Більше не включати джерела 3-х сторін

* Ми більше не включаємо джерела 3-х сторін, такі як `libyaml`, `libffi`.

    * Джерело libyaml було видалено з psych. Вам може знадобитися встановити `libyaml-dev` на платформі Ubuntu/Debian. Назва пакета відрізняється на кожній платформі.

    * Включене джерело libffi також видалено з `fiddle`

### Мова

* Анонімні rest та keyword rest аргументи тепер можуть передаватися як
  аргументи, замість просто використання в параметрах методу.
  [[Функція #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Proc, який приймає один позиційний аргумент та ключові слова, більше
  не буде автоплітуватися. [[Помилка #18633]]

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
  до констант використовується порядок оцінки зліва направо. З цим
  кодом:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Тепер використовується наступний порядок оцінки:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Помилка #15928]]

* Find pattern більше не є експериментальним.
  [[Функція #18585]]

* Методи, які приймають rest параметр (як `*args`) та бажають делегувати ключові
  аргументи через `foo(*args)`, тепер повинні бути позначені `ruby2_keywords`
  (якщо це ще не так). Іншими словами, всі методи, які бажають делегувати
  ключові аргументи через `*args`, тепер повинні бути позначені `ruby2_keywords`,
  без винятку. Це зробить легшим перехід до інших способів
  делегації, коли бібліотека може вимагати Ruby 3+. Раніше прапорець `ruby2_keywords`
  зберігався, якщо метод, що приймає, приймав `*args`, але це була помилка та
  неузгодженість. Хороша техніка для знаходження потенційно відсутніх `ruby2_keywords`
  - це запустити тестовий набір, для місця, де він не проходить, знайти останній метод, який повинен
  приймати ключові аргументи, використати `puts nil, caller, nil` там, та перевірити кожен
  метод/блок у ланцюжку викликів, який повинен делегувати ключові слова, правильно позначений
  як `ruby2_keywords`. [[Помилка #18625]] [[Помилка #16466]]

    ```ruby
    def target(**kw)
    end

    # Випадково працювало без ruby2_keywords в Ruby 2.7-3.1, ruby2_keywords
    # потрібен в 3.2+. Так само як (*args, **kwargs) або (...) були б потрібні на
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

* Підтримка arm64 / aarch64 на UNIX платформах.
* Збірка YJIT вимагає Rust 1.58.1+. [[Функція #18481]]

## Інші помітні зміни з 3.1

* Hash
    * Hash#shift тепер завжди повертає nil, якщо hash
      порожній, замість повернення значення за замовчуванням або
      виклику default proc. [[Помилка #16908]]

* MatchData
    * MatchData#byteoffset додано. [[Функція #13110]]

* Module
    * Module.used_refinements додано. [[Функція #14332]]
    * Module#refinements додано. [[Функція #12737]]
    * Module#const_added додано. [[Функція #17881]]

* Proc
    * Proc#dup повертає екземпляр підкласу. [[Помилка #17545]]
    * Proc#parameters тепер приймає ключове слово lambda. [[Функція #15357]]

* Refinement
    * Refinement#refined_class додано. [[Функція #12737]]

* RubyVM::AbstractSyntaxTree
    * Додано опцію `error_tolerant` для `parse`, `parse_file` та `of`. [[Функція #19013]]

* Set
    * Set тепер доступний як вбудований клас без необхідності `require "set"`. [[Функція #16989]]
      Він зараз автозавантажується через константу `Set` або виклик `Enumerable#to_set`.

* String
    * String#byteindex та String#byterindex додано. [[Функція #13110]]
    * Оновлено Unicode до Версії 14.0.0 та Emoji Версії 14.0. [[Функція #18037]]
      (також застосовується до Regexp)
    * String#bytesplice додано.  [[Функція #18598]]

* Struct
    * Клас Struct також може бути ініціалізований з ключовими аргументами
      без `keyword_init: true` на `Struct.new` [[Функція #16806]]

## Проблеми сумісності

Примітка: Виключаючи виправлення помилок функцій.

### Видалені константи

Наступні застарілі константи видалено.

* `Fixnum` та `Bignum` [[Функція #12005]]
* `Random::DEFAULT` [[Функція #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Видалені методи

Наступні застарілі методи видалено.

* `Dir.exists?` [[Функція #17391]]
* `File.exists?` [[Функція #17391]]
* `Kernel#=~` [[Функція #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Функція #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Функція #16131]]

## Проблеми сумісності Stdlib

* `Psych` більше не включає джерела libyaml.
  Користувачі повинні встановити бібліотеку libyaml самостійно через систему
  пакетів. [[Функція #18571]]

## Оновлення C API

### Оновлені C API

Наступні API оновлено.

* Оновлення PRNG
  `rb_random_interface_t` оновлено та версіоновано.
  Бібліотеки розширень, які використовують цей інтерфейс та зібрані для старіших версій.
  Також функція `init_int32` повинна бути визначена.

### Видалені C API

Наступні застарілі API видалено.

* Змінна `rb_cData`.
* Функції "taintedness" та "trustedness". [[Функція #16131]]

### Оновлення стандартних бібліотек

* SyntaxSuggest

  * Функція `syntax_suggest` раніше `dead_end` інтегрована в Ruby.
    [[Функція #18159]]

* ErrorHighlight
  * Тепер він вказує аргумент(и) TypeError та ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

*   Наступні default gems оновлено.
    * RubyGems 3.4.0.dev
    * bigdecimal 3.1.2
    * bundler 2.4.0.dev
    * cgi 0.3.2
    * date 3.2.3
    * error_highlight 0.4.0
    * etc 1.4.0
    * io-console 0.5.11
    * io-nonblock 0.1.1
    * io-wait 0.3.0.pre
    * ipaddr 1.2.4
    * json 2.6.2
    * logger 1.5.1
    * net-http 0.2.2
    * net-protocol 0.1.3
    * ostruct 0.5.5
    * psych 5.0.0.dev
    * reline 0.3.1
    * securerandom 0.2.0
    * set 1.0.3
    * stringio 3.0.3
    * syntax_suggest 0.0.1
    * timeout 0.3.0
*   Наступні включені gems оновлено.
    * minitest 5.16.3
    * net-imap 0.2.3
    * rbs 2.6.0
    * typeprof 0.21.3
    * debug 1.6.2
*   Наступні default gems тепер є bundled gems.

Див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [логи комітів](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
для більше деталей.

З цими змінами, [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} додано(+), {{ release.stats.deletions }} видалено(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
з Ruby 3.1.0!

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

Ruby вперше розроблено Matz (Yukihiro Matsumoto) у 1993 році,
і зараз розробляється як Open Source. Він працює на кількох платформах
та використовується по всьому світу, особливо для веб-розробки.




[Функція #12005]: https://bugs.ruby-lang.org/issues/12005
[Функція #12655]: https://bugs.ruby-lang.org/issues/12655
[Функція #12737]: https://bugs.ruby-lang.org/issues/12737
[Функція #13110]: https://bugs.ruby-lang.org/issues/13110
[Функція #14332]: https://bugs.ruby-lang.org/issues/14332
[Функція #15231]: https://bugs.ruby-lang.org/issues/15231
[Функція #15357]: https://bugs.ruby-lang.org/issues/15357
[Помилка #15928]:     https://bugs.ruby-lang.org/issues/15928
[Функція #16131]: https://bugs.ruby-lang.org/issues/16131
[Помилка #16466]:     https://bugs.ruby-lang.org/issues/16466
[Функція #16806]: https://bugs.ruby-lang.org/issues/16806
[Помилка #16889]:     https://bugs.ruby-lang.org/issues/16889
[Помилка #16908]:     https://bugs.ruby-lang.org/issues/16908
[Функція #16989]: https://bugs.ruby-lang.org/issues/16989
[Функція #17351]: https://bugs.ruby-lang.org/issues/17351
[Функція #17391]: https://bugs.ruby-lang.org/issues/17391
[Помилка #17545]:     https://bugs.ruby-lang.org/issues/17545
[Функція #17881]: https://bugs.ruby-lang.org/issues/17881
[Функція #18037]: https://bugs.ruby-lang.org/issues/18037
[Функція #18159]: https://bugs.ruby-lang.org/issues/18159
[Функція #18351]: https://bugs.ruby-lang.org/issues/18351
[Помилка #18487]:     https://bugs.ruby-lang.org/issues/18487
[Функція #18571]: https://bugs.ruby-lang.org/issues/18571
[Функція #18585]: https://bugs.ruby-lang.org/issues/18585
[Функція #18598]: https://bugs.ruby-lang.org/issues/18598
[Помилка #18625]:     https://bugs.ruby-lang.org/issues/18625
[Помилка #18633]:     https://bugs.ruby-lang.org/issues/18633
[Функція #18685]: https://bugs.ruby-lang.org/issues/18685
[Помилка #18782]:     https://bugs.ruby-lang.org/issues/18782
[Функція #18788]: https://bugs.ruby-lang.org/issues/18788
[Функція #18809]: https://bugs.ruby-lang.org/issues/18809
[Функція #18481]: https://bugs.ruby-lang.org/issues/18481
[Помилка #19100]:     https://bugs.ruby-lang.org/issues/19100
[Функція #19013]: https://bugs.ruby-lang.org/issues/19013
