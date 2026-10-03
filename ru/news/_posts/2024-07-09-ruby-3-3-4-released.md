---
layout: news_post
title: "Вышел Ruby 3.3.4"
author: "k0kubun"
translator: "ablzh"
date: 2024-07-09 00:30:00 +0000
lang: ru
---

Вышел Ruby 3.3.4.

В этом релизе исправлена регрессия Ruby 3.3.3: в gemspec некоторых поставляемых с Ruby гемов
отсутствовали зависимости — `net-pop`, `net-ftp`, `net-imap` и `prime`
[[Bug #20581]](https://bugs.ruby-lang.org/issues/20581).
Исправление позволяет Bundler успешно устанавливать эти гемы на таких платформах, как Heroku.
Если `bundle install` уже работает корректно, эта проблема вас, вероятно, не затрагивает.

Остальные изменения — преимущественно небольшие исправления ошибок.
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_4).

## График релизов

В дальнейшем мы планируем выпускать обновления последней стабильной версии Ruby (сейчас Ruby 3.3) каждые 2 месяца после релиза `.1`.
Для Ruby 3.3 выход версии 3.3.5 запланирован на 3 сентября, 3.3.6 — на 5 ноября, а 3.3.7 — на 7 января.

Если возникнут изменения, затрагивающие много пользователей, например пользователей Ruby 3.3.3 на Heroku в случае этого релиза,
мы можем выпустить новую версию раньше запланированного срока.

## Скачать

{% assign release = site.data.releases | where: "version", "3.3.4" | first %}

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
