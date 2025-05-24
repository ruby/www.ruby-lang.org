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
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <strong>4</strong>
  </div>
  <h1>二十分鐘 Ruby 體驗</h1>

---

我們來深入看看這個新程式。注意到由井號(#)開頭的第一行，在 Ruby
裡，任何在井號之後的內容都是註解，會被直譯器忽略。除了檔案的第一行是個例外，在 Unix-like 作業系統下這告訴 Shell
如何執行這個檔案。其餘的註解則用來說明程式。

我們的 `say_hi` 方法也改變了：

{% highlight ruby %}
# 對每個人說 hi
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
{% endhighlight %}

它現在會根據 `@names` 參數的不同而有不同的行為。如果是 nil，它會輸出三個點。沒必要對空氣打招呼，對吧?

## 循環、迴圈，迭代 (Iteration)

如果 `@names` 物件可以回應 `each` 方法，那表示你可以迭代它，好讓我們輪流對其中的元素打招呼。如果 `@names`
什麼都不是，我們透過字串內嵌把它轉化成字串，用預設的打招呼方式。

下面來看一看這是怎麼迭代的：

{% highlight ruby %}
@names.each do |name|
  puts "Hello #{name}!"
end
{% endhighlight %}

`each` 是一個可以接受程式區塊(a block of code)的方法，它會對 `@names` 裡的每個元素執行這個程式區塊，也就是從
`do` 到 `end` 的程式碼。一個程式區塊就像是一個匿名方法，也像是 `lambda`。而在直線 `|` 符號之間的是這個程式區塊的參數。

具體來說就是，程式區塊裡的 `name` 參數會被輪流指定為容器裡的每個元素，然後執行 `puts "Hello #{name}!"` 。

大多數的程式語言會用 `for` 迴圈來做這件事情，例如在 C 裡面：

{% highlight c %}
for (i=0; i<number_of_elements; i++)
{
  do_something_with(element[i]);
}
{% endhighlight %}

這樣也行，只是沒這麼漂亮。你需要一個用過即丟的 `i` 變數、需要計算容器的長度、檢查離開迴圈的條件。而 Ruby
的方式漂亮多了，所有的工作都被包裝在 `each` 方法裡。在 `each` 內部會去輪流呼叫 `yield "Albert"`、`yield
"Brenda"`、`yield "Charles"` 等等。(譯註：yield 的意思是“轉交”，也就是跳去執行程式區塊)

## 讓 Ruby 發光發亮的程式區塊(Blocks)

程式區塊真正厲害的地方是，它可以處理比迭代更複雜的任務。你可以用來設定(setup)、卸載(teardown)和錯誤處理，這些都可以隱藏起來讓方法使用者無需擔心。

{% highlight ruby %}
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
{% endhighlight %}

`say_bye` 方法沒有用到 `each`，而是檢查 `@names`@ 是不是可以回應 `join`
方法。如果可以，就呼叫它。不然它就把它當做字串輸出。這個方法並不在乎變數真正的
*型別(type)*，而只關心變數是不是可以回應支援某個方法，這種風格叫做 “鴨子型別(Duck Typing)”，意義就是
“如果它走起來像鴨子，叫起來也像鴨子，那就當它是鴨子”。這種思維的好處是它不會被變數的型別所限制。如果有人寫了新的容器類別，並且也實作了
`join` 這個方法，那麼我們就可以在這裡使用它。

## 讓腳本跑起來

這就是 MegaGreeter 類別了。剩下的部份是就是使用這個類別而已。唯一要注意的技巧是以下這行：

{% highlight ruby %}
if __FILE__ == $0
{% endhighlight %}

`__FILE__` 是一個預先定義好的變數，內容是目前這個檔案的名稱。而 `$0` 是執行這隻程式的執行檔名稱。這個檢查是說
“如果這個檔案就是執行程式的檔案....”。這可以允許將這個檔案當做方法庫使用。也就是說，這個檔案如果當做方法庫使用時，不會執行這段程式。如果當做執行檔執行，就會執行這段程式。

## 就這樣啦

這就是二十分鐘的 Ruby 入門體驗了。還有許多值得探索的地方，例如不同的控制結構、如何使用程式區塊及
`yield`、模組(modules)的第二個用途 mixin 等等。希望這份體驗教學讓你有興趣繼續學習。

如果你希望進一步了解，歡迎前往我們的 [文件](/zh_tw/documentation/)，那裡提供了一些免費的線上文件和導覽。
