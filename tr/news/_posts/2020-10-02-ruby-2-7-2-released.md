---
layout: news_post
title: "Ruby 2.7.2 Yayınlandı"
author: "nagachika"
translator: "ismailarilik"
date: 2020-10-02 11:00:00 +0000
lang: tr
---

Ruby 2.7.2 yayınlandı.

Bu yayın kasıtlı uyumsuzluk içermektedir.
2.7.2 ve sonrasında kullanımdan kaldırma uyarıları varsayılan olarak kapalıdır.
Kullanımdan kaldırma uyarılarını komut satırında -w veya -W:deprecated seçeneğini belirterek açabilirsiniz.
Ayrıntılar için lütfen aşağıdaki konulara bakın.

* [Feature #17000 2.7.2 kullanımdan kaldırma uyarılarını varsayılan olarak kapatıyor](https://bugs.ruby-lang.org/issues/17000)
* [Feature #16345 Varsayılan olarak kullanımdan kaldırma uyarılarını yayınlama.](https://bugs.ruby-lang.org/issues/16345)

Bu yayın aşağıdaki makalede tanımlanan bir güvenlik düzeltmesi içeren, webrick'in yeni bir sürümü içermektedir.

* [CVE-2020-25613: WEBrick'te Potansiyel HTTP İsteği Kaçakçılığı Zaafiyeti](/tr/news/2020/09/29/http-request-smuggling-cve-2020-25613/)

Diğer değişiklikler için [işleme loglarına](https://github.com/ruby/ruby/compare/v2_7_1...v2_7_2) bakınız.

## İndirin

{% assign release = site.data.releases | where: "version", "2.7.2" | first %}

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

Hata bildirimleri ve katkıları ile bu yayını mümkün kılan tüm işleyicilere, geliştiricilere ve kullanıcılara teşekkür ederiz.
