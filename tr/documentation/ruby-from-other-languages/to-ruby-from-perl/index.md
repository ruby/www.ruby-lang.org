---
layout: page
title: "Perl'den Ruby'ye"
lang: tr
---

Perl çok iyidir. Perl’ün dökümantasyonu çok iyidir. Perl’ün topluluğu …
çok iyidir. Ancak bu dil biraz kalabalık ve karmaşıktır. Bu yüzden az
zaman harcayan, daha belirli çizgileri olan ve başından beri eşsiz OO
özellikleri olan bir dilin hasretini çeken Perl’cüler için Ruby uygun
olabilir.

### Benzerlikler

Perl’de olduğu gibi Ruby’de de,...

* CPAN benzeri bir paket yönetim sistemi vardır ([RubyGems][1])
* Regex’ler içine gömülüdür. Bon appétit!
* Birçok sık kullanılan özellik içinde gömülüdür.
* Parantezler çoğunlukla isteğe bağlıdır
* String’ler aynı şekilde çalışır.
* Perl gibi string ve regex belirleme yapıları vardır. (`%q{bu}`
  (tek-tırnak), veya `%Q{bu}` (çift-tırnaklı), ve `%w{bu tek-tırnaklı
  kelime listesi}` gibi. İsterseniz `%Q|bunu|` `%Q(veya)` `%Q^diğer
  bir^` sınırlayıcıyı da kullanabilirsiniz).
* Çift tırnak içinde değişken değerlerine `"bu #{şekilde}"`
  erişebilirsiniz. (Ayrıca bu `#{}` içine Ruby kodu da koyabilirsiniz.
* Shell komutu program içinden `` `backtick’ler` `` (ters tek tırnaklar) ile
  çağrılır (``tarih = `date` `` gibi).
* Gömülü döküman aracı vardır (Ruby’ninki RDoc olarak adlandırılmıştır).

### Farklar

Ruby’de Perl’den farklı olarak,...

* Perl’deki gibi içeriğe bağlı kurallar yoktur.
* Bir değişken gösterdiği nesne ile aynı şey değildir. Sadece nesneye
  referans verir.
* `$` ve `@` karakterleri bazen değişken isminin ilk harfi olarak
  kullanılabilir. Ama bunlar tipi değil kapsamı belirtir. (global
  değişkenler `$` ile başlar, nesne nitelikleri `@` ile
  başlar ve sınıf nitelikleri `@@` ile başlar).
* Array değerleri parantezler yerine köşeli parantezler içinde
  gösterilir.
* Listelerden oluşan bir liste ürettiğinizde büyük bir liste oluşmaz.
  Array’lerden oluşan bir array elde edersiniz.
* `sub` yerine `def` kullanılır.
* Her satırın sonunda noktalı virgül gerekmez. Lafı açılmışken, sınıf
  tanımları, fonksiyon tanımları ve case blokları `end` anahtar kelimesi ile
  biter.
* Nesneler güçlü tiplenirler. Nesnelerin tipini dönüştürmek için
  `foo.to_i`, `foo.to_s` gibi elle yapmalısınız.
* `eq`, `ne`, `lt`, `gt`, `ge`, veya `le` yoktur.
* “Diamond” operatörü (`<>`) yoktur. Genellikle bunun yerine
  `IO.fonksiyon` kullanılır.
* “fat comma” (`=>`) sadece hash içinde kullanılır.
* `undef` yoktur. Ruby’de `nil` vardır. `nil` de diğer herşey gibi bir
  nesnedir. Tanımsız değişken ile aynı şey değildir. Boolean
  sorgulanırsa `false` olarak değer görür.
* Doğruluğu sorgulandığında sadece `false` ve `nil` olumsuz değer
  dönerler diğer herşey olumlu (true) değer döner ( `0`, `0.0`, ve `"0"`
  dahil herşey!)
* [PerlMonks][2] gibi biryer yoktur. Ancak ruby-talk mailing list
  ihtiyaclarınızı karşılar.



[1]: http://guides.rubygems.org
[2]: http://www.perlmonks.org/
