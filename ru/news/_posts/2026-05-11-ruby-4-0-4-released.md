---
layout: news_post
title: "Вышел Ruby 4.0.4"
author: k0kubun
translator: "ablzh"
date: 2026-05-11 21:41:38 +0000
lang: ru
---

Вышел Ruby 4.0.4.

Это плановое обновление, которое включает исправления ошибок.
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.4).

## График релизов

Мы планируем выпускать последнюю стабильную версию Ruby (на данный момент Ruby 4.0) каждые два месяца после последнего *регулярного* выпуска. Ruby 4.0.5 выйдет в июле, 4.0.6 — в сентябре, а 4.0.7 — в ноябре.

Если возникнут изменения, существенно влияющие на пользователей, релиз может состояться раньше запланированного срока, и последующий график может измениться соответствующим образом.

## Скачать

{% assign release = site.data.releases | where: "version", "4.0.4" | first %}

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

Многие коммиттеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам подготовить этот релиз.
Спасибо за ваш вклад.
