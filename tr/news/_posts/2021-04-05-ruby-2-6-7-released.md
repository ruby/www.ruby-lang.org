---
layout: news_post
title: "Ruby 2.6.7 Yayınlandı"
author: "usa"
translator: "ismailarilik"
date: 2021-04-05 12:00:00 +0000
lang: tr
---

Ruby 2.6.7 yayınlandı.

Bu yayın güvenlik düzeltmelerini içerir.
Ayrıntılar için lütfen aşağıdaki konulara göz atın.

* [CVE-2020-25613: WEBrick'te Olası HTTP İsteği Kaçırma Zaafiyeti]({%link tr/news/_posts/2020-09-29-http-request-smuggling-cve-2020-25613.md %})
* [CVE-2021-28965: REXML'de XML gidiş-dönüş zaafiyeti]({% link tr/news/_posts/2021-04-05-xml-round-trip-vulnerability-in-rexml-cve-2021-28965.md %})

Ayrıntılar için lütfen [işleme loglarına](https://github.com/ruby/ruby/compare/v2_6_6...v2_6_7) bakın.

Bu sürümle birlikte Ruby 2.6'nın olağan sürdürme süreci sona ermiştir ve Ruby 2.6 güvenlik sürdürme sürecine girmiştir.
Bunun anlamı, güvenlik düzeltmeleri dışında herhangi bir hata düzeltmesini Ruby 2.6'ya aktarmayacağımızdır.
Güvenlik sürdürme süreci 1 yıldır.
Ruby 2.6, güvenlik sürdürme sürecinin sonunda hayatının sonuna ulaşır ve bu sürüme verilen resmi destek sona erer.
Bu sebeple Ruby 2.7 ya da 3.0'a geçmeyi düşünmeye başlamanızı tavsiye ederiz.

## İndirin

{% assign release = site.data.releases | where: "version", "2.6.7" | first %}

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

Birçok işleyici, geliştirici ve hata bildirileri gönderen kullanıcı bu sürümü yapmamızda bize yardım etti.
Katkıları için onlara teşekkür ederiz.

Bu sürümü de içeren Ruby 2.6'nın sürdürmesi, Ruby Derneği'nin "Ruby kararlı sürüm anlaşmasına" dayanır.
