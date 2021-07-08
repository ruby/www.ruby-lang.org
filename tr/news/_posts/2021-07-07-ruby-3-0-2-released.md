---
layout: news_post
title: "Ruby 3.0.2 Yayınlandı"
author: "nagachika"
translator: "ismailarilik"
date: 2021-07-07 09:00:00 +0000
lang: tr
---

Ruby 3.0.2 yayınlandı.

Bu yayın güvenlik düzeltmeleri içermektedir.
Ayrıntılar için lütfen aşağıdaki konuları kontrol edin.

* [CVE-2021-31810: Net::FTP'de FTP PASV yanıtlarına güvenme zaafiyeti]({%link tr/news/_posts/2021-07-07-trusting-pasv-responses-in-net-ftp.md %})
* [CVE-2021-32066: Net::IMAP'te bir StartTLS çıkarma zaafiyeti]({%link tr/news/_posts/2021-07-07-starttls-stripping-in-net-imap.md %})
* [CVE-2021-31799: RDoc'ta bir komut satırı enjeksiyon zaafiyeti]({%link tr/news/_posts/2021-05-02-os-command-injection-in-rdoc.md %})

Ayrıntılar için [işleme kayıtlarına](https://github.com/ruby/ruby/compare/v3_0_1...v3_0_2) bakınız.

## İndirin

{% assign release = site.data.releases | where: "version", "3.0.2" | first %}

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

Birçok işleyici, geliştirici ve hata bildirileri gönderen kullanıcı bu yayını yapmamızda bize yardım etti.
Katkıları için kendilerine teşekkür ederiz.
