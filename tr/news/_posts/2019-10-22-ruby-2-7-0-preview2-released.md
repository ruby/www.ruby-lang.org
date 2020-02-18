---
layout: news_post
title: "Ruby 2.7.0-preview2 Yayınlandı"
author: "naruse"
translator: "İsmail Arılık"
date: 2019-10-22 12:00:00 +0000
lang: tr
---

2.7.0-preview2'nin yayınlandığını duyurmaktan memnuniyet duyuyoruz.

Bir önizleme sürümü, Aralık'ta yayınlanması planlanan son sürüm için geri bildirim toplamak için yayınlanır.
Bu sürüm birkaç yeni özellik ve performans iyileştirmesi içermektedir, bunların en önemlileri:

* Sıkıştırma GC
* Desen Eşleştirme
* REPL iyileştirmesi
* Konumsal argümanların ve anahtar kelime argümanlarının ayrılması

## Sıkıştırma GC

Bu sürüm, parçalanmış hafıza alanını birleştirebilen Sıkıştırma GC'yi tanıtmaktadır.

Bazı çok thread'li Ruby programları hafıza parçalanmasına neden olabilir, bu da yüksek hafıza kullanımı ve hız düşüşüne neden olur.

`GC.compact` metodu, heap'i sıkıştırmak için eklenmiştir.
Bu fonksiyon heap'teki canlı nesneleri sıkıştırır, böylece daha az sayfa kullanılabilir ve heap daha CoW canlısı olabilir.
[Özellik #15626](https://bugs.ruby-lang.org/issues/15626)

## Desen Eşleştirme [Deneysel]

Desen eşleştirme deneysel bir özellik olarak eklenmiştir, bu özellik fonksiyonel programlama dillerinde sıklıkla kullanılır.
[Özellik #14912](https://bugs.ruby-lang.org/issues/14912)
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
[Özellik #14683](https://bugs.ruby-lang.org/issues/14683), [Özellik #14787](https://bugs.ruby-lang.org/issues/14787), [Özellik #14918](https://bugs.ruby-lang.org/issues/14918)
ÜStelik şimdi `binding.irb`'de gösterilen kaynak satırları ve temel sınıf nesnelerinin gözlem sonuçları renklendiriliyor.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Konumsal argümanların ve anahtar kelime argümanlarının ayrılması

Anahtar kelime argümanlarının ve konumsal argümanların otomatik dönüştürülmesi ileride kaldırılacak olarak işaretlendi ve Ruby 3'te kaldırılacak.
[[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)

* Eğer bir metod çağrısı son argümanı olarak bir Hash geçirirse, ve hiç anahtar kelime geçirmezse, ve çağrılan metod anahtar kelimeler kabul ediyorsa, bir uyarı yayınlanır.
  Anahtar kelime olarak anlaşılmasını sağlamak, uyarıdan kaçınmak ve Ruby 3'te doğru davranıştan emin olmak için çift yıldız operatörü ekleyin.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # uyarı yayınlanır
  def foo(**kw);    end; foo({key: 42})   # uyarı yayınlanır
  def foo(key: 42); end; foo(**{key: 42}) # İyi
  def foo(**kw);    end; foo(**{key: 42}) # İyi
  ```

* Eğer bir metod çağrısı, anahtar kelimeler kabul eden bir metoda anahtar kelimeler geçirirse fakat yeterli sayıda zorunlu konumsal argüman geçirmezse, anahtar kelimeler gerekli son konumsal argüman olarak düşünülür ve bir uyarı yayınlanır.
  Uyarıdan kaçınmak ve Ruby 3'te doğru davranıştan emin olmak için argümanı anahtar kelimeler olarak değil de, hash olarak geçirin.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # uyarı yayınlanır
  def foo(h, key: 42); end; foo(key: 42)   # uyarı yayınlanır
  def foo(h, **kw); end; foo({key: 42})    # İyi
  def foo(h, key: 42); end; foo({key: 42}) # İyi
  ```

* Bir metod belirli anahtar kelimeler bekliyor fakat yıldızlı anahtar kelime beklemiyorsa, ve metoda bir hash ya da hem Symbol hem de Symbol olmayan anahtarları içeren yıldızlı anahtar kelimeler geçirildiyse, hash ayrılmaya devam eder, ve bir uyarı yayınlanır.
  Ruby 3'te doğru davranıştan emin olmak için çağıran kodu ayrı hash'ler geçirecek şekilde güncellemeniz gerekiyor.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # uyarı yayınlanır
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # uyarı yayınlanır
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # İyi
  ```

* Eğer bir metod anahtar kelime kabul etmiyor ve anahtar kelimeler ile çağrıldıysa, anahtar kelimeler yine konumsal hash olarak düşünülür, herhangi bir uyarı yayınlanmaz.
  Bu davranış Ruby 3'te çalışmaya devam edecek.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # İyi
  ```

* Eğer metod keyfi anahtar kelimeler kabul ediyorsa, anahtar kelime argüman anahtarları olarak sembol olmayanlara izin verilir.
  [[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* Harici olarak metodun anahtar kelime almadığını belirtmek için metod tanımlarında <code>**nil</code> kullanılabilir.
  Böyle bir metodu anahtar kelimeler ile çağırmak ArgumentError ile sonuçlanır.
  [[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # İyi
  def foo(h, **nil); end; foo({"str" => 1}) # İyi
  ```

* Anahtar kelime almayan bir metoda boş bir anahtar kelime yıldızı geçirmek artık boş bir hash geçirmiyor.
  Ancak gerekli bir parametre için boş bir hash gerekliyse, bir uyarı yayınlanır.
  Konumsal bir hash geçirmeye devam etmek için çift yıldızı kaldırın.
  [[Özellik #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} ve uyarı
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

## Dikkate Değer Diğer Yeni Özellikler

* Bir metod referans operatörü (<code>.:</code>), deneysel bir özellik olarak eklendi.
  [[Özellik #12125]]( https://bugs.ruby-lang.org/issues/12125), [[Özellik #13581]]( https://bugs.ruby-lang.org/issues/13581)

* Varsayılan blok parametresi olarak numaralanmış parametre, deneysel bir özellik olarak eklendi.
  [[Özellik #4475]](https://bugs.ruby-lang.org/issues/4475)

* Başlangıçsız aralık deneysel olarak eklendi.
  Bu, sonsuz aralık kadar kullanışlı olmayabilir, fakat DSL kullanımları için iyi olacaktır.
  [[Özellik #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # ary[0..3] ile aynı
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` eklendi.
  Bu metod, her öğenin kaç kere geçtiğini sayar.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* `self` üstünden özel bir metodu çağırmaya artık izin verilmiyor.
  [[Özellik #11297]](https://bugs.ruby-lang.org/issues/11297) [[Özellik #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` eklendi.
  Bu, tembel bir numaralandırıcıdan tembel olmayan bir numaralandırıcı oluşturur.
  [[Özellik #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Performans iyileştirmeleri

* JIT [Deneysel]

  * JIT edilmiş kod, bir eniyileştirme varsayımı geçersiz kılındığında, daha az eniyileştirilmiş koda yeniden derlenir.

  * Bir metodun saf olduğu düşünülürse, metod satıriçi yapma uygulanır.
    Bu eniyileme hala deneyseldir ve birçok metod henüz saf olarak düşünülmemektedir.

  * `--jit-min-calls`'ın varsayılan değeri 5'ten 10.000'e değiştirildi.

  * `--jit-max-cache`'in varsayılan değeri 1.000'den 100'e değiştirildi.

* `Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` ve `nil.to_s` artık her zaman donmuş String döndürüyor.
Döndürülen String, belirli bir nesne için her zaman aynıdır.
[Deneysel]  [[Özellik #16150]](https://bugs.ruby-lang.org/issues/16150)

* `CGI.escapeHTML`'in performansı iyileştirildi.
[GH-2226](https://github.com/ruby/ruby/pull/2226)

## 2.6'dan bu yana dikkate değer diğer değişiklikler

* Bazı standart kütüphaneler güncellendi.
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Orijinal sürümü olmayan bazı diğer kütüphaneler de güncellendi.

* Bir blokla çağrılmış bir metodda bloksuz olarak yer alan `Proc.new` ve `proc` şimdi bir uyarıdır.

* Bir blokla çağrılmış bir metodda bloksuz olarak yer alan `lambda` şimdi bir hatadır.

* Unicode ve Emoji sürümleri 11.0.0'dan 12.0.0'a güncellendi.
  [[Özellik #15321]](https://bugs.ruby-lang.org/issues/15321)

* Unicode sürümü 12.1.0'a güncellendi, bu sürüm U+32FF SQUARE ERA NAME REIWA için destek eklemektedir.
  [[Özellik #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, ve `Date.parse` yeni Japon dönemini desteklemektedir.
  [[Özellik #15742]](https://bugs.ruby-lang.org/issues/15742)

* Derleyicilerin C99'u desteklemesi zorunlu tutuldu.
  [[Diğer #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Lehçemizin ayrıntıları: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Daha fazla ayrıntı için [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview2/NEWS)'e ya da [işleme logları](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2)na bakın.

Bu değişiklikler ile birlikte Ruby 2.6.0'dan bu yana [3670 dosya değişti, 201242 ekleme(+), 88066 silme(-) yapıldı](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2)!

Ruby 2.7 ile programlamanın tadını çıkarın!

## İndirin

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## Ruby nedir

Ruby ilk olarak Matz (Yukihiro Matsumoto) tarafından 1993'te geliştirilmiştir ve şimdi Açık Kaynak olarak geliştirilmektedir.
Birçok platformda çalışır ve dünyanın her yerinde kullanılır, özellikle web geliştirmesi için.
