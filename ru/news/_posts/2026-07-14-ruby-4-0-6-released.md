---
layout: news_post
title: "Вышел Ruby 4.0.6"
author: k0kubun
translator: "ablzh"
date: 2026-07-14 01:41:20 +0000
lang: ru
---

Вышел Ruby 4.0.6.

Это плановое обновление, которое включает исправления ошибок.
Дополнительные сведения смотрите в [релизах на GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.6).

## График релизов

Мы планируем выпускать последнюю стабильную версию Ruby (на данный момент Ruby 4.0) каждые два месяца после последнего релиза. Ruby 4.0.7 выйдет в сентябре, а Ruby 4.0.8 в ноябре.

Если возникнут изменения, существенно влияющие на пользователей, релиз может состояться раньше запланированного срока, и последующий график релизов может сдвинуться соответствующим образом.

## Скачать

{% assign release = site.data.releases | where: "version", "4.0.6" | first %}

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

Многие коммиттеры, разработчики и пользователи, присылавшие отчеты об ошибках, помогли нам сделать этот релиз.
Благодарим за их вклад.
