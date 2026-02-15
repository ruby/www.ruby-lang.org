---
layout: news_post
title: "Вийшов Ruby 2.1.9"
author: "usa"
translator: "Andrii Furmanets"
date: 2016-03-30 12:00:00 +0000
lang: uk
---

Ruby 2.1.9 випущено.

Цей випуск включає багато виправлень помилок.
Див. [ChangeLog](https://github.com/ruby/ruby/blob//v2_1_9/ChangeLog)
для деталей.

[Як було оголошено раніше](https://www.ruby-lang.org/uk/news/2016/02/24/support-plan-of-ruby-2-0-0-and-2-1/), це останній нормальний випуск серії Ruby 2.1.
Після цього випуску ми ніколи не будемо backport'ити жодних виправлень помилок до 2.1, крім виправлень безпеки.
Ми рекомендуємо вам почати планувати оновлення до Ruby 2.3 або 2.2.

До речі, ми плануємо випустити Ruby 2.1.10 через кілька днів.
Ruby 2.1.10 не включатиме жодних змін з 2.1.9, крім його номера версії.
Вам не потрібно використовувати його в продакшні, але ви повинні протестувати його, оскільки він має двозначний номер версії.

## Завантаження

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.bz2)

      РОЗМІР:   12016421 байтів
      SHA1:   39524185b580a3390a3b5019819c8b28d3249766
      SHA256: 4f21376aa11e09b499c3254bbd839e68e053c0d18e28d61c428a32347269036e
      SHA512: a86422132e4c64007a84a91696f4557bdcbc8716fbfe1962f1eef3754ee7f994f4de0b5b7e7231c25057515767040d5c4af33339750b6db15744662e9bd24f38

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.gz)

      РОЗМІР:   15166126 байтів
      SHA1:   dd68afc652fe542f83a9a709a74f4da2662054bf
      SHA256: 034cb9c50676d2c09b3b6cf5c8003585acea05008d9a29fa737c54d52c1eb70c
      SHA512: 1e03aa720e932f019c4651c355e8ef35b87fdf69b054c9d39a319467d2a8e5bfe4995cbacd9add36b832c77761a47c9d1040f00e856ad5888d69ec7221455e35

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.tar.xz)

      РОЗМІР:   9395648 байтів
      SHA1:   5e89efa5189c3def8ee8de18ce750a7e4a20ac32
      SHA256: 39f203f7498aed2456fb500147fada5adcbf102d89d4f6aca773ebcadd8ea82a
      SHA512: 1f331a8910fd7a9ab9c41bf56aef12041dd413ad49c696f6df2c9a7ec3a3d5cdf383f2a3d30949ea37b8ecb39f50355e526412b36ed4e07b60733d9db4d2bd14

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.9.zip)

      РОЗМІР:   16696728 байтів
      SHA1:   4aa288b65fbf12692ac53577adc561c9a0f6a6ca
      SHA256: 8610fdb1836d493c19600cfed4828083f85197096c0aea3f73fa1ed532cbb5a7
      SHA512: a212b6a58637f6bf4f456d7ecc7bbd8ceaa0c3f16cb844b872eb62eaf261b5874fdb79705241d05a356fcdc1d3fdd8a94fcd8e6ca62190e9f544c8f45a9f41af

## Коментар до випуску

Дякую всім, хто допоміг з цим випуском.

Обслуговування Ruby 2.1, включаючи цей випуск, базується на "Угоді для стабільної версії Ruby" [Ruby Association](http://www.ruby.or.jp/).
