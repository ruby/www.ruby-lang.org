---
layout: news_post
title: "Выпуск Ruby 3.3.1"
author: "hsbt"
translator: "suban05"
date: 2024-04-23 10:00:00 +0000
lang: ru
---

Вышел Ruby 3.3.1.

Этот выпуск включает исправления уязвимостей. Пожалуйста, ознакомьтесь с темами ниже для получения подробностей.

* [CVE-2024-27282: Уязвимость чтения произвольного адреса памяти при поиске по регулярному выражению]({%link ru/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: Уязвимость RCE с .rdoc_options в RDoc]({%link ru/news/_posts/2024-03-21-rce-rdoc-cve-2024-27281.md %})
* [CVE-2024-27280: Уязвимость переполнения буфера в StringIO]({%link ru/news/_posts/2024-03-21-buffer-overread-cve-2024-27280.md %})

Дополнительные подробности смотрите в [релизах GitHub](https://github.com/ruby/ruby/releases/tag/v3_3_1).

## Скачать

{% assign release = site.data.releases | where: "version", "3.3.1" | first %}

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
