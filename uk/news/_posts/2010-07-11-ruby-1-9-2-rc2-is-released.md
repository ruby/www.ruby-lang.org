---
layout: news_post
title: "Вийшов Ruby 1.9.2 RC2"
author: "Yugui"
translator: "Andrii Furmanets"
lang: uk
---

Ruby 1.9.2 RC2 щойно випущено. Це другий кандидат на випуск
Ruby 1.9.2.

Бібліотека psych виправлена з попереднього кандидата, та деякі
незначні помилки виправлено.

Див. файли [NEWS][1] та [ChangeLog][2] для більше деталей.

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

Ruby 1.9.2 став стабільним, як ми очікували. Через наш розклад, Ruby
1.9.2 буде випущено на початку серпня. Розклад Ruby 1.9.2
зсунувся, щоб забезпечити, що 1.9.2 проходить RubySpec. Тепер він проходить
більше 99% RubySpecs. Спробуйте новий Ruby та повідомте нам через
[наш трекер проблем][3], якщо у вас є будь-які проблеми.

## Завантаження

* [ruby-1.9.2-rc2.tar.bz2][4]
  * РОЗМІР: 8480974 байтів
  * MD5: 4e4906d0aab711286b31f5a834860cc3
  * SHA256: 692ebae991b104482dc9f0d220c1afb6b690a338b3b815aaa4f62954d2fa1b4a

* [ruby-1.9.2-rc2.tar.gz][5]
  * РОЗМІР: 10781884 байтів
  * MD5: d12cd39eee4d99bc54b52aba5a0ba4e1
  * SHA256: 5d523d99f928705ac1de84ade03283c468415c00f8b6755a8dd7a140828869b4

* [ruby-1.9.2-rc2.zip][6]
  * РОЗМІР: 12161233 байтів
  * MD5: 05229b43981e4e5ce58b5fb2e98eee52
  * SHA256: 33f7f4cdd8444c2594728f70ac07477575a7cba5e7756bd3645f23e52605618c




[1]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_rc2/NEWS
[2]: https://svn.ruby-lang.org/repos/ruby/tags/v1_9_2_rc2/ChangeLog
[3]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip