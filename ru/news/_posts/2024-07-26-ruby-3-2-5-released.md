---
layout: news_post
title: "Вышел Ruby 3.2.5"
author: "nagachika"
translator: "ablzh"
date: 2024-07-26 10:00:00 +0000
lang: ru
---

Вышел Ruby 3.2.5.

В этот релиз вошли многочисленные исправления ошибок.
Также мы обновили поставляемый с Ruby гем `rexml`, включив следующее исправление уязвимости:
[CVE-2024-39908: DoS в REXML]({%link ru/news/_posts/2024-07-16-dos-rexml-cve-2024-39908.md %}).

Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_5).

## Скачать

{% assign release = site.data.releases | where: "version", "3.2.5" | first %}

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
