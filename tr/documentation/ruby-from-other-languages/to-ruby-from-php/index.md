---
layout: page
title: "PHP'den Ruby'ye"
lang: tr
---

PHP web uygulamalarında çok yaygın olarak kullanılır, ama Ruby On Rails
kullanmak istiyorsanız veya sadece genel kullanım için daha özel bir dil
istiyorsanız, Ruby’ye bir göz atmaya değer.

### Benzerlikler

PHP’de olduğu gibi, Rubyde…

* Ruby dinamik olarak yazılan bir dildir, PHP’de olduğu gibi, bu yüzden
  değişken tanımlama konusunda endişelenmenize gerek yok
* Sınıflar vardır, ve bu sınıflara erişimi PHP 5’te olduğu gibi kontrol
  edebilirsiniz.
  (`public`, `protected` ve `private`)
* Bazı değişkenler $ sembolü ile başlar, PHP gibi (ama hepsi değil)
* `eval` burada da vardır.
* Karakter dizisi katıştırması kullanabilirsiniz. `"$foo is a $bar"`
  şeklinde kullanmak yerine `"#{foo} is a #{bar}"` şeklinde
  kullanabilirsiniz—PHP’de olduğu gibi, tek tırnaklı karakter
  dizilerinde kullanamazsınız.
* Here dökümanları vardır
* PHP 5 gibi rubyde de istisnalar(exception) vardır.
* Oldukça büyük bir standart kütüphanesi vardır.
* Dizeler ve hash veri tipi beklendiği gibi çalışır, `array()` yerine `{` ve
  `}` kullanırsanız: `array('a' => 'b')` `{'a' => 'b'}` olur.
* `true` ve `false` PHP’de olduğu gibi davranır, ama `null` `nil` olarak
  çağırılır.

### Farklılıklar

PHP’nin aksine, Rubyde…

* Güçlü tipleme vardır. Karakter dizisi ve sayı tipi gibi veri tipleri
  arasında çeviri yapabilmek için bunu yapması için dile güvenmek yerine
  `to_s`, `to_i` vs. metodları kullanmalısınız.
* Karakter dizileri, sayılar, dizeler, hash veri tipleri, vs. nesnedir.
  `abs(-1)` yerine `-1.abs` olarak kullanılır.
* Parantezler metod çağrılarında isteğe bağlıdır, hangi parametrelerin
  hangi metod çağrılarına gideceğini netleştirmek için kullanılanlar
  hariç.
* Alt çizgi gibi isimlendirme gelenekleri yerine standart kütüphaneler
  ve ekleri modüller ve sınıfları şeklinde düzenlenmiştir.
* Yansıma nesnelerin kendi özelliğidir, PHP 5 gibi `Reflection`
  sınıfları kullanmanız gerekmez.
* Değişkenler referanslardır.
* `abstract` sınıflar veya `interface`ler yoktur.
* Hash’ler ve array’ler birbirine çevrilemez
* Koşullarda sadece `false` ve `nil` yanlış bilgisi döner: `0`,
  `array()` ve `""` doğru bilgisi döner.
* Neredeyse her şey metod çağrılarıdır, hatta `raise` bile. (PHP’de
  `throw`).
