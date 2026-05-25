---
layout: news_post
title: "Вышел Ruby 4.0.5"
author: k0kubun
translator: "ablzh"
date: 2026-05-20 00:12:20 +0000
lang: ru
---

Вышел Ruby 4.0.5.

В этот релиз вошло только исправление уязвимости
[CVE-2026-46727: Use-after-free в обработчике таймаута getaddrinfo на базе pthread](/ru/news/2026/05/20/getaddrinfo-cve-2026-46727/)
и исправление регрессии системы сборки в Ruby 4.0.4 при использовании локали C [[Bug #22065]](https://bugs.ruby-lang.org/issues/22065).

Подробности можно найти в [заметках о релизе на GitHub](https://github.com/ruby/ruby/releases/tag/v4.0.5).

## График релизов

Мы планируем выпускать последнюю стабильную версию Ruby (в данный момент Ruby 4.0) каждые два месяца после последнего обычного релиза. Ruby 4.0.6 выйдет в июле, 4.0.7 в сентябре и 4.0.8 в ноябре.

Если возникнут изменения, существенно влияющие на пользователей, релиз может состояться раньше запланированного срока, и последующий график может быть соответствующим образом скорректирован.

## Скачать

{% assign release = site.data.releases | where: "version", "4.0.5" | first %}

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

Многие коммиттеры, разработчики и пользователи, присылавшие сообщения об ошибках, помогли нам подготовить этот релиз.
Благодарим их за вклад.
