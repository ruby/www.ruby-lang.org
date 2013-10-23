---
layout: page
title: "Yirmi Dakikada Ruby"
lang: tr

header: |
  <h2>Yirmi Dakikada Ruby</h2>
  <ul class="multi-page">
    <li><a href="../" title="Part 1">Part 1</a></li>
    <li><a href="../2/" title="Part 2">Part 2</a></li>
    <li><strong>Part 3</strong></li>
    <li><a href="../4/" title="Part 4">Part 4</a></li>
  </ul>
---

Şimdi bir selamlayıcı nesnesi üretelim ve kullanalım:

{% highlight ruby %}
irb(main):035:0> g = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> g.say_hi
Hi Pat!
=> nil
irb(main):037:0> g.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

Birkez `g` nesnesi üretildimi, ismin Pat olduğunu hep hatırlayacaktır.
Hımm, peki ismi direk olarak almak istersek nolcak?

{% highlight ruby %}
irb(main):038:0> g.@name
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

Yok, yapamadık.

## Nesnenin Derisinin Altında

Oluşum değişkenleri nesnenin içinde gizli kalırlar. Mutlak olarak gizli
değillerdir, onlara erişmenin diğer başka yolları vardır, fakat Ruby
verileri dışardan erişime gizleyecek çeşitli nesne yönelimli teknikler
kullanır.

Pekala Greeter nesnesinin ne metodları mevcut?

{% highlight ruby %}
irb(main):039:0> Greeter.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "say_hi", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "say_bye", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

Waw, bir sürü metod varmış. Biz sadece iki metod tanımladık. Burda neler
oluyor? Pekala bunlar Greeter nesnesinin tüm metodları, kalıtımdan
gelenler dahil. Eğer kalıtımdan gelen atalarının metodlarını görmek
itemezsek az evvelki çağrıyı `false` prametresiyle yapmalıyız. Bunun
anlamı kalıtımsal metodları istemediğimizdir.

{% highlight ruby %}
irb(main):040:0> Greeter.instance_methods(false)
=> ["say_bye", "say_hi"]
{% endhighlight %}

Ah, şimdi daha iyi. Haydi şimdide selamlayıcı nesnemizin hangi metodlara
cevap veriyor bulalım:

{% highlight ruby %}
irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("say_hi")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

Gördüğünüz gibi `say_hi` ve `to_s` (birşeyi stringe çevirme emridir)
kelimelerinin anlamını biliyor, fakat `name` anlamını bilmiyor.

## Sınıfları Değiştirmek—Asla Çok Geç Değildir

Fakat eğer isimi görmek ve değiştirmek isterseniz ne olacak? Ruby
nesnenin değişkenlerine erişmek için kolay bir yol sunar.

{% highlight ruby %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> nil
{% endhighlight %}

Ruby’de, sınıfı tekrar açıp değiştirebilirsiniz. Yapılan değişiklikler
yeni üretilecek nesnelerde etkili olacağı gibi üretilmiş nesnelerde de
etkilidir. Öyleyse yeni bir nesne üretelim ve onun `@name` özelliği ile
biraz oynayalım.

{% highlight ruby %}
irb(main):047:0> g = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> g.respond_to?("name")
=> true
irb(main):049:0> g.respond_to?("name=")
=> true
irb(main):050:0> g.say_hi
Hi Andy!
=> nil
irb(main):051:0> g.name="Betty"
=> "Betty"
irb(main):052:0> g
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> g.name
=> "Betty"
irb(main):054:0> g.say_hi
Hi Betty!
=> nil
{% endhighlight %}

`attr_accessor` kullanarak iki yeni metod tanımlanmış olur, değeri
okumak için `name` ve değeri değiştirmek için `name=` metodları.

## Herşeyi ve Hiçbirşeyi Selamlamak, MegaGreeter Hiçbirini Atlamaz!

Bu selamlayıcı yeterince ilginç değil. Sadece bir kişi ile ilgileniyor.
Eğer biz dünyayı, bir kişiyi yada kişiler listesinin hepsini
selamlayacak bir MegaGreeter istersek nasıl olacak?

Bu seferki kodumuzu direk IRB’de yazmak yerine bir dosyaya yazarak
saklayalım.

IRB’den çıkmak için “quit”, “exit” yazın ya da sadece Control-D basın.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Nesnenin üretilmesi
  def initialize(names = "World")
    @names = names
  end

  # Herkese merhaba de
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names içinde bir çeşit liste var, içinde döndür!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Herkese hoşçakal de
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Liste elemanlarını virgülle birleştir
      puts "Goodbye #{@names.join(", ")}.  Come back soon!"
    else
      puts "Goodbye #{@names}.  Come back soon!"
    end
  end

end


if __FILE__ == $0
  mg = MegaGreeter.new
  mg.say_hi
  mg.say_bye

  # İsimi "Zeke" olarak değiştir
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # İsimi bir isimler dizisine çevir
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  #  nil yap
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

Bu dosyayı “ri20min.rb” olarak kaydedin ve “ruby ri20min.rb” konsol
komutuyla çalıştırın. Çıktısı şöyle olmalı:

    Hello World!
    Goodbye World.  Come back soon!
    Hello Zeke!
    Goodbye Zeke.  Come back soon!
    Hello Albert!
    Hello Brenda!
    Hello Charles!
    Hello Dave!
    Hello Engelbert!
    Goodbye Albert, Brenda, Charles, Dave, Engelbert.  Come
    back soon!
    ...
    ...
{: .code}

Bu son örnekle birçok yeni şey ortaya çıktı, [daha bir derin
inceleyelim.](../4/)

