---
layout: news_post
title: "Вышел Ruby 4.0.2"
author: k0kubun
translator: "ablzh"
date: 2026-03-16 23:18:29 +0000
lang: ru
---

Вышел Ruby 4.0.2.

Это плановое обновление, которое включает исправление ошибки в YJIT для [NoMethodError в Puma](https://github.com/puma/puma/issues/3620).
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.2).

## График релизов

Мы намерены выпускать последнюю стабильную версию Ruby (в настоящее время Ruby 4.0) каждые два месяца после последнего релиза.
Ruby 4.0.3 выйдет в мае, 4.0.4 в июле, 4.0.5 в сентябре, а 4.0.6 в ноябре.

Если возникнет изменение, которое существенно повлияет на пользователей, релиз может состояться раньше запланированного срока, и последующий график может соответственно сдвинуться.

## Скачать

{% assign release = site.data.releases | where: "version", "4.0.2" | first %}

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

## Комментарии к релизу

Многие коммиттеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам подготовить этот релиз.
Спасибо за их вклад.
