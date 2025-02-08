---
layout: news_post
title: "Выпуск Ruby 3.0.6"
author: "usa"
translator:
date: 2023-03-30 12:00:00 +0000
lang: ru
---

Вышел Ruby 3.0.6.

Этот релиз включает исправления безопасности.
Для получения подробной информации ознакомьтесь с следующими темами:

* [CVE-2023-28755: Уязвимость ReDoS в URI]({%link ru/news/_posts/2023-03-28-redos-in-uri-cve-2023-28755.md %})
* [CVE-2023-28756: Уязвимость ReDoS в Time]({%link ru/news/_posts/2023-03-30-redos-in-time-cve-2023-28756.md %})

Этот релиз также включает исправления ошибок.
Дополнительные детали доступны в [GitHub релизах](https://github.com/ruby/ruby/releases/tag/v3_0_6).

После этого релиза мы завершаем обычную фазу поддержки Ruby 3.0, и Ruby 3.0 входит в фазу поддержки безопасности.
Это означает, что мы больше не будем вносить обратные исправления ошибок в Ruby 3.0, кроме исправлений безопасности.

Фаза поддержки безопасности запланирована на год.
Поддержка Ruby 3.0 завершается по окончании фазы поддержки безопасности.
Поэтому мы рекомендуем вам начать планирование обновления до Ruby 3.1 или 3.2.

## Скачать

{% assign release = site.data.releases | where: "version", "3.0.6" | first %}

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

Поддержка Ruby 3.0, включая этот релиз, основана на "Соглашении о стабильной версии Ruby" от Ruby Association.
