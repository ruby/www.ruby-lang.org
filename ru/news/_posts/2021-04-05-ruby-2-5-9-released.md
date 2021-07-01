---
layout: news_post
title: "Вышел Ruby 2.5.9"
author: "usa"
translator: "nakilon"
date: 2021-04-05 12:00:00 +0000
lang: ru
---

Вышел Ruby 2.5.9.

Этот релиз включает в себя исправления уязвимостей.
Ознакомьтесь с подробностями ниже.

* [CVE-2020-25613: Потенциальная уязвимость скрытого HTTP запроса в WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Уязвимость round-trip кодирования в REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

См. [коммиты](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9).

Этим релизом Ruby 2.5 достигает EOL, т.е. это последний релиз из серии 2.5.
Мы не будем выпускать Ruby 2.5.10 даже если будут найдены уязвимости.
Мы рекомендуем всем пользователям Ruby 2.5 немедленно обновиться до 3.0, 2.7 или 2.6.

## Скачать

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

Благодарим всех, кто помог с этим релизом, особенно за сообщения об уязвимости.
