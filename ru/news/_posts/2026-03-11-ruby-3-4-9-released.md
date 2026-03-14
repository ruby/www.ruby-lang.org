---
layout: news_post
title: "Вышел Ruby 3.4.9"
author: nagachika
translator: "ablzh"
date: 2026-03-11 11:00:00 +0000
lang: ru
---

Вышел Ruby 3.4.9.

В этот релиз вошло [обновление гема zlib, устраняющее CVE-2026-27820](https://www.ruby-lang.org/ru/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/), а также другие исправления ошибок.
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_9).

Мы рекомендуем обновить вашу версию гема zlib. Этот релиз был подготовлен для удобства тех, кто хочет продолжать использовать его как гем по умолчанию.


## Скачать

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Комментарий к релизу

Многие коммиттеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам выпустить этот релиз.
Спасибо за их вклад.
