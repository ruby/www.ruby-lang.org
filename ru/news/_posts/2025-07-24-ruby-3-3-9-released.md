---
layout: news_post
title: "Вышел Ruby 3.3.9"
author: nagachika
translator: "ablzh"
date: 2025-07-24 11:00:00 +0000
lang: ru
---

Вышла новая версия Ruby 3.3.9.

В этот релиз вошло следующее исправление уязвимости безопасности в стандартных гемах:

* [CVE-2025-24294: Возможен отказ в обслуживании (DoS) в гемe resolv](/ru/news/2025/07/08/dos-resolv-cve-2025-24294/)

а также добавлены исправления проблем со сборкой под:

* GCC 15.1
* Visual Studio 2022 Version 17.14

 Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_9).

## Скачать

{% assign release = site.data.releases | where: "version", "3.3.9" | first %}

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

Многие коммиттеры, разработчики и пользователи, отправлявшие отчёты об ошибках, помогли нам подготовить этот релиз.
Спасибо всем за вклад в развитие Ruby.
