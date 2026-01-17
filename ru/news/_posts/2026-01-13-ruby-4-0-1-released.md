---
layout: news_post
title: "Вышел Ruby 4.0.1"
author: k0kubun
translator: "ablzh"
date: 2026-01-13 02:28:48 +0000
lang: ru
---

Вышел Ruby 4.0.1.

Этот релиз включает исправление ошибки, связанной со случайным пробуждением `Kernel#sleep`, когда подпроцесс завершается в другом потоке,
наряду с другими исправлениями ошибок. Пожалуйста, смотрите [GitHub releases](https://github.com/ruby/ruby/releases/tag/v4.0.1) для получения подробностей.

## График релизов

Мы планируем выпускать последнюю стабильную версию Ruby (в настоящее время Ruby 4.0) каждые два месяца после самого последнего выпуска.
Ruby 4.0.2 выйдет в марте, 4.0.3 в мае, 4.0.4 в июле, 4.0.5 в сентябре, и 4.0.6 в ноябре.

Если возникнет изменение, которое существенно повлияет на пользователей, релиз может выйти раньше запланированного, и последующий график может быть сдвинут соответствующим образом.

## Скачать

{% assign release = site.data.releases | where: "version", "4.0.1" | first %}

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

Многие коммиттеры, разработчики и пользователи, предоставившие отчеты об ошибках, помогли нам сделать этот релиз.
Спасибо за их вклад.
