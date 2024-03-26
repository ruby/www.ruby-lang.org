---
layout: page
title: "關於 Ruby"
lang: zh_tw
---

想知道 Ruby 為何如此受歡迎嗎？為什麼 Ruby 的支持者會說 Ruby 是個美麗的程式語言，既靈巧方便又實用呢？

### Ruby 發明者的理想

Ruby 是一個注重均衡的語言。Ruby 語言的發明者，[松本行弘 Yukihiro “Matz” Matsumoto][matz]，混合了他喜歡的語言（如 Perl、Smalltalk、Eiffel、Ada、以及 Lisp）產生了一種嶄新的語言，同時具有函數式與指令式程式設計語言特性。

Matz 常說： “不斷嘗試讓 Ruby 更為自然，而不是簡單”，就像生活一樣。

除此之外，他還提到:

> Ruby 像人體一樣，外表看似簡單，卻有著複雜的內裡<sup>[1](#fn1)</sup>。

### Ruby 的成長

自從在 1995 年公開發表以來，Ruby 在全球吸引了許多忠誠的支持者。2006 年，Ruby 被廣泛的接受。各大城市都有活躍的使用者社群，並舉辦了許許多多場場爆滿的研討會。

2006 年，Ruby 主要的[郵件列表：Ruby-Talk](/en/community/mailing-lists/) 上，討論 Ruby 語言的文章爬升到每日 200 封。近幾年郵件列表討論下降了，因為各個社群有著自己的討論小組。

[TIOBE 的最流行開發語言排名調查][tiobe]中，Ruby 排名為全球第 13。根據這樣的成長情況，他們預測 “在半年之中 Ruby 將會進入最受歡迎的第 10 名.” 有越來越多受歡迎的軟體，如 [Ruby on Rails][ror] 網路框架 是使用 Ruby 撰寫而成，也是為什麼 Ruby 會成長的如此快。

同時，Ruby 是個[自由軟體]({{ site.license.url }})。不僅免費，同時可自由的使用、修改與散佈。

### 萬物即物件

最初，Matz 從其他語言中尋找理想的語法。他回憶起曾做過的研究，說：“我想要一個比 Perl 更強大、比 Python 更物件導向的的腳本語言<sup>[2](#fn2)</sup>”。

在 Ruby 裡，萬物皆物件。所有的資訊與程式碼，都給傳遞給物件擁有的屬性（properties）與行為（actions）。物件導向程式設計中稱屬性為**實體變數**（ *instance variables* ）而行為稱為**方法**（ *methods* ）。從下列程式碼中看到 Ruby 能夠給 “數字（number）” 賦予 “行為（actions）” 這特點來看，足以證明 Ruby 是個純物件導向的語言。

{% highlight ruby %}
5.times { print "We *love* Ruby -- it's outrageous!" }
{% endhighlight %}

許多的語言裡，數字與其他的原生資料型態（primitive types）都不是物件。 而 Ruby 受到了 Smalltalk 語言讓所有的資料型態都可賦予方法與產生實體變數的影響。更進而讓這規則適用於 Ruby 中所有物件。

### Ruby 的靈活性

Ruby 是個相當靈活的語言，可以讓使用者自由的去改變語言的各個部分。 Ruby
的本質部份也可以隨意地被移除或重新定義。現有的部份也可以繼續添加內容。Ruby 試著不去限制程式設計人員。

舉例而言，我們使用（`+`）運算元來執行加法。但是如果你打算使用 `plus` 來取代，你可以加入以下的方法到 Ruby 的內建
`Numeric` 類別之中。

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y 等於 11
{% endhighlight %}

Ruby 的運算元其實就是個方法（method）。你也可以重新定義運算元。

### 區塊（Blocks）非常驚艷的功能

Ruby 的區塊可說是強大靈活性的來源。 程式設計師可以為任何的方法加上閉包（closure），來描述這個方法該做什麼。此處的閉包稱為 *block* 同時這也是從指令式程式設計語言如 PHP 或 Visual Basic 轉換到 Ruby 的新手最喜歡的功能。

區塊的靈感是由函數式程式設計語言而來。Matz 說到：”在 Ruby 的閉包之中，我要向 Lisp 文化致敬<sup>[3](#fn3)</sup>”。

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

在上面的程式碼裡，區塊是在 `do ... end` 之間。其中 `map` 方法給區塊提供一個字串陣列。Ruby 中還有許多其他的方法，提供了類似的方式，讓程式設計師可以撰寫自己的區塊來完成此方法該做的事。

### Ruby 與 Mixin

和其他許多的物件導向語言不同，Ruby 故意的只提供單繼承（single inheritance）。但 Ruby 提供模組(module) 的觀念(在 Objective-C 中稱為 Categories)。 Module 是許多方法的集合。

類別（Class）可以混入（mixin）模組，並可自由的取用模組內的所有方法。舉例來講，所有要實作 `each` 方法的類別，都可以混入 `Enumerable` 模組進來，便可以使用 `each` 方法來達到執行迴圈的目的。

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

一般來說，Ruby 使用者使用這種方式，會比使用複雜且有很多限制的多重繼承來得清楚。

### Ruby 的外觀

Ruby 常使用某些符號與英文關鍵字來輔助撰寫程式。Ruby 不需要事先宣告變數。使用簡單的命名規則來說明變數的生命範圍。

* `var`  表示變數是個**區域變數（local variable）**。
* `@var` 表示變數是個**實體變數（instance variable）**。
* `$var` 表示變數是個**全域變數（global variable）**。

這些符號讓程式設計師可以輕易的定義每個變數的角色，進而增加了程式的可讀性。另外 Ruby 也省略了累贅的 `self.` ，方便直接來存取每個實體成員。

### 更上一層樓

Ruby 還具有以下的特點：

* Ruby 具有例外處理（exception handling）的能力。就如 Java 或 Python 一樣，可以讓使用者輕鬆的處理錯誤狀況。

* Ruby 對於所有的物件具有一個真正的標記-清除（mark and sweep）式的垃圾收集器（garbage collector）。使用者不必去維護擴充函式庫中的 參考計數器(reference counts)。如 Matz 說的：”這樣有益健康”。

* 在 Ruby 中撰寫 C 的擴充程式比在 Perl 或 Python 中方便，擁有許多方便的 API 可以讓 C 呼叫 Ruby。這樣可以將 Ruby 當成腳本語言，嵌入到其他軟體之中。它也具有 SWIG 的呼叫界面。

* 如果作業系統支援，Ruby 可以動態的載入擴充函式庫。

* Ruby 具有高度的移植性：它大部份是在 GNU/Linux 上發展出來，但是可以執行於多種的作業系統如： UNIX、macOS、Windows 等。

### 參考資料

<sup>1</sup> Matz 於 [2000 年 5 月 12 日][blade] Ruby-Talk 郵件論壇上的發言。
{: #fn1}

<sup>2</sup> [專訪 Ruby 語言發明者][linuxdevcenter]（2001 年 11 月 29 日）
{: #fn2}

<sup>3</sup> Matz 談 [Blocks and Closures in Ruby][artima] （2003 年 12 月 22 日）。
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
