---
layout: news_post
title: "Ruby 4.0.1 Yayınlandı"
author: k0kubun
translator: "Ender Ahmet Yurt"
date: 2026-01-13 02:28:48 +0000
lang: tr
---

Ruby 4.0.1 yayınlandı.

Bu sürüm, başka bir iş parçacığında alt süreç sonlandığında `Kernel#sleep` metodunda meydana gelen sahte uyanma sorununa yönelik bir hata düzeltmesi ve diğer hata düzeltmelerini içermektedir. Daha fazla ayrıntı için lütfen [GitHub sürüm notlarına](https://github.com/ruby/ruby/releases/tag/v4.0.1) bakın.

## Yayın Takvimi

En son kararlı Ruby sürümünü (şu anda Ruby 4.0) en son sürümden sonra her iki ayda bir yayınlamayı planlıyoruz.
Ruby 4.0.2 Mart'ta, 4.0.3 Mayıs'ta, 4.0.4 Temmuz'da, 4.0.5 Eylül'de ve 4.0.6 Kasım'da yayınlanacaktır.

Kullanıcıları önemli ölçüde etkileyen bir değişiklik ortaya çıkarsa, planlanan tarihten önce sürüm yapılabilir ve sonraki takvim buna göre kaydırılabilir.

## İndirme

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

## Yayın Yorumu

Bu sürümü hazırlamamıza yardımcı olan hata raporu sunan birçok katkıcı, geliştirici ve kullanıcıya teşekkür ederiz.
Katkıları için minnettarız.
