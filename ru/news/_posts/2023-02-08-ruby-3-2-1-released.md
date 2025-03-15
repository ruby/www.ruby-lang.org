---
layout: news_post
title: "Выпуск Ruby 3.2.1"
author: "naruse"
translator: "suban05"
date: 2023-02-08 12:00:00 +0000
lang: ru
---

Вышел Ruby 3.2.1.

Это первый релиз версии 3.2 с изменением TEENY.

Дополнительные подробности смотрите в [релизах на GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_1).

## Скачать

{% assign release = site.data.releases | where: "version", "3.2.1" | first %}

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

Множество коммитеров, разработчиков и пользователей, предоставивших отчеты об ошибках, помогли нам сделать этот релиз.
Благодарим за их вклад.
