---
layout: news_post
title: "Вийшов Ruby 3.2.0 Preview 1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2022-04-03 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview1" | first %}

Ми раді оголосити випуск Ruby {{ release.version }}. Ruby 3.2 додає багато функцій та покращень продуктивності.


## Підтримка WASI на основі WebAssembly

Це початковий порт підтримки WASI на основі WebAssembly. Це дозволяє бінарному файлу CRuby бути доступним у веб-браузері, середовищі Serverless Edge та інших вбудовувачах WebAssembly/WASI. Зараз цей порт проходить базові та bootstrap тестові набори, які не використовують Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Передісторія

[WebAssembly (Wasm)](https://webassembly.org/) спочатку введено для запуску програм безпечно та швидко у веб-браузерах. Але його мета - запуск програм ефективно з безпекою на різних середовищах - довго бажана не лише вебом, але й загальними додатками.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) розроблено для таких випадків використання. Хоча такі додатки потребують спілкування з операційними системами, WebAssembly працює на віртуальній машині, яка не мала системного інтерфейсу. WASI стандартизує це.

Підтримка WebAssembly/WASI в Ruby має на меті використати ці проекти. Вона дозволяє розробникам Ruby писати додатки, які працюють на такій обіцяній платформі.

### Випадок використання

Ця підтримка дозволяє розробникам використовувати CRuby в середовищі WebAssembly. Приклад випадку використання - підтримка CRuby [TryRuby playground](https://try.ruby-lang.org/playground/). Тепер ви можете спробувати оригінальний CRuby у вашому веб-браузері.

### Технічні моменти

Сьогоднішні WASI та WebAssembly самі мають деякі відсутні функції для реалізації Fiber, винятків та GC, оскільки вони все ще розвиваються, а також з міркувань безпеки. Тому CRuby заповнює прогалину, використовуючи Asyncify, який є технікою бінарного перетворення для контролю виконання в userland.

Крім того, ми побудували [VFS поверх WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby), щоб ми могли легко упакувати додатки Ruby в один .wasm файл. Це робить розповсюдження додатків Ruby трохи простішим.


### Пов'язані посилання

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Regexp timeout

Введено функцію таймауту для зіставлення Regexp.

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError піднімається за одну секунду
```

Відомо, що зіставлення Regexp може зайняти несподівано довго. Якщо ваш код намагається зіставити можливо неефективний Regexp з ненадійним вводом, зловмисник може використати це для ефективної Denial of Service (так звана Regular expression DoS, або ReDoS).

Ризик DoS може бути запобігнутий або значно пом'якшений налаштуванням `Regexp.timeout` відповідно до вимог вашого додатку Ruby. Будь ласка, спробуйте це у вашому додатку та вітаємо ваш відгук.

Зауважте, що `Regexp.timeout` є глобальною конфігурацією. Якщо ви хочете використовувати різні налаштування таймауту для деяких спеціальних Regexps, ви можете використати ключове слово `timeout` для `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# Цей regexp не має таймауту
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # ніколи не переривається
```

Оригінальна пропозиція: https://bugs.ruby-lang.org/issues/17837


## Інші помітні нові функції

### Більше не включати джерела 3-х сторін

* Ми більше не включаємо джерела 3-х сторін, такі як `libyaml`, `libffi`.

    * Джерело libyaml було видалено з psych. Вам може знадобитися встановити `libyaml-dev` на платформі Ubuntu/Debian. Назва пакета може відрізнятися на інших платформах.

    * libffi буде видалено з `fiddle` на preview2

### Мова

* Find pattern більше не є експериментальним.


## Покращення продуктивності



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


### Оновлення стандартних бібліотек

*   Наступні default gem оновлено.

    * TBD

*   Наступні включені gems оновлено.

    * TBD

*   Наступні default gems тепер є bundled gems. Вам потрібно додати наступні бібліотеки до `Gemfile` в середовищі bundler.

    * TBD

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