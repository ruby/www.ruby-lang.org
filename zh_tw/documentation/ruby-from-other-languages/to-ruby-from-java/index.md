---
layout: page
title: "從 Java 到 Ruby"
lang: zh_tw
---

Java 是個成熟，通過考驗，而且執行速度快(與反對者所指恰恰相反)的程式語言，它也滿囉嗦的。
由Java到Ruby，程式的篇幅可望縮短不少，也可以預期花較少的時間就能拼出系統雛形。

### 相似點

Ruby與Java一樣的地方，...

* 記憶體透過垃圾回收(Garbage Collection)機制管理。
* 物件為強型別(Strongly typed)。
* 有 public, private, 與 protected 方法。
* 也有將原始碼轉成文件的工具(Ruby的叫做RDoc)，文件以 rdoc 產生的樣子與 javadoc 類似。

### 相異點

Ruby與Java不同的地方，...

* 不用編譯程式，直接跑它就行了。
* 有不同的圖形介面(GUI)工具組，例如可以試試 [WxRuby][1] ， [FXRuby][2] ， [Ruby-GNOME2][3]
  ， [Qt][4] ， 或已經包在Ruby裡的Tk。
* 以 `end` 這個關鍵字作為定義類別(class)等的結尾，不必用大括號包著程式區塊。
* 用 `require` 而不是 `import` 。
* 物件的所有成員變數皆為 private，外界需透過方法(method)來存取。
* 呼叫方法時，可以省略括號。
* 所有東西都是物件，包括像 2 與 3.14159 這些數字。
* 沒有靜態的型別檢查。
* 變數名稱只是標記，不與型別關聯。
* 不用宣告型別。只要依需要指定給一個新的變數，事情就“發生”了 (所以不用 `int[] a = {1,2,3};` ，僅需 `a =
  [1,2,3]` )。
* 直接呼叫方法，不用轉型。在執行程式前，你的單元測試應該能告訴你是否會有例外(exception)。
* 寫 `foo = Foo.new("hi")` ，而非 `Foo foo = new Foo("hi");` 。
* 建構式的名稱固定為“initialize”，而非與類別同名。
* 運用 “mixin” 而非介面(interface)。
* 傾向使用<abbr title="YAML Ain’t Markup Language">YAML</abbr>多於XML。
* 是 `nil` ，不是 `null` 。
* Ruby處理 `==` 及 `equals()` 的方式迥異。要看是否等值，使用 `==` (Java用 `equals()`
  )。要知道是否為同一物件，則使用 `equal?()` (Java用 `==` )。



[1]: https://github.com/eumario/wxruby
[2]: https://github.com/larskanis/fxruby
[3]: https://ruby-gnome2.osdn.jp/
[4]: https://github.com/ryanmelt/qtbindings/
