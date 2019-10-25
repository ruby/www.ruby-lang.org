---
layout: news_post
title: "Ruby 2.2.0-preview1 Yayınlandı"
author: "naruse"
translator: "İ. Emre Kutlu"
date: 2014-09-18 09:00:00 +0000
lang: tr
---

Ruby 2.2.0-preview1 sürümünü duyurmaktan memnuniyet duyuyoruz.

Ruby 2.2.0-preview1, Ruby 2.2.0 için ilk önsürümdür.
Giderek artan ve genişleyen çeşitlilikte beklentileri karşılamak için
Ruby'ye birçok yeni özellik ve iyileştirme eklendi.

Örneğin Symbol GC, sembollerin otomatik olarak bellekten temizlenebilmesini
sağladı. Bu, sembollerin bellek kullanımını azaltır, çünkü Ruby 2.2'den önce
GC bunu yapamıyordu. Rails 5.0, Symbol GC kullanımını zorunlu tutacak.
Rails 5.0 sadece Ruby 2.2 veya daha üst sürümleri destekleyecek.
(Ayrıntılar için [Rails'in blog yazısı](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)na bakın.)

Ayrıca, yeni Artımlı GC otomatik bellek temizleme işlemindeki duraklamaları
azaltıyor. Rails uygulamalarını koşmak için faydalı.

Ruby 2.2.0-preview1 ile proglamlamanın tadını çıkarın!

## 2.1'den sonra Kayda Değer Değişiklikler

* [Artımlı GC](https://bugs.ruby-lang.org/issues/10137)
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
* ana kütüphaneler:
  * Unicode 7.0 desteği [#9092](https://bugs.ruby-lang.org/issues/9092)
  * Yeni metodlar:
    * Enumerable#slice_after
    * Float#next_float, Float#prev_float
    * File.birthtime, File#birthtime
* beraber gelen kütüphaneler:
  * Psych 2.0.6 güncellemesi
  * Rake 10.3.2+ güncellemesi (e47d0239)
  * RDoc 4.2.0.alpha güncellemesi (21b241a)
  * RubyGems 2.4.1+ güncellemesi (713ab65)
  * test-unit 3.0.1 güncellemesi (depodan çıkarıldı fakat tar arşivine eklendi)
  * minitest 5.4.1 güncellemesi (depodan çıkarıldı fakat tar arşivine eklendi)
  * mathn sonraki sürümlerde desteklenmeyecek
* C API
  * Sonraki sürümlerde desteklenmeyeceği belirtilen API'lar kaldırıldı

Ayrıntılar için [Ruby deposundaki NEWS'e (yapım aşamasında)](https://github.com/ruby/ruby/blob/v2_2_0_preview1/NEWS) bakınız.

Bu değişiklikler ile, 1239 dosya değiştirildi, 98343 ekleme(+), 61858 silme(-)
yapıldı.

## İndir

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.bz2>
  * BOYUT:  12385780 bayt
  * MD5:    767b132eec3e70b14afe5884a7a767b1
  * SHA256: a3614c389de06b1636d8b919f2cd07e85311486bda2cb226a5549657a3610af5
  * SHA512: 2f1190f5d8cd1fa9962d1ff416dae97759d032a96801d77bc6b10136eba59dde1a554ff8c0c2d9ce0d3c1361d4dd12ad573b1266fd53b90ab238d8ce39e6b862
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.gz>
  * BOYUT:  15419211 bayt
  * MD5:    f78fc9ec907fe622822abf3aa839c1b4
  * SHA256: 7a49493d148a38eff9ab13e88601686985cadf2de86276ae796f5443deab3abb
  * SHA512: 34381eee1d31cc1dad87e6d57ba71153c4db034b697cf7f0010fa432bb037e8eef5a90936a658f8f07b9b1eaa18f0b5c02ea113c78f39061514724373622a3b5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.xz>
  * BOYUT:  9617132 bayt
  * MD5:    96cde140b3211780d58b36af023143d5
  * SHA256: 7ed01a518b8c4d65bfb887cf6e0809977c88abeb5bb70c9fe8df754966820411
  * SHA512: 1241fd9a6e583544576177f372e245845b9df1427104b595963e37d7348a7d1c5558c6f6bf6ca5f1856d0d4a8f4a54a8948d4b6d78fb7943d6c7458691f34f6d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.zip>
  * BOYUT:  17161678 bayt
  * MD5:    df34e9d6a447b21a4e7fa261d51bb881
  * SHA256: 2fa6c0cbddd1566a8658e16a34b6ae2f9eda2a8eeee4113561b3948d066f44a0
  * SHA512: 615b35c0a0bc408b28af9d9220ccd1658c718c7657ae7ad3f8318d38850bec760b1738c43454986b105857a7ffc2fea95294b964e5ea26a915d6fd9d510351b7

## Sürüm Yorumu

* [2.2.0 Bilinen sorunlar](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

Ayrıca, sürüm planlaması ve diğer bilgiler için bakınız:

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering22)
