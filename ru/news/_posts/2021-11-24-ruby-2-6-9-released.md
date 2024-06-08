---
layout: news_post
title: "Выпуск Ruby 2.6.9"
author: "usa"
translator: "suban05"
date: 2021-11-24 12:00:00 +0000
lang: ru
---

Вышел Ruby 2.6.9.

Этот выпуск включает исправления безопасности.
Пожалуйста, ознакомьтесь с подробностями по следующим темам.

* [CVE-2021-41817: Уязвимость отказа в обслуживании при помощи регулярных выражений в методах разбора даты]({%link en/news/_posts/2021-11-15-date-parsing-method-regexp-dos-cve-2021-41817.md %})
* [CVE-2021-41819: Подделка префикса Cookie в CGI::Cookie.parse]({%link en/news/_posts/2021-11-24-cookie-prefix-spoofing-in-cgi-cookie-parse-cve-2021-41819.md %})

См. [журналы коммитов](https://github.com/ruby/ruby/compare/v2_6_8...v2_6_9) для получения подробной информации.

Ruby 2.6 теперь находится в фазе обслуживания безопасности, до конца марта 2022 года.
После этой даты обслуживание Ruby 2.6 будет прекращено.
Мы рекомендуем вам начать планирование миграции на более новые версии Ruby, такие как 3.0 или 2.7.

## Скачать

{% assign release = site.data.releases | where: "version", "2.6.9" | first %}

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

## Комментарий к выпуску

Многие коммитеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам выпустить этот релиз.
Благодарим за их вклад.
