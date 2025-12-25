---
layout: news_post
title: "Вийшов Ruby 2.4.8"
author: "usa"
translator: "Andrii Furmanets"
date: 2019-10-01 11:00:00 +0000
lang: uk
---

Ruby 2.4.8 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2019-16255: Вразливість ін'єкції коду Shell#[] та Shell#test]({% link uk/news/_posts/2019-10-01-code-injection-shell-test-cve-2019-16255.md %})
* [CVE-2019-16254: HTTP response splitting в WEBrick (Додаткове виправлення)]({% link uk/news/_posts/2019-10-01-http-response-splitting-in-webrick-cve-2019-16254.md %})
* [CVE-2019-15845: Вразливість ін'єкції NUL File.fnmatch та File.fnmatch?]({% link uk/news/_posts/2019-10-01-nul-injection-file-fnmatch-cve-2019-15845.md %})
* [CVE-2019-16201: Вразливість Regular Expression Denial of Service модуля Digest access authentication WEBrick]({% link uk/news/_posts/2019-10-01-webrick-regexp-digestauth-dos-cve-2019-16201.md %})

Ruby 2.4 зараз у стані фази підтримки безпеки, до
кінця березня 2020 року.  Після цієї дати підтримка Ruby 2.4
буде завершена. Ми рекомендуємо вам почати планувати міграцію до новіших
версій Ruby, таких як 2.6 або 2.5.

__Оновлення (2 жовтня 4:00 UTC):__ Ми працюємо над проблемою, що tarball випуску Ruby 2.4.8 не встановлюється під _non-root_ користувачем. Слідкуйте за [[Помилка #16197]](https://bugs.ruby-lang.org/issues/16197) для детальних оновлень.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.4.8" | first %}

* <{{ release.url.bz2 }}>

      РОЗМІР: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      РОЗМІР: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      РОЗМІР: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      РОЗМІР: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Коментар до випуску

Дякую всім, хто допоміг з цим випуском, особливо, репортерам вразливості.