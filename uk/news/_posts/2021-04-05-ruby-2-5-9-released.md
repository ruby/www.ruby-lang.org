---
layout: news_post
title: "Вийшов Ruby 2.5.9"
author: "usa"
translator: "Andrii Furmanets"
date: 2021-04-05 12:00:00 +0000
lang: uk
---

Ruby 2.5.9 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2020-25613: Потенційна вразливість HTTP Request Smuggling в WEBrick]({%link uk/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: Вразливість XML round-trip в REXML]({% link uk/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9) для деталей.

Після цього випуску Ruby 2.5 досягає EOL. Іншими словами, це останній випуск серії Ruby 2.5.
Ми не випустимо Ruby 2.5.10 навіть якщо буде знайдено вразливість безпеки.
Ми рекомендуємо всім користувачам Ruby 2.5 негайно оновитися до Ruby 3.0, 2.7 або 2.6.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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