---
layout: news_post
title: "Излезе Ruby 2.3.0-preview2"
author: "naruse"
translator: "Georgi Mitrev"
date: 2015-12-11 14:00:00 +0000
lang: bg
---

Радваме се да обявим излизането на Ruby 2.3.0-preview2.

Това е вторият предварителен преглед на Ruby 2.3.0, който включва
много новости и подобрения.

Първата голяма новост е добавянето на [Frozen String Literal](
https://bugs.ruby-lang.org/issues/11473). В Ruby 2.1 `"str".freeze`
е оптимизирано да намали броят на алокациите. Ruby 2.3 въвежда
нов 'магически' коментар и опция, чрез които може да се обявят всички
'string literals' във входните файлове. При дебъгване може да се подава
опцията `--debug=frozen-string-literal`, която ще помогне при намирането
на стрингове при получаване на `"can't modify frozen String"` грешки.

Другата голяма новост е добавянето на [Safe Navigation Operator](
https://bugs.ruby-lang.org/issues/11537), който позволява
`obj && obj.foo` да бъде заместено от `obj&.foo`. Подобни оператори
вече съществуват в C#, Groovy и Swift. Добавени са също `Array#dig`
и `Hash#dig`.

[did_you_mean gem](https://bugs.ruby-lang.org/issues/11252) e добавен
към ruby-core. Библиотеката показва потенциални кандидати при `NameError`
и `NoMethodError` за по-лесно дебъгване.

[RubyVM::InstructionSequence#to_binary и .load_from_binary](https://bugs.ruby-lang.org/issues/11788) са добавени като експерименталнa функционалност. С тяхна помощ може да се създаде платформено-зависимо binary, което да използва по-малко памет и да зарежда по-бързо.

Ruby 2.3 включва много подобрения по производителността. Например,
[оптимизиран Proc#call](https://bugs.ruby-lang.org/issues/11569),
[улеснено търсене на super-класове](https://bugs.ruby-lang.org/issues/11278),
[добавяне на `st_table` в
интерпретатора](https://bugs.ruby-lang.org/issues/11420),
оптимизиране на алокирането на обекти и извикване на методи, както и много
други.

Приятно използване на Ruby 2.3.0-preview2!

## Важни промени от 2.2

Виж [Новини](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS) и
[Списък с промени](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
за повече информация.

## Download

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## Коментар

За повече информация и release schedule:

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
