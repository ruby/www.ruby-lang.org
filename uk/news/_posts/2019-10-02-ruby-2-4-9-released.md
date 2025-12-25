---
layout: news_post
title: "Вийшов Ruby 2.4.9"
author: "usa"
translator: "Andrii Furmanets"
date: 2019-10-02 09:00:00 +0000
lang: uk
---

Ruby 2.4.9 випущено.

Цей випуск є перепакуванням 2.4.8, оскільки попередній tarball випуску Ruby 2.4.8
не встановлюється.
(Див. [[Помилка #16197]](https://bugs.ruby-lang.org/issues/16197) детально.)
Немає істотних змін, окрім їхніх номерів версій, між 2.4.8 та 2.4.9.

Ruby 2.4 зараз у стані фази підтримки безпеки, до
кінця березня 2020 року.  Після цієї дати підтримка Ruby 2.4
буде завершена. Ми рекомендуємо вам почати планувати міграцію до новіших
версій Ruby, таких як 2.6 або 2.5.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.4.9" | first %}

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

Дякую всім, хто допоміг з цим випуском.

