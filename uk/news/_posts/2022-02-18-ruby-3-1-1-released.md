---
layout: news_post
title: "Вийшов Ruby 3.1.1"
author: "naruse"
translator: "Andrii Furmanets"
date: 2022-02-18 12:00:00 +0000
lang: uk
---

Ruby 3.1.1 випущено.

Це перший TEENY випуск стабільної серії 3.1.

* [error_highlight не працює для опції -e](https://bugs.ruby-lang.org/issues/18434)
* [Виправлено YJIT передачу аргументів методу в неправильному порядку, коли ключовий аргумент та аргументи за замовчуванням змішані. Ламає Rails collection caching](https://bugs.ruby-lang.org/issues/18453)
* [Segmentation fault, коли відсутній метод Warning#warn](https://bugs.ruby-lang.org/issues/18458)
* [Виправлено Pathname dot directory globbing](https://bugs.ruby-lang.org/issues/18436)
* [Виправлено default --jit-max-cache в ruby --help](https://bugs.ruby-lang.org/issues/18469)
* [3.1.0-dev `include` спричиняє позначення Module як ініціалізованого](https://bugs.ruby-lang.org/issues/18292)
* [Посилання Tutorial для Optionparser зламане](https://bugs.ruby-lang.org/issues/18468)
* [Yielding елемента для Enumerator в іншому потоці дампує core](https://bugs.ruby-lang.org/issues/18475)
* [Segmentation fault з ruby 3.1.0 в `active_decorator`](https://bugs.ruby-lang.org/issues/18489)
* [Segfault при використанні Process.daemon в Fiber](https://bugs.ruby-lang.org/issues/18497)
* [0 << (2\*\*40) є NoMemoryError, але 0 << (2\*\*80) є 0](https://bugs.ruby-lang.org/issues/18517)
* [Виправлення помилок IO read/write/wait hook.](https://bugs.ruby-lang.org/issues/18443)
* [Витік пам'яті при аліасингу методу до себе](https://bugs.ruby-lang.org/issues/18516)
* [error: use of undeclared identifier 'MAP_ANONYMOUS'](https://bugs.ruby-lang.org/issues/18556)
* [\[BUG\] try to mark T_NONE object in RubyVM::InstructionSequence. load_from_binary](https://bugs.ruby-lang.org/issues/18501)
* [throw_data передається до rescue через require](https://bugs.ruby-lang.org/issues/18562)
* [Виправлено `IpAddr#to_range` на заморожених екземплярах `IpAddr`.](https://bugs.ruby-lang.org/issues/18570)
* [Виправлено шлях для ipaddr.rb](https://github.com/ruby/ruby/pull/5533)
* [Об'єднано RubyGems-3.3.7 та Bundler-2.3.7](https://github.com/ruby/ruby/pull/5543)
* [Зависання при повторенні Hash#shift проти порожнього Hash](https://bugs.ruby-lang.org/issues/18578)

Див. [логи комітів](https://github.com/ruby/ruby/compare/v3_1_0...v3_1_1) для подальших деталей.

## Завантаження

{% assign release = site.data.releases | where: "version", "3.1.1" | first %}

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

## Коментар до випуску

Багато комітерів, розробників та користувачів, які надали звіти про помилки, допомогли нам зробити цей випуск.
Дякую за їхній внесок.