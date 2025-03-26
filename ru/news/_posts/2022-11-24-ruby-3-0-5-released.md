---
layout: news_post
title: "Выпуск Ruby 3.0.5"
author: "usa"
translator: "suban05"
date: 2022-11-24 12:00:00 +0000
lang: ru
---

Вышел Ruby 3.0.5.

В этом выпуске внесено исправление безопасности.
Пожалуйста, ознакомьтесь с разделами ниже для получения подробностей.

* [CVE-2021-33621: HTTP разделение ответов в CGI]({%link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Этот релиз также включает исправления ошибок.
Дополнительные подробности смотрите в [релизах на GitHub](https://github.com/ruby/ruby/releases/tag/v3_0_5).

## Загрузка

{% assign release = site.data.releases | where: "version", "3.0.5" | first %}

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

Множество коммитеров, разработчиков и пользователей, предоставивших отчеты о проблемах, помогли нам сделать этот релиз.
Благодарим их за вклад.

Обслуживание Ruby 3.0, включая этот релиз, основывается на "Соглашении по стабильной версии Ruby" от Ruby Association.
