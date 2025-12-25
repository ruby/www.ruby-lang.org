---
layout: news_post
title: "Вийшов Ruby 2.1.0-preview1"
author: "nurse"
translator: "Andrii Furmanets"
date: 2013-09-23 07:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.1.0-preview1.
Будь ласка, перевірте нові функції в Ruby 2.1 перед фінальним випуском!

## Завантаження

Ми рекомендуємо використовувати
[https://cache.ruby-lang.org/pub/ruby/2.1/](https://cache.ruby-lang.org/pub/ruby/2.1/)
через Fastly.

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2)

      РОЗМІР:   11475553 байтів
      MD5:    d32d1ea23988399afadbd21c5a7a37fc
      SHA256: 860b90d28b214393fd9d77ac2ad65b384d8249cd59b658c668cf0c7bad1db341

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz)

      РОЗМІР:   14449544 байтів
      MD5:    9df4f546f6b961895ba58a8afdf857da
      SHA256: 747472fb33bcc529f1000e5320605a7e166a095d3805520b989e73b33c05b046

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip)

      РОЗМІР:   16124069 байтів
      MD5:    f9bc3f9a10174a022381ce2c60a59e64
      SHA256: 28855621f7d364277e7f258d5cc380e005896ef8ebc36e5cbf78d2bf763c291b

## Зміни

Помітні зміни:

* VM (кеш методів)
* RGenGC (Див. презентацію ko1 на [RubyKaigi](http://rubykaigi.org/2013/talk/S73) та [EuRuKo](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf))
* refinements
* синтаксис
  * Десятковий літерал
  * Заморожений літерал рядка
* значення повернення def
* Bignum
  * 128bit
  * GMP
* String#scrub
* Socket.getifaddrs
* новий RubyGems

Див. більше деталей змін: [NEWS в репозиторії Ruby (WIP)](https://github.com/ruby/ruby/blob/trunk/NEWS).

ko1 представив презентацію toruby: [Резюме Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) написав хороше резюме у своєму блозі: [Що нового в Ruby 2.1?](http://rkh.im/ruby-2.1).

## Коментар до випуску

Відомі проблеми:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Див. також розклад випуску та іншу інформацію:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)

