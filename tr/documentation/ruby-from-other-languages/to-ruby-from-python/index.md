---
layout: page
title: "Python'dan Ruby'ye"
lang: tr
---

Python bir diğer çok güzel genel amaçlı bir programlama dilidir.
Pythondan ruby’e geçerken, ruby de pythona göre öğrenmeniz gereken çok az
söz dizimi bulacaksınız.

### Benzerlikler

Pythonda olduğu gibi,rubyde,...

* Etkileşimli komut satırı vardır. (`irb` olarak bilinir).
* dökümanları komut satırında okuyabilirsiniz. (`pydoc` yerine `ri`
  komutuyla).
* Özel satır sonlandırıcıları yoktur. (Her zamanki yeni satır hariç).
* Karakter dizisi kalıpları Python’ın üç tırnaklı karakter dizesi
  gibi birden fazla satır olabilir.
* Köşeli parantezler listeler içindir, ve süslü parantezler sözlükler içindir.
  (Rubyde, “hash” veri tipi içindir).
* Diziler aynı şekilde çalışır. (Eklemek uzun bir dizi yapar, ama onları
  bu şekilde birleştirmek `a3 = [ a1, a2 ]` size dizilerden oluşan bir
  dizi verir).
* Nesneler güçlü ve dinamik tiplenirler.
* Her şey objedir, ve değişkenler sadece objelere referanslardır.
* Anahtar kelimeleri biraz farklı olmasına rağmen, istisnalar aynı
  çalışır.
* Gömülü döküman araçlarına sahipsiniz. (Rubyde rdoc).
* Birinci sınıf fonksiyonlar, anonim fonksiyonlar ve kapamalar ile fonksiyonel
  programlama için iyi bir destek sunar.

### Farklılıklar

Python’ın aksine, Rubyde,...

* Karakter dizeleri değişebilir.
* Sabitler oluşturabilirsiniz. (Değerinin değişmesini istemediğiniz
  değişkenler).
* Bazı zorunlu harf kuralları vardır. (ör. sınıf isimleri büyük harfle
  başlar, değişkenler küçük harfle başlar).
* Tek çeşit liste konteyneri vardır (bir dizi(Array)), ve değişkendir.
* Çift tırnaklı karakter dizeleri kaçış karakterlerine (`\t` gibi) ve
  özel “deyim yer değişimi” söz dizilerine (Ruby ifadelerinin sonuçlarını diğer
  karakter dizelerine `"add " + "strings " + "together"` şeklinde
  uğraşmadan direkt olarak eklemenizi sağlar) izin verir. Tek tırnaklı
  karakter dizeleri Python’ın `r"ham karakter dizeleri"` gibidir.
* “new style” ve “old style” sınıflar yoktur. Sadece tek çeşittir. (Python 3'te
  bu sorun yoktur fakat Python 3, Python 2 ile geriye dönük uyumlu değildir.)
* Özniteliklere asla direkt olarak ulaşamazsınız. Ruby ile, tümü metod
  çağrılarıdır.
* Metod çağrılarında parantez kullanımı genellikle isteğe bağlıdır.
* Erişim izinleri için Python’ın `_kasıtlı_` altçizgi `__geleneği__`
  yerine `public`, `private` ve `protected` ifadeleri vardır.
* Çoklu miras yerine mixinler kullanılır.
* Gömülü sınıflara metod ekleyebilir ya da bu sınıfların metodlarını
  değiştirebilirsiniz. İki dil de sınıfları her zaman açıp değiştirmenize
  izin verir, fakat Python gömülü olanların değiştirilmesini engeller,
  Ruby ise engellemez.
* `True` ve `False` yerine `true` ve `false` vardır (ve `None` yerine
  `nil`).
* Doğruluk test edildiğinde, sadece `false` ve `nil` false bir değer
  döner. Diğer her şey true döner (`0`, `0.0`, `""`, ve `[]` dahil).
* `elif` yerine `elsif` kullanılır.
* `import` yerine `require` kullanılır. Fakat kullanımları aynıdır.
* Satır(lar)daki bir şeylerin (altındaki belgelendirme karakter
  dizileri değil de) *üstündeki* alışıldık biçimdeki yorumlar belgeleri
  oluşturmak için kullanılır.
* Birçok kısayol vardır. Bu, hatırlanacak daha fazla şey anlamına gelse de,
  hızlıca öğrenirsiniz. Bunlar rubyyi eğlenceli ve çok üretken yapmak içindir.
* Daha önceden belirlenmiş bir değişkeni silme yolu yoktur (Python’ın
  `del` ifadesi gibi). Değişkeni `nil` olarak ayarlayabilirsiniz, bu
  değişkenin değerini çöp toplayıcıya gönderir. Ama değişken,
  kapsamı içinde sembol tablosunda kalmaya devam eder.
* `yield` anahtar kelimesi farklı davranır. Python'da bu, yürütmeyi fonksiyon
  başlatımının dışındaki kapsama döndürür. Harici kod fonksiyonu devam
  ettirmekten sorumludur. Ruby'de `yield`, son argüman olarak geçirilen bir
  diğer fonksiyonu yürütür, daha sonra hemen kaldığı yerden devam eder.
