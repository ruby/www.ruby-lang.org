---
layout: news_post
title: "Ruby 2.7.0-preview2 發佈"
author: "naruse"
translator: Delton Ding
date: 2019-10-22 12:00:00 +0000
lang: zh_tw
---

我們很榮幸的宣布 Ruby 2.7.0-preview2 發布了。

為了計畫於十二月發布的最終版本，我們發布了預覽版本以收集回饋。他引入了許多新功能和性能提升，最值得注意的事：

* Compaction GC
* Pattern Matching
* REPL 改進
* 位置參數和關鍵字參數的分離

## Compaction GC

此版本引入了 Compaction GC，可以對零碎的記憶體空間進行整理。

某些多執行緒的 Ruby 程式可能會導致記憶體碎片化，進而導致記憶體使用率增高和速度降低。

引入了 `GC.compact` 方法來壓縮堆疊。此函數壓縮堆疊中的活動物件，以便可以使用更少的頁面，並且堆疊可能對於寫入時複製更友好。[Feature #15626](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [實驗性質]

在函數式編程語言中廣泛地被使用的 Pattern matching，作為實驗性的功能加入了。[Feature #14912](https://bugs.ruby-lang.org/issues/14912) 它可以遍歷給定的物件並在其比對成功時賦值。

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

更多詳細資訊，請參閱 [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)。

## REPL 改進

`irb`，綑綁交互環境 (REPL; Read-Eval-Print-Loop)，現已支持多行編輯，由 `reline`、`readline` 實現純 Ruby 的支援。它還提供 rdoc 集成。在 irb 中您可以為指定的類別、模組或方法的顯示引用。[Feature #14683](https://bugs.ruby-lang.org/issues/14683)、[Feature #14787](https://bugs.ruby-lang.org/issues/14787)、[Feature #14918](https://bugs.ruby-lang.org/issues/14918) 此外，`binding.irb` 中顯示的程式碼行和核心類別的檢查結果現在已經有著色了。

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## 位置參數和關鍵字參數的分離

關鍵字參數和位置參數的自動轉換被標記爲已廢棄（deprecated），自動轉換將會在 Ruby 3 中被移除。[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

* 當方法將 Hash 作爲最後一個參數傳入，或者傳入的參數沒有關鍵字的時候，会拋出警告。如果需要繼續將其視爲關鍵字參數，則需要加入兩個星號來避免警告並在 Ruby 3 在中行爲正常。

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* 當方法傳入 Hash 到一個接受關鍵字參數的方法中，但沒有傳入足夠的位置參數，關鍵字參數會被視爲最後一個位置參數，並拋出一個警告。請將參數包裝爲 Hash 物件來避免警告，並在 Ruby 3 在中行爲正常。

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* 當方法接受關鍵字參數傳入，但不會進行關鍵字分割（splat），且傳入同時含有 Symbol 和非 Symbol 的 key，那麼 Hash 會被分割，但是會拋出警告。你需要傳入兩個分開的 Hash 來確保 Ruby 3 中行爲正常。

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* 當一個方法不接受關鍵字參數，但傳入了關鍵字參數，關鍵字會被視爲位置參數，不會有警告拋出。這一行爲會在 Ruby 3 中繼續工作。

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* 如果方法支援任意參數傳入，那麼非 Symbol 也會被允許作爲關鍵字參數傳入。[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* <code>**nil</code> 被允許使用在方法的定義中，用來標記不接受關鍵字參數。以關鍵詞參數來使用這些方法會拋出 ArgumentError [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* 將空的關鍵字分割（splat）傳入一個不接受關鍵字參數的方法不會繼續被當作空雜湊處理，除非空雜湊被作爲一個必要參數，並且這種情況會拋出警告。請移除雙星號将雜湊作爲位置參數傳入。[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

## 其他值得注意的新特點

* 方法引用運算符，<code>.:</code>，作為實驗性的功能加入了。[Feature #12125]( https://bugs.ruby-lang.org/issues/12125)、[Feature #13581]( https://bugs.ruby-lang.org/issues/13581)

* 默認為區塊參數的編號參數作為實驗性的功能加入了。[#4475](https://bugs.ruby-lang.org/issues/4475)

* 無始範圍試驗性的加入了。他可能沒有無盡範圍那麼有用，但他以 DSL 為目的來說是好的。[Feature #14799](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* 新增了 `Enumerable#tally`，它將會計算每個元素出現的次數。

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* 允許在 `self` 上調用私有方法 [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297) [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* 新增 `Enumerator::Lazy#eager`。它會產生一個非懶惰的 Enumerator。[[功能 #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## 效能改進

* JIT [實驗性質]

  * 當最佳化假設不成功時，JIT 後的程式碼將會重新編譯為成最佳化程度較低的程式碼。

  * 當方法（Method）被認為是純粹（pure）時，執行方法內聯。這種最佳化的方法仍然是實驗性質，許多方法都不被認為是純粹的。

  * `--jit-min-calls` 的預設值從 5 調整至 10,000。

  * `--jit-max-cache` 的預設值從 1,000 調整至 100。

* Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` 和 `nil.to_s` 現在始終返回一個凍結（frozen）字串。返回的字串始終和給定的物件相等。 [實驗性質]  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* `CGI.escapeHTML` 的效能得到了提升。[GH-2226](https://github.com/ruby/ruby/pull/2226)

## 其他從 2.6 版本以來顯著的變化

* 一些函式庫被更新
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * 一些沒有原始版本的函式庫也得到了更新

* 現在 `Proc.new` 和 `proc` 沒有 block 時，在有區塊的方法調用時會產生警告。

* `lambda` 在方法調用時如果沒有 block 時會產生區塊錯誤。

* Unicode 和 Emoji 版本從 11.0.0 更新至 12.0.0。[[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* 更新 Unicode 至 12.1.0 版本，新增對於新年號令和 U+32FF 的支援。[[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`、`Date#jisx0301` 和 `Date.parse` 暫時支持新的日本年號作為非正式的擴充功能，直到新的 JIS X 0301 發佈。[[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* 編譯器需必需支援 C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * 關於我們語言的詳細資訊：<https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

請參考[新聞](https://github.com/ruby/ruby/blob/v2_7_0_preview2/NEWS)或[提交紀錄](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2)來進一步了解。

伴隨著這些變動，自 Ruby 2.6.0 以來，共有 [3670 個檔案變更，201242 行增加（+），88066 行刪減（-）](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2)！

享受使用 Ruby 2.7 編程吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## Ruby 是什麼

Ruby 最初由 Matz（Yukihiro Matsumoto）於 1993 年開發出來，現在作為開源軟體開發。它可在多個平台上運行，並在世界各地使用，尤其適用於網站開發。
