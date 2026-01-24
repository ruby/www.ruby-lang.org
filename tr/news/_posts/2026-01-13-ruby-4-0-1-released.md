---
layout: news_post
title: "Ruby 4.0.1 Yayınlandı"
author: k0kubun
translator: "Ender Ahmet Yurt"
date: 2026-01-13 02:28:48 +0000
lang: tr
---

Ruby 4.0.1 yayınlandı.

Bu sürüm, başka bir iş parçacığında alt süreç sonlandığında `Kernel#sleep`'ten sahte uyanma için bir hata düzeltmesi ve diğer hata düzeltmelerini içerir. Daha fazla ayrıntı için lütfen [GitHub sürümlerine](https://github.com/ruby/ruby/releases/tag/v4.0.1) bakın.

## Yayın Takvimi

En son kararlı Ruby sürümünü (şu anda Ruby 4.0) en son yayından sonra her iki ayda bir yayınlamayı planlıyoruz.
Ruby 4.0.2 Mart'ta, 4.0.3 Mayıs'ta, 4.0.4 Temmuz'da, 4.0.5 Eylül'de ve 4.0.6 Kasım'da yayınlanacak.

Kullanıcıları önemli ölçüde etkileyen bir değişiklik ortaya çıkarsa, planlanan zamandan önce bir yayın yapılabilir ve sonraki takvim buna göre kayabilir.

## İndir

{% assign release = site.data.releases | where: "version", "4.0.1" | first %}

* <{{ release.url.gz }}>

      BOYUT: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      BOYUT: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      BOYUT: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Yayın Yorumu

Bu yayını yapmamızda bize yardımcı olan birçok geliştirici, katkıcı ve hata bildirimi sağlayan kullanıcılara teşekkür ederiz.
Katkılarınız için teşekkürler.
