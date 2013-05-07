---
layout: page
title: "關於 Ruby"
lang: zh_TW
---

想知道Ruby為何如此受歡迎嗎? 為什麼它的支持者會稱它是個美麗、靈巧而且方便又實用的程式語言?

### Ruby 發明者的理想

Ruby 是一個注重均衡的語言. 它的發明者, [松本行弘 Yukihiro “matz” Matsumoto][1], 混合了他喜歡的語言
(如 Perl, Smalltalk, Eiffel, Ada, and Lisp) 產生了一個具有函數式與指令式程式設計語言特性的新語言。

他常說他是： “試著讓 Ruby 更為自然，而不是簡單”，就像生活一樣。

除此之外, 他還提到:

> Ruby 就像人的身體一樣，表面上看來簡單，但是內在卻是相當的複雜，\[1\].

### Ruby 的成長

自從在 1995 年公開發表以來, Ruby 在全球吸引了許多忠實的程式設計師. 在 2006 年, Ruby 被廣泛的接受.
在各大城市都有活躍的使用者社群並舉辦了許許多多場場爆滿的研討會.

![Graph courtesy of
Gmane.](http://gmane.org/plot-rate.php?group=gmane.comp.lang.ruby.general&amp;width=320&amp;height=160&amp;title=Ruby-Talk+Activity
"Graph courtesy of Gmane."){: style="padding-left:8px;"}
{: style="float:right"}

在主要的 [郵件論壇: Ruby-Talk](/en/community/mailing-lists/) 上，討論 Ruby
語言的文章爬升到每日 200 封.

在 [TIOBE 的最流行開發語言排名調查][2]中, Ruby 排名為全球第 11. 根據這樣的成長情況, 他們預測 “在半年之中 Ruby
將會進入最受歡迎的第 10 名.” 有越來越多受歡迎的軟體如 Ruby on Rails web
framework<sup>[2](#fn2)</sup> 是使用 Ruby 撰寫而成，也是造成了 Ruby 如此的成長因素.

同時，Ruby 是個[自由軟體]({{ site.license.url }}). 不只是免費，而且可以自由的使用, 修改與散佈.

### 所見即物件

最初，Matz 從其他語言中找尋理想的語法。 想起他做的研究，他說：”我想要一個比 Perl 更強大，比 Python 更物件導向的
scripting language \[3\]”.

在 Ruby 中，所有的東西都是個物件。所有的資訊與程式碼都可以給與他們所擁有的 屬性(properties) 與 行為(actions)
。物件導向程式設計中稱屬性為 *實體變數*(*instance variables*) 而行為稱為
*方法*(*methods*)。從下列程式碼中看到 Ruby 能夠給 “數字(number)” 賦予 “行為(actions)”
這特點來看，可以證明 Ruby 是個純物件導向的語言。

{% highlight ruby %}
5.times { print "We *love* Ruby -- it's outrageous!" }
{% endhighlight %}

在許多的語言中，數字與其他的原生資料型態(primitive types) 都不是物件。 而 Ruby 受到了 Smalltalk
語言讓所有的資料型態都可賦予方法與產生實體變數的影響。更進而讓這規則適用於 Ruby 中所有物件。

### Ruby 的彈性

Ruby 是個相當具有彈性的語言， 它可以讓使用者自由的去改變它的本身。 Ruby
的必要部份也可以隨意地被移除或重新定義。已存在的部份也可以被繼續添加內容。Ruby 試著不去限制程式設計人員。

舉例而言，我們使用 (`+`) 運算元來執行加法。但是如果你打算使用 `plus` 來取代，你可以加入以下的方法到 Ruby 的內建
`Numeric` 類別之中。

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y is now equal to 11
{% endhighlight %}

Ruby 的運算元其實就是個方法(method)\[4\]。你也可以重新定義運算元。

### 區塊(Blocks), 很有意思的功能

Ruby 的區塊可說是它強大彈性的來源。 程式設計師可以為任何的 method 加上 closure(閉包) , 來描述這個 method
該做什麼。此處的 closure 稱為 *block* 同時這也是從指令式程式設計語言如 PHP 或 Visual Basic 轉換到 Ruby
的新手最喜歡的功能。

Block 的靈感是由函數式程式設計語言而來。Matz 說到：”在 Ruby closures 之中, 我要向 Lisp culture
致敬\[5\].”

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

在上方的程式碼中，block 是在 `do ... end` 之間。其中 `map` method 提供一個字串陣列給 block。Ruby
中還有許多其他的 methods 提供了類似的方式可以讓程式設計師撰寫自己的 block 來完成此 method 該做的事。

### Ruby 與 Mixin

和其他許多的物件導向語言不同，Ruby 故意的只提供 單一繼承(single inheritance)。但是 Ruby 提供
模組(module) 的觀念(在 Objective-C 中稱為 Categories)。 Module 是許多 method 的集合。

類別(Class) 可以 混入(mixin) 模組並且可以自由的取用模組內的所有方法。舉例而也，所有要實作 `each` 方法的類別都可以 混入
`Enumerable` 模組進來，就可以使用 `each` 方法來達到執行迴圈的目的。

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

一般來說，Ruby 使用者使用這種方式會比使用複雜且有很多限制的多重繼承來得清楚。

### Ruby 的面貌

Ruby 常使用某些符號與英文關鍵字來輔助撰寫程式。Ruby 不需要事先宣告變數。它使用簡單的命名規則來說明變數的生命範圍。

* `var` 表示變數是個 區域變數(local variable).
* `@var` 表示變數是個 實體變數(instance variable).
* `$var` 表示變數是個 全域變數(global variable).

這些符號讓程式設計師可以輕易的定義每個變數的角色進而增加了程式的易讀性。另外 Ruby 也省略了累贅的 `self.`
方便直接來存取每個實體成員。

### 更上一層樓

Ruby 還具有以下的特點：

* Ruby 具有 例外處理(exception handling) 的能力。就如 Java 或 Python
  一樣，可以讓使用者輕鬆的處理錯誤狀況。
^

* Ruby 對於所有的物件具有一個真正的 標記-清除(mark and sweep) 式的垃圾收集器(garbage
  collector)。使用者不必去維護擴充函式庫中的 參考計數器(reference counts)。如 Matz說的：”這樣有益健康”。
^

* 在 Ruby 中撰寫 C 的擴充程式比在 Perl 或 Python 中方便，它擁有許多方便的 API 可以讓 C 呼叫
  Ruby。這樣可以將 Ruby 當成 script language 嵌入到其他軟體之中。它也具有 SWIG 的呼叫界面。
^

* 如果作業系統支援，Ruby 可以動態的載入擴充函式庫。
^

* Ruby 具有與作業系統無關的多緒(threading)能力。可以在所有可以執行 Ruby
  的平台上都能夠達到多緒的目標，而不必管作業系統是否支援，就算是 MS-DOS 也行。
^

* Ruby 具有高度的移植性：它大部份是在 GUN/Linux 上發展出來，但是可以執行於多種的作業系統如： UNIX, MAC OS
  X,Windows 95/98/Me/NT/2000/XP, DOS, BeOS, OS/2, 等等。

#### 參考資料

<sup>1</sup> Matz, 於 Ruby-Talk 郵件論壇上的發言, [May 12th, 2000][3].
{: #fn1}

<sup>2</sup> 請參考 [Ruby on Rails][4] 官方首頁有更多資料.
{: #fn2}

<sup>3</sup> Matz, in [An Interview with the Creator of Ruby][5], Nov.
29th, 2001.
{: #fn3}

<sup>4</sup> 原文直譯：運算元是方法的語法糖衣(syntactic sugar)，Ruby’s operators are
syntactic sugar for methods.
{: #fn4}

<sup>5</sup> Matz, in [Blocks and Closures in Ruby][6], December 22nd,
2003.
{: #fn5}



[1]: http://www.rubyist.net/~matz/
[2]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[3]: http://blade.nagaokaut.ac.jp/cgi-bin/scat.rb/ruby/ruby-talk/2773
[4]: http://rubyonrails.org/
[5]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[6]: http://www.artima.com/intv/closures2.html
