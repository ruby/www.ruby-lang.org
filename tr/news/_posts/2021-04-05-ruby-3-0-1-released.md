---
layout: news_post
title: "Ruby 3.0.1 Yayınlandı"
author: "naruse"
translator: "ismailarilik"
date: 2021-04-05 12:00:00 +0000
lang: tr
---

Ruby 3.0.1 yayınlandı.

Bu yayın güvenlik düzeltmelerini içerir.
Ayrıntılar için lütfen aşağıdaki konulara göz atın.

* [CVE-2021-28965: REXML'de XML gidiş-dönüş zaafiyeti]({% link tr/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})
* [CVE-2021-28966: Windows'ta Tempfile içinde yol geçişi]({% link tr/news/_posts/2021-04-05-tempfile-path-traversal-on-windows-cve-2021-28966.md %})

Ayrıntılar için lütfen [işleme loglarına](https://github.com/ruby/ruby/compare/v3_0_0...v3_0_1) bakın.

## İndirin

{% assign release = site.data.releases | where: "version", "3.0.1" | first %}

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

## Sürüm Yorumu

Birçok işleyici, geliştirici ve hata bildirileri gönderen kullanıcı bu sürümü yapmamızda bize yardım etti.
Katkıları için onlara teşekkür ederiz.
