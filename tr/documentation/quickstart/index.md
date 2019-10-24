---
layout: page
title: "Yirmi Dakikada Ruby"
lang: tr

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Kısım 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Kısım 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Kısım 4">4</a>
  </div>
  <h1>Yirmi Dakikada Ruby</h1>

---

## Giriş

Bu tamamlaması 20 dakikadan fazla vakit almayacak küçük bir Ruby
eğitmenidir. Halihazırda Ruby’nin sisteminizde kurulu olduğunu kabul
eder. (eğer Ruby bilgisayarınızda yüklü değilse başlamadan önce
[kurun][installation].)

## İnteraktif Ruby

Ruby kendisine girdiğiniz her Ruby satırının sonucunu gösteren bir
programla beraber gelir. Ruby ile etkileşimli bir oturumda oynamak bu
dili öğrenmek için dehşet verici bir yoldur.

IRB’i açın (Interactive Ruby anlamına gelir).

* Eğer **macOS** kullanıyorsanız `Terminal` açın ve yazın : `irb`,
  sonra enter basın.
* Eğer **Linux** kullanıyorsanız konsol açın ve yazın : `irb`, sonra
  enter basın.
* Eğer **Windows** kullanıyorsanız başlat menüsü Ruby bölümünden
  `Interactive Ruby` çalıştırın.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Tamam açıldı şimdi ne yapacağız?

Şunu yazın : `"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby Size İtaat Eder!

Ne yaptık şimdi? Dünyanın en kısa “Hello World” programını mı yazdık?
Tam olarak değil. İkinci satır sadece IRB’in yaptığı işlemin sonucunu
bildirme tekniği. Eğer ekrana “Hello World” yazdırmak istiyorsak daha
fazla birşeyler yapmalıyız:

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` Ruby’de çıktı almak için en basit bir komut. Fakat bu `=> nil` ne
oluyor ki? Bu işlevin sonucudur. `puts` her zaman Ruby’de hiçbir şeyi
ifade eden nil değerini döndürür.

## Bedava Hesap Makinası Burada

IRB basit bir hesap makinası olarak kullanılabilir:

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

Üç artı iki. Çok kolay. Peki üç *kere* iki nedir? Bunu girebileceğiniz
gibi bir önce girdiğiniz satırı yukarı tuşuna basarak tekrar
çağırabilirsiniz. Yukarı tuşuna basıp bunu test edin `+` işaretinin
üstüne gidip silin ve `*` ile değiştirin.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

Sonra üçün karesini bulalım:

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

Ruby’de `**` “üssü” demenin yoludur. Fakat bir sayının karekökü için ne
yapmalı?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

Tamam, bu ne demek sizce? Tahmin ederseniz dokuzun karekökü alınmış.
Haklısınız fakat daha yakından inceleyelim, en başta bu `Math` ne ?

## Modüller, Kodları Başlıklar Altında Toplar

`Math` matematik için bir dahili modüldür. Modüller Ruby’de iki hizmet
sunarlar. Bir rolü şu: benzer görevler yapan metotları bir grup başlığı
altında toplamak. `Math` içinde ayrıca `sin()` ve `tan()` gibi işlevler
de vardır.

Sonraki bir nokta işareti, nokta ne yapıyor? Nokta size mesajın
alıcısını gösteriyor. Burada mesaj `sqrt(9)` metot çağrısı, parametresi
9 olan “karekök” alma komutu.

Bu metodun cevabı `3.0` dır. Dikkat ettiyseniz sadece `3` değil. Çünkü
birçok karekök işleminin sonucu tamsayı değildir. Bu yüzden işlev kayan
noktalı bir sayı geri döndürür.

Peki bazı matematik işlemlerimizin sonucunu hatırlamak istersek? Cevabı
bir değişkene atama yaparız.

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

Bir hesap makinası için oldukça yeterli. Klasik `Hello World` mesajından
uzaklaşmaya başladık, [geri dönelim.](2/)

[installation]: /tr/documentation/installation/
