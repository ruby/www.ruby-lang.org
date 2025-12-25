---
layout: news_post
title: "Вийшов Ruby 2.4.4"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2018-03-28 17:10:00 +0000
lang: uk
---

Ruby 2.4.4 випущено.

Цей випуск включає деякі виправлення помилок та деякі виправлення безпеки.

* [CVE-2017-17742: Розділення HTTP відповіді в WEBrick](/uk/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/)
* [CVE-2018-6914: Ненавмисне створення файлу та директорії з обходом директорії в tempfile та tmpdir](/uk/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/)
* [CVE-2018-8777: DoS великим запитом в WEBrick](/uk/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/)
* [CVE-2018-8778: Недочитування буфера в String#unpack](/uk/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/)
* [CVE-2018-8779: Ненавмисне створення сокету через отруєний NUL байт в UNIXServer та UNIXSocket](/uk/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/)
* [CVE-2018-8780: Ненавмисний обхід директорії через отруєний NUL байт в Dir](/uk/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/)
* [Множинні вразливості в RubyGems](/uk/news/2018/02/17/multiple-vulnerabilities-in-rubygems/)


Також є деякі виправлення помилок.
Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_4_3...v2_4_4) для більше деталей.

## Завантаження

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.4.tar.bz2>

      РОЗМІР:   12659705 байтів
      SHA1:   1cc548ba3eb821e29ab92ac13e1d5c7bf23b1526
      SHA256: 45a8de577471b90dc4838c5ef26aeb253a56002896189055a44dc680644243f1
      SHA512: ae632852a5f413561d8134e9ef3bb82adb37317696dd293ef92cb76709ecd45718f14116ecce35b12f1c2dd53ccae8dabc7a924a270072b697512d11f4922347

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.4.tar.gz>

      РОЗМІР:   14225338 байтів
      SHA1:   ec82b0d53bd0adad9b19e6b45e44d54e9ec3f10c
      SHA256: 254f1c1a79e4cc814d1e7320bc5bdd995dc57e08727d30a767664619a9c8ae5a
      SHA512: fa1f6d3a4856046d4f9c3e652be225ae67f3e9ff0d117b6ed327d58cfb717fb9b1ce81d06a3302e486e7da0b5f67b16341666ceb02a554a428d221d008263ed8

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.4.tar.xz>

      РОЗМІР:   10049304 байтів
      SHA1:   0eac83a0818e1d6bc661abd9f90457cff8868cff
      SHA256: 1d0034071d675193ca769f64c91827e5f54cb3a7962316a41d5217c7bc6949f0
      SHA512: 4dc112a149273d4221484ccbf1260c6c5fcad7e0a6e4bc91e4ef69cbc093d3191f7abd71420f80d680f8ea5d111e6803ba2af32166aa501913639e6d5696fde0

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.4.zip>

      РОЗМІР:   15685143 байтів
      SHA1:   4ac11e6915c168a235b854014aa2a0d540cabd68
      SHA256: d0ca0561be0045f2e094f2ba94f1585e66e9c1e91fe6de3f3035f4d67dce7650
      SHA512: 79b655fda332d44097e108a76c4ff74f16930cd3ef3951c7988df325781aa0b3e724697107d964735f31a2457a835f08fa72c4eadd5ef7d3ccc1e6c9185f37e3

## Коментар до випуску

Багато комітерів, розробників та користувачів, які надали звіти про помилки, допомогли
нам зробити цей випуск.
Дякую за їхній внесок.