---
layout: news_post
title: "Вышел Ruby 2.7.2"
author: "nagachika"
translator: "nakilon"
date: 2020-10-02 11:00:00 +0000
lang: ru
---

Вышел Ruby 2.7.2.

Этот релиз сознательно содержит несовместимости. Предупреждения об устаревании по умолчанию выключены начиная с версии 2.7.2.
Вы можете включить предупреждения об устаревании флагом командой строки -w или -W:deprecated.
Ознакомьтесь с подробностями ниже.

* [Feature #17000 2.7.2 turns off deprecation warnings by default](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Don't emit deprecation warnings by default.](https://bugs.ruby-lang.org/issues/16345)

Этот релиз содержит новую версию webrick с исправлением уязвимости, описанной в статье.

* [CVE-2020-25613: Потенциальная уязвимость скрытого HTTP запроса в WEBrick](/ru/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

См. остальные изменения в [коммитах](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2).

## Скачать

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

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

Благодарим множественных коммитеров, разработчиков и пользователей за сообщения об ошибках и вклад, который позволил осуществить данный релиз.
