---
layout: news_post
title: "Вышел Ruby 3.2.9"
author: "hsbt"
translator: "ablzh"
date: 2025-07-24 08:51:53 +0000
lang: ru
---

Вышла новая версия Ruby 3.2.9.

В этот релиз вошли следующие исправления уязвимостей безопасности:

* [CVE-2025-24294: Возможен отказ в обслуживании (DoS) в геме resolv](https://www.ruby-lang.org/ru/news/2025/07/08/dos-resolv-cve-2025-24294/)
* [CVE-2025-43857: Уязвимость, приводящая к DoS, в net-imap](https://www.ruby-lang.org/ru/news/2025/04/28/dos-net-imap-cve-2025-43857/)

а также следующие исправления проблем со сборкой:

* GCC 15.1
* Visual Studio 2022 Version 17.14

Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_9).

## Скачать

{% assign release = site.data.releases | where: "version", "3.2.9" | first %}

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
Спасибо всем за их вклад!
