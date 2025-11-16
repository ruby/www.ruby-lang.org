---
layout: news_post
title: "Вышел Ruby 3.2.8"
author: hsbt
translator: "ablzh"
date: 2025-03-26 04:45:01 +0000
lang: ru
---

Вышел Ruby 3.2.8. В этот релиз вошли [исправления CVE-2025-27219, CVE-2025-27220 и CVE-2025-27221](https://www.ruby-lang.org/ru/news/2025/02/26/security-advisories/).

Пожалуйста смотрите [заметки о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v3_2_8) для получения более подробной информации.

Эта версия является последней версией в рамках обычного цикла поддержки серии Ruby 3.2. Мы будем исправлять только уязвимости безопасности для серии Ruby 3.2 до конца марта 2026 года.

Пожалуйста, рассмотрите возможность обновиться до Ruby 3.3 или 3.4.

## Скачать

{% assign release = site.data.releases | where: "version", "3.2.8" | first %}http://127.0.0.1:4000

- <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

- <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

- <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Комментарий к релизу

Многие коммиттеры, разработчики и пользователи, предоставившие отчёты об ошибках, помогли нам подготовить этот релиз.
Спасибо за их вклад.
