---
layout: page
title: "Ruby в 20 минути"
lang: bg

header: |
  <div class="multi-page">
    <a href="../" title="Част 1">1</a>
    <span class="separator"> | </span>
    <strong>2</strong>
    <span class="separator"> | </span>
    <a href="../3/" title="Част 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Част 4">4</a>
  </div>
  <h1>Ruby в 20 минути</h1>

---

Как да направим така, че да изписваме “Hello World” когато си поискаме,
без да пишем низа всеки път ? Трябва да дефинираме метод !

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> nil
{% endhighlight %}

Кодът започва с израза `def`, което обозначава началото на метода. Това
указва на Ruby, че искаме да дефинираме метод с име `h`. Следващият ред
е тялото на метода, като то съдържа кода, който видяхме в Част 1: `puts
"Hello World"`. Дефинирането на метода приключва с ключовата дума `end`.

## Използване на метод

Нека извикаме метода няколко пъти:

{% highlight irb %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

Извикването на метод е толкова лесно, колкото самото изписване на името
му. Ако методът не приема параметри, може да пропуснем скобите.

Изниква въпросът: как да кажем ‘Hello” на определен човек, а не на целия
свят ? Просто трябва да дефинираме метода да приема параметър:

{% highlight irb %}
irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

Чудесно, работи. Но нека видим как точно.

## Изпълнение на код в низ

Изразът #\{name}@ представлява начин за вмъкване на променлива/метод в
низ. Можем също така да приложим методът към нашата променлива `name`\:

{% highlight irb %}
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

Нещата, които тук се забелязват са употребата на методът с и без
параметър. Ако извикаме методът с параметър, който сме въвели,
стойността по подразбиране ще бъде пренебрегната.

## Еволюиране в “Посрещач”

Ако искаме да сме наистина учтиви, да помним името на “госта” и да го
поздравяваме и отнасяме с уважение към него, може да използваме обект.
Нека напишем клас “Greeter”.

{% highlight irb %}
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

Новата ключова дума в примера е `class`. Тя дефинира нов клас, наречен
Greeter, както и няколко метода . Също така трябва да се обърне внимание
на `@name`. Това е променлива на инстанцията, достъпна за всички методи
на класа. Както виждате, тя влиза в употреба в методите `say_hi` и
`say_bye`.

Продължаваме с Част 3, където може да видим класът в действие и
[създаването на обект](../3/)
