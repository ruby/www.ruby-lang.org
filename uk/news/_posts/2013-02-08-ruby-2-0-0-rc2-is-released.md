---
layout: news_post
title: "Вийшов Ruby 2.0.0-rc2"
author: "Yusuke Endoh"
date: 2013-02-08 14:34:17 +0000
translator: "Andrii Furmanets"
lang: uk
---

Ruby 2.0.0-rc2 випущено. Це буде останній кандидат на випуск
Ruby 2.0.0.

Будь ласка, спробуйте його, та повідомте про будь-яку проблему, якщо помітите.

## Розташування

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2&gt;][1]

      РОЗМІР:   10822239 байтів
      MD5:    e92420131bd7994513e0bf09a3e2a19b
      SHA256: d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz&gt;][2]

      РОЗМІР:   13616756 байтів
      MD5:    9d5e6f26db7c8c3ddefc81fdb19bd41a
      SHA256: 87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip&gt;][3]

      РОЗМІР:   15118480 байтів
      MD5:    1a2d33f1c50e32ca1532f8dea4790d53
      SHA256: c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

## Нові функції в 2.0.0

* Ключові аргументи
* Enumerable#lazy
* Module#prepend
* \#to\_h: Конвенція для перетворення в Hash
* %i: літерал для масиву символів
* Оновлений рушій regexp: Onigmo (форк Oniguruma)
* Enumerator#size та Range#size були введені
* Підтримка DTrace
* TracePoint
* Оптимізована продуктивність require (особливо, на Windows)
* Підтримка NativeClient
* Покращення документації
* Покращена обробка асинхронних переривань
* Параметри налаштування розміру стеку при запуску
* Refinements \[експериментальна функція\]

... та більше покращень. Див. NEWS для деталей.

Ось деякі вступні статті від третіх сторін:

* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][4]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][5]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][6]
* [&lt;URL:http://timelessrepo.com/refinements-in-ruby&gt;][7]
  (Refinements)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][8]
  (японською)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][9]
  (Enumerator::Lazy, японською)

(Якщо ви добровільно надасте додаткові статті, ми можемо процитувати або посилатися на
них в наступному оголошенні випуску.)

## Примітки

### Несумісність

Є три помітні несумісності, про які ми знаємо:

* Кодування за замовчуванням для скриптів ruby тепер UTF-8 [\[#6679\]][10].
  Деякі люди повідомляють, що це впливає на існуючі програми, такі як деякі
  бенчмарк програми стають дуже повільними [\[ruby-dev:46547\]][11]. Специфікація
  може змінитися для офіційного випуску.
* iconv видалено, який вже був застарілим, коли M17N був
  введений у ruby 1.9. Використовуйте String#encode, тощо замість цього.
* Є порушення ABI [\[ruby-core:48984\]][12]. Ми думаємо, що звичайні
  користувачі можуть/повинні просто перевстановити бібліотеки розширень. Ви повинні
  знати: "НЕ КОПІЮЙТЕ ФАЙЛИ .so АБО .bundle З 1.9".

Є деякі порівняно невеликі несумісності.
[\[ruby-core:49119\]][13] Будь ласка, повідомте про будь-яку іншу несумісність, яку ви
помітите.

Для довідки: Ми створюємо примітки до оновлення, але деякі частини вже застарілі.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft&gt;][14]

### Статус Refinements

2\.0.0 включатиме refinements як "експериментальну функцію", оскільки ми
не змогли домовитися про її детальну специфікацію. Зверніть увагу, що поведінка може змінитися
в майбутніх версіях Ruby.

### Особлива подяка

Я ціную всіх, хто спробував preview та rc1 випуск! Я вдячний за всю
важку роботу всіх учасників для виправлення багатьох помилок. Я справді вдячний
всім людям, які допомогли мені зробити цей випуск.




[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
[4]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[5]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[6]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[7]: http://timelessrepo.com/refinements-in-ruby
[8]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[9]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[10]: https://bugs.ruby-lang.org/issues/6679
[11]: https://blade.ruby-lang.org/ruby-dev/46547
[12]: https://blade.ruby-lang.org/ruby-core/48984
[13]: https://blade.ruby-lang.org/ruby-core/49119
[14]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft

