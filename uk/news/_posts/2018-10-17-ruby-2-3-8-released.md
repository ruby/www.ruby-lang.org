---
layout: news_post
title: "Вийшов Ruby 2.3.8"
author: "usa"
translator: "Andrii Furmanets"
date: 2018-10-17 17:00:00 +0000
lang: uk
---

Ruby 2.3.8 випущено.

Цей випуск включає кілька виправлень безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2018-16396: Прапорці tainted не поширюються в Array#pack та String#unpack з деякими директивами](/uk/news/2018/10/17/not-propagated-taint-flag-in-some-formats-of-pack-cve-2018-16396/)
* [CVE-2018-16395: Перевірка рівності OpenSSL::X509::Name працює неправильно](/uk/news/2018/10/17/openssl-x509-name-equality-check-does-not-work-correctly-cve-2018-16395/)

Цей випуск також включає не-безпекове виправлення для підтримки Visual Studio 2014
з Windows 10 October 2018 Update з причин обслуговування.

Ruby 2.3 тепер знаходиться в стані фази обслуговування безпеки, до
кінця березня 2019 року.  Після цієї дати обслуговування Ruby 2.3
буде закінчено. Ми рекомендуємо вам почати планувати міграцію до новіших
версій Ruby, таких як 2.5 або 2.4.

## Завантаження

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.bz2)

      РОЗМІР:   14418609 байтів
      SHA1:   91b31abdba00a346c155fd32bd32d3cec3b73bc4
      SHA256: 4d1a3a88e8cf9aea624eb73843fbfc60a9a281582660f86d5e4e00870397407c
      SHA512: 6d79e0d25757fd37188a8db3e630a52539bce7927fcb779a2ce9a97b9e5f330753035c16843552f1a1fb6c9a1e5c0f916b3cc8b5c0bfe81e20f35f8442e40ae8

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.gz)

      РОЗМІР:   17858806 байтів
      SHA1:   69311991a9cd2c8e3c86a0dbbaaf915ae91f0bec
      SHA256: b5016d61440e939045d4e22979e04708ed6c8e1c52e7edb2553cf40b73c59abf
      SHA512: 43b02f2f9de6baf281f09a49fd07367127b4de1fb14473380d06bfa7667990d8f722ae2d33cf7d15b02f7e799515f21aebd308897c4c2a5461ebab4049d6c7ef

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.xz)

      РОЗМІР:   11465792 байтів
      SHA1:   9771acdad851bbf0ef349bb7da5d0ffc91a860ed
      SHA256: 910f635d84fd0d81ac9bdee0731279e6026cb4cd1315bbbb5dfb22e09c5c1dfe
      SHA512: 06373050e6c1af9cb6a5863aef878b21c8a45fd0e68414e3d546cb73ec3028207d3acc0a9326428f172b9347a30bbe69a16f9dc0bdb739161d677adb2d888095

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.zip)

      РОЗМІР:   19911652 байтів
      SHA1:   ad9e0ec7c874701832c9e224eb5b9e2258f3a041
      SHA256: ec9792d0473a22954ad25cd0c531fc672679c1a5eaeefa08caf9e1288852796f
      SHA512: 732d69cd55f1c273a02005306720fd8fc9d77398177db9509452be31820976b54b30319d9e6bc36fb6bcd7af656f807ef6c26d8955012c8b20424912a2f51bf8

## Коментар до випуску

Дякую всім, хто допоміг з цим випуском.