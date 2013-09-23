---
layout: page
title: "Java'dan Ruby'ye"
lang: tr
---

Java oturmuş bir dildir, kararlıdır ve hızlıdır (Java karşıtları bunu
kabul etmezler) Ayrıca biraz da gereksiz kalabalık kodları vardır.
Java’dan Ruby’ye geçince kodunuzun boyutunun azalması beklenir, ayrıca
prototiplere daha çabuk ulaşırsınız.

### Benzerlikler

Java’da olduğu gibi Ruby’de de,...

* Hafıza kullanımı sizin tarafınızdan yönetilir.
* Nesneleri işlemekte güçlüdür.
* Public, private ve protected metodlar vardır.
* Gömülü dökümanlama araçları vardır (Ruby’ninki RDoc olarak
  isimlendirilir). RDoc ile hazırlanan dökümanlar javadoc ile
  hazırlanana çok benzer.

### Farklar

Ruby’de Java’dan farklı olarak,...

* Kodunuzu derlemeye gerek yoktur, direk olarak çalıştırırsınız.
* Ruby kullanıcıları değişik GUI araşları kullanabilir [WxRuby][1],
  [FXRuby][2], [Ruby-GNOME2][3], [Qt][4], ya da Ruby içinde yüklü gelen Tk
  bunların bazıları.
* Sınıflar, metodlar gibi birşeyleri tanımlarken kod bloğunu süslü
  parantez içine almak yerine sonunda `end` deyimi kullanırsınız
* `import` yerine `require` kullanılır.
* Sınıf içinde tüm değişkenler özeldir. Dışardan herşeye metodlarla
  erişirsiniz.
* Metod çağrılarında parantezler genelde opsiyoneldir ve çoğunlukla da
  kullanılmaz.
* Herşey bir nesnedir, 2 veya 3.14159 gibi sayılar dahil.
* Sabit tip kontrolü yoktur.
* Değişken isimleri sadece etiketlerdir. Belirlenmiş bir tipe
  bağlanmazlar.
* Tip tanımlamaları yoktur. Yeni bir değişken üretirken sadece kendisine
  değer atamak yeterlidir. (örn. `int[] a = {1,2,3};` yerine `a =
  [1,2,3]` yazılır)
* There’s no casting. Just call the methods. Your unit tests should tell
  you before you even run the code if you’re going to see an exception.
* `Foo foo = new Foo("hi")` yerine `foo = Foo.new("hi")` yazılır.
* Sınıfın üretici metodu için sınıfın adı yerine bütün sınıflar için
  “initialize” ismi kullanılır.
* “interface” yerine “mixin” vardır.
* YAML, XML’e göre daha tercih edilen bir yöntemdir.
* `null` yerine `nil` kullanılır.
* `==` ve `equals()` Ruby’de farklı değerlendirilir. Ruby’de eşitlik
  test etmek için `==` kullanılır (Java’da `equals()` kullanılır).
  Nesnelerin birbiri ile aynı olduğunu test için Ruby’de `equal?()`
  kullanılır (Java’da `==` kullanılır)



[1]: http://wxruby.rubyforge.org/wiki/wiki.pl
[2]: http://www.fxruby.org/
[3]: http://ruby-gnome2.sourceforge.jp/
[4]: https://github.com/ryanmelt/qtbindings/
