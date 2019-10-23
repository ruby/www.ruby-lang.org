---
layout: page
title: "Ruby ve Diğer Diller"
lang: tr
---

Ruby koduna ilk baktığınızda daha önce kullandığınız başka programlama
dillerine benzetebilirsiniz. Bu bilerek yapılmıştır. Java, Perl veya
Python kullanıcılarına deyimler tanıdık gelecektir. Eğer bunlardan
birini kullanmışsanız işiniz çok kolay.
{: .summary}

Bu belgede iki ana bölüm var. İlki *X* dilinden Ruby’ye geçerken ne
görmeyi beklediğiniz, ikincisi dilin ana özelliklerini ele alıp önceden
bildiklerinizle karşılaştırır.

## Neler Değişiyor: *X Dilinden* Ruby’ye

* [C ve C++ dan Ruby’ye](to-ruby-from-c-and-cpp/)
* [Java’dan Ruby’ye](to-ruby-from-java/)
* [Perl’den Ruby’ye](to-ruby-from-perl/)
* [PHP’den Ruby’ye](to-ruby-from-php/)
* [Python’dan Ruby’ye](to-ruby-from-python/)

## Önemli Dil Özellikleri ve Bazı İpuçları

Burada Ruby öğrenirken yardımcınız olacak ana Ruby özelliklerini
görüyorsunuz.

### Yineleme (Iteration)

İki Ruby özelliği, daha önce muhtemelen görmediğiniz ve kullanmaya başlaması
biraz zaman alan, bloklar ve yineleyicilerdir. Bir index üzerinden
döngü yapmak (C, C++ ve 1.5 öncesi Java daki gibi) veya bir liste
üzerinde döngü yapmak (Perl’ün `for (@a) {...}` veya Python’un
`for i in aList: ...`) yerine Ruby ile genellikle şöyle birşey
görürsünüz:

{% highlight ruby %}
some_list.each do |this_item|
  # Burası blok içi.
  # this_item ile çalışan kodlar buradadır.
end
{% endhighlight %}

`each` (ve arkadaşları `collect`, `find`, `inject`, `sort`, vs.)
hakkında daha fazla bilgi için komut satırında `ri Enumerable`
(ve sonrasında `ri Enumerable#some_method`) yazabilirsiniz.

### Herşeyin Bir Değeri Vardır

Bir deyimle bir ifade arasında fark yoktur. Herşey **nil** de
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
sorulacak olan **ne** olduğu değil **kim** olduğudur. Konsolda `irb`
girin ve farkı görelim:

{% highlight irb %}
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
durdurmaz. Bu, sabitleri yeniden **tanımlamalısınız** demek değildir tabii ki.

### İsimlendirme Gelenekleri

Ruby bazı isimlendirme geleneklerine zorlar. Eğer bir isim büyük harfle
başlıyorsa, o bir sabittir. Eğer bir dolar işaretiyle başlıyorsa (`$`), bu
bir global değişkendir. Eğer `@` işaretiyle başlıyorsa bu bir örnek
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

### Anahtar kelime argümanları

Python'daki gibi, Ruby 2.0'dan itibaren, metodlar anahtar kelime argümanları
kullanarak tanımlanabilir:

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### Evrensel Doğruluk

Ruby’de **nil** ve **false** dışında herşey doğru kabul edilir. C,
Python ve diğer birçok dilde 0 ve boş listeler gibi diğer bazı değerler
yanlış kabul edilir. Aşağıdaki Python koduna bakın (diğer dillerde de durum
böyledir):

{% highlight python %}
# Python'da
if 0:
  print("0 is true")
else:
  print("0 is false")
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
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

`another_method` erişiminin genel olacağını düşünebilirsiniz ama öyle değil. “private” erişim belirleyici sınıf tanımı sonuna kadar veya başka bir erişim belirleyici satıra kadar geçerli olacaktır. Default olarak tüm metodlar “public”(genel erişim)dir:

{% highlight ruby %}
class MyClass
  # Şimdi a_method public erişim
  def a_method; true; end

  private

  # another_method private erişim
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` ve `protected` aslında metoddur ve bu yüzden parametre alabilirler. Eğer bunlara bir sembol gönderirseniz metodun görünürlüğü değişir.

### Metod Erişimleri

Java’da `public`, metoda herkes erişebilir demektir. `protected`, sınıfın
örneklerinden, türetilmiş sınıfların örneklerinden ve aynı paket
içerisindeki sınıfların örneklerinden erişilebilir demektir. `private`
ise sınıfın örneklerinden başka kimse metoda ulaşamaz demektir.

Ruby biraz farklılık gösterir. `public` doğal olarak herkese açık
demektir. `private` ise metodun sadece harici bir alıcı olmadan
çağrılabildiğinde ulaşılabilir olduğunu belirtir. Sadece `self`, private bir
metod çağrısının alıcısı olabilir.

`protected` incelenmesi gereken birşey. Bir protected metod sınıfın yada türetilmiş sınıfın örneklerinden çağrılabilir, ayrıca diğer örnekler üzerinden çağrılabilir. Örnek, [Ruby Dili SSS][faq] alınmıştır:

{% highlight ruby %}
class Test
  # varsayılan olarak public
  def identifier
    99
  end

  def ==(other)
    identifier == other.identifier
  end
end

t1 = Test.new  # => #<Test:0x34ab50>
t2 = Test.new  # => #<Test:0x342784>
t1 == t2       # => true

# şimdi `identifier'ı protected yapalım, hala çalışıyor
# çünkü protected `diğerinin' alıcı olmasına izin verir

class Test
  protected :identifier
end

t1 == t2  # => true

# şimdi `identifier'ı private yapalım

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### Sınıflar Açıktır

Ruby sınıfları açıktır. İstediğiniz zaman açabilir, ekleme yapabilir,
değiştirebilirsiniz. Çekirdek sınıfları bile, mesela `Integer` ve hatta tüm
nesnelerin anası `Object` sınıfı dahil. Ruby on Rails `Integer` sınıfına
zamanla ilgili bir kısım metod eklemiştir. İzleyin:

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # bir saat içindeki saniye miktarı
  end
  alias hour hours
end

# 1 Ocak saat 00:00 dan itibaren 14 saat sonra
# anca uyanmışsınız ;)
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### Eğlenceli Metod İsimleri

Ruby’de metodların soru veya ünlem işareti ile bitmesine izin verilir.
Gelenek olarak sorulara cevap veren metodlar (örnek,
`Array#empty?` eğer alıcısı boşsa **true** döner) soru işareti
ile biter. Tehlikeli sonuçları olabilecek metodlar (örneğin “kendi”ni ya da argümanlarını
değiştiren metodlar, `exit!` gibi) ünlem işareti ile bitirilirler.

Argümanlarını değiştiren tüm metodlar ünlem işareti ile bitmeyebilir.
`Array#replace` bir array’in içeriğini diğer biriyle değiştirir
ama ünlemle bitmez. Böyle bir metodun kendini **değiştirmemesi** pek mantıklı
değil.

### Tekil Metodlar

Tekil metodlar, tek nesneye özel metodlardır. Hangi nesne için
tanımlandıysa onun için geçerlidir.

{% highlight ruby %}
class Car
  def inspect
    "Cheap car"
  end
end

porsche = Car.new
porsche.inspect # => Cheap car
def porsche.inspect
  "Expensive car"
end

porsche.inspect # => Expensive car

# Diğer nesneler etkilenmez
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### Kayıp Metodlar

Ruby bir metodu listesinde bulamayınca vazgeçmez, `method_missing`
metodunu bulamadığı metod ismi ve argümanları ile çağırır. Normalde
`method_missing` bir NameError hatası verir, fakat isterseniz bunu
istediğiniz şekilde değiştirebilirsiniz ve birçok kütüphane de bunu
yapar. Bir örnek:

{% highlight ruby %}
# id çağrılan metodun adı, * deyimiyle tüm argümanlar
# bir 'arguments' adlı bir array içinde toplanır
def method_missing(id, *arguments)
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

Yukardaki kod sadece çağrının detaylarını yazdırır, fakat siz mesajı
istediğiniz gibi ele almakta serbestsiniz.

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

Bloklar (gerçekte kapamalar) standart kütüphane tarafından çok
kullanılır. Bir bloğu çağırmak için `yield` da kullanabilirsiniz,
argüman listesine özel bir argüman ekleyerek bloğu `Proc` da yapabilirsiniz.
Şöyleki:

{% highlight ruby %}
def block(&the_block)
  # Burada the_block metoda gönderilen bloktur
  the_block # bloğu geri döndür
end
adder = block { |a, b| a + b }
# burada adder şimdi bir Proc nesnesidir
adder.class # => Proc
{% endhighlight %}

Blokları metod çağrıları dışında da `Proc.new` ile veya `lambda` metodu
ile üretebilirsiniz

Benzer olarak metodlar da birer nesnedir:

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### Operatörler sözdizimsel şekerlerdir

Ruby’deki çoğu operatör birbirine belli önceliği olan metod çağrılarıdır.
Bu yüzden isterseniz Integer’ın + metodunu değiştirebilirsiniz:

{% highlight ruby %}
class Integer
  # Yapabilirsiniz ama lütfen bunu yapmayın
  def +(other)
    self - other
  end
end
{% endhighlight %}

C++’ın `operator+`'ına, vb. ihtiyacınız yok.

Array stili bir erişim için `[]` ve `[]=` metodları tanımlayabilirsiniz.
(+1 ve -2 deki gibi) işaretler için `+@` ve `-@` metodlarını
tanımlamalısınız.

Aşağıdaki operatörler sözdizimsel şeker değillerdir. Bunlar metod
değildir ve tekrar tanımlanamazlar:

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

Ek olarak, `+=`, `*=` vb. şunların kısaltmasıdır : `var = var + other_var`,
`var = var * other_var`, vb. ve bu yüzden tekrar tanımlanamazlar.

## Daha Fazla Bilgi

Daha fazla bilgiye ihtiyaç duyarsanız [Belgeler](/tr/documentation/)
bölümüne bakınız.



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
