---
layout: news_post
title: "Ruby 2.6.6 Yayınlandı"
author: "nagachika"
translator: "ismailarilik"
date: 2020-03-31 12:00:00 +0000
lang: tr
---

Ruby 2.6.6 yayınlandı.

Bu yayın güvenlik düzeltmeleri içermektedir.
Ayrıntılar için lütfen aşağıdaki konuları inceleyin.

* [CVE-2020-10663: JSON'da Güvensiz Nesne Oluşturma Zaafiyeti (Ek düzeltme)]({% link tr/news/_posts/2020-03-19-json-dos-cve-2020-10663.md %})
* [CVE-2020-10933: Soket kütüphanesinde heap teşhir zaafiyeti]({% link tr/news/_posts/2020-03-31-heap-exposure-in-socket-cve-2020-10933.md %})

Ayrıntılar için [işleme logları](https://github.com/ruby/ruby/compare/v2_6_5...v2_6_6)na bakın.

## İndirin

{% assign release = site.data.releases | where: "version", "2.6.6" | first %}

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

## Yayın Yorumu

Birçok işleyici, geliştirici ve hata bildirileri sağlayan birçok kullanıcı bu yayını yapmamızda bize yardım etti.
Katkıları için onlara teşekkür ederiz.
