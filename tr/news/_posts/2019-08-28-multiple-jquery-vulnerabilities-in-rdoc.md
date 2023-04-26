---
layout: news_post
title: "RDoc'ta birden fazla jQuery güvenlik açığı"
author: "aycabta"
translator: "İsmail Arılık"
date: 2019-08-28 09:00:00 +0000
tags: security
lang: tr
---


Ruby'de paketlenmiş olan RDoc ile gelen jQuery'de Siteler Arası Betikleme (XSS)
ile ilgili birçok güvenlik açığı vardır. Tüm Ruby kullanıcılarına, RDoc'un
düzeltilmiş sürümünün bulunduğu son sürüme güncelleme yapmaları önerilir.

## Ayrıntılar

Aşağıdaki güvenlik açıkları bildirildi.

* [CVE-2012-6708](https://www.cve.org/CVERecord?id=CVE-2012-6708)
* [CVE-2015-9251](https://www.cve.org/CVERecord?id=CVE-2015-9251)

Tüm Ruby kullanıcılarının en kısa zamanda Ruby kurulumlarını yükseltmeleri ya
da aşağıdaki geçici çözümlerden birini kullanmaları şiddetle tavsiye edilir.
Ayrıca güvenlik açıklarını tamamiyle ortadan kaldırmak için var olan RDoc
belgelendirmelerini yeniden oluşturmalısınız.

## Etkilenen Sürümler

* Ruby 2.3 serisi: tümü
* Ruby 2.4 serisi: 2.4.6 ve öncesi
* Ruby 2.5 serisi: 2.5.5 ve öncesi
* Ruby 2.6 serisi: 2.6.3 ve öncesi
* f308ab2131ee675000926540cbb8c13c91dc3be5 master işlemesi öncesi

## Gerekli eylemler

RDoc, bir statik belgelendirme oluşturma aracıdır. Aracın kendisine yama
yapmak, bu güvenlik açıklarını kapatmak için yeterli değildir.

Yani önceki sürümler ile oluşturulan RDoc belgelendirmeleri, daha yeni bir RDoc
ile yeniden oluşturulmalıdır.

## Geçici çözümler

Aslında Ruby kurulumunuzu son sürüme yükseltmelisiniz. RDoc 6.1.2 ve sonrası
güvenlik açıkları için düzeltmeyi içerir, yani eğer Ruby'nin kendisini
yükseltemiyorsanız, RDoc'u son sürüme yükseltin.

Daha önce bahsedildiği gibi var olan RDoc belgelendirmelerini yeniden
oluşturmanız gerektiğini unutmayın.

```
gem install rdoc -f
```

*Güncelleme:* Bu gönderinin ilk sürümü kısmen rdoc-6.1.1.gem'den bahsetmiştir,
ki bunda da güvenlik açığı vardır. Lütfen rdoc-6.1.2 ya da sonrasını
kurduğunuza emin olun.

Geliştirme sürümü için master dalının en son HEAD'ine güncelleyin.

## Teşekkür

[Chris Seaton](https://hackerone.com/chrisseaton)'a güvenlik açıklarını bildirdiği için teşekkürler.

## Geçmiş

* İlk olarak 2019-08-28 09:00:00 UTC tarihinde yayınlandı
* RDoc sürümü 2019-08-28 11:50:00 UTC tarihinde düzeltildi
* 2019-08-28 12:30:00 UTC tarihinde küçük dil düzeltmeleri yapıldı
