---
layout: news_post
title: "Вийшов Ruby 3.3.0-preview2"
author: "naruse"
translator: "Andrii Furmanets"
date: 2023-09-14 00:00:00 +0000
lang: uk
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview2" | first %}

Раді повідомити про вихід Ruby {{ release.version }}. Ruby 3.3 додає новий чистий Ruby JIT компілятор під назвою RJIT, використовує Lrama як генератор парсерів та багато покращень продуктивності, особливо YJIT.

## RJIT

* Впроваджено чистий Ruby JIT компілятор RJIT та замінено MJIT.
  * RJIT підтримує лише архітектуру x86\_64 на платформах Unix.
  * На відміну від MJIT, він не потребує компілятора C під час виконання.
* RJIT існує лише для експериментальних цілей.
  * Ви повинні продовжувати використовувати YJIT у виробництві.
* Якщо зацікавлені у розробці JIT для Ruby, будь ласка, перегляньте [презентацію k0kubun на День 3 RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Використання Lrama замість Bison

* Заміна Bison на [генератор парсерів Lrama LALR](https://github.com/yui-knk/lrama) [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * Якщо зацікавлені, будь ласка, перегляньте [Майбутнє бачення Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)

## YJIT

* Значні покращення продуктивності порівняно з 3.2
  * Підтримка splat та rest аргументів покращена.
  * Регістри виділяються для операцій стеку віртуальної машини.
  * Більше викликів з опціональними аргументами компілюється.
  * Обробники винятків також компілюються.
  * Змінні екземпляра більше не виходять до інтерпретатора
    з мегаморфними формами об'єктів.
  * Непідтримувані типи викликів більше не виходять до інтерпретатора.
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===` спеціально оптимізовані.
  * Тепер більш ніж у 3 рази швидше за інтерпретатор на optcarrot!
* Метадані для скомпільованого коду використовують набагато менше пам'яті.
* Генерується більш компактний код на ARM64
* Опція запуску YJIT в режимі паузи, а потім увімкнення вручну
  * `--yjit-pause` та `RubyVM::YJIT.resume`
  * Це може використовуватися для увімкнення YJIT лише після того, як ваш застосунок завершить завантаження
* Статистика `ratio_in_yjit`, створена `--yjit-stats`, тепер доступна в release збірках,
  більше не потрібна спеціальна stats або dev збірка.
* Опція трасування виходів тепер підтримує вибірку
  * `--trace-exits-sample-rate=N`
* Більш ретельне тестування та кілька виправлень помилок



## Інші помітні нові можливості

### Мова



## Покращення продуктивності

* `defined?(@ivar)` оптимізовано з Object Shapes.

## Інші помітні зміни з версії 3.2

### IRB

IRB отримав кілька покращень, включаючи, але не обмежуючись:

- Розширена інтеграція `irb:rdbg`, яка забезпечує еквівалентний досвід налагодження до `pry-byebug` ([doc](https://github.com/ruby/irb#debugging-with-irb)).
- Підтримка пейджера для команд, таких як `ls` та `show_cmds`.
- Більш точна та корисна інформація, надана командами `ls` та `show_source`.

Крім того, IRB також пройшов значний рефакторинг та отримав десятки виправлень помилок для полегшення майбутніх покращень.

## Проблеми сумісності

Примітка: Виключаючи виправлення помилок функцій.

### Видалені константи

Наступні застарілі константи видалено.



### Видалені методи

Наступні застарілі методи видалено.



## Проблеми сумісності стандартної бібліотеки

### `ext/readline` виведено з експлуатації

* У нас є `reline`, яка є чистою реалізацією Ruby, сумісною з API `ext/readline`. Ми покладаємося на `reline` у майбутньому. Якщо вам потрібно використовувати `ext/readline`, ви можете встановити `ext/readline` через rubygems.org за допомогою `gem install readline-ext`.
* Нам більше не потрібно встановлювати бібліотеки, такі як `libreadline` або `libedit`.

## Оновлення C API

### Оновлені C API

Наступні API оновлено.



### Видалені C API

Наступні застарілі API видалено.



## Оновлення стандартної бібліотеки

RubyGems та Bundler попереджають, якщо користувачі роблять `require` gem, який заплановано стати bundled gems у майбутній версії Ruby.

Оновлено наступні default gems.

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.8
* erb 4.0.3
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.7.4
* nkf 0.1.3
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.8
* stringio 3.0.9
* strscan 3.0.7
* syntax_suggest 1.1.0
* time 0.2.2
* timeout 0.4.0
* uri 0.12.2
* yarp 0.9.0

Оновлено наступні bundled gems.

* minitest 5.19.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-imap 0.3.7
* rbs 3.2.1
* typeprof 0.21.8
* debug 1.8.0

Наступний default gem тепер bundled.

* racc 1.7.1

Див. GitHub releases, такі як [Logger](https://github.com/ruby/logger/releases), або
changelog для деталей default gems або bundled gems.

Див. [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
або [журнали комітів](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})
для подробиць.

Унаслідок цих змін [{{ release.stats.files_changed }} файлів змінено, {{ release.stats.insertions }} вставок(+), {{ release.stats.deletions }} видалень(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
з часу Ruby 3.2.0!


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
