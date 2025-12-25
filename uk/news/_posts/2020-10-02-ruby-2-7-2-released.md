---
layout: news_post
title: "Вийшов Ruby 2.7.2"
author: "nagachika"
translator: "Andrii Furmanets"
date: 2020-10-02 11:00:00 +0000
lang: uk
---

Ruby 2.7.2 випущено.

Цей випуск містить навмисну несумісність. Попередження про застарілість вимкнено за замовчуванням у 2.7.2 та пізніших.
Ви можете увімкнути попередження про застарілість, вказавши опцію -w або -W:deprecated у командному рядку.
Будь ласка, перевірте теми нижче для деталей.

* [Функція #17000 2.7.2 вимикає попередження про застарілість за замовчуванням](https://bugs.ruby-lang.org/issues/17000)
* [Функція #16345 Не випускати попередження про застарілість за замовчуванням.](https://bugs.ruby-lang.org/issues/16345)

Цей випуск містить нову версію webrick з виправленням безпеки, описаним у статті.

* [CVE-2020-25613: Потенційна вразливість HTTP Request Smuggling в WEBrick](/uk/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2) для інших змін.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

* <{{ release.url.bz2 }}>

      РОЗМІР: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      РОЗМІР: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      РОЗМІР: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      РОЗМІР: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Коментар до випуску

Дякую багатьом комітерам, розробникам та користувачам, які надали звіти про помилки та внески, що зробили цей випуск можливим.