---
layout: page
title: "Yirmi Dakikada Ruby"
lang: tr
---

## Giriş

Bu tamamlaması 20 dakikadan fazla vakit almayacak küçük bir Ruby
eğitmenidir. Halihazırda Ruby’nin sisteminizde kurul olduğunu kabul
eder. (eğer Ruby bilgisayarınızda yüklü değilse başlamadan önce
[indirin](/tr/downloads/) ve kurun.)

## İnteraktif Ruby

Ruby kendisine girdiğiniz her Ruby satırının sonucunu gösteren bir
programla beraber gelir. Ruby ile etkileşimli bir oturumda oynamak bu
dili öğrenmek için dehşet verici bir yoldur.

IRB’i açın (Interactive Ruby anlamına gelir).

* Eğer **Mac OS X** kullanıyorsanız `Terminal` açın ve yazın : `irb`,
  sonra enter basın.
* Eğer **Linux** kullanıyorsanız konsol açın ve yazın : `irb`, sonra
  enter basın.
* Eğer **Windows** kullanıyorsanız başlat menüsü Ruby bölümünden `fxri`
  çalıştırın.
^

    irb(main):001:0>
{: .code .ruby-code}

Tamam açıldı şimdi ne yapacağız?

Şunu yazın : `"Hello World"`

    irb(main):001:0> "Hello World"
    => "Hello World"
{: .code .ruby-code}

## Ruby Size İtaat Eder!

Ne yaptık şimdi? Dünyanın en kısa “Hello World” programını mı yazdık?
Tam olarak değil. İkinci satır sadece IRB’in yaptığı işlemin sonucunu
bildirme tekniği. Eğer ekrana “Hello World” yazdırmak istiyorsak daha
fazla birşeyler yapmalıyız:

    irb(main):002:0> puts "Hello World"
    Hello World
    => nil
{: .code .ruby-code}

`puts` Ruby’de çıktı almak için en basit bir komut. Fakat bu `=> nil` ne
oluyor ki? Bu işlevin sonucudur. `puts` herzaman Ruby’de hiçbirşeyi
ifade eden nil döner.

## Bedava Hesap Makinası Burada

IRB basit bir hesap makinası olarak kullanılabilir:

    irb(main):003:0> 3+2
    => 5
{: .code .ruby-code}

Üç artı iki. Çok kolay. Peki üç *kere* iki nedir? Bunu girebileceğiniz
gibi bir önce girdiğiniz satırı yukarı tuşuna basarak tekrar
çağırabilirsiniz. Yukarı tuşuna basıp bunu test edin `+` işaretinin
üstüne gidip silin ve `*` ile değiştirin.

    irb(main):004:0> 3*2
    => 6
{: .code .ruby-code}

Sonra üçün karesini bulalım:

    irb(main):005:0> 3**2
    => 9
{: .code .ruby-code}

Ruby’de `**` “üssü” demenin yoludur. Fakat bir sayının karekökü için ne
yapmalı?

    irb(main):006:0> Math.sqrt(9)
    => 3.0
{: .code .ruby-code}

Tamam, bu ne demek sizce? Tahmin ederseniz dokuzun karekökü alınmış.
Haklısınız fakat daha yakından inceleyelim, en başta bu `Math` ne ?

## Modüller, Kodları başlıklar altında toplamak

`Math` matematik için bir dahili modüldür. Modüller Ruby’de iki hizmet
sunarlar. Bir rolü şu: benzer görevler yapan metodları bir grup başlığı
altında toplamak. `Math` içinde ayrıca `sin()` ve `tan()` gibi işlevler
de vardır.

Sonraki bir nokta işareti, nokta ne yapıyor? Nokta size mesajın
alıcısını gösteriyor. Burada mesaj `sqrt(9)` metod çağrısı, parametresi
9 olan “karekök” alma komutu.

Bu metodun cevabı `3.0` dır. Dikkat ettiyseniz sadece `3` değil. Çünkü
birçok karekök işleminin sonucu tamsayı değildir. Bu yüzden işlev kayan
noktalı bir sayı geri döner.

Peki bazı matematik işlemlerimizin sonucunu hatırlamak istersek? Cevabı
bir değişkene atama yaparız.

    irb(main):007:0> a = 3 ** 2
    => 9
    irb(main):008:0> b = 4 ** 2
    => 16
    irb(main):009:0> Math.sqrt(a+b) => 5.0
{: .code .ruby-code}

Bir hsap makinası için oldukça yeterli. Klasik `Hello World` mesajından
uzaklaşmaya başladık, [geri dönelim.](2/)

