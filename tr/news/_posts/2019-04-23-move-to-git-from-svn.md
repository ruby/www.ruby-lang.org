---
layout: news_post
title: "Ruby Deposu Subversion'dan Git'e Taşındı"
author: "hsbt"
translator: "İsmail Arılık"
date: 2019-04-23 00:00:00 +0000
lang: tr
---

Bugün, Ruby programlama dilinin standart deposu Subversion'dan Git'e taşındı.

Yeni depo için web arayüzü [https://git.ruby-lang.org](https://git.ruby-lang.org)'dur, ve cgit tarafından sağlanmaktadır.
Katkıcının işleme hash'ini doğrudan Ruby deposunda tutabiliriz.

## Geliştirme politikası

* cgit'te bir konu dalı kullanmıyoruz.
* GitHub deposu sadece bir yansı olarak kalmaya devam edecek.
  "Çekme isteğini birleştir" özelliğini kullanmıyoruz.
* ruby_2_4, ruby_2_5, ve ruby_2_6 dalları SVN'i kullanmaya devam edecek.
  cgit'te bu dallara herhangi bir şey itmiyoruz.
* ruby_2_7'den başlayarak, kararlı dalları geliştirmek için cgit'i kullanacağız.
* Birleştirme işlemelerini kullanmıyoruz.

## Özel Teşekkürler

* k0kubun

  k0kubun yoğun bir şekilde, iş akışlarını yayınlamak ve geri taşımak ile ilgili araç dizilerini geliştirdi ve ayrıca git için kanca betiğini güncelledi.

* naruse

  naruse, Ruby CI ve Redmine (bugs.ruby-lang.org) için özellik değişikliklerini güncelledi.

* mame

  mame, slack için işleme bildirim betiği oluşturdu.

## Gelecek İş

Hala bazı görevleri tamamlamalıyız.
Eğer Git göçü ile ilgili bir sorun bulursanız, lütfen bunu [https://bugs.ruby-lang.org/issues/14632](https://bugs.ruby-lang.org/issues/14632) konusuna dosyalayın.

Keyfini çıkarın!
