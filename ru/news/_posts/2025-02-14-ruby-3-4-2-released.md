---
layout: news_post
title: "Вышел Ruby 3.4.2"
author: k0kubun
translator: "ablzh"
date: 2025-02-14 21:55:17 +0000
lang: ru
---

Вышел Ruby 3.4.2.

Это плановое обновление, которое включает исправления ошибок. Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_2).

## График релизов

Мы планируем выпускать последнюю стабильную версию Ruby (в настоящее время Ruby 3.4) каждые 2 месяца.
Ruby 3.4.3 выйдет в апреле, 3.4.4 — в июне, 3.4.5 — в августе, 3.4.6 — в октябре и 3.4.7 — в декабре.

Если произойдут какие-либо изменения, затрагивающие значительное число людей, эти версии могут быть выпущены раньше ожидаемого.

## Скачать

{% assign release = site.data.releases | where: "version", "3.4.2" | first %}

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

Многие коммиттеры, разработчики и пользователи, сообщившие об ошибках, помогли нам подготовить этот релиз.
Спасибо за их вклад.
