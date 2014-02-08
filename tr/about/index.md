---
layout: page
title: "Ruby Hakkında"
lang: tr
---

Ruby’nin niçin bu kadar popüler olduğunu mu merak ediyorsunuz?
Rubyseverler, Ruby’yi güzel, sanatsal, becerikli ve pratik bir dil
olarak tanımlarlar. Peki Ruby size neler vaad ediyor?
{: .summary}

### Ruby’nin Yaratıcısının İdealleri

Ruby dengenin dilidir. Ruby’nin yaratıcısı [Yukihiro “Matz”
Matsumoto][matz] en sevdiği dillerin (Perl, Smalltalk, Eiffel, Ada, ve
Lisp) en iyi özelliklerini harmanlayarak fonksiyonel programlama ile
imperativ programlamaya dayanan yeni bir dil yaratmayı amaçlamıştır.

Matz, her zaman “Ruby’yi basit değil, doğal yapmaya çalıştığını”
vurgulamıştır, tıpkı yaşam gibi…

Buradan yola çıkarak Matz aşağıdakileri ekler:

> Ruby tıpkı insan vücudu gibi, görünüşte basit, ama içinde çok kompleks
> bir yapıya sahiptir<sup>[1](#fn1)</sup>.

### Ruby’nin Büyüme Hızı

Ruby 1995’te halka duyurulduğundan beri, dünya çapında programcıların
dikkatini çekmeye başlamıştır. 2006 Ruby’nin altın yılı olmuştur.
Dünyanın en büyük şehirlerinde aktif kullanıcı grupları ve Ruby ile
ilgili konferanslar gerçekleştirilmiştir.

![Graph courtesy of
Gmane.](http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=320&amp;height=160&amp;title=Ruby-Talk+Activity
"Graph courtesy of Gmane."){: style="padding-left:8px;"}
{: style="float:right"}

Ruby-Talk, en çok kullanılan Ruby [e-posta
listesi](/en/community/mailing-lists/) günde ortalama 200 mesaj
trafiğine sahiptir.

Programlama dillerinin popülaritesini araştıran [TIOBE][tiobe] istatistiklerine
göre, Ruby dünya çapında en çok kullanılan 10.cu dil haline gelmiştir.
Ruby’nin bu hızlı büyümesinde [Ruby on Rails][ror] framework’ünün
hatırı sayılır etkisi bulunmaktadır.

Ruby aynı zamanda [tamamen özgür]({{ site.license.url }}) bir dildir. Ruby size
yalnızca sorumluluk anlamında bir özgürlük değil, aynı zamanda kullanma,
kopyalama, düzenleme ve dağıtma özgürlüğü de sunar.

### Herşey Bir Nesnedir

Matz yeni bir dil yaratmadan önce ideal sözdizimini bulmak için diğer
programlama dillerini incelemiş ve araştırmasının sonunda “Perl’den daha
güçlü ama Pyton’dan daha nesneye yönelik bir betik
dili<sup>[2](#fn2)</sup>” istediğini söylemiştir.

Ruby’de herşey bir nesnedir. Gördüğünüz en ufak bilgi parçası ve kod
kendi özelliklerine ve olaylarına sahiptir. Özellikleri isimle çağırma
*örnek değişkenler* ,olaylar da *metotlar* olarak isimlendirilir.
Ruby’nin yüzde yüz saf nesneye yönelik bir dil olduğunun en iyi ispatı
bir kod parçası ile bir sayıya olay vererek yapılır:

{% highlight ruby %}
5.times { print "Ruby'ti *seviyoruz* -- harika bir dil!" }
{% endhighlight %}

Çoğu dilde sayılar ve diğer ilkel tipler nesne değildir. Ruby tüm
tiplerine metotlar ve örnek değişkenler verme geleneğini Smalltalk’tan
miras almıştır.

### Ruby Esnektir

Ruby kullanıcılara istediği kısımları değiştirebilme imkanı sunduğu için
esnek bir dildir. İsteğe bağlı olarak Ruby’nin esaslı kısımları bile
kaldırılabilir, yeniden tanımlanabilir ya da yeni kısımlar eklenebilir.
Ruby programıcıyı kısıtlamamayı amaçlamaktadır.

Örneğin toplama işleminin artı (`+`) operatörü ile yapıldığını
biliyoruz. Ama eğer okunabilirlik amacıyla `topla` gibi bir kelime
kullanmak istiyorsanız Ruby’nin gömülü `Numeric` sınıfına yeni bir metod
ekleyebilirsiniz.

{% highlight ruby %}
class Numeric
  def topla(x)
    self.+(x)
  end
end

y = 5.topla 6
# y'nin değeri 11 oldu.
{% endhighlight %}

Ruby’nin operatörleri sözdizimsel olarak esnektir, yeniden tanımlamanıza
olanak sağlar.

### Bloklar, Tam Anlamıyla Etkileyici Bir Özellik

Ruby’nin esnek bir dil olarak anılmasının en önemli sebeplerinden biri
de bloklardır.Bir kapamayı (closure) herhangi bir metoda ataçlayabilir
ve metodun nasıl tepki vereceğini belirleyebilirsiniz. Kapamalar,
*bloklar* olarak anlandırırlırlar ve PHP ya da Visual Basic gibi
imperativ dillerden Ruby’ye geçenler arasında en popüler özelliğe
dönüşmüştür.

Bloklar fonksiyonel dillerden esinlenilerek Ruby’ye getirilmiştir. Matz
“Ruby kapamalarında, Lisp kültürüne saygı göstermek
istedim<sup>[3](#fn3)</sup>.” demiştir.

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

Yukarıdaki kodda bir blok `do ... end` yapıları içerisinde tanımlanıyor.
`map` metodu bloğa bir kelime listesi ile çalıştığını bildiriyor.
Ruby’de bunun gibi bir çok metod programcıya kendi bloklarını yazıp,
metodu istediği gibi şekillendirmesine izin vermektedir.

### Ruby ve Mixin’ler

Pek çok nesneye yönelik dilin aksine, Ruby özellikle yalnızca tekil
mirası destekler. Çünkü Ruby modül konseptini (Nesnesel-C’de
Kategoriler) kullanır ve modüller metodların bir koleksiyonundan
ibarettir.

Sınıflar bir modülü kendisine dahil ederse, onun tüm metodlarını da
almış olur. Örneğin `each` metodunu gerçekleştiren her sınıf
`Enumerable` modülünü de kendisine dahil edebilir, böylece döngülerde
`each` ile beraber kullanabileceği bir dizi metoda sahip olur.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Genelde Ruby’ciler bu yolu bazen çok karmaşıklaşan ve kısıtlayıcı olan
çoklu mirastan daha temiz ve sağlam bir yöntem olarak görürler.

### Ruby’nin Görselliği

Her ne kadar Ruby sınırlı sayıda noktalama işareti ve İngilizce anahtar
kelimeler kullansa da, bazı noktalama işaretleri Ruby’yi dekore etmek
için kullanılır. Ruby’de değişken tanımlamaları yoktur. Değişkenlerin
faaliyet alanlarını belirlemek için basit noktalama işaretleri
kullanılır.

* `var` yerel bir değişken olabilir
* `@var` bir örnek değişkendir.
* `$var` bir global değişkendir.

Bu işaretlendirmeler sayesinde programcı her değişkenin rolünü kolayca
görebilmektedir. Aynı zamanda her örnek değişken için `self.` kullanma
külfetini ortadan kaldırmıştır.

### Temel İşlevlerin Ötesinde

Ruby çok çeşitli özelliklere sahiptir, aşağıda bir kaçından
bahsedilmiştir:

* Ruby Java ya da Python gibi istisna yakalama mekanizmalarına sahiptir,
  hatalarla başetmek kolaylaşır.

* Ruby tüm nesneleri için gerçek bir mark &amp; sweep çöp toplayıcısı
  sunar. Eklenti kütüphanelerinde referans sayaçlarına gerek yok,
  Matz’ın dediği gibi: “Bu sizin sağlığınız için iyidir”.

* C’den Ruby çağıran şık API’si sayesinde Ruby’de C eklentileri yazmak
  Perl ya da Python’dan daha kolaydır. Bu API aynı zamanda yazılımlara
  betik dili olarak Ruby’yi gömmek için gereken çağrıları da içerir.
  Ayrıca SWIG arayüzü de alternatif olarak sunulmaktadır.

* İşletim sistemi izin verdiği sürece harici dinamik kütüphaneler
  yükleyebilirsiniz.

* Ruby işletim sisteminden bağımsız iş parçacığı özelliği sunar.Yani
  işletim sisteminin desteklemesine bakmaksızın, MS-DOS üzerinde olsanız
  bile çoklu iş parçacıkları kullanabilirsiniz!

* Ruby yüksek taşınabilirliğe sahiptir. GNU/Linux üzerinde geliştirilmiş
  olsa dahi, UNIX’in bir çok çeşidi, Mac OS X, Windows
  95/98/Me/NT/2000/XP, DOS, BeOS, OS/2, vb. üzerinde çalışmaktadır.

### Referanslar

<sup>1</sup> Matz, Ruby-Talk e-posta listesi, [12 Mayıs, 2000][blade].
{: #fn1}

<sup>2</sup> Matz, [Ruby’nin Yaratıcısı İle Bir Söyleşi][linuxdevcenter], Kasım.
29th, 2001.
{: #fn2}

<sup>3</sup> Matz, [Ruby’de Bloklar ve Kapamalar][artima], 22 Aralık, 2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
