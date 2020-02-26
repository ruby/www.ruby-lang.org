---
layout: news_post
title: "Вышел Ruby 2.4.9"
author: "usa"
translator: "shprotru"
date: 2019-10-02 09:00:00 +0000
lang: ru
---

Вышел релиз Ruby 2.4.9.

Этот релиз является пересборкой 2.4.8, потому что предыдущий релиз
Ruby 2.4.8 не устанавливается из tarball'а.
(Смотрите [[Bug #16197]](https://bugs.ruby-lang.org/issues/16197) для подробностей.)
Нет никаких существенных изменений, кроме изменения маркера версий 2.4.8 и 2.4.9.

Ruby 2.4 теперь находится в состоянии обслуживания безопасности, до
конца марта 2020 года.  После этой даты обслуживание Ruby 2.4
прекратится. Мы рекомендуем начинать планирование перехода на более новые версии
версии Ruby, такие как 2.6 или 2.5.

## Скачать

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

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

Спасибо всем кто помогал с этим релизом.
