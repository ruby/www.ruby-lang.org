---
layout: news_post
title: "Вышел Ruby 3.2.3"
author: "nagachika"
translator: "ablzh"
date: 2024-01-18 09:00:00 +0000
lang: ru
---

Вышел Ruby 3.2.3.

В этот релиз вошли многочисленные исправления ошибок.
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_3).

В этот релиз также вошло обновление гема uri до версии 0.12.2, содержащее исправление уязвимости.
Подробности приведены ниже.

* [CVE-2023-36617: Уязвимость ReDoS в URI]({%link ru/news/_posts/2023-06-29-redos-in-uri-CVE-2023-36617.md %})

## Скачать

{% assign release = site.data.releases | where: "version", "3.2.3" | first %}

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

Многие коммиттеры, разработчики и пользователи, присылавшие отчёты об ошибках, помогли нам подготовить этот релиз.
Спасибо за их вклад.
