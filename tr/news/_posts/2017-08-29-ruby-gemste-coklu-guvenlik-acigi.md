---
layout: news_post
title: "RubyGems'te Çok Güvenlik Açığı"
author: "usa"
translator: "Ali GÖREN"
date: 2017-08-29 12:00:00 +0000
tags: security
lang: tr
---

Ruby tarafından oluşturulan RubyGem'lerinde birden fazla güvenlik açığı bulundu.
Açığa dair bilgiler [Resmi RubyGems blogunda paylaşıldı](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Detaylar

Aşağıda yer alan güvenlik açıkları bildirildi:

* DNS hijacking açığı. (CVE-2017-0902)
* ANSI kaçış dizisi açığı. (CVE-2017-0899)
* Sorgu komutunda yer alan DoS açığı. (CVE-2017-0900)
* Rastgele dosyalar üzerine kötü niyetli gem tarafından tekrar yazılmaya izin veren gem installar açığı. (CVE-2017-0901)

Ruby kullanıcılarına en kısa zamanda aşağıda yer alan geçici çözümlerden birisini kullanması önerilir.

## Etkilenen sürümler

* Ruby 2.2 sürümlerinden: 2.2.7 ve öncesi
* Ruby 2.3 sürümlerinden: 2.3.4 ve öncesi
* Ruby 2.4 sürümlerinden: 2.4.1 ve öncesi
* revision sayısı 59672'den önce olanlarda

## Geçici Çözümler

Şu anda, RubyGems'te yer alan bu açığa dair herhangi bir güncelleme yayınlanmadı.
Ancak, RubyGems'i son sürümüne güncelleyebilirsiniz..
RubyGems 2.6.13 ve sonraki sürümler açığın kapatıldığı yamayı içermekte.

```
gem update --system
```

RubyGems'i güncelleyemiyorsanız, geçici çözüm olarak aşağıdaki yamaları uygulayabilirsiniz:

* [Ruby 2.2.7 için](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [Ruby 2.3.4 için](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* Ruby 2.4.1 için: 2 yama gereklidir.  Sırasıyla aşağıdaki gibi uygulayın
  1. [RubyGems 2.6.11 sürümünden 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 sürümünden 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

Revizyonu son sürüme güncelleyin.

## Katkıda bulunanlar

Bu bildiri [Resmi RubyGems bloguna](http://blog.rubygems.org/2017/08/27/2.6.13-released.html) dayanmaktadır.

## Geçmiş

* İlk yayınlanma tarihi: 2017-08-29 12:00:00 UTC
* CVE numaralandırmalarının eklendiği tarih 2017-08-31 2:00:00 UTC
