---
layout: news_post
title: "Ruby 2.7.0 已發布"
author: "naruse"
translator: "Juanito Fatas"
date: 2019-12-25 00:00:00 +0000
lang: zh_tw
---

我們很高興宣佈 2.7.0 發佈了。

本版帶有許多新功能及效能提升，主要有：

* 模式匹配
* REPL 改進
* GC 壓縮
* 分離依序參數和關鍵字參數

## 模式匹配 [實驗性質]

引入了實驗性質、在函數式程式語言廣泛使用的功能，模式匹配。見
[[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)。

模式匹配可以遍歷傳入的物件，如果找到匹配的模式就賦值給指定的變數。

```ruby
require "json"

json = <<END
{
  "name": "Alice",
  "age": 30,
  "children": [{ "name": "Bob", "age": 2 }]
}
END

case JSON.parse(json, symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age #=> 2
end
```

進一步了解請參考 [Ruby 2.7 的新功能：模式匹配](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)。

## REPL 改進

`irb`，內建的互動環境（REPL Read-Eval-Print-Loop），透過純 Ruby 所實現的 `relin` 和與 `readline` 相容的函式庫現支持多行編輯。`irb` 整合了 rdoc，可以顯示任何一個類別、模組、方法之間的引用關係。
[[Feature #14683]](https://bugs.ruby-lang.org/issues/14683)、
[[Feature #14787]](https://bugs.ruby-lang.org/issues/14787)、
[[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)。

除此之外，`Binding#irb` 所顯示的原始碼行號與查詢結果現在以彩色顯示。

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259" poster="https://cache.ruby-lang.org/pub/media/irb-reline-screenshot.png">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take3.mp4" type="video/mp4">
</video>

## Compaction GC

本版引入了 Compaction GC，可以整理零碎的記憶體空間。

由某些多線程的 Ruby 程式所引起的零碎記憶體空間，導致記憶體用量大增及速度變慢。

新增了 `GC.compact` 方法用來壓縮堆疊（heap）。這個方法壓縮了堆疊上正在使用的物件，進而使用更少的記憶體分頁，使堆疊對寫入式複製（CoW, copy-on-write）更加友好。
[[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## 分離依序參數和關鍵字參數

依序參數與關鍵字參數之間的自動轉換已經棄用，將在 Ruby 3 正式移除。
[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

詳見文章「[Separation of positional and keyword arguments in Ruby 3.0](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)」。

以下是改動的內容：

* 當一個接受參數的方法，呼叫時傳入的最後一個參數為 Hash，但沒有傳入所須的關鍵字參數，則會出現警告訊息。 要繼續將 Hash 作為關鍵字使用的話，請使用 double splat 運算子來確保程式可在 Ruby 3 正在作動並避免警告訊息。

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* 當接受關鍵字參數的方法傳入關鍵字，但沒有傳入足夠的依序參數時，關鍵字會被視作最後一個依序參數並出現警告訊息。請用 Hash 傳入參數而不是關鍵字確保程式可在 Ruby 3 正在作動並避免警告訊息。

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* 當方法接受特定關鍵字，但不接受 keyword splat，傳入一個有符號及非符號為鍵的 Hash 或 keyword splat 時，Hash 仍會被分解並報一個警告訊息。請分別傳入 Hash 以確保程式可在 Ruby 3 正常作動。

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* 若方法不接受關鍵字但呼叫時傳入關鍵字，則關鍵字會被依序視為 Hash 且不會出警告訊息。此行為在 Ruby 3 會繼續作動。

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* 方法接受任意關鍵字時，可以使用非符號作為關鍵字。
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* 可以用 `**nil` 將方法標記為不接受任何關鍵字。用關鍵字呼叫這樣的方法會報一個 ArgumentError 錯誤。
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* 給一個不接受關鍵字的方法傳入空的 keyword splat 時，參數不再視為空 Hsah。當空 Hash 是一個必要的參數時，則會報一個警告訊息。請移除 double splat 來繼續傳入一個依序的 Hash。
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

如想不要顯示警告訊息，請使用命令行選項 `-W:no-deprecated`，或是添加 `Warning[:deprecated] = false` 這行程式碼。

## 其他新功能

* 引入了基於數字的區塊參數。
  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* 引入了實驗性質的無起始範圍，可能不像無終止範圍實用，但在實作 DSL 的場景很有用。
  [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* 新增 `Enumerable#tally`，可以算出元素出現的次數

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* 現在可從 `self` 呼叫私有方法
  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297)、
  [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* 新增 `Enumerator::Lazy#eager`。從惰性求值的迭代器上產生一般的迭代器。
  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## 效能改進

* JIT [實驗性質]

  * 當優化條件不成立時，經 JIT 編譯的程式碼將會重編成優化程度較低的程式碼。

  * 方法若為純方法，則進行內聯優化。這個優化是實驗性質的，目前許多方法均不是純方法。

  * `--jit-min-calls` 的預設值從 5 改為 10,000。

  * `--jit-max-cache` 的預設值從 1,000 改為 100。

* 改變了 Fiber 的快取策略並提昇了建立 Fiber 的速度
  [GH-2224](https://github.com/ruby/ruby/pull/2224)

* `Module#name`、`true.to_s`、`false.to_s` 以及
  `nil.to_s` 現在永遠回傳已經凍結的字串。同一個物件會永遠回傳相同的字串。
  [實驗性質]
  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* 改善了 `CGI.escapeHTML` 的效能
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* 改善了 Monitor 與 MonitorMixin 的效能
  [[Feature #16255]](https://bugs.ruby-lang.org/issues/16255)

* 改善了（自 Ruby 1.9 以來的）Per-call-site 的方法快取命中率，從 89% 提昇至 94%。
  見 [GH-2583](https://github.com/ruby/ruby/pull/2583)

* `RubyVM::InstructionSequence#to_binary` 方法會產生執行檔，減少了執行檔的大小。 [Feature #16163]

## 其他自 2.6 以來的變更

* 更新了某些標準函式庫
  * Bundler 2.1.2
    ([發布記](https://github.com/bundler/bundler/releases/tag/v2.1.2))
  * RubyGems 3.1.2
    * ([3.1.0 的發布記](https://github.com/rubygems/rubygems/releases/tag/v3.1.0))
    * ([3.1.1 的發布記](https://github.com/rubygems/rubygems/releases/tag/v3.1.1))
    * ([3.1.2 的發布記](https://github.com/rubygems/rubygems/releases/tag/v3.1.2))
  * Racc 1.4.15
  * CSV 3.1.2
    ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * REXML 3.2.3
    ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * 也更新了一些沒有版本號的函式庫

* 以下函式庫不再內建，請安裝對應的 Gem 再使用。
  * CMath (cmath gem)
  * Scanf (scanf gem)
  * Shell (shell gem)
  * Synchronizer (sync gem)
  * ThreadsWait (thwait gem)
  * E2MM (e2mmap gem)

* `profile.rb` 從標準函式庫移除了。

* 將以下的函式庫納入標準函式庫
  * 同時發佈在 rubygems.org
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * 只是納入了 ruby-core 但未發佈在 rubygems.org
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* 對沒有區塊的 `Proc.new` 和 `proc` 方法，用區塊呼叫會報一個警告訊息。

* 對沒有區塊的 `lambda` 的方法，用區塊呼叫則會拋一個異常。

* 更新 Unicode version and Emoji version 從 11.0.0 至 12.0.0。
  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* 更新 Unicode version 至 12.1.0，支援方塊版的令和新年號（U+32FF）。
  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`、`Date#jisx0301`、`Date.parse` 現可以解析日本新年號
  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* 需使用支援 C99 的編譯器
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * 詳見我們所使用的方言
    <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

了解更多請參考[新聞](https://github.com/ruby/ruby/blob/v2_7_0/NEWS)
或[提交紀錄](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0)。

{% assign release = site.data.releases | where: "version", "2.7.0" | first %}

以上自 2.6.0 以來，計 [{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增(+)，{{ release.stats.deletions }} 行刪減(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0)！

耶誕快樂、佳節愉快，享受與 Ruby 2.7 一起寫程式的時光！

## 下載

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby 是

Ruby 最早由 Matz（松本行弘）於 1993 年開發，現在開發由開源社群所維護。Ruby 可以在多個平台上運行，廣受世人喜愛用於開發網路應用。
