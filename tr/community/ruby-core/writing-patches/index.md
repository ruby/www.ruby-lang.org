---
layout: page
title: "Yama Yazıcı Kılavuzu"
lang: tr
---

Burada yamalarınızın göz önüne alınabilmesi için takip etmeniz gereken, Matz
tarafından hazırlanmış, bazı ipuçlarını bulabilirsiniz.
{: .summary}

Bu kılavuz Ruby-Core e-posta listesindeki
[Matz'in bir gönderisi][ruby-core-post]nden alınmıştır:

* Yama başına bir değişiklik gerçekleyin

  Ertelenen yamalar için bu durum en büyük konudur. Birden fazla hatayı
  düzelten (ve özellikler ekleyen) bir yamayı bir seferde gönderdiğinizde,
  uygulamadan önce bunları ayırmamız gerekiyor. Bizim gibi meşgul
  geliştiriciler için bu, oldukça zor bir iş, o yüzden bu gibi yamalar genelde
  ertelenir. Lütfen büyük yamalar göndermeyin.

* Açıklama ekleyin

  Bazen yamalar hangi problemi düzelttiklerini yeterince açıklamıyorlar. Daha
  iyi bir açıklama (düzeltilen problem, önkoşullar, platform, vb.) yamanın daha
  erken birleştirilmesine yardımcı olacaktır.

* En son revizyonla aradaki fark

  Probleminiz en son revizyonda çözülmüş olabilir. Ya da kod şu anda tamamiyle
  farklı olabilir. Bir yama göndermeden önce, lütfen Subversion deposundan son
  sürümü (son geliştirme sürümü için `trunk` dalı,
  {{ site.svn.stable.version }} için `{{ site.svn.stable.branch }}`) çekmeyi
  deneyin.

* `diff -u` kullanın

  `diff -c` ya da diğer tür yamalar yerine `diff -u` tarzı birleşik yamaları
  tercih ediyoruz. Bu yamaları gözden geçirmesi çok daha kolay. Değiştirilmiş
  dosyaları göndermeyin, kendimiz fark oluşturmak istemiyoruz.

* Test durumları sağlayın (isteğe bağlı)

  Test durumları sağlayan bir yama (tercihen `test/*/test_*.rb`'ye), yamayı ve
  niyetinizi anlamamıza yardım edecektir.

İleride Git tarzı itme/çekme akışına geçebiliriz. O zamana kadar, yukarıdaki
kılavuza uymak düş kırıklığına uğramamanız için önemlidir.


[ruby-core-post]: https://blade.ruby-lang.org/ruby-core/25139
