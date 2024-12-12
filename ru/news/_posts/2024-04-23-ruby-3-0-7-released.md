---
layout: news_post
title: "Выпуск Ruby 3.0.7"
author: "hsbt"
translator: "suban05"
date: 2024-04-23 10:00:00 +0000
lang: ru
---

Вышел Ruby 3.0.7.

Этот выпуск включает исправления уязвимостей. Пожалуйста, ознакомьтесь с темами ниже для получения подробностей.

* [CVE-2024-27282: Уязвимость чтения произвольного адреса памяти при поиске по регулярному выражению]({%link ru/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: Уязвимость RCE с .rdoc_options в RDoc]({%link ru/news/_posts/2024-03-21-rce-rdoc-cve-2024-27281.md %})
* [CVE-2024-27280: Уязвимость переполнения буфера в StringIO]({%link ru/news/_posts/2024-03-21-buffer-overread-cve-2024-27280.md %})

Дополнительные подробности смотрите в [релизах GitHub](https://github.com/ruby/ruby/releases/tag/v3_0_7).

После этого выпуска Ruby 3.0 достигает конца своего жизненного цикла (EOL). Другими словами, это, вероятно, последний выпуск серии Ruby 3.0.
Мы не будем выпускать Ruby 3.0.8 даже в случае обнаружения уязвимости безопасности (но возможно, выпустим, если будет обнаружена серьезная регрессия).
Рекомендуем всем пользователям Ruby 3.0 начать миграцию на Ruby 3.3, 3.2 или 3.1 немедленно.

## Скачать

{% assign release = site.data.releases | where: "version", "3.0.7" | first %}

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

Многие коммитеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам в создании этого выпуска.
Благодарим их за вклад.
