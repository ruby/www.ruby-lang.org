---
layout: page
title: "從其他程式語言到 Ruby"
lang: zh_tw
---

當你第一眼看見 Ruby 程式碼，你一定會想起你熟悉的程式語言。這正是本文件的目的。Ruby 有許多語法和 Perl、Python 和 Java
(以及其他程式語言) 類似，所以如果你已經熟悉這些程式語言，那麼學習 Ruby 易如反掌。

這份文件包括兩大部份。這一部分的用意是整理從 *X* 語言到 Ruby 的重點。第二部分則從 Ruby
的重要功能及特色著手，與其他程式語言來做比較。

## 重點整理: 從 *程式語言 X* 到 Ruby

* [從 C 和 C++ 到 Ruby](to-ruby-from-c-and-cpp/)
* [從 Java 到 Ruby](to-ruby-from-java/)
* [從 Perl 到 Ruby](to-ruby-from-perl/)
* [從 PHP 到 Ruby](to-ruby-from-php/)
* [從 Python 到 Ruby](to-ruby-from-python/)

## 重要的語言特色及一些訣竅

這裡是你學習 Ruby 的一些重點及提示。

### 迭代 (Iteration)

Ruby 有兩個常用的特色你可能沒見過，那就是 “程式區塊(blocks)” 和 “迭代子(iterators)”。不像使用索引的迴圈(例如 C,
C++ 和 pre-1.5 Java)，或是迴圈控制結構(例如 Perl 的 `for (@a) {...}`，或是
Python 的 `for i in aList: ...`)。在 Ruby 裡你會常常看到：

{% highlight ruby %}
some_list.each do |this_item|
  # 我們在程式區塊中
  # 處理 this_item
end
{% endhighlight %}

關於更多 `each` 的資訊 (以及 `collect`, `find`, `inject`, `sort` 等等)，請參考
`ri Enumerable` (和 `ri Enumerable#some_method`).

### 一切東西都有值

表達式(expression)和敘述(statement)沒有差別，都會有回傳值，即使那個值是 **nil**。例如下述用法：

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

### Symbols 不是輕量化的字串

許多 Ruby 新手會搞不清楚什麼是 Symbols(符號) 可以做什麼用。

Symbols 就如同一個識別符號。一個 symbol 就代表它是“誰”了，而不是代表它是“什麼”。打開 `irb` 來看一看它們的區別：

{% highlight irb %}
irb(main):001:0> :george.object_id == :george.object_id
=> true
irb(main):002:0> "george".object_id == "george".object_id
=> false
irb(main):003:0>
{% endhighlight %}

`object_id` 方法會回傳物件的識別編號。如果有兩個物件有相同的 `object_id` 表示它們其實是同一個(指向同一個記憶體位置)。 如你所見，使用過 Symbols 之後，任何相同名字的 Symbol 都是指記憶體裡的同一個物件。對任何相同名字的 Symbols，它們的
`object_id` 都一樣。

讓我們來看看字串 “george”，它們的 `object_id`
並不相同。這表示它們在記憶體裡面是不同的物件。每次你建立一個新的字串，Ruby 就會分配新的記憶體空間給它。

如果你不清楚何時使用 Symbol 何時用字串(String)，想想看用途究竟是物件的識別(例如一個雜湊 Hash 的
key)，還是物件內容(比如這個例子的 “george”)。

### 所有東西都是物件

“所有東西都是物件” 並不是誇大，甚至是類別跟整數也是物件，你可以與其他物件一樣操作它們：

{% highlight ruby %}
# 這是等價的程式：
# class MyClass
#   attr_accessor :instance_var
# end
MyClass = Class.new do
  attr_accessor :instance_var
end
{% endhighlight %}

譯註：在 Ruby 中任何類別都是由 `Class` 類別所實例(new)出來的物件。

### 可變的常數

常數(Constant)並不真的無法改變。如果你修改了一個已經有值的常數，你會得到一個警告訊息，但程式不會終止。當然這不表示你“應該”修改常數的值。

### 命名慣例

Ruby 規定了一些命名慣例。變數的識別名稱，大寫字母開頭的是常數、錢號(`$`)開頭的是全域變數、`@` 開頭是實例變數(instance
variable)、`@@` 開頭則是類別變數。

方法名稱可以允許大寫字母開頭，雖然可能造成一些混淆，例如：

{% highlight ruby %}
Constant = 10
def Constant
  11
end
{% endhighlight %}

這裡的 `Constant` 是 10，但是 `Constant()` 卻是 11。

### 關鍵字參數

Ruby 自 2.0 起，方法可以使用關鍵字參數，用法與 Python 類似：

{% highlight ruby %}
def deliver(from: "A", to: nil, via: "mail")
  "Sending from #{from} to #{to} via #{via}."
end

deliver(to: "B")
# => "Sending from A to B via mail."
deliver(via: "Pony Express", from: "B", to: "A")
# => "Sending from B to A via Pony Express."
{% endhighlight %}

### 一切為 true

在 Ruby 裡，除了 **nil** 和 **false** 之外的所有東西，都可以當做 true 值。在 C, Python
和其他語言中，0 和一些其他值，例如空列表，會被當做 false。例如我們看看以下的 Python 程式(其他語言亦同)：

{% highlight python %}
# in Python
if 0:
  print("0 is true")
else:
  print("0 is false")
{% endhighlight %}

這會輸出 “0 is false”。而在 Ruby 裡:

{% highlight ruby %}
# in Ruby
if 0
  puts "0 is true"
else
  puts "0 is false"
end
{% endhighlight %}

這會輸出 “0 is true”。

### 存取修飾詞會作用到底

在下面的 Ruby 程式中，

{% highlight ruby %}
class MyClass
  private
  def a_method; true; end
  def another_method; false; end
end
{% endhighlight %}

你可能會認為 `another_method` 是 public 的，但不是這樣。這個 `private`
存取修飾到作用域(scope)結束，或是直到另一個存取修飾詞開始作用。方法預設都是 public 的：

{% highlight ruby %}
class MyClass
  # 這個 a_method 是 public 的
  def a_method; true; end

  private

  # 這個 another_method 是 private 的
  def another_method; false; end
end
{% endhighlight %}

`public`, `private` 和 `protected` 其實也是一種方法，所以可以接受參數。如果你傳入一個 Symbol，那個該 Symbol 代表的方法就會改變存取權限。

### 方法存取權限

在 Java 裡，`public` 表示方法可以被任何人呼叫。`protected` 表示只有這個類別的實例、衍生類別的實例，以及相同
package 類別的實例可以呼叫，而 `private` 表示除了這個類別的實例之外，其他都不行呼叫。

在 Ruby 中，`public` 還是一樣是公開的意思，其他則有一點差異。`private`
表示只有不指定接受者(receiver)時才可以呼叫，也就是只有 **self** 可以當成 private 方法的接受者。

`protected` 也有點不同。一個 protected 方法除了可以被一個類別或衍生類別的實例呼叫，也可以讓另一個相同類別的實例來當做接受者。 來看看 [Ruby Language FAQ][faq] 的例子：

{% highlight ruby %}
class Test
  # 預設是 public 的
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

# 來讓 `identifier' 變成 protected，一樣沒問題
# 因為 protected 允許其他相同類別的實例呼叫

class Test
  protected :identifier
end

t1 == t2  # => true

# 來讓 `identifier' 變成 private

class Test
  private :identifier
end

t1 == t2
# NoMethodError: private method `identifier' called for #<Test:0x342784>
{% endhighlight %}

### 類別是開放的

Ruby 的類別是開放的，你可以隨時打開它新增一點程式或是修改。即使是核心類別如 `Integer` 或是
`Object`(這是所有類別的父類別) 都一樣。 Ruby on Rails 甚至定義了一堆時間方法到 `Integer` 去，例如：

{% highlight ruby %}
class Integer
  def hours
    self * 3600 # 一小時有多少秒
  end
  alias hour hours
end

# 從一月一號 00:00 往後數 14 個小時
# (你終於醒了吧 ;)
Time.mktime(2006, 01, 01) + 14.hours # => Sun Jan 01 14:00:00
{% endhighlight %}

### 有趣的方法名稱

在 Ruby 裡，方法名稱允許用問號或驚嘆號結尾。慣例上，用來回答是非題的方法會用問號結尾 (例如 `Array#empty?`
會回傳 **true** 如果方法接收者是空的)。有潛在 “危險” (表示有某種副作用，會修改 **self** 或參數值。例如 `exit!`
等) 的方法會用驚嘆號結尾。

但是這不表示所有會修改參數的方法一定有驚嘆號結尾，例如 `Array#replace` 就會替換內容成別的陣列，畢竟
replace 的意思就是要修改替換自己。

### 單件方法

單件方法(Singleton methods)是個別物件才有的方法。它們只存在於你要定義的物件之中。

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

# 其他物件就不受影響
other_car = Car.new
other_car.inspect # => Cheap car
{% endhighlight %}

### Missing 方法

當你呼叫一個不存在的方法，Ruby 仍然有辦法處理。它會改呼叫 `method_missing`
這個方法，並把這個不存在的方法名稱傳進去當做參數。`method_missing` 預設會丟出一個 NameError
例外，但是你可以根據你的需求重新定義過，也有許多函式庫這麼做。這是一個例子：

{% highlight ruby %}
# id 是被呼叫方法的名字，而 * 符號會收集
# 所有傳進來的參數變成一個叫做 'arguments' 的陣列
def method_missing(id, *arguments)
  puts "Method #{id} was called, but not found. It has " +
       "these arguments: #{arguments.join(", ")}"
end

__ :a, :b, 10
# => Method __ was called, but not found. It has these
# arguments: a, b, 10
{% endhighlight %}

以上程式會輸出呼叫的細節，但你可以隨意定義這個訊息。

### 傳遞訊息，不是呼叫函數

一個方法呼叫(method call)其實就是送一個 **訊息(message)** 給一個物件：

{% highlight ruby %}
# 這個
1 + 2
# 等同於 ...
1.+(2)
# 也等同於:
1.send "+", 2
{% endhighlight %}

### Blocks 也算是物件

程式區塊 Blocks (或叫做 closures) 被廣泛應用在標準函式庫。要執行一個程式區塊，可以用 `yield`
，或是透過一個特別的參數讓它變成 `Proc`，例如：

{% highlight ruby %}
def block(&the_block)
  # 在這裡面，the_block 是被傳進來的程式區塊
  the_block # return the block
end
adder = block { |a, b| a + b }
# adder 是一個 Proc 物件
adder.class # => Proc
{% endhighlight %}

你也可以透過 `Proc.new` 或 `lambda` 在方法外建立程式區塊。

同樣的，方法也可以當做物件：

{% highlight ruby %}
method(:puts).call "puts is an object!"
# => puts is an object!
{% endhighlight %}

### 操作符只是語法包裝

大部分的 Ruby 操作符(operators)只是一種方法呼叫的語法包裝(syntactic
sugar)，加上一些優先權規則。你要的話，舉例來說，我們可以覆寫掉 Integer 的 + 方法：

{% highlight ruby %}
class Integer
  # 可以這麼做，但請不要這麼改
  def +(other)
    self - other
  end
end
{% endhighlight %}

你不需要 C++ 的 `operator+` 等等。

甚至有如陣列存取的 `[]` 和 `[]=` 可以定義。要定義一元的 + and – (想想看 +1 跟 -2)，你必須分別定義 `+@` 和
`-@` 方法。

以下的操作符則**不是**語法包裝。它們不是方法，不能被覆寫定義：

{% highlight ruby %}
=, .., ..., not, &&, and, ||, or, ::
{% endhighlight %}

此外 `+=`, `*=` 等只是 `var = var + other_var` 跟 `var = var * other_var`
等的縮寫，因此也不能被覆寫定義。

## 更多資料

如果你需要更多 Ruby 知識，請參考 [文件](/zh_tw/documentation/) 。



[faq]: http://ruby-doc.org/docs/ruby-doc-bundle/FAQ/FAQ.html
