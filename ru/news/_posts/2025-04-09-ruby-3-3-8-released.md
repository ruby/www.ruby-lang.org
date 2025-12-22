---
layout: news_post
title: "Вышел Ruby 3.3.8"
author: nagachika
translator: "ablzh"
date: 2025-04-09 11:00:00 +0000
lang: ru
---

Вышла новая версия Ruby 3.3.8.

Подробности смотрите в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_8).

## Скачать

{% assign release = site.data.releases | where: "version", "3.3.8" | first %}

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

Многие коммиттеры, разработчики и пользователи,предоставившие отчёты об ошибках, помогли нам подготовить этот релиз.
Благодарим всех за их вклад.
