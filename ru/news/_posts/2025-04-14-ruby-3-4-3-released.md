---
layout: news_post
title: "Вышел Ruby 3.4.3"
author: k0kubun
translator: "ablzh"
date: 2025-04-14 08:06:57 +0000
lang: ru
---

Вышла новая версия Ruby 3.4.3.

Это плановое обновление, включающее исправления ошибок. Подробности смотрите в
[заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_3).

## График релизов

Мы намерены выпускать последнюю стабильную версию Ruby (на данный момент Ruby 3.4) каждые 2 месяца.
Ruby 3.4.4 будет выпущен в июне, 3.4.5 — в августе, 3.4.6 — в октябре, и 3.4.7 — в декабре.

Если произойдёт какое-либо изменение, затрагивающее значительное количество людей, эти версии могут быть выпущены раньше, чем ожидалось.

## Скачать

{% assign release = site.data.releases | where: "version", "3.4.3" | first %}

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
