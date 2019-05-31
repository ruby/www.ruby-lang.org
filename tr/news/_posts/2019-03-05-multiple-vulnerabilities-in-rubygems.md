---
layout: news_post
title: "RubyGems'te birçok güvenlik açığı"
author: "hsbt"
translator: "İsmail Arılık"
date: 2019-03-05 00:00:00 +0000
tags: security
lang: tr
---

Ruby ile paketlenmiş RubyGems'te birçok güvenlik açığı var.
Bunlar [RubyGems'in resmi günlüğünde bildirilmiştir](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Ayrıntılar

Aşağıdaki güvenlik açıkları bildirilmiştir.

* CVE-2019-8320: Tar'ı çıkarırken simgesel bağlantı kullanarak dizini silme
* CVE-2019-8321: `verbose`'ta kaçış dizisi enjeksiyonu güvenlik açığı
* CVE-2019-8322: `gem owner`'da kaçış dizisi enjeksiyonu güvenlik açığı
* CVE-2019-8323: API yanıtı ele alımında kaçış dizisi enjeksiyonu güvenlik açığı
* CVE-2019-8324: Kötü niyetli bir gem kurmak keyfi kod çalıştırımına öncülük edebilir
* CVE-2019-8325: Hatalarda kaçış dizisi enjeksiyonu güvenlik açığı

Ruby kullanıcılarına, en kısa zamanda Ruby kurulumlarını yükseltmeleri ya da aşağıdaki geçici çözümlerden birini kullanmaları şiddetle tavsiye edilir.

## Etkilenen Sürümler

* Ruby 2.3 serisi: tümü
* Ruby 2.4 serisi: 2.4.5 ve öncesi
* Ruby 2.5 serisi: 2.5.3 ve öncesi
* Ruby 2.6 serisi: 2.6.1 ve öncesi
* 67168 trunk revizyonundan öncekisi

## Geçici Çözümler

Kural olarak, Ruby kurulumunuzu son sürüme yükseltmelisiniz.
RubyGems 3.0.3 veya sonrası, güvenlik açıkları için düzeltmeyi içerir, yani eğer Ruby'nin kendisini yükseltemiyorsanız RubyGems'i son sürüme yükseltin.

```
gem update --system
```

Eğer RubyGems'i yükseltemiyorsanız, geçici çözüm olarak aşağıdaki yamaları uygulayabilirsiniz.

* [Ruby 2.4.5 için](https://bugs.ruby-lang.org/attachments/7669)
* [Ruby 2.5.3 için](https://bugs.ruby-lang.org/attachments/7670)
* [Ruby 2.6.1 için](https://bugs.ruby-lang.org/attachments/7671)

Ruby trunk'a gelince, son revizyon'a güncelleyin.

## Jenerik

Bu bildiri [RubyGems'in resmi günlüğü](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html)ne dayalıdır.

## Geçmiş

* Aslen 2019-03-05 00:00:00 UTC tarihinde yayınlanmıştır.
* Güncellenmiş yamalara bağlantı 2019-03-06 05:26:27 UTC tarihinde verilmiştir.
* Ruby'nin kendisini yükseltmeden 2019-04-01 06:00:00 UTC tarihinde bahsedilmiştir.
