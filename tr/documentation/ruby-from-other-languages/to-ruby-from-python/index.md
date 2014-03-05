---
layout: page
title: "Python'dan Ruby'ye"
lang: tr
---

Python bir diğer çok güzel genel amaçlı bir programlama dilidir.
Pythondan ruby’e geçerken, ruby de pythona göre öğrenmeniz gereken daha
fazla söz dizimi bulabilirsiniz.

### Benzerlikler

Pythonda olduğu gibi,rubyde,...

* Etkileşimli komut satırı vardır. (`irb` olarak bilinir).
* dökümanları komut satırında okuyabilirsiniz. (`pydoc` yerine `ri`
  komutuyla).
* Özel satır sonlandırıcıları yoktur. (Her zamanki yeni satır hariç).
* Karakter dizesi değişmezleri Python’ın üç tırnaklı karakter dizesi
  gibi birden fazla satır olabilir.
* Köşeli parantezler listeler içindir, ve parantezler sözlükler içindir.
  (Rubyde, “hash” veri tipi içindir).
* Diziler aynı şekilde çalışır. (Eklemek uzun bir dizi yapar, ama onları
  bu şekilde karıştırmak `a3 = [ a1, a2 ]` size dizilerden oluşan bir
  dizi verir).
* Nesneler güçlü ve dinamik olarak yazılır.
* Her şey objedir, ve değişkenler sadece objelere referanslardır.
* Anahtar kelimeleri biraz farklı olmasına rağmen, istisnalar aynı
  çalışır.
* Gömülü döküman araçlarına sahipsiniz. (Rubyde rdoc).

### Farklılıklar

Python’ın aksine, Rubyde,...

* Karakter dizeleri değişebilir.
* Sabitler oluşturabilirsiniz. (Değerinin değişmesini istemediğiniz
  değişkenler).
* Bazı zorunlu harf kuralları vardır. (ör. sınıf isimleri büyük harfle
  başlar, değişkenler küçük harfle başlar).
* Tek çeşit liste konteyneri vardır (bir dizi(Array)), ve değişkendir.
* Çift tırnaklı karakter dizeleri kaçış karakterlerine (`\t` gibi) ve
  özel “ifade ikame” söz dizilerine (Ruby ifadelerinin sonuçlarını diğer
  karakter dizelerine `"add " + "strings " + "together"` şeklinde
  uğraşmadan direkt olarak eklemenizi sağlar) izin verir. Tek tırnaklı
  karakter dizeleri Python’ın `r"ham karakter dizeleri"` gibidir.
* “new style” ve “old style” sınıflar yoktur. Sadece tek çeşittir.
* Özniteliklere asla direkt olarak ulaşamazsınız. Ruby ile, tümü metod
  çağrılarıdır.
* Metod çağrılarında parantez kullanımı genellikle isteğe bağlıdır.
* Erişim izinleri için Python’ın `_voluntary_` underscore@*convention*@
  ifadeleri yerine `public`, `private` ve `protected` ifadeleri vardır.
* Çoklu miras yerine mixinler kullanılır.
* You can add or modify the methods of built-in classes. Both languages
  let you open up and modify classes at any point, but Python prevents
  modification of built-ins — Ruby does not.
* `True` ve `False` yerine `true` ve `false` vardır (ve `None` yerine
  `nil`).
* Doğruluk test edildiğinde, sadece `false` ve `nil` false bir değer
  döner. Diğer her şey true döner (`0`, `0.0`, `""`, ve `[]` dahil).
* `elif` yerine `elsif` kullanılır.
* `import` yerine `require` kullanılır. Fakat kullanımları aynıdır.
* The usual-style comments on the line(s) *above* things (instead of
  docstrings below them) are used for generating docs.
* Birçok kısayol vardır , buna rağmen kolay hatırlar, hızlıca
  öğrenirsiniz. Bunlar rubyyi eğlenceli ve çok üretken yapmak içindir.
* Daha önceden belirlenmiş bir değişkeni silme yolu yoktur (Python’ın
  `del` ifadesi gibi). Değişkeni `nil` olarak ayarlayabilirsiniz, bu
  eski değişkenin eski değerini çöp toplayıcıya gönderir, ama değişken
  kapsamı içinde sembol tablosunda kalmaya devam eder.

