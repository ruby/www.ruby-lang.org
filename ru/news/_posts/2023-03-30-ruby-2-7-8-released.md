---
layout: news_post
title: "Выпуск Ruby 2.7.8"
author: "usa"
translator: "suban05"
date: 2023-03-30 12:00:00 +0000
lang: ru
---

Вышел Ruby 2.7.8.

Этот релиз включает исправления безопасности.
Для получения подробной информации ознакомьтесь с следующими темами:

* [CVE-2023-28755: Уязвимость ReDoS в URI]({%link ru/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Уязвимость ReDoS в Time]({%link ru/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Этот релиз также включает исправления проблем сборки.
Дополнительные детали доступны в [GitHub релизах](https://github.com/ruby/ruby/releases/tag/v2_7_8).

После этого релиза Ruby 2.7 достигает конца срока поддержки (EOL). Другими словами, ожидается, что это последний релиз серии Ruby 2.7.
Мы не планируем выпуск Ruby 2.7.9, даже если будет найдена уязвимость безопасности (но можем выпустить, если будет найдена серьезная ошибка в работе).
Мы рекомендуем всем пользователям Ruby 2.7 немедленно начать миграцию на Ruby 3.2, 3.1 или 3.0.

## Скачать

{% assign release = site.data.releases | where: "version", "2.7.8" | first %}

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

Множество коммитеров, разработчиков и пользователей, предоставивших отчёты о багах, помогли нам сделать этот релиз.
Благодарим за их вклад.
