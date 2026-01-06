---
layout: page
title: "從 PHP 到 Ruby"
lang: zh_tw
---

PHP 被廣泛的應用在網頁程式中，如果你想試試看 Ruby on Rails，或是你想要一個更加講究的多功能程式語言，Ruby 值得一看。

### 相似點

Ruby與PHP一樣的地方...

* Ruby是個動態型別的程式語言，你不用擔心宣告變數的問題。
* Ruby有類別，也有 `public`, `private`, 與 `protected` 方法，就像PHP 5一樣。
* 也有變數以$號開頭 (在Ruby中表示這是全域變數)
* 也有 `eval` 。
* 有字串「內嵌」。不過不是用
  `"$foo is a $bar"` ，而是`"#{foo} is a #{bar}"`—跟PHP一樣，用單引號包住的字串就不會作用。
* 也有Heredocs。
* Ruby也有例外處理，就像PHP 5一樣。
* Ruby也有非常廣泛的標準函式庫。
* 陣列和雜湊就和你期望的一樣，只要你把 `array()` 換成 `{` 和 `}` ： `array('a' => 'b')` 變成
  `{'a' => 'b'}`。
* `true` 和 `false` 和PHP一樣，但 `null` 變成了 `nil` 。

### 相異點

Ruby與PHP不同的地方...

* Ruby有強型別，你必須要使用 `to_s`, `to_i` 等方法來轉換型別。
* 字串、數值、陣列、雜湊...等等。他們全都是物件。所以該用`-1.abs`而不是`abs(-1)`。
* 呼叫方法時，可以省略括號。
* 標準函式庫和擴充套件都被包裝成模組和類別了。
* 反射(reflection)是 Ruby 物件與生俱來的能力，你不需要像在PHP 5中一樣使用 `Reflection` 類別。
* 變數都是參照(references)。
* 沒有抽象類別和介面。
* 雜湊和陣列不可互換使用。
* 只有 `false` and `nil` 是 false: `0`, `array()` and `""` 在條件判斷時皆為真。
* 幾乎所有東西都是方法呼叫，甚至是 `raise` (PHP的 `throw`).
