---
layout: page
title: "Ruby ve Diğer Diller"
lang: tr
---

Ruby koduna ilk baktığınızda daha önce kullandığınız başka programlama
dillerine benzetebilirsiniz. Bu bilerek yapılmıştır. Java, Perl veya
Python kullanıcılarına deyimler tanıdık gelecektir. Eğer bunlardan
birini kullanmışsanız işiniz çok kolay.

Bu belgede iki ana bölüm var. İlki *X* dilinden Ruby’ye geçerken ne
görmeyi beklediğiniz, ikincisi dlin ana özelliklerini ele alıp önceden
bildiklerinizle karşılaştırır.

## Neler Değişiyor: *X Dilinden* Ruby’ye

* [C ve C++ dan
  Ruby’ye](/tr/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp/)
* [Java’dan
  Ruby’ye](/tr/documentation/ruby-from-other-languages/to-ruby-from-java/)
* [Perl’den
  Ruby’ye](/tr/documentation/ruby-from-other-languages/to-ruby-from-perl/)
* [PHP’den
  Ruby’ye](/tr/documentation/ruby-from-other-languages/to-ruby-from-php/)
* [Python’dan
  Ruby’ye](/tr/documentation/ruby-from-other-languages/to-ruby-from-python/)

## Önemli Dil Özellikleri ve Bazı İpuçları

Burada Ruby öğrenirken yardımcınız olacak ana Ruby özelliklerini
görüyorsunuz.

### Yineleme (Iteration)

İki Ruby özelliğini daha önce görmüşsünüzdür ama Ruby’de farklı bir
davranış gösterirler, bloklar ve yineleyiciler. Bir index üzerinden
döngü yapmak (C, C++ ve 1.5 öncesi Java daki gibi) veya bir liste
üzerinde döngü yapmak (Perl’ün <tt>for (@a) \{...}</tt> veya Python’un
<tt>for i in aList: ...</tt>) yerine Ruby ile genellikle şöyle birşey
görürsünüz:

{% highlight ruby %}
some_list.each do |this_item|
  # Burası blok içi.
  # this_item ile çalışan kodlar buradadır.
end
{% endhighlight %}

`each` (ve arkadaşları `collect`, `find`, `inject`, `sort`, vs.)
hakkında daha fazla bilgi için komut satırında `ri Enumerable` (ve
sonrasında <tt>ri Enumerable#*func\_name*</tt>) yazabilirsiniz.

### Herşeyin Bir Değeri Vardır

Bir eşitlik ve bir deyim satırı arasında fak yoktur. Herşey **nil** de
olsa bir değer geri döner. Şu mümkündür:

{% highlight ruby %}
x = 10
y = 11
z = if x < y
  true
else
  false
end
z # => true
{% endhighlight %}

### Semboller Sıradan Stringler Değildir

Ruby’ye yeni başlayan birçok kişi Sembollerin ne olduğunu ve ne için
kullanıldıklarını anlamakta zorlanır.

Semboller en iyi kimlikler olarak açıklanabilir. Bir sembolle ilgili
sorulacak olan **ne** olduğu değil **kim** olduğudur. Konsalda `irb`
girin ve farkı görelim:

{% highlight ruby %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

`object_id` metodu bir nesnenin tanımlama kodunu geri döner. Eğer iki nesne birbirine eşitse `object_id` leri de eşit olacaktır. Bunun anlamı ikisi de hafıza da aynı yeri işaret ediyor demektir. Gördüğünüz gibi bir sembol ilk defa kullanıldıktan sonra aynı
karakterler her zaman hafızada aynı yeri gösterir. Yani `object_id`leri
aynıdır.

Şimdi de (“george”) stringine bakalım. `object_id`leri aynı değil. Bunun
anlamı hafızada ayrı iki nesneyi işaret etmekte olmalarıdır. Her nezaman
yeni bir string üretirseniz Ruby onun için bir hafıza ayırır.

Eğer nerede sembol nerede string kullanacağınızdan emin değilseniz,
kimliği mi (örn. Hash key) yoksa içeriği mi size gerekli (yukardaki
“gearge” gibi) ona göre değerlendirin.

### Herşey bir Nesnedir

“Herşey bir nesnedir” lafı diğer dillerdeki gibi abartı bir laf
değildir. Sınıflar gibi tamsayılar da bir nesnedir ve diğer nesnelerle
yaptığınız herşeyi onlarla da yapabilirsiniz:

{% highlight ruby %}
# class MyClass
#   attr_accessor :instance_var
# end
# Koduyla aynı anlama gelen bir kod
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

### Değişken Sabitler

Sabitler tam olarak sabit değil. Eğer halihazırda değeri verilmiş bir
sabiti değiştirmeye kalkarsanız bir uyarı mesajı üretir ama çalışmayı
durdurmaz.

### İsimlendirme Gelenekleri

Ruby bazı isimlendirme geleneklerine zorlar. Eğer bir isim büyük harfle
başlıyorsa, o bir sabittir. Eğer bir dolar işaretiyle başlıyorsa ($), bu
bir global değişkendir. Eğer `@` işaretiyle başlıyorsa bu bir oluşum
değişkenidir. Eğer `@@` ile başlıyorsa bu bir sınıf değişkenidir.

Metod isimleri de büyük harfle başlayabilir. Bu aşağıdaki gibi bir
karışıklığa sebep olabilir:

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

Burada `Constant` 10 değerindeyken `Constant()` değeri 11 dir.

### Sahte İsimli Parametreler

Ruby Python’dakine benzer isimli parametrelere sahip değildir. Bunun
yerine hash ve semboller kullanarak taklidi yapılır. Ruby on Rails’de
çok sık kullanılır. Örneğin:

{% highlight ruby %}
def some_keyword_params( params )
  params
end
some_keyword_params( :param_one => 10, :param_two => 42 )
# => {:param_one=>10, :param_two=>42}
{% endhighlight %}

### Evrensel Doğruluk

Ruby’de **nil** ve **false** dışında herşey doğru kabul edilir. C,
Python ve diğer birçok dilde 0 ve boş listeler gibi diğer bazı değerler
yanlış kabul edilir. Aşağıdaki Python koduna bakın (diğer dillere de
çevrilebilir):

{% highlight python %}
# Python'da
if 0:
  print "0 is true"
else:
  print "0 is false"
{% endhighlight %}

Bunu çıktısı “0 is false” olacaktır. Ruby karşılığı ise:

{% highlight ruby %}
# Ruby'de
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

“0 is true” çıktısı verecektir.

### Erişim Belirleyicileri Kısım Sonuna Kadar Geçerlidir

Aşağıdaki Ruby kodunda,

{% highlight ruby %}
class MyClass
  private
  def bir_metod; true; end
  def diger_metod; false; end
end
{% endhighlight %}

`diger_metod` erişiminin genel olacağını düşünebilirsiniz ama öyle değil. “privete” erişim belirleyici sınıf tanımı sonuna kadar veya başka bir erişim belirleyici satıra kadar geçerli olacaktır. Default olarak tüm metodlar “public”(genel erişim)dir:

{% highlight ruby %}
class MyClass
  # Şimdi a_method public erişim
  def a_method; true; end

  private

  # another_method private erişim
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` ve `protected` aslında metoddur ve bu yüzden parametre alabilirler. Eğer bunlara bir sembol gönderirseniz metodun görünrlüğü değişir.

### Metod Erişimleri

Java’da, `public` metoda herkes erişebilir demektir. `protected` sınıfın
oluşumlarından, türetilmiş sınıfların oluşumlarından ve aynı paket
içersindeki sınıfların oluşumlarından erişilebilir demektir. `private`
ise sınıfın oluşumlarından başka kimse metoda ulaşamaz demektir.

Ruby biraz farklılık gösterir. `public` doğal olarak herkese açık
demektir. `private` ise metodun belirlenmiş alıcısı varsa
erişilebileceğini belirtir ve bu alıcı sadece **self** olabilir.

`protected` incelenmesi gereken birşey. Bir protected metod sınıfın yada türetilmiş sınıfın oluşumlarından çağrılabilir, ayrıca diğer oluşum üzerinden çağrılabilir. Örnek, [Ruby FAQ][1] alınmıştır:

{% highlight ruby %}
$ irb
irb(main):001:0> class Test
irb(main):002:1>   # default olarak public
irb(main):003:1*   def func
irb(main):004:2>     99
irb(main):005:2>   end
irb(main):006:1>
irb(main):007:1*   def ==(diger)
irb(main):008:2>     func == diger.func
irb(main):009:2>   end
irb(main):010:1> end
=> nil
irb(main):011:0>
irb(main):012:0* t1 = Test.new
=> #<Test:0x34ab50>
irb(main):013:0> t2 = Test.new
=> #<Test:0x342784>
irb(main):014:0> t1 == t2
=> true
irb(main):015:0> # şimdi `func` u protected yapalım, hala çalışıyor
irb(main):016:0* # çünkü protexted diğerine referansa izin veriyor
irb(main):017:0* class Test
irb(main):018:1>   protected :func
irb(main):019:1> end
=> Test
irb(main):020:0> t1 == t2
=> true
irb(main):021:0> # şimdi `func` u private yapalım
irb(main):022:0* class Test
irb(main):023:1>   private :func
irb(main):024:1> end
=> Test
irb(main):025:0> t1 == t2
NoMethodError: private method `func' called for #<Test:0x342784>
        from (irb):8:in `=='
        from (irb):25
        from :0
irb(main):026:0>
{% endhighlight %}

### Sınıflar Açıktır

Ruby sınıfları açıktır. İstediğiniz zaman açabilir, ekleme yapabilir,
değiştirebilirsiniz. Core sınıfları bile, mesela `Fixnum` ve hatta tüm
sınıfların anası `Object` sınıfı dahil. Ruby on Rails `Fixnum` sınıfına
zamanla ilgili bir kısım metod eklemiştir. İzleyin:

{% highlight ruby %}
class Fixnum
  def hours
    self * 3600 # bir saat içindeki saniye miktarı
  end
  alias hour hours
end

# 1 Ocak saat 00:00 dan itibaren 14 saat sonra
# anca uyanmışsınız ;)
Time.mktime(2011, 01, 01) + 14.hours # => Sat Jan 01 14:00:00
{% endhighlight %}

### Eğlenceli Metod İsimleri

Ruby’de metodların soru veya ünlem işareti ile bitmesine izin verilir.
Gelenek olarak sorulara cevap veren metodlar (örnek,
<tt>Array#empty?</tt> eğer alıcısı boşsa **true** döner) soru işareti
ile biter. Tehlikeli sonuçları olabilecek metodlar (örneğin “kendi”ni
değiştiren metodlar, `exit!` gibi) ünlem işareti ile bitirilirler.

Argümanlarını değiştiren tüm metodlar ünlem işareti ile bitmayabilir.
<tt>Array#replace</tt> bir array’in içeriğini diğer biriyle değiştirir
ama ünlemle bitmez.

### Özel Metodlar

Özel metodlar, tek nesneye özel metodlardır. Hangi nesne için
tanımlandıysa onun için geçerlidir.

{% highlight ruby %}
class Car
  def inspect
    "Ucuz araba"
  end
end

porsche = Car.new
porsche.inspect # => Ucuz araba
def porsche.inspect
  "Pahalı araba"
end

porsche.inspect # => Pahalı araba

# Diğer nesneler etkilenmez
other_car = Car.new
other_car.inspect # => Ucuz araba
{% endhighlight %}

### Kayıp Metodlar

Ruby bir metodu listesinde bulamayınca vazgeçmez, `method_missing`
metodunu bulamadığı metod ismi ve argümanları ile çağırır. Normalde
method\_missing bir NameError hatası verir, fakat isterseniz bunu
istediğiniz şekilde değiştirebilirsiniz ve birçok kütüphane de bunu
yapar. Bir örnek:

{% highlight ruby %}
# id çağrılan metodun adı, * deyimiyle tüm argümanlar
# bir 'arguments' adlı bir array içinde toplanır
def method_missing( id, *arguments )
  puts "Metod #{id} çağrıldı fakat bulunamadı. Argümanları " +
       "şunlar : #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Metod __ çağrıldı fakat bulunamadı. Argümanları
# şunlar: a, b, 10
{% endhighlight %}

Yukardaki kod sadece çağrının detaylarını çağırır, fakat siz bu mesajı
istediğiniz gibi değiştirmekte serbestsiniz.

### Fonksiyon Çağrısı Değil Mesaj İletimi

Bir metod çağrısı aslında diğer bir nesneye bir **mesaj** dır:

{% highlight ruby %}
# Bununla
1 + 2
# Bu aynıdır ...
1.+(2)
# Bu da aynıdır:
1.send "+", 2
{% endhighlight %}

### Bloklar Nesnedir, Sadece Henüz Bunu Bilmiyorlar

Bloklar (çevrili kodlar) standart kütüphaneler tarafından çok
kullanılır. Bir bloğu çağırmak için `yield` da kullanabilirsiniz,
argüman listesinde özel bir argüman ekleyerek `Proc` da yapabilirsiniz.
Şöyleki:

{% highlight ruby %}
def block( &the_block )
  # Burada the_block metoda gönderilen bloktur
  the_block # bloğu geri döndür
end
adder = block { |a, b| a + b }
# burada adder şimdi bir Proc nesnesidir
adder.class # => Proc
{% endhighlight %}

Blokları metod çağrıları dışında da Proc.new ile veya `lambda` metodu
ile üretebilirsiniz

Benzer olarak metodlar da birer nesnedir:

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### Operatörler de Deyimdir

Ruby’deki operatörler birbirlerine belli öncelikleri olan metodlardır.
Bu yüzden isterseniz Fixnum’un + metodunu değiştirebilirsiniz:

{% highlight ruby %}
class Fixnum
  # Yapabilirsiniz ama lütfen bunu yapmayın
  def +( other )
    self - other
  end
end
{% endhighlight %}

C++’ın `operator+` sına ihtiyacınız yok.

Array stili bir erişim için `[]` ve `[]=` metodları tanımlayabilirsiniz.
(+1 ve -2 deki gibi) işaretler için `+@` ve `-@` metodlarını
tanımlamalısınız.

Aşağıdaki operatörler bu şekilde değerlendirilmezler. Bunlar metod
değildir ve tekrar tanımlanamazlar:

{% highlight ruby %}
=, .., ..., !, not, &&, and, ||, or, !=, !~, ::
{% endhighlight %}

Ek olarak, +=, \*= vb. şunların kısaltmasıdır : `var = var + other_var`, `var = var * other_var`, vb. ve bu yüzden tekrar tanımlanamazlar.

## Daha Fazla Bilgi

Daha fazla bilgiye ihtiyaç duyarsanız [Belgeler](/tr/documentation/)
bölümüne bakınız.



[1]: http://faq.rubygarden.org/entry/show/57?controller_prefix=faq%2F
