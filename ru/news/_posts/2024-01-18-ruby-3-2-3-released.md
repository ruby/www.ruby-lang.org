---
layout: news_post
title: "Выпуск Ruby 3.2.3"
author: "nagachika"
translator: "suban05"
date: 2024-01-18 09:00:00 +0000
lang: ru
---

Выпущен Ruby 3.2.3.

Этот выпуск включает множество исправлений ошибок.
Дополнительные сведения см. в разделе [GitHub releases](https://github.com/ruby/ruby/releases/tag/v3_2_3).

Этот выпуск также включает обновление uri.gem до версии 0.12.2, содержащей исправление безопасности.
Пожалуйста, ознакомьтесь с подробностями по следующим темам.

* [CVE-2023-36617: Уязвимость ReDoS в URI]({%link en/news/_posts/2023-06-29-redos-in-uri-CVE-2023-36617.md %})

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

## Комментарий к выпуску

Многие участники, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам сделать этот выпуск.
Благодарим их за их вклад.
