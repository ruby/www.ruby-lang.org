---
layout: news_post
title: "CVE-2021-31799: RDoc'ta bir komut satırı enjeksiyon zaafiyeti"
author: "aycabta"
translator: "ismailarilik"
date: 2021-05-02 09:00:00 +0000
tags: security
lang: tr
---

Ruby ile paketlenen RDoc'ta Komut Satırı Enjeksiyonu ile ilgili bir zaafiyet bulunmaktadır.
Tüm Ruby kullanıcılarına bu zaafiyeti çözen son RDoc sürümüne güncelleme yapmaları önerilir.

## Ayrıntılar

Aşağıdaki zaafiyet bildirilmiştir.

* [CVE-2021-31799](https://www.cve.org/CVERecord?id=CVE-2021-31799)

RDoc yerel bir dosyayı açmak için `Kernel#open` metodunu çağırıyordu.
Eğer bir Ruby projesi `|` ile başlayan ve `tags` ile biten bir dosyaya sahipse, boru karakterini takip eden komut çalıştırılır.
Kötü niyetli bir Ruby projesi, `rdoc` komutunu çalıştırmayı deneyen bir kullanıcıya karşı herhangi bir komutu çalıştırmak için bunu kullanabilirdi.

RDoc sürümleri bu sorundan etkilenen Ruby kullanıcıları RDoc'un en son sürümüne güncelleme yapmalıdır.

## Etkilenen Sürümler

* 3.11'den 6.3.0'a tüm RDoc sürümleri

## Nasıl Güncellenir

Zaafiyeti düzeltmek amacıyla RDoc'u en son sürüme (6.3.1 ya da sonrası) güncellemek için aşağıdaki komutu çalıştırın.

```
gem install rdoc
```

Eğer bundler kullanıyorsanız, lütfen `gem "rdoc", ">= 6.3.1"` satırını `Gemfile` dosyanıza ekleyin.

## Teşekkürler

Bu sorunu bildirdiği için [Alexandr Savca](https://hackerone.com/chinarulezzz)'ya teşekkür ederiz.

## Geçmiş

* İlk olarak 2021-05-02 09:00:00 UTC tarihinde bildirilmiştir.
