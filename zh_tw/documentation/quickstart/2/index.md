---
layout: page
title: "二十分鐘 Ruby 體驗"
lang: zh_tw

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
  <h1>二十分鐘 Ruby 體驗</h1>

---

如果您想說很多次 “Hello”，卻不想敲太多按鍵。是時候定義一個方法了!

{% highlight irb %}
irb(main):010:0> def h
irb(main):011:1> puts "Hello World!"
irb(main):012:1> end
=> nil
{% endhighlight %}

從 `def h` 開始定義一個方法。它告訴 Ruby 方法名字是 `h`。下一行是方法的內容，也就是我們之前看過的 `puts "Hello
World"`。接著最後一行 `end` 表示方法定義結束。 Ruby 回應 `=> nil` 告訴我們它知悉了這個方法定義。

## 這個簡短可以反覆執行的方法

現在來試試看執行這個方法數次：

{% highlight irb %}
irb(main):013:0> h
Hello World!
=> nil
irb(main):014:0> h()
Hello World!
=> nil
{% endhighlight %}

簡單吧。在 Ruby 中呼叫方法只要輸入方法名字就可以了。如果方法不需要參數，那麼括號可以省略。你也可以加上空括號，但不是必要的。

如果你只想對某個人打招呼呢? 只要重新定義 `h` 方法接受一個參數即可。

{% highlight irb %}
irb(main):015:0> def h(name)
irb(main):016:1> puts "Hello #{name}!"
irb(main):017:1> end
=> nil
irb(main):018:0> h("Matz")
Hello Matz!
=> nil
{% endhighlight %}

正如預期... 讓我們仔細看看到底發生什麼事情。

## 字串內嵌

什麼是 `#{name}` 啊? 這是 Ruby
用來在字串中插入資料的方式。大括號裡面的程式會被執行後變成一個字串，然後將整個大括號符號替換掉。例如，我們來把人名變成大寫：

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

這裡還有幾個小訣竅。第一是我們再次省略了方法的括號。如果方法呼叫很簡單，那麼括號建議你可以省略掉。另一個訣竅是參數有預設值
`World`。意思是說 “如果沒有給 name 參數，那麼就使用預設值 `"World"`“。

## 發展成 Greeter (接待員)

如果我們需要一個接待員，可以記住你的名字，並且禮貌地歡迎你。你會開始需要使用物件(object)了。讓我們來建立 “Greeter”
類別(class)。

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

新的關鍵字是 `class`。這定義了一個新的類別叫做 Greeter，以及屬於這個類別的方法。注意到 `@name`
這是一個實例變數，可以在類別裡面的方法中存取到。你可以看到在方法 `say_hi` 和 `say_bye` 裡使用了它。

如何讓 Greeter 類別動起來呢? 請接著看 [建立物件](../3/)。
