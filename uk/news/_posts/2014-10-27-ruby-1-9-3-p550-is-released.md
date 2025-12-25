---
layout: news_post
title: "Вийшов Ruby 1.9.3-p550"
author: "usa"
translator: "Andrii Furmanets"
date: 2014-10-27 12:00:00 +0000
lang: uk
---

Ми раді оголосити випуск Ruby 1.9.3-p550.

Цей випуск включає виправлення безпеки для вразливості DoS REXML.

* [CVE-2014-8080: Відмова в обслуговуванні розширення XML](https://www.ruby-lang.org/uk/news/2014/10/27/rexml-dos-cve-2014-8080/)

Цей випуск також включає зміну налаштувань за замовчуванням ext/openssl.
Небезпечні опції SSL/TLS тепер вимкнено за замовчуванням.

* [Змінено налаштування за замовчуванням ext/openssl](https://www.ruby-lang.org/uk/news/2014/10/27/changing-default-settings-of-ext-openssl/)

І, крім того, включений jQuery для шаблону darkfish RDoc також оновлено.


## Примітка

Ruby 1.9.3 тепер знаходиться в фазі обслуговування безпеки.
Це означає, що ми ніколи не виправляємо помилки, крім проблем безпеки.
І, на цей час, кінець обслуговування 1.9.3 заплановано на лютого наступного року.
Ми рекомендуємо, щоб користувачі Ruby 1.9.3 мігрували до новішої версії якнайшвидше.


## Завантаження

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p550.tar.bz2](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p550.tar.bz2)

      РОЗМІР:   10053787 байтів
      MD5:    c2169c8b14ccefd036081aba5ffa96da
      SHA256: d3da003896db47fb10ba4d2e0285eea7fe8cdc785b86c02ebad5bc9cdeaa4748
      SHA512: 38767e98df25484f7292437f3cb0f798b3a43e9a7414a5401677e96ad1cc367cb3fa23ac3abe568d5bf2b2ca553713469a8770d41b79bc63daf3fa59cb4e15c6

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p550.tar.gz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p550.tar.gz)

      РОЗМІР:   12605180 байтів
      MD5:    e05135be8f109b2845229c4f47f980fd
      SHA256: d6cf008d9f3a9aeed2ef04428f19d66e28aed8a71456f7edba68627d3302cd6b
      SHA512: 420d4f9fe027ffc3ec5cc4ea19cf6e1f1473199ee4af06ef364c08f4a04bf65e253b32e76f37370b8e56ad2e26d0c09e6fa5b1f7c0b407b0c68b63acd2cce975

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p550.tar.xz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p550.tar.xz)

      РОЗМІР:   7714228 байтів
      MD5:    c0261155faec6cfc9aa16790ee56448f
      SHA256: c87f04392010ec7f01b12dcbb6d985c61d5f481e71d2a7b25b5f1e72d2d61faa
      SHA512: cd68e60e01c31642fac08d88846dd8ce9ba287d8322f779490a4e016611090af0cbdee5be4ac611c5468cab90c6a2cdfe2a08c0c05106b6fe61c1253e49273d5

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p550.zip](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p550.zip)

      РОЗМІР:   13987149 байтів
      MD5:    4946e5f3d083894372a7a46342e885f7
      SHA256: 6e7eceddca615c19f81c125f9864de3570b9687df858cfb27298d867521d5beb
      SHA512: 0daa8fafa950f1e6ddf79815a615c7d730d234042718bd70e8211e4c23d7cc93126c924ad42673844c3a8cb908bf02a8d03ae2857658a027935f46c13bb17a13

## Коментар до випуску

Я вдячний усім, хто підтримує Ruby.
Дякую.