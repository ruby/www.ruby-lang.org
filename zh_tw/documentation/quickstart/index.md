---
layout: page
title: "二十分鐘 Ruby 體驗"
lang: zh_tw

header: |
  <div class="multi-page">
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="4/" title="Part 4">4</a>
  </div>
  <h1>二十分鐘 Ruby 體驗</h1>

---

## 簡介

這是一個簡短的 Ruby 入門體驗，應該可以在二十分鐘內完成。您必須先安裝好 Ruby
(如果還沒有，請先[下載](/zh_tw/downloads/)安裝)

## 互動式 Ruby

Ruby 附帶了一支程式可以讓你即時看到執行 Ruby 敘述的結果。使用這種互動式環境來學習 Ruby 可說是非常地方便。

打開 IRB (表示 Interactive Ruby)。

* 如果你使用 **macOS** 請打開 `Terminal` 然後輸入 `irb` 和 enter。
* 如果你使用 **Linux**，請打開一個 shell 然後輸入 `irb` 和 enter。
* 如果你使用 **Windows**，請從開始選單中打開 Ruby 的 `Interactive Ruby` 。

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

Ok，打開了，現在怎麼辦？

請輸入：`"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## 讓 Ruby 聽話!

發生什麼事了? 你是不是剛剛寫下了全世界最短的 “Hello World” 程式？也不盡然。第二行只是 IRB
告訴我們最後的敘述執行結果。如果我們需要輸出 “Hello World” 還需要多一行：

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` 是 Ruby 的基本輸出指令。但是什麼是 `=> nil` 呢? 那是那一行敘述的執行結果。 `puts` 總是回傳
nil，nil 在 Ruby 中表示一個絕對的空值。

## 你的第一個免費計算機

其實，我們已經可以用 IRB 來當做一個簡單的計算機了。

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

三加二，夠簡單了。那怎麼三乘二呢? 你可以試試，一點都不難，你也能夠隨意輸入數字試試。試著按按看 **上** 它會顯示上一行的
`3+2`，然後你可以往左移動到 `+` 更改成 `*` 乘號。

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

接下來，讓我們試試看三的平方：

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

在 Ruby 中 `**` 是 “次方” 的意思。但是如果你想開根號呢?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

等一下，上面那是什麼? 如果你想說：“它是 9 的平方根” 那就對了。讓我們來仔細看一下。首先，什麼是 `Math`?

## 給程式分類的模組(Modules)

`Math` 是一個內建的數學模組。Ruby 的模組有兩種作用。這裡介紹的是第一種：把功能相似的方法放在一起。`Math` 模組還包括了像是
`sin()` 和 `tan()`。

接下來介紹點(dot)。這個點是做什麼用的? 這個點是用來告訴接收者(即 Math 模組)一個訊息。什麼訊息呢? 在這個例子，訊息是
`sqrt(9)`，也就是呼叫 `sqrt` 方法，並傳遞 9 作為參數。sqrt 正是 “square root” 平方根的意思。

這個方法的回傳值是 `3.0`。你可能會發現到這不只是 `3`
而已，還包括小數點。這是因為大多數的情況開根號不會剛好是整數，所以這個函數總是回傳浮點數。

如果我們想記住運算的結果呢? 指定到一個變數即可。

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

儘管這是一個不錯的計算機，但我們將逐漸脫離基本的 `Hello World`，[讓我們繼續吧](2/)。
