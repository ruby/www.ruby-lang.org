---
layout: page
title: "Ruby за двадцять хвилин"
lang: uk

header: |
  <div class="multi-page">
    <a href="../" title="Частина 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Частина 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Частина 4">4</a>
  </div>
  <h1>Ruby за двадцять хвилин</h1>

---

Тепер створімо об’єкт привітальника та використаємо його:

{% highlight irb %}
irb(main):035:0> greeter = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> greeter.say_hi
Hi Pat!
=> nil
irb(main):037:0> greeter.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

Після створення об’єкта `greeter` він запам’ятовує, що ім’я — Pat. Гм,
а що, якщо ми хочемо отримати ім’я безпосередньо?

{% highlight irb %}
irb(main):038:0> greeter.@name
SyntaxError: (irb):38: syntax error, unexpected tIVAR, expecting '('
{% endhighlight %}

Ні, так не вийде.

## Під «шкірою» об’єкта

Змінні екземпляра приховані всередині об’єкта. Вони не надто приховані:
ви бачите їх, коли інспектуєте об’єкт, і є інші способи доступу до них,
але Ruby застосовує правильний об’єктно-орієнтований підхід — тримати дані
певною мірою прихованими.

Отже, які методи існують для об’єктів Greeter?

{% highlight irb %}
irb(main):039:0> Greeter.instance_methods
=> [:say_hi, :say_bye, :instance_of?, :public_send,
    :instance_variable_get, :instance_variable_set,
    :instance_variable_defined?, :remove_instance_variable,
    :private_methods, :kind_of?, :instance_variables, :tap,
    :is_a?, :extend, :define_singleton_method, :to_enum,
    :enum_for, :<=>, :===, :=~, :!~, :eql?, :respond_to?,
    :freeze, :inspect, :display, :send, :object_id, :to_s,
    :method, :public_method, :singleton_method, :nil?, :hash,
    :class, :singleton_class, :clone, :dup, :itself, :taint,
    :tainted?, :untaint, :untrust, :trust, :untrusted?, :methods,
    :protected_methods, :frozen?, :public_methods, :singleton_methods,
    :!, :==, :!=, :__send__, :equal?, :instance_eval, :instance_exec, :__id__]
{% endhighlight %}

Ого. Це багато методів. Ми визначили лише два. Що відбувається?
Насправді це **всі** методи об’єктів Greeter — повний список, включно
з методами, визначеними у класах-предках. Якщо ми хочемо побачити лише
методи, визначені саме для Greeter, можемо вказати, що не потрібно
включати предків, передавши параметр `false`.

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> [:say_hi, :say_bye]
{% endhighlight %}

О, це вже краще. Тепер подивімося, на які методи реагує наш об’єкт greeter:

{% highlight irb %}
irb(main):041:0> greeter.respond_to?("name")
=> false
irb(main):042:0> greeter.respond_to?("say_hi")
=> true
irb(main):043:0> greeter.respond_to?("to_s")
=> true
{% endhighlight %}

Отже, він знає `say_hi` і `to_s` (тобто перетворення на рядок — метод,
визначений за замовчуванням для кожного об’єкта), але не знає `name`.

## Зміна класів — ніколи не пізно

А що, якщо ви хочете мати доступ до імені або змінювати його? Ruby
надає простий спосіб доступу до змінних об’єкта.

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

У Ruby можна знову відкрити клас і змінити його. Зміни будуть доступні
для нових об’єктів і навіть для вже існуючих об’єктів цього класу.
Тож створімо новий об’єкт і пограємося з його властивістю `@name`.

{% highlight irb %}
irb(main):047:0> greeter = Greeter.new("Andy")
=> #<Greeter:0x3c9b0 @name="Andy">
irb(main):048:0> greeter.respond_to?("name")
=> true
irb(main):049:0> greeter.respond_to?("name=")
=> true
irb(main):050:0> greeter.say_hi
Hi Andy!
=> nil
irb(main):051:0> greeter.name="Betty"
=> "Betty"
irb(main):052:0> greeter
=> #<Greeter:0x3c9b0 @name="Betty">
irb(main):053:0> greeter.name
=> "Betty"
irb(main):054:0> greeter.say_hi
Hi Betty!
=> nil
{% endhighlight %}

Використання `attr_accessor` визначило для нас два нові методи: `name`
для отримання значення і `name=` для його встановлення.

## Вітання всього й усіх: MegaGreeter нікого не обділяє!

Цей привітальник не надто цікавий — він може працювати лише з однією
людиною за раз. А що, якщо у нас буде MegaGreeter, який може вітати
світ, одну людину або цілий список людей?

Напишімо це у файлі замість введення безпосередньо в інтерактивний
інтерпретатор Ruby (IRB).

Щоб вийти з IRB, введіть “quit”, “exit” або просто натисніть Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # Create the object
  def initialize(names = "World")
    @names = names
  end

  # Say hi to everybody
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names is a list of some kind, iterate!
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # Say bye to everybody
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # Join the list elements with commas
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

  # Change name to be "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # Change the name to an array of names
  mg.names = ["Albert", "Brenda", "Charles",
              "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # Change to nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

Збережіть цей файл як “ri20min.rb” і запустіть як “ruby ri20min.rb”.
Вивід має бути таким:

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

У цьому фінальному прикладі з’явилося багато нового, що ми
[можемо розглянути детальніше.](../4/)
