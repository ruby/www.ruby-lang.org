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

Ruby-Talk, Ruby dilini tartışmak için birincil [e-posta listesi](/tr/community/mailing-lists/), 2006 yılında günde ortalama 200 mesaja ulaşmıştır.
Bu sayı son yıllarda düşmüştür çünkü topluluğun büyüklüğü, tartışmanın merkezi bir listeden daha küçük gruplara kaymasına neden olmuştur.

Ruby, dünya çapında programlama dillerinin büyümesini ve popülaritesini ölçen dizinlerin ([TIOBE dizini][tiobe] gibi) çoğunda ilk 10 içinde yer almıştır.
Büyümenin çoğu, Ruby ile yazılmış yazılımların popülaritesiyle ilgilidir, özellikle [Ruby on Rails][ror] web çatısıyla.

Ruby aynı zamanda [tamamen özgür]({{ site.license.url }}) bir dildir.
Bu özgürlük sadece maddi anlamda değildir; kullanma, kopyalama, değiştirme, ve dağıtma konusunda da özgürsünüz.

### Her şeyi bir Nesne Olarak Görmek

Matz yeni bir dil yaratmadan önce ideal sözdizimini bulmak için diğer
programlama dillerini incelemiş ve araştırmasının sonunda “Perl’den daha
güçlü ama Python’dan daha nesneye yönelik bir betik
dili istediğini<sup>[2](#fn2)</sup>” söylemiştir.

Ruby’de herşey bir nesnedir. Gördüğünüz en ufak bilgi parçası ve kod kendi özelliklerine ve olaylarına sahiptir.
Nesne yönelimli programlama, özellikleri *örnek değişkenleri* ismiyle anar, olaylar ise *metodlar* olarak bilinir.
Ruby’nin yüzde yüz saf nesneye yönelik bir dil olduğunun en iyi ispatı bir kod parçası ile bir sayıya olay vererek yapılır:

{% highlight ruby %}
5.times { print "We *love* Ruby -- it's outrageous!" }
{% endhighlight %}

Çoğu dilde sayılar ve diğer ilkel tipler nesne değildir.
Ruby tüm tiplerine metod ve örnek değişkenleri verme geleneğini Smalltalk’tan miras almıştır.
Bu, Ruby kullanımını kolaylaştırır, çünkü nesnelere uygulanan kurallar Ruby'nin tümüne uygulanır.

### Ruby'nin Esnekliği

Ruby, kullanıcılara istediği kısımları değiştirebilme imkanı sunduğu için esnek bir dil olarak görülür.
İsteğe bağlı olarak Ruby’nin esas kısımları bile kaldırılabilir, yeniden tanımlanabilir ya da bunlara yeni kısımlar eklenebilir.
Ruby, programcıyı kısıtlamamayı amaçlar.

Örneğin toplama işleminin artı (`+`) operatörü ile yapıldığını
biliyoruz. Ama eğer okunabilirlik amacıyla `plus` gibi bir kelime
kullanmak istiyorsanız Ruby’nin gömülü `Numeric` sınıfına yeni bir metod
ekleyebilirsiniz.

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y'nin değeri 11 oldu.
{% endhighlight %}

Ruby’nin operatörleri metodlar için sözdizimsel kolaylıklardır.
Bunları da yeniden tanımlayabilirsiniz.

### Bloklar, Tam Anlamıyla Etkileyici bir Özellik

Ruby’nin esnek bir dil olarak anılmasının en önemli sebeplerinden biri
de bloklardır. Bir kapamayı (closure) herhangi bir metoda ataçlayabilir
ve metodun nasıl tepki vereceğini belirleyebilirsiniz. Kapamalar,
*bloklar* olarak adlandırılırlar ve PHP ya da Visual Basic gibi
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
`map` metodu, bloğu sağlanan kelime listesine uygular.
Ruby’de bunun gibi bir çok metod programcıya kendi bloklarını yazıp, bu metodun ne yapması gerektiğini belirtme izni vermektedir.

### Ruby ve Mixin’ler

Pek çok nesneye yönelik dilin aksine, Ruby **özellikle** yalnızca tekil
mirası destekler. Çünkü Ruby modül konseptini (Objective-C’de
Kategoriler) kullanır. Modüller metodların bir koleksiyonundan
ibarettir.

Sınıflar bir modülü kendisine dahil ederse, onun tüm metodlarını da
almış olur. Örneğin `each` metodunu gerçekleştiren her sınıf
`Enumerable` modülünü de kendisine dahil edebilir, böylece döngülerde
`each`'i kullanan bir dizi metoda sahip olur.

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

Genelde Ruby’ciler bu yolu bazen çok karmaşıklaşan ve kısıtlayıcı olan
çoklu mirastan daha temiz bir yöntem olarak görürler.

### Ruby’nin Görselliği

Her ne kadar Ruby sınırlı sayıda noktalama işareti ve İngilizce anahtar
kelimeler kullansa da, bazı noktalama işaretleri Ruby’yi dekore etmek
için kullanılır. Ruby’de değişken tanımlamaları yoktur. Değişkenlerin
faaliyet alanlarını belirlemek için basit isimlendirme gelenekleri
kullanılır.

* `var` yerel bir değişken olabilir
* `@var` bir örnek değişkenidir.
* `$var` bir evrensel değişkendir.

Bu işaretlendirmeler sayesinde programcı her değişkenin rolünü kolayca
görebilmektedir. Aynı zamanda her örnek değişken için `self.` kullanma
külfetini ortadan kaldırmıştır.

### Temel İşlevlerin Ötesinde

Ruby çok çeşitli özelliklere sahiptir, aşağıda bir kaçından
bahsedilmiştir:

* Ruby, hataları işlemeyi kolaylaştırmak amacıyla Java veya Python
  gibi istisna işleme özelliklerine sahiptir.

* Ruby tüm nesneleri için gerçek bir mark&amp;sweep çöp toplayıcısı
  sunar. Eklenti kütüphanelerinde referans sayaçlarına gerek yok,
  Matz’ın dediği gibi: “Bu sizin sağlığınız için iyidir.”

* C’den Ruby çağıran şık API’ı sayesinde Ruby’de C eklentileri yazmak
  Perl ya da Python’kinden daha kolaydır. Bu API aynı zamanda yazılımlara
  betik dili olarak Ruby’yi gömmek için gereken çağrıları da içerir.
  Ayrıca SWIG arayüzü de alternatif olarak sunulmaktadır.

* İşletim sistemi izin verdiği sürece harici dinamik kütüphaneler
  yükleyebilirsiniz.

* Ruby yüksek taşınabilirliğe sahiptir. GNU/Linux üzerinde geliştirilmiş
  olsa dahi, UNIX’in bir çok çeşidi, macOS ve Windows üzerinde çalışmaktadır.

### Ruby'nin Diğer Gerçeklemeleri

Ruby, bir dil olarak, birkaç farklı gerçeklemeye sahiptir.
Bu sayfa, toplulukta sıklıkla **MRI** (“Matz’s Ruby Interpreter”) ya da **CRuby** (C'de yazıldığından dolayı) olarak bilinen başvuru gerçeklemesini tartışmaktadır, ancak başkaları da vardır.
Bunlar belirli durumlarda kullanışlıdır, diğer dil ya da ortamlara fazladan bütünleşim sağlarlar, ya da MRI'ın sahip olmadığı özel özelliklere sahiptirler.

İşte bunların bir listesi:

* [JRuby][jruby], JVM'in (Java Virtual Machine) üstünde çalışan Ruby'dir, JVM'in eniyileyen JIT derleyicisi, çöp toplayıcısı, eşzamanlı thread'leri, araç ekosistemi, ve muazzam sayıdaki kütüphanelerinden faydalanır.
* [Rubinius][rubinius], ‘Ruby'da yazılmış Ruby'dir’.
  LLVM'in üstüne inşa edilmiştir ve ayrıca diğer dillerin üstüne inşa edebilecekleri şık bir sanal makine de sunar.
* [TruffleRuby][truffleruby], GraalVM'in üstünde çalışan yüksek performanslı bir Ruby gerçeklemesidir.
* [mruby][mruby], bir uygulamaya bağlanıp gömülebilen hafif bir Ruby gerçeklemesidir.
  Geliştirilmesine Ruby'nin yaratıcısı Yukihiro “Matz” Matsumoto tarafından önderlik edilmektedir.

Daha tam bir liste için, [Müthiş Ruby'ler][awesome-rubies]e bakın.

### Referanslar

<sup>1</sup> Matz, Ruby-Talk e-posta listesi, [12 Mayıs, 2000][blade].
{: #fn1}

<sup>2</sup> Matz, [Ruby’nin Yaratıcısı İle Bir Söyleşi][linuxdevcenter], 29 Kasım 2001.
{: #fn2}

<sup>3</sup> Matz, [Ruby’de Bloklar ve Kapamalar][artima], 22 Aralık, 2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[jruby]: http://jruby.org
[rubinius]: https://github.com/rubinius/rubinius
[truffleruby]: https://github.com/oracle/truffleruby
[mruby]: http://www.mruby.org/
[awesome-rubies]: https://github.com/planetruby/awesome-rubies
