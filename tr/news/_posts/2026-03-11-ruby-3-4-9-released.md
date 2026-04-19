---
layout: news_post
title: "Ruby 3.4.9 Yayınlandı"
author: nagachika
translator: "Ender Ahmet Yurt"
date: 2026-03-11 11:00:00 +0000
lang: tr
---

Ruby 3.4.9 yayınlandı.

Bu sürüm, [CVE-2026-27820'yi ele alan zlib gem güncellemesini](https://www.ruby-lang.org/tr/news/2026/03/05/buffer-overflow-zlib-cve-2026-27820/) ve diğer hata düzeltmelerini içerir.
Daha fazla ayrıntı için lütfen [GitHub sürümlerine](https://github.com/ruby/ruby/releases/tag/v3_4_9) bakın.

zlib gem'inizi güncellemenizi öneririz. Bu sürüm, onu varsayılan gem olarak kullanmaya devam etmek isteyenlerin kolaylığı için yapılmıştır.


## İndir

{% assign release = site.data.releases | where: "version", "3.4.9" | first %}

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
