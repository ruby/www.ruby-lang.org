---
layout: news_post
title: "CVE-2021-31810: Net::FTP'de FTP PASV yanıtlarına güvenme zaafiyeti"
author: "shugo"
translator: "ismailarilik"
date: 2021-07-07 09:00:00 +0000
tags: security
lang: tr
---

Net::FTP'de bir FTP PASV yanıtlarına güvenme zaafiyeti keşfedildi.
Bu zaafiyete [CVE-2021-31810](https://www.cve.org/CVERecord?id=CVE-2021-31810) CVE belirteci atanmıştır.
Şiddetle Ruby'yi güncellemenizi tavsiye ederiz.

net-ftp Ruby 3.0.1 ile gelen varsayılan bir gem'dir fakat paketleme sorunlarına sahiptir, yani lütfen Ruby'nin kendisini güncelleyin.

## Ayrıntılar

Zararlı bir FTP sunucusu PASV yanıtını, Net::FTP'yi verilen bir IP adresi ve port'a tekrar bağlamak için kullanabilir.
Bu muhtemelen Net::FTP'nin normalde gizli olan bilgileri dışarı çıkarmasını sağlayabilir.
Örneğin; saldırgan port taramaları ve servis afişi çıkarmaları yönetebilir.

## Etkilenen sürümler

* Ruby 2.6 serisi: 2.6.7 ve öncesi
* Ruby 2.7 serisi: 2.7.3 ve öncesi
* Ruby 3.0 serisi: 3.0.1 ve öncesi

## Teşekkürler

[Alexandr Savca](https://hackerone.com/chinarulezzz)'ya bu zaafiyeti bildirdiği için teşekkür ederiz.

## Geçmiş

* İlk olarak 2021-07-07 09:00:00 UTC tarihinde yayınlandı.
