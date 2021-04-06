---
layout: news_post
title: "Ruby 2.5.9 Yayınlandı"
author: "usa"
translator: "ismailarilik"
date: 2021-04-05 12:00:00 +0000
lang: tr
---

Ruby 2.5.9 yayınlandı.

Bu yayın güvenlik düzeltmelerini içerir.
Ayrıntılar için lütfen aşağıdaki konulara göz atın.

* [CVE-2020-25613: WEBrick'te Olası HTTP İsteği Kaçırma Zaafiyeti]({%link tr/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: REXML'de XML gidiş-dönüş zaafiyeti]({% link tr/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Ayrıntılar için lütfen [işleme loglarına](https://github.com/ruby/ruby/compare/v2_5_8...v2_5_9) bakın.

Bu yayından sonra Ruby 2.5, hayatının sonuna ulaşmış bulunmaktadır.
Diğer bir deyişle, bu sürüm Ruby 2.5 serisinin son sürümüdür.
Bir güvenlik açığı bulunsa bile Ruby 2.5.10'u yayınlamayacağız.
Tüm Ruby 2.5 kullanıcılarının Ruby 3.0, 2.7 ya da 2.6'ya acilen geçmelerini öneriyoruz.

## İndirin

{% assign release = site.data.releases | where: "version", "2.5.9" | first %}

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

## Sürüm Yorumu

Bu sürümde bize yardım eden herkese teşekkürler, özellikle zaafiyeti bildirenlere.
