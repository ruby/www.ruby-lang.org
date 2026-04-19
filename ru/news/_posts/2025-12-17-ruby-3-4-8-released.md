---
layout: news_post
title: "Вышел Ruby 3.4.8"
author: k0kubun
translator: "ablzh"
date: 2025-12-17 00:24:30 +0000
lang: ru
---

Вышел Ruby 3.4.8.

Это плановое обновление, которое включает исправления ошибок.
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_8).

## График релизов

Мы намерены выпускать последнюю стабильную версию Ruby (на данный момент Ruby 3.4) каждые два месяца после самого последнего релиза.
Выпуск Ruby 3.4.9 запланирован на февраль.

Если возникнут изменения, существенно влияющие на пользователей, релиз может состояться раньше запланированного срока, и последующий график может быть соответствующим образом смещен.

## Скачать

{% assign release = site.data.releases | where: "version", "3.4.8" | first %}

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
Спасибо за их вклад.
