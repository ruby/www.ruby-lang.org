---
layout: news_post
title: "Излезе Ruby 2.3.0"
author: "naruse"
translator: "Georgi Mitrev"
date: 2015-12-25 17:00:00 +0000
lang: bg
---

Радваме се да обявим излизането на Ruby 2.3.0.

Това е първият стабилен рилийз от Ruby 2.3 серията. Включени са много нови
функционалности, например:

Добавянето на [Frozen String Literal](
https://bugs.ruby-lang.org/issues/11473). В Ruby 2.1 `"str".freeze`
е оптимизирано да намали броят на алокациите. Ruby 2.3 въвежда
нов 'магически' коментар и опция, чрез които може да се обявят всички
'string literals' във входните файлове. При дебъгване може да се подава
опцията `--debug=frozen-string-literal`, която ще помогне при намирането
на стрингове при получаване на `"can't modify frozen String"` грешки.

[Safe Navigation Operator]( https://bugs.ruby-lang.org/issues/11537),
който позволява
`obj && obj.foo` да бъде заместено от `obj&.foo`. Подобни оператори
вече съществуват в C#, Groovy и Swift. Добавени са също `Array#dig`
и `Hash#dig`. Забележете, че `&.` се държи като
[try! от Active Support](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21),
който специфично обработва само `nil`.

[did_you_mean gem](https://bugs.ruby-lang.org/issues/11252) e добавен
към ruby-core. Библиотеката показва потенциални кандидати при `NameError`
и `NoMethodError` за по-лесно дебъгване.

[RubyVM::InstructionSequence#to_binary и .load_from_binary](https://bugs.ruby-lang.org/issues/11788)
са добавени като експерименталнa функционалност. С тяхна помощ
може да се създаде платформено-зависимо binary,
което да използва по-малко памет и да зарежда по-бързо.

Ruby 2.3 включва много подобрения по производителността. Например,
[оптимизиран Proc#call](https://bugs.ruby-lang.org/issues/11569),
[улеснено търсене на super-класове](https://bugs.ruby-lang.org/issues/11278),
[добавяне на `st_table` в
интерпретатора](https://bugs.ruby-lang.org/issues/11420),
[по-умна структура от данни за instance променливи](https://bugs.ruby-lang.org/issues/11170),
оптимизиране на алокирането на обекти и извикване на методи, както и много
други.

За пълен списък с промени, моля вижте
[Новини](https://github.com/ruby/ruby/blob/v2_3_0/NEWS) и
[Списък с промени](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog).

Весели празници и приятно ползване на Ruby 2.3!

## Сваляне

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
