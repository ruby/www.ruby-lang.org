---
layout: news_post
title: "Вышел Ruby 3.1.5"
author: "hsbt"
translator: "ablzh"
date: 2024-04-23 10:00:00 +0000
lang: ru
---

Вышел Ruby 3.1.5.

В этот релиз вошли исправления уязвимостей.
Подробности приведены ниже.

* [CVE-2024-27282: Уязвимость чтения по произвольному адресу памяти при поиске регулярными выражениями]({%link ru/news/_posts/2024-04-23-arbitrary-memory-address-read-regexp-cve-2024-27282.md %})
* [CVE-2024-27281: Уязвимость удалённого выполнения кода (RCE) через .rdoc_options в RDoc]({%link ru/news/_posts/2024-03-21-rce-rdoc-cve-2024-27281.md %})
* [CVE-2024-27280: Уязвимость чтения за границами буфера (buffer overread) в StringIO]({%link ru/news/_posts/2024-03-21-buffer-overread-cve-2024-27280.md %})

Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_1_5).

## Скачать

{% assign release = site.data.releases | where: "version", "3.1.5" | first %}

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
