---
layout: news_post
title: "Вышел Ruby 2.6.8"
author: "usa"
translator: "nakilon"
date: 2021-07-07 09:00:00 +0000
lang: ru
---

Вышел Ruby 2.6.8.

Этот релиз включает в себя исправления уязвимостей.
Ознакомьтесь с подробностями ниже.

* [CVE-2021-31810: Уязвимость доверия к PASV-ответам FTP в Net::FTP]({%link ru/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Уязвимость StartTLS stripping в Net::IMAP]({%link ru/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: Уязвимость внедрения команды в RDoc]({%link ru/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Обычно мы не вносим исправления в Ruby 2.6 за исключением исправлений уязвимости, однако этот релиз также содержит исправления некоторых регрессий и проблем сборки.
См. [коммиты](https://github.com/ruby/ruby/compare/v2_6_7...v2_6_8).

Ruby 2.6 находится в фазе поддержки безопасности до марта 2022.
После этого поддержка Ruby 2.6 завершится.
Мы рекомендуем начать планировать миграцию на более новые версии Ruby, такие как 3.0 или 2.7.

## Скачать

{% assign release = site.data.releases | where: "version", "2.6.8" | first %}

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
