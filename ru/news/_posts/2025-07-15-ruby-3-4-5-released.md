---
layout: news_post
title: "Вышел Ruby 3.4.5"
author: k0kubun
translator: "ablzh"
date: 2025-07-15 17:00:00 +0000
lang: ru
---

Вышла новая версия Ruby 3.4.5.

Это плановое обновление, включающее исправления ошибок и поддержку GCC 15. Подробности можно найти в
[заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_5).

## График релизов
Мы планируем выпускать последнюю стабильную версию Ruby (в настоящее время Ruby 3.4) каждые два месяца после предыдущего релиза.
Ruby 3.4.6 запланирован на сентябрь, 3.4.7 — на ноябрь, а 3.4.8 — на январь.

Если произойдут изменения, которые существенно влияют на пользователей, релиз может выйти раньше запланированного, а график выпусков будет скорректирован соответствующим образом.

## Скачать

{% assign release = site.data.releases | where: "version", "3.4.5" | first %}

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

Многие коммиттеры, разработчики и пользователи, сообщавшие об ошибках, помогли подготовить этот релиз.
Спасибо всем за их вклад.
