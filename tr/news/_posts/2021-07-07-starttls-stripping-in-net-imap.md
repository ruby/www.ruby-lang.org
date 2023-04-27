---
layout: news_post
title: "CVE-2021-32066: Net::IMAP'te bir StartTLS çıkarma zaafiyeti"
author: "shugo"
translator: "ismailarilik"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: tr
---

Bir StartTLS çıkarma zaafiyeti Net::IMAP'te keşfedildi.
Bu zaafiyet [CVE-2021-32066](https://www.cve.org/CVERecord?id=CVE-2021-32066) CVE belirtecine atanmıştır.
Ruby'yi güncellemenizi şiddetle tavsiye ederiz.

net-imap, Ruby 3.0.1'de varsayılan bir gem fakat paketleme sorunlarına sahip, yani lütfen Ruby'nin kendisini güncelleyin.

## Ayrıntılar

Net::IMAP, StartTLS başarısız olduğunda bir istisna yükseltmemektedir, ki bu durumda ortadaki-adam saldırganları istemci ile kayıt arasındaki konuma kaldıraç uygulayarak StartTLS komutunu bloklayabilir ve TLS korumalarını atlatabilir.
İşte bu "StartTLS çıkarma saldırısı" adını almaktadır.

## Etkilenen Sürümler

* Ruby 2.6 serisi: 2.6.7 ve öncesi
* Ruby 2.7 serisi: 2.7.3 ve öncesi
* Ruby 3.0 serisi: 3.0.1 ve öncesi

## Teşekkürler

[Alexandr Savca](https://hackerone.com/chinarulezzz)'ya bu zaafiyeti bildirdiği için teşekkür ederiz.

## Geçmiş

* İlk olarak 2021-07-07 09:00:00 UTC tarihinde yayınlandı.
