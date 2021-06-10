---
layout: page
title: "Yirmi Dakikada Ruby"
lang: tr

header: |
  <div class="multi-page">
    <a href="../" title="Kısım 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Kısım 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Kısım 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>Yirmi Dakikada Ruby</h1>

---

Peki, yeni programımıza daha derin bir inceleme yapalım, (#) ile
başlayan ilk satıra dikkat edin. Ruby’de diyez işareti ile başlayan
satırlar bilgilendirme satırlarıdır ve komut işleyici tarafından dikkate
alınmaz. Dosyanın ilk satırının Unix benzeri işletim sistemlerinde özel
bir anlamı vardır. İşletim sistemine dosyanın nasıl çalıştırılacağını
anlatır. Diğer bütün yorum satırları sadece bilgilendirme amaçlıdır.

Bizim `say_hi` metodunda biraz kurnazlıklar mevcut:

{% highlight ruby %}
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
{% endhighlight %}

Bu betik nasıl cevap vereceğine karar vermek için `@names` değişkenine
bakıyor. Eğer değişken nil'se üç nokta koyuyor, selamlanacak kimse yoksa
ne yapacak ki?

## Çevirmek, Döngü veya Yineleme

Eğer `@names` nesnesi `each` metoduna cevap verirse içinde yineleme
yapabileceğiniz bir listedir, öyleyse onun içinde bir yineleme ile
listedeki her kişiyi selamlayabilirsiniz. En son olarak da `@names`
bunların hiçbiri değilse otomatik olarak stringe dönüşür ve önceki
selamlama şeklini yapar.

Haydi bu yineleyiciyi daha yakından inceleyelim:

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` metodu arkasından gelen kod bloğunu listenin her elemanı için
çalıştırır. `do` ve `end` arasında kod bloğu yer alır. Blok, isimsiz
fonksiyonlar ya da `lambda` gibidir. Liste elemanları
tek tek bar karakterleri arasındaki değişkene konur ve kod işlenir.
Sonra bir sonraki liste elemanına geçilir.

Burada olan şudur: `name` listenin
elemanlarına bağlanır ve `puts "Hello #{name}!"` satırı bu isimle
çalışır.

Birçok diğer programlama dilinde bir liste `for` döngüsü ile işlenir,
C’de şuna benzer bir kod olur:

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

Bu kod çalışıyor ama şık bir görüntüsü yok. `i` gibi bir değişken
üretmek zorundasınız, listenin uzunluğunu bulmak zorundasınız ve liste
elemanlarının nasıl işleneceğini anlatmak zorundasınız. Ruby yolu çok
daha zarif, tüm ayrıntılar bir `each` kelimesinin içinde saklı ve
sadece her elemanı ne yapacağınızı anlatmak zorundasınız. Ayrıca daha
okunaklı oluyor, Ruby yolu böyle olmalı. İçeride `each` metodu sırayla
`yield "Albert"` sonra `yield "Brenda"` sonra `yield "Charles"` şeklinde
çalışmaktadır.

## Bloklar, Ruby’nin En Işıldayan Özelliği

Blokların bir şeyleri işlemekteki gücü listelerdekinden daha fazladır.
Metodun içerisindekileri toparlamanın ötesinde, ayrıca kullanıcı farkında
olmadan ayarlar, parçalama ve hatalarla ilgilenebilirsiniz.

{% highlight ruby %}
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
{% endhighlight %}

`say_bye` metodu `each` kullanmaz onun yerine `@names` değişkeninin
`join` metoduna cevap vermesini sınar ve veriyorsa bu metodu kullanır. Diğer
durumda bu değişken liste
değil de string olarak işlenir. Bu metot, değişkenin orjinal *tipi* ile
ilgilenmez `join` metoduna cevap veriyorsa `join` ile değişkeni işler,
liste değil başka bir tipte değişken de `join` metoduna cevap verse onu
da aynı şekilde işler. Buna “Duck Typing” denir, “eğer ördek gibi
yürüyorsa ve ördek gibi ötüyorsa …” gibi bir şey. Bunun faydası, desteklenen
değişken tiplerinin gereksiz yere kısıtlanmamasıdır. Eğer birisi yeni bir tür
liste sınıfı ile gelirse, diğer listelerdeki aynı anlam ile `join` metodunu
gerçeklediği sürece, her şey planlandığı gibi çalışacaktır.

## Betiğe Giriş

Peki, bu MegaGreeter sınıf tanımıydı, dosyanın geri kalanı ise bu
sınıfın kullanılmasından ibaret. Dikkatinizi çekecek son bir nokta
kaldı, o da şu:

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` sihirli bir değişkendir ve bulunduğu dosyanın ismini içerir.
`$0` ise bu programı çağıran dosyanın ismini içerir. Buradaki koşul ile
“Eğer bu dosya direk çağrıldıysa .. ” deniyor. Başka bir program burada
tanımlanan sınıfı `require` satırı ile içerip kullanacaksa bu koşul
içindeki blok çalışmayacaktır. Ancak ve ancak bu dosya tek başına
çalıştırıldığında bu satırlar işlenecekir.

## Artık Kendinizi Tanışmış Kabul Edin

Ruby’ye hızlı bakış bu kadar. Daha Ruby’nin sunduğu incelenebilecek
birçok değişik kontrol yapıları var; blokların ve `yield`in kullanımı,
mixin olarak modüller ve dahası. Umarız bu anlattıklarımız sizde Ruby hakkında
daha
fazla şeyler öğrenmek için bir arzu yaratmıştır.

Eğer öyleyse lütfen [Belgeler](/tr/documentation/) bölgesindeki ücretsiz
el kitapları ve öğreticileri inceleyin.
