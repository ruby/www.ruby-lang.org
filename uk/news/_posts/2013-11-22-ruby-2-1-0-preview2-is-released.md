---
layout: news_post
title: "Вийшов Ruby 2.1.0-preview2"
author: "nurse"
translator: "Andrii Furmanets"
date: 2013-11-22 22:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 2.1.0-preview2.
Будь ласка, протестуйте нові функції в Ruby 2.1 перед фінальним випуском!

## Помітні зміни з preview 1

* виправлення [Переповнення купи при парсингу чисел з плаваючою комою (CVE-2013-4164)](https://www.ruby-lang.org/uk/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/)
* "literal".freeze тепер оптимізовано [#9042](https://bugs.ruby-lang.org/issues/9042)
* суфікс f літералу рядка видалено [#9042](https://bugs.ruby-lang.org/issues/9042)
* виправлення проблеми споживання пам'яті на RGenGC ([r43532](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=43532) та [r43755](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=43755))
* додано Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* оновлено бібліотеки, такі як json, nkf, rake, RubyGems, та RDoc.

## Завантаження

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2)

      РОЗМІР:   11432454 байтів
      MD5:    9d566a9b2d2e7e35ad6125e2a14ce672
      SHA256: 780fddf0e3c8a219057d578e83367ecfac5e945054b9f132b3b93ded4802d1ce

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz)

      РОЗМІР:   14416029 байтів
      MD5:    ba2b95d174e156b417a4d580a452eaf5
      SHA256: a9b1dbc16090ddff8f6c6adbc1fd0473bcae8c69143cecabe65d55f95f6dbbfb

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip)

      РОЗМІР:   16110720 байтів
      MD5:    2ad1aa3d89ae32607cf14fc73b192de1
      SHA256: cc2f7f8e05daed716489e5480e6365a711a13ed7747dbc59e989a41fe2805076

## Зміни з 2.0

Помітні зміни:

* VM (кеш методів)
* RGenGC (Див. презентацію ko1 на [RubyKaigi](http://rubykaigi.org/2013/talk/S73) та [RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* зміни синтаксису
  * Літерал Rational/Complex [#8430](https://bugs.ruby-lang.org/issues/8430)
  * значення повернення def [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * використання 128bit цілих чисел [#8509](https://bugs.ruby-lang.org/issues/8509)
  * використання GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 та RubyGems 2.2.0.preview.2

Див. більше деталей змін: [NEWS в репозиторії Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

ko1 говорив про нові функції Ruby 2.1 на toruby: [Все про Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) написав хороше резюме у своєму блозі: [Що нового в Ruby 2.1?](http://rkh.im/ruby-2.1).

## Коментар до випуску

Відомі проблеми:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Див. також розклад випуску та іншу інформацію:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
