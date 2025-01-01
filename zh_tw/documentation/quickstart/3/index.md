---
layout: page
title: "二十分鐘 Ruby 體驗"
lang: zh_tw

header: |
  <div class="multi-page">
    <a href="../" title="Part 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
  </div>
  <h1>二十分鐘 Ruby 體驗</h1>

---

讓我們建立一個 greeter 物件來使用：

{% highlight irb %}
irb(main):035:0> g = Greeter.new("Pat")
=> #<Greeter:0x16cac @name="Pat">
irb(main):036:0> g.say_hi
Hi Pat!
=> nil
irb(main):037:0> g.say_bye
Bye Pat, come back soon.
=> nil
{% endhighlight %}

一旦建立了 `g` 物件，它就會記得它的名字是 Pat。嗯，但是我們如何拿到這個名字的值呢?

{% highlight irb %}
irb(main):038:0> g.@name
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

啊，這樣不行。

## 揭開物件的面紗

物件中的實例變數(Instance variables)是隱藏的。雖然可以透過檢查(inspect)物件看到這個變數，不過 Ruby
採用了物件導向的思維(譯註: 即封裝)，內部屬性資料基本上是隱藏起來的。

到底 Greeter 物件有哪些方法呢?

{% highlight irb %}
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

哇。有這麼多。我們不是只定義了兩個方法，怎麼回事呢? 這裡列出的是**所有** Greeter
物件的方法，因此也包括了它所繼承的類別的方法。如果我們只需要 Greeter 自己的方法，可以傳入一個 **false**
參數，表示我們不希望包括父類別的方法。

{% highlight irb %}
irb(main):040:0> Greeter.instance_methods(false)
=> ["say_bye", "say_hi"]
{% endhighlight %}

看起來好多了。讓我們看看 greeter 物件對哪些方法有反應?

{% highlight irb %}
irb(main):041:0> g.respond_to?("name")
=> false
irb(main):042:0> g.respond_to?("say_hi")
=> true
irb(main):043:0> g.respond_to?("to_s")
=> true
{% endhighlight %}

它知道 `say_hi` 和 `to_s` (意思是轉換成字串，這是每個物件都有的方法)，但是不知道 `name` 這個方法。

## 變更類別，永不嫌晚

那麼要怎麼能夠讀取或修改名字呢? Ruby 提供了一個簡單的方式來讓你存取物件的變數：

{% highlight irb %}
irb(main):044:0> class Greeter
irb(main):045:1>   attr_accessor :name
irb(main):046:1> end
=> [:name, :name=]
{% endhighlight %}

在 Ruby
裡你可以再度打開一個類別然後修改它。這個改變會對之後產生的物件，甚至是已經產生的物件產生即時效果。所以，我們來建立一個新的物件試試看
`@name` 屬性。

{% highlight irb %}
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

`attr_accessor` 會定義兩個新的方法，`name` 用來取值，而 `name=` 用來給值。

## 可以歡迎任何東西的 MegaGreeter!

這個 greeter 玩膩了，它一次只能處理一個人。要如何能夠有 MegaGreeter
可以不只歡迎這個世界，還可以歡迎不同人，甚至是一群人呢?

接著讓我們開一個新檔案來撰寫 Ruby 程式吧，互動式的 IRB 不適合撰寫較長的程式。

要離開 IRB 請輸入 “quit” 或 “exit” 或按下 Control-D。

{% highlight ruby %}
#!/usr/bin/env ruby

class MegaGreeter
  attr_accessor :names

  # 初始化這個物件
  def initialize(names = "World")
    @names = names
  end

  # 向每個人說 hi
  def say_hi
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("each")
      # @names 是可以迭代的陣列容器
      @names.each do |name|
        puts "Hello #{name}!"
      end
    else
      puts "Hello #{@names}!"
    end
  end

  # 向每個人說 bye
  def say_bye
    if @names.nil?
      puts "..."
    elsif @names.respond_to?("join")
      # 用逗號將陣列中的元素串接成一個字串
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

  # 變更成 "Zeke"
  mg.names = "Zeke"
  mg.say_hi
  mg.say_bye

  # 變更成一個名字的陣列
  mg.names = ["Albert", "Brenda", "Charles",
    "Dave", "Engelbert"]
  mg.say_hi
  mg.say_bye

  # 變更成 nil
  mg.names = nil
  mg.say_hi
  mg.say_bye
end
{% endhighlight %}

把這個檔案存成 “ri20min.rb”，然後在命令提示符號輸入 “ruby ri20min.rb” 來執行它。您應該可以看到輸出是：

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

這個最後的範例有許多新東西，讓我們來[仔細瞧瞧](../4/)。
