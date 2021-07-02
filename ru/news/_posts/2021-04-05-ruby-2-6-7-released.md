---
layout: news_post
title: "Вышел Ruby 2.6.7"
author: "usa"
translator: "nakilon"
date: 2021-04-05 12:00:00 +0000
lang: ru
---

Вышел Ruby 2.6.7.

Этот релиз включает в себя исправления уязвимостей.
Ознакомьтесь с подробностями ниже.

* [CVE-2020-25613: Потенциальная уязвимость скрытого HTTP запроса в WEBrick]({%link en/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Уязвимость round-trip кодирования в REXML]({% link en/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

См. [коммиты](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7).

На этом релизе мы прекращаем фазу нормальной поддержки Ruby 2.6,
и Ruby 2.6 входит в фазу поддержки безопасности.
Это означает, что мы больше не будем бэкпортировать какие-либо исправления в Ruby 2.6 за исключением исправлений, связанных с безопасностью.
Срок фазы поддержки безопасности запланировал на год.
Ruby 2.6 достигает EOL и его официальная поддержка заканчивается вместе с фазой поддержки безопасности.
Поэтому мы рекомендуем начать планировать обновление до Ruby 2.7 или 3.0.

## Скачать

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

Поддержка Ruby 2.6, включая этот релиз, основана на "Соглашении о стабильной версии Ruby" Ассоциации Ruby.
