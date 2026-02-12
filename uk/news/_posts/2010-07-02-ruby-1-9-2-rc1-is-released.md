---
layout: news_post
title: "Вийшов Ruby 1.9.2 RC1"
author: "Yugui"
translator: "Andrii Furmanets"
lang: uk
---

Ruby 1.9.2 RC щойно випущено. Це кандидат на випуск
Ruby 1.9.2.

## Про Ruby 1.9.2

Ruby 1.9.2 буде майже сумісним з 1.9.1, крім наступних
змін:

* багато нових методів
* новий socket API (підтримка IPv6)
* нові кодування
* клас `Random`, який підтримує різні генератори випадкових чисел
* `Time` перереалізовано. Більше немає проблеми року 2038.
* деякі покращення regexp
* `$:` більше не включає поточну директорію
* `dl` перереалізовано на основі `libffi`
* нова бібліотека `psych`, яка обгортає `libyaml`. Ви можете використовувати бібліотеку
  замість `syck`

Див. файли [NEWS][1] та [ChangeLog][2] для більше деталей.

Близько 130 помилок виправлено з випуску 1.9.2 preview 3. Всі
відомі основні помилки в 1.9.2 виправлено, крім [#3462][3].

Через наш розклад, Ruby 1.9.2 буде випущено на початку серпня. Розклад
Ruby 1.9.2 зсунувся, щоб забезпечити, що 1.9.2 проходить
RubySpec. Тепер він проходить більше 99% RubySpecs. Спробуйте новий
Ruby та повідомте нам через [наш трекер проблем][4], якщо у вас є будь-які проблеми.

## Завантаження

* [ruby-1.9.2-rc1.tar.bz2][5]
  * РОЗМІР: 8479087 байтів
  * MD5: 242dcfaed8359a6918941b55d0806bf0
  * SHA256: c2a680aa5472c8d04a71625afa2b0f75c030d3655a3063fe364cfda8b33c1480

* [ruby-1.9.2-rc1.tar.gz](URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz)
  * РОЗМІР: 10779309 байтів
  * MD5: fdedd5b42ae89a9a46797823ad2d9acf
  * SHA256: 3e90036728342ce8463be00d42d4a36de70dabed96216c5f8a26ec9ba4b29537

* [ruby-1.9.2-rc1.zip][6]
  * РОЗМІР: 12158992 байтів
  * MD5: 3da59c5d3567f6e1f1697abbef71f507
  * SHA256: 4f593a3d0873cea8f371a7fc7484cad7bc03acac0ada1970cb9f83a89bc27997




[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_rc1
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_rc1
[3]: https://bugs.ruby-lang.org/issues/show/3462
[4]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip
