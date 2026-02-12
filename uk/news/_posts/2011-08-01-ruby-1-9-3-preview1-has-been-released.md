---
layout: news_post
title: "Вийшов Ruby 1.9.3 preview1"
author: "Moru"
translator: "Andrii Furmanets"
lang: uk
---

Ruby 1.9.3 preview1 випущено. Це перший preview наступної
версії, і все ще є незначні відомі проблеми. Але це буде виправлено в
наступному випуску, Ruby 1.9.3-p0.

Див. [ChangeLogs][1] та [NEWS][2] для описів.

Ruby Inside опублікував [огляд цього випуску][3].

## Завантаження

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2&gt;][4]
  РОЗМІР: 9507455 байтів
  MD5: 7d93dc773c5824f05c6e6630d8c4bf9b
  SHA256: a15d7924d74a45ffe48d5421c5fc4ff83b7009676054fa5952b890711afef6fc

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz&gt;][5]
  РОЗМІР: 12186410 байтів
  MD5: 0f0220be4cc7c51a82c1bd8f6a0969f3
  SHA256: 75c2dd57cabd67d8078a61db4ae86b22dc6f262b84460e5b95a0d8a327b36642

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip&gt;][6]
  РОЗМІР: 13696708 байтів
  MD5: 960e08b2dc866c9987f17d0480de63a1
  SHA256: 249483f88156b4ae65cd45742c6f6316660f793b78739657596c63b86f76aaeb

## Відмінності від попередньої версії

Попередні версії Ruby були ліцензовані під "GPLv2" та "Ruby" ліцензією,
але "2-clause BSDL"(AKA Simplified BSD License) та "Ruby" ліцензія
стали заміною для них.

### Кодування

SJIS змінено на псевдонім для Windows-31J, замість Shift\_JIS.

### Стандартні бібліотеки

* io/console: Додано можливості до екземплярів IO.
* openssl
* test/unit: підтримує паралельні тести

### Інші зміни

* pathname та date перереалізовано на поточному preview.
* Мета блокування VM змінено.




[1]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_3_preview1
[2]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_3_preview1
[3]: http://www.rubyinside.com/ruby-1-9-3-preview-1-released-5229.html
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-preview1.zip
