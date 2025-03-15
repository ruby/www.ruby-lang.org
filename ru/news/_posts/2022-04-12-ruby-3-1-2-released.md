---
layout: news_post
title: "Выпуск Ruby 3.1.2"
author: "naruse и mame"
translator: "suban05"
date: 2022-04-12 12:00:00 +0000
lang: ru
---

Вышел Ruby 3.1.2.

Этот выпуск включает исправления безопасности.
Пожалуйста, ознакомьтесь с темами ниже для получения подробной информации.

* [CVE-2022-28738: Двойное освобождение памяти при компиляции регулярных выражений]({%link en/news/_posts/2022-04-12-double-free-in-regexp-compilation-cve-2022-28738.md %})
* [CVE-2022-28739: Переполнение буфера при преобразовании строки в число с плавающей точкой]({%link en/news/_posts/2022-04-12-buffer-overrun-in-string-to-float-cve-2022-28739.md %})

Дополнительные подробности см. в [журналах коммитов](https://github.com/ruby/ruby/compare/v3_1_1...v3_1_2).

## Загрузка

{% assign release = site.data.releases | where: "version", "3.1.2" | first %}

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

## Комментарий к выпуску

Многие коммитеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам сделать этот выпуск.
Спасибо за их вклад.
