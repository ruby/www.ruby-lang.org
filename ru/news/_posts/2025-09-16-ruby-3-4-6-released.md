---
layout: news_post
title: "Вышел Ruby 3.4.6"
author: k0kubun
translator: ablzh
date: 2025-09-16 00:00:00 +0000
lang: ru
---

Вышла новая версия Ruby 3.4.6.

Это плановое обновление, включающее исправления ошибок. Подробности смотрите в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_4_6).

## График выпусков

Мы планируем публиковать последнюю стабильную версию Ruby (сейчас это Ruby 3.4) каждые два месяца после предыдущего релиза.
Ruby 3.4.7 запланирован на ноябрь, а 3.4.8 — на январь.

Если появятся изменения, существенно влияющие на пользователей, релиз может выйти раньше намеченного срока, а последующий график будет скорректирован.

## Скачать

{% assign release = site.data.releases | where: "version", "3.4.6" | first %}

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

Многие коммиттеры, разработчики и пользователи, присылавшие отчёты об ошибках, помогли нам подготовить этот релиз.Спасибо за их вклад.
