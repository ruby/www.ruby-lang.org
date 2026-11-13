---
layout: news_post
title: "Вышел Ruby 3.3.6"
author: k0kubun
translator: "ablzh"
date: 2024-11-05 04:25:00 +0000
lang: ru
---

Вышел Ruby 3.3.6.

Это плановое обновление с небольшими исправлениями ошибок.
Также отключены предупреждения об отсутствующих зависимостях от гемов по умолчанию (default gems), которые в Ruby 3.5 станут гемами, поставляемыми с Ruby (bundled gems).
Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_6).

## График релизов

Как мы ранее [сообщали](https://www.ruby-lang.org/ru/news/2024/07/09/ruby-3-3-4-released/), мы планируем выпускать обновления последней стабильной версии Ruby (сейчас Ruby 3.3) каждые 2 месяца после релиза `.1`.

Мы планируем выпустить Ruby 3.3.7 7 января. При появлении значительных изменений, затрагивающих много пользователей, новая версия может выйти раньше запланированного срока.

## Скачать

{% assign release = site.data.releases | where: "version", "3.3.6" | first %}

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
