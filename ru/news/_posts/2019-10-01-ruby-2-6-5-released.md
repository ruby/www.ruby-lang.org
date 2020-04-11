---
layout: news_post
title: "Вышел Ruby 2.6.5"
author: "nagachika"
translator: "shprotru"
date: 2019-10-01 11:00:00 +0000
lang: ru
---

Вышел релиз Ruby 2.6.5.

Этот выпуск содержит исправления безопасности.
Пожалуйста, ознакомьтесь с пунктами ниже для подробностей.

* [CVE-2019-16255: Уязвимость внедрения кода в Shell#[] и Shell#test]({% link ru/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: Разделение HTTP-ответа в WEBrick (Дополняющее исправление)]({% link ru/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: Уязвимость NUL инъекции в File.fnmatch и File.fnmatch?]({% link ru/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: Уязвимость отказа в обслуживании от регулярного выражения в дайджест-аутентификации WEBrick'а]({% link ru/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Смотрите [историю коммитов](https://github.com/ruby/ruby/compare/v2_6_4...v2_6_5) для подробностей об изменениях.

## Скачать

{% assign release = site.data.releases | where: "version", "2.6.5" | first %}

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

Всем коммитерам, разработчикам, и пользователям, которые предоставляли
сведения об ошибках, помогая нам с выпуском этого релиза
Благодарю их всех за вклад в проект.
