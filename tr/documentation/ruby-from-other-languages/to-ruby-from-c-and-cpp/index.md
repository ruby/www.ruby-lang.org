---
layout: page
title: "C ve C++ dan Ruby'ye"
lang: tr
---

Ruby’de kodunuzun C’den veya C++’dan nasıl farklı olacağını bir bullet
liste ile anlatmak çok zor, çünkü oldukça fazla fark var. Bir sebep Ruby
runtime sizin için birçok şeyi yapar. Ruby , C’nin “saklı mekanizma yok”
prensibinden çok uzak görünür—Ruby’nin tüm amacı işin çoğunu runtime’ın
omuzlarına yükleyerek insanların işini kolaylaştırmak. Ruby kullanırken
eğer kodunuzu optimize etmeye çalışmıyorsanız "derleyiciyi mutlu etmeye"
çalışmazsınız.

Bunun anlamı, eşdeğer bir C veya C++ programa göre Ruby programının daha
yavaş çalışmasını bekleyebilirsiniz ama ne kadar az kod yazarak ve ne
kadar kısa sürede çalışan bir program elde ettiğinize şaşıracaksınız.
Ruby , C++ dan çok daha basittir ve her işinizi görür.

Ruby dinamik yazılımdır , static değildir—runtime bir çok şeyi ismi gibi
program çalışırken ayarlar. Örneğin Ruby programınızın hangi modüllere
bağlanacağını (yükleyip kullanacağını) bilmeye veya hangi metodun çağrılacağını
önceden bilmeye gerek yoktur.

Ne mutlu ki, Ruby ve C arasında genetik bir bağlantı vardır. Ruby
“extension modüles” destekler. Bu modüller C’de yazılmış ama Ruby
programın içinde aynı bir Ruby modülüymüş gibi kullanabildiğiniz
modüllerdir. Bu sayede Ruby programınızın yüksek performan isteyen
kısımlarında C ile yazılmış kodlar kullanabilirsiniz.

Ve tabii ki Ruby’nin kendisi de C ile yazılmıştır.

### C ile Benzerlikler

C gibi Ruby de,...

* Prosedürel programlama yapabilirsiniz (fakat arka planda o hala
  nesne-yönelimli olacaktır).
* Operatörlerin birçoğu aynıdır (birleşik eşitlemeler ve ikili
  işlemciler dahil). Ama ruby’de `++` ve `--` yoktur.
* `__FILE__` ve `__LINE__` aynıdır.
* Özel `const` deyimi olmamasına rağmen sabitleriniz vardır. Const
  olmadan isimlendirme ile sabitler belirtilir, büyük harfle başlayan
  isimler sabit demektir.
* String’ler çift tırnak içindedir.
* Stringler mutasyona uğrayabilir.
* Man sayfaları gibi birçok dökümanı terminal ekranında görebilirsiniz—
  `ri` komutu yardımıyla yapılır.
* Aynı şekilde komut satırı debugger mümkündür.

### C++ ile Benzerlikler

C++ gibi Ruby de,...

* Çoğunlukla aynı operatörler kullanılır (`::` dahil). `<<` ile genelde
  listelere elemanlar eklenir. Bir fark olarak Ruby’de `->` kullanılmaz
  herzaman `.` kullanılır.
* `public`, `private`, ve `protected` benzer işlev görür.
* Kalıtım deyimi halen tek karakterdir ama `:` yerine `<` kullanılır.
* C++ nın kullandığı `namespace` benzeri şekilde kodunuzu “modul”ler
  içine koyabilirsiniz.
* Sıradışı durumlar benzer işlenir, özel olmak uğruna kullanılan
  deyimler farklıdır.

### C’den Farklılıklar

Ruby’de C’den farklı olarak,...

* Kodunuzu derlemenize gerek yoktur, doğrudan çalıştırabilirsiniz.
* Nesneler güçlü tiplenir (ve değişkenlerin tipi yoktur).
* Makrolar ya da önyükleme komutları yoktur. Cast yoktur. İşaretçiler
  (veya işaretçi aritmetiği) yoktur. typedef, sizeof ya da enum yoktur.
* Header dosyalar yoktur. Fonksiyonlarınızı (genelde metod denir) ve
  sınıflarınızı kaynak dosyalarınıza yazarsınız.
* `#define` yoktur. Bunun yerine sabitleri kullanın.
* Ruby 1.8 itibarıyla kod makina ya da byte koduna dönüştürüleceğine
  direk runtime içinde işlenmektedir.
* Tüm değişkenler heap'te yaşar. Dahası hafızadan kendiniz
  boşaltmak zorunda değilsiniz—garbage collector bunu kontrol eder.
* Metodlara argümanları değer olarak değil referans olarak geçirilir.
* `#include <foo>` veya `#include "foo"` yerine `require 'foo'`
  kullanılır.
* Assembly yazamazsınız.
* Satır sonlarında noktalı virgüller yoktur.
* `if` ve `while` koşul deyimlerinde parantez kullanılmaz.
* Metod çağrıları için parantezler sıklıkla isteğe bağlıdır.
* Süslü parantezler kullanılmaz, `while` gibi çok satırlı yapıları sonlandırmak
  için sadece `end` anahtar kelimesini kullanın.
* `do` kelimesi “blok”lar için kullanılır C’deki gibi “do statement”
  yoktur.
* “Blok” farklı bir anlama gelir. Bir metod çağrısına bağlanmış kod
  bloğunu ifade eder ve metod çalışırken bloğu çağırır.
* Değişken tanımlaması yoktur. Değişkene ihtiyaç duyduğunuz anda bir
  atama ile değerini belirlersiniz.
* Doğruluğu test edilirken sadece `false` ve `nil` yanlış olarak
  değerlendirilir. Diğer herşey (`0`, `0.0`, ve `"0"` dahil) doğru
  olarak değerlendirilir.
* `char` yoktur—onlar sadece 1-harfli stringlerdir.
* Stringler bir null byte ile bitmezler.
* Array’ler köşeli parantez içindedir, süslü parantez değil.
* Array’ler içlerine daha fazla eleman koydukça büyürler.
* Eğer iki array’i toplarsanız yeni ve büyük bir array elde edilir (tabii ki
  heap'te tutulur),
  işaretçi aritmetiği yapılmaz.
* Herşey bir eşitliktir ve değer döner (yani `while` gibi deyimler
  gerçekte bir değer dönüşü yaparlar)

### C++’tan Farklar

Ruby’de C++’tan farklı,...

* Harici referanslar yoktur. Şu demek Ruby’de tüm değişkenler bir objeye
  referans eden isimlerdir.
* Objeler güçlü ama *dinamik* tiplenirler. Runtime bir
  metodun çalışabilirliğini *çalışırken* araştırır.
* Sınıf inşaa edici metod sınıfın adı yerine `initialize` olarak
  adlandırılır.
* Herzaman tüm metodlar gerçeldir.
* “Class” (static) değişken isimleri herzaman `@@` ile başlar
  (`@@total_widgets` daki gibi).
* Üye değişkenlere direk erişemezsiniz—Tüm public üye değişkenlere
  ulaşmak için (Ruby’de attribute denir) metodlar kullanılır.
* `this` yerine `self` kullanılır.
* Bazı metodların sonunda ’?’ ve ’!’ vardır, bunlar metod isminin
  parçasıdır işlem değildir.
* Çoklu kalıtım yoktur. Fakat Ruby "mixin"lere sahiptir (bir modülün tüm örnek
  metodlarını "miras alabilirsiniz").
* Bazı zorunlu harf boyut gelenekleri vardır (örn. sınıf isimleri büyük
  harfle başlar , değişkenler küçük harfle başlar).
* Metod çağrılarında parantez kullanılması genelde isteğe bağlıdır.
* Herhangibir zamanda sınıf kodunu tekrar açıp içine metod
  ekleyebilirsiniz.
* C++ şablonlarına ihtiyaç yoktur (bir değişkene çalıştırma esnasında
  herhangi bir obje atayabileceğiniz ve her durumda tiplerin çalışma zamanında
  anlaşılacağı için). Tip dönüşümüne gerek yoktur.
* Tekrarlamalar biraz farklı yapılır. Ruby’de farklı bir tekrar nesnesi
  kullanılmaz. (`vector<T>::const_iterator iter` gibi) fakat bunun
  yerine taşıyıcı nesnenin bir yineleyici metodu (`each` gibi) kullanılır, bu
  metod bir kod bloğu alır ve ardarda gelen öğeleri bu bloğa geçirir.
* Sadece iki container tip vardır: `Array` ve `Hash`.
* Tip dönüşümüne gerek yoktur. Ruby mantığına sahip oldukça siz de
  gereksiz olduğunu göreceksiniz.
* Multithread gömülüdür, fakat Ruby 1.8 ile birlikte “green threads”
  olarak adlandırıldı (sadece interpreter içinde işlenirler) native
  thread’a zıt olarak.
* Ruby ile bir birim test kütüphanesi birlikte gelir.
