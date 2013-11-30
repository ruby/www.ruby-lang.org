---
layout: page
title: "Yirmi Dakikada Ruby"
lang: tr

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
  </div>
  <h1>Yirmi Dakikada Ruby</h1>

---

Eğer parmaklarımızı çok yormadan defalarca “Hello” demek istersek ? Bir
metot tanımlamamız gerekiyor!

{% highlight ruby %}
irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> nil
{% endhighlight %}

`def h` kodu ile metot tanımlaması başlar. Bu Ruby’ye adı `h` olan bir
metot tanıtımı (definition) başlattığımızı bildirir. Sonraki satır
metodun gövdesini oluşturur. Daha önce gördüğümüz gibi: `puts "Hello
World"`. Son satırdaki `end` Ruby’ye metot tanımlamasını bitirdiğimizi
belirtir. Ruby’nin `=> nil` cevabı da metot tanımlamamızı algıladığını
belirtir.

## Kısaca Bir Metot Defalarca Yaşar

Şimdi bu metodu birkaç defa çalıştıralım:

{% highlight ruby %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

Pekala, bu kolaydı. Ruby’de metotları çağırmak için adlarını Ruby’ye
söylemek yeterli. Eğer metot bir parametre almıyorsa tüm yapmanız
gereken bundan ibaret. Eğer isterseniz boş parantezlerle parametresiz
bir metot çağırdığınızı belirtebilirsiniz, ama gereği yok.

Eğer dünyaya değil de bir kişiye merhaba demek istersek ne olacak? Hemen
`h` metodunu bu sefer parametre alacak şekilde tekrar tanımlayalım.

{% highlight ruby %}
irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

Çalıştığını gördükten sonra neler olduğunu tekrar bir inceleyelim.

## String İçine Erişmek

`#{name}` kısmı nedir? Bu bir string içine birşeyler eklemenin Ruby
yoludur. Süslü parantez içindeki kısım stringe çevrilir ve ana string
içine bu noktada eklenir. Bunu verilen ismin ilk harfinin büyük
olduğundan emin olmak için kullanabilirsiniz:

{% highlight ruby %}
irb(main):019:0> def h(name = "World")
irb(main):020:1> puts "Hello #{name.capitalize}!"
irb(main):021:1> end
=> nil
irb(main):022:0> h "chris"
Hello Chris!
=> nil
irb(main):023:0> h
Hello World!
=> nil
{% endhighlight %}

Burda birkaç diğer şekil görünüyor. Biri metodu parantez kullanmadan
çağırıyoruz. Parantezler keyfe bağlı kullanılır, görsel olarak isterseniz
kullanırsınız. Diğer şekil varsayılan parametre değeri `World`. Bunun
anlamı eğer parametre verilmediyse `name` değeri varsayılan olarak
`"World"` alınacaktır.

## Bir Selamlayıcıya Dönüştürmek

Eğer bir selamlayıcı yapmak istersek, adınızı hatırlayacak ve sizi
karşılayacak, sonra uğurlayacak. Bunu yapmak için bir nesne kullanmak
isteyebilirsiniz. Bir “Greeter” sınıfı oluşturalım.

{% highlight ruby %}
irb(main):024:0> class Greeter
irb(main):025:1>   def initialize(name = "World")
irb(main):026:2>     @name = name
irb(main):027:2>   end
irb(main):028:1>   def say_hi
irb(main):029:2>     puts "Hi #{@name}!"
irb(main):030:2>   end
irb(main):031:1>   def say_bye
irb(main):032:2>     puts "Bye #{@name}, come back soon."
irb(main):033:2>   end
irb(main):034:1> end
=> nil
{% endhighlight %}

Buradaki yeni kelime `class`. Bu Greeter adı verilen bir nesne ve içinde
birkaç metot tanımlar. Ayrıca dikkat ederseniz `@name` bu sınıfın bir
örnek değişkeni. Göreceğiniz gibi `say_hi` ve `say_bye` metotları
içinde kullanılıyor.

Peki bu Greeter sınıfını nasıl çalıştıracağız? [Bir nesne
üretin.](../3/)
