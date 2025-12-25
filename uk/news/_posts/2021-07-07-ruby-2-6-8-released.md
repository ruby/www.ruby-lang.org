---
layout: news_post
title: "Вийшов Ruby 2.6.8"
author: "usa"
translator: "Andrii Furmanets"
date: 2021-07-07 09:00:00 +0000
lang: uk
---

Ruby 2.6.8 випущено.

Цей випуск включає виправлення безпеки.
Будь ласка, перевірте теми нижче для деталей.

* [CVE-2021-31810: Вразливість довіри до FTP PASV відповідей в Net::FTP]({%link uk/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Вразливість StartTLS stripping в Net::IMAP]({%link uk/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: Вразливість ін'єкції команди в RDoc]({%link uk/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Ми зазвичай не виправляємо Ruby 2.6, окрім виправлень безпеки, але цей випуск також включає деякі виправлення регресійних помилок та проблем збірки.
Див. [логи комітів](https://github.com/ruby/ruby/compare/v2_6_7...v2_6_8) для деталей.

Ruby 2.6 зараз у стані фази підтримки безпеки, до кінця березня 2022 року.
Після цієї дати підтримка Ruby 2.6 буде завершена.
Ми рекомендуємо вам почати планувати міграцію до новіших версій Ruby, таких як 3.0 або 2.7.

## Завантаження

{% assign release = site.data.releases | where: "version", "2.6.8" | first %}

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

Багато комітерів, розробників та користувачів, які надали звіти про помилки, допомогли нам зробити цей випуск.
Дякую за їхній внесок.