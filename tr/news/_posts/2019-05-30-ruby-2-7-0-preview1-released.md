---
layout: news_post
title: "Ruby 2.7.0-preview1 Yayınlandı"
author: "naruse"
translator: "İsmail Arılık"
date: 2019-05-30 00:00:00 +0000
lang: tr
---

Ruby 2.7.0-preview1'in yayınını duyurmaktan memnuniyet duyarız.

Bu önizleme sürümü, Aralık ayında yayınlanması planlanan son sürüm için geri bildirim almak amacıyla yayınlanmıştır.
Bu sürüm, birçok yeni özellik ve performans iyileştirmesi içermektedir, en önemlileri:

* Sıkıştırma GC
* Desen Eşleştirme
* REPL iyileştirmesi

## Sıkıştırma GC

Bu sürüm, parçalanmış hafıza alanını birleştirebilen Sıkıştırma GC'yi tanıtmaktadır.

Bazı çok thread'li Ruby programları hafıza parçalanmasına neden olabilir, bu da yüksek hafıza kullanımı ve hız düşüşüne neden olur.

`GC.compact` metodu, heap'i sıkıştırmak için eklenmiştir.
Bu fonksiyon heap'teki canlı nesneleri sıkıştırır, böylece daha az sayfa kullanılabilir ve heap daha yazmada-kopyala canlısı olabilir.
[#15626](https://bugs.ruby-lang.org/issues/15626)

## Desen Eşleştirme [Deneysel]

Desen eşleştirme deneysel bir özellik olarak eklenmiştir, bu özellik fonksiyonel programlama dillerinde sıklıkla kullanılır.
[#14912](https://bugs.ruby-lang.org/issues/14912)
Bu özellik, verilen bir nesne üzerinde yürüyebilir ve eğer bu nesne bir desenle eşleşirse, bu nesnenin değerini atayabilir.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

Daha fazla ayrıntı için lütfen [Desen eşleştirme - Ruby 2.7'de yeni bir özellik](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)'e bakın.

## REPL iyileştirmesi

Ruby ile gelen etkileşimli ortam (REPL; Read-Eval-Print-Loop) olan `irb` şimdi çoklu satır değiştirmeyi destekliyor.
Bu özellik, `reline` ve `readline`'a uyumlu saf bir Ruby gerçeklemesi tarafından güçlendirilmiştir.
Ayrıca bu, rdoc bütünleşimi de sağlamaktadır.
`irb`'de ayrıca verilen bir sınıf, modül ya da metodun başvurusunu da görüntüleyebilirsiniz.
[#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
ÜStelik şimdi `binding.irb`'de gösterilen kaynak satırları ve temel sınıf nesnelerinin gözlem sonuçları renklendiriliyor.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Dikkate Değer Diğer Yeni Özellikler

* Bir metod referans operatörü (<code>.:</code>), deneysel bir özellik olarak eklendi.
  [#12125]( https://bugs.ruby-lang.org/issues/12125), [#13581]( https://bugs.ruby-lang.org/issues/13581)

* Varsayılan blok parametresi olarak numaralanmış parametre, deneysel bir özellik olarak eklendi.
  [#4475](https://bugs.ruby-lang.org/issues/4475)

* Başlangıçsız aralık deneysel olarak eklendi.
  Bu, sonsuz aralık kadar kullanışlı olmayabilir, fakat DSL kullanımları için iyi olacaktır.
  [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # ary[0..3] ile aynı
      rel.where(sales: ..100)

* `Enumerable#tally` eklendi.
  Bu metod, her öğenin kaç kere geçtiğini sayar.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Performans İyileştirmeleri

* JIT [Deneysel]

  * JIT edilmiş kod, bir eniyileştirme varsayımı geçersiz kılındığında, daha az eniyileştirilmiş koda yeniden derlenir.

  * Bir metodun saf olduğu düşünülürse, metod satıriçi yapma uygulanır.
    Bu eniyileme hala deneyseldir ve birçok metod henüz saf olarak düşünülmemektedir.

  * `--jit-min-calls`'ın varsayılan değeri 5'ten 10.000'e değiştirildi.

  * `--jit-max-cache`'in varsayılan değeri 1.000'den 100'e değiştirildi.

## 2.6'dan bu yana dikkate değer diğer değişiklikler

* Bir blokla çağrılmış bir metodda bloksuz olarak yer alan `Proc.new` ve `proc` şimdi bir uyarıdır.

* Bir blokla çağrılmış bir metodda bloksuz olarak yer alan `lambda` şimdi bir hatadır.

* Unicode ve Emoji sürümleri 11.0.0'dan 12.0.0'a güncellendi.
  [[Özellik #15321]](https://bugs.ruby-lang.org/issues/15321)

* Unicode sürümü 12.1.0'a güncellendi, bu sürüm U+32FF SQUARE ERA NAME REIWA için destek eklemektedir.
  [[Özellik #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, ve `Date.parse` resmi olmayan bir uzantı ile geçici olarak yeni Japon dönemini desteklemektedir, yeni JIS X 0301 çıkana kadar.
  [[Özellik #15742]](https://bugs.ruby-lang.org/issues/15742)

* Derleyicilerin C99'u desteklemesi zorunlu tutuldu.
  [[Diğer #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Lehçemizin ayrıntıları: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Daha fazla ayrıntı için [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) ya da [işleme logları](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)na bakın.

Bu değişiklikler ile Ruby 2.6.0'dan bu yana [1727 dosya değişti, 76022 ekleme yapıldı(+), 60286 silme yapıldı(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)!

Ruby 2.7 ile programlamanın keyfini çıkarın!

## İndirin

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## Ruby Nedir

Ruby ilk olarak Matz (Yukihiro Matsumoto) tarafından 1993'te geliştirilmiştir, ve şimdi Açık Kaynak olarak geliştirilmektedir.
Birçok platformda çalışır ve dünyanın her yerinde kullanılır, özellikle web geliştirmesi için.
