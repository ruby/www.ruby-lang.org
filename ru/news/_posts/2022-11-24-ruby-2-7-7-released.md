---
layout: news_post
title: "Выпуск Ruby 2.7.7"
author: "usa"
translator: "suban05"
date: 2022-11-24 12:00:00 +0000
lang: ru
---

Вышел Ruby 2.7.7.

В этом выпуске внесена исправление безопасности.
Пожалуйста, ознакомьтесь с разделами ниже для получения подробностей.

* [CVE-2021-33621: HTTP разделение ответов в CGI]({%link en/news/_posts/2022-11-22-http-response-splitting-in-cgi-cve-2021-33621.md %})

Этот релиз также включает исправления проблем сборки. Предполагается, что они не повлияют на совместимость с предыдущими версиями.
Дополнительные подробности смотрите в [релизах на GitHub](https://github.com/ruby/ruby/releases/tag/v2_7_7).

## Загрузка

{% assign release = site.data.releases | where: "version", "2.7.7" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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
