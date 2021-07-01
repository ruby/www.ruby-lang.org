---
layout: news_post
title: "Вышел Ruby 2.7.3"
author: "nagachika"
translator: "nakilon"
date: 2021-04-05 12:00:00 +0000
lang: ru
---

Вышел Ruby 2.7.3.

Этот релиз включает в себя исправления уязвимостей.
Ознакомьтесь с подробностями ниже.

* [CVE-2021-28965: Уязвимость round-trip кодирования в REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})
* [CVE-2021-28966: Уязвимость обхода каталога в Tempfile на Windows]({% link en/news/_posts/2021-04-05-tempfile-path-traversal-on-windows-cve-2021-28966.md %})

См. [коммиты](https://github.com/ruby/ruby/compare/v2_7_2...v2_7_3).

## Скачать

{% assign release = site.data.releases | where: "version", "2.7.3" | first %}

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

Многие коммитеры, разработчики и пользователи, кто присылал баг-репорты, помогли нам сделать этот релиз.
Благодарим за этот вклад.
