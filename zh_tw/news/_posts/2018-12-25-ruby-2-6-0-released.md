---
layout: news_post
title: "Ruby 2.6.0 發佈"
author: "naruse"
translator: Vincent Lin
date: 2018-12-25 00:00:00 +0000
lang: zh_tw
---

我們高興地宣佈 Ruby 2.6.0 已發佈。

Ruby 2.6.0 引入了許多新功能以及效能提升，其中最值得注目的是：

 * 全新的 JIT 編譯器
 * `RubyVM::AbstractSyntaxTree` 模組

## JIT [ 實驗性質 ]

Ruby 2.6 引入了 JIT（Just-in-time）編譯器初始實作。

JIT 編譯器專注於提升任何 Ruby 程式的執行速度。不同於其他語言的 JIT 編譯器，Ruby 的 JIT 使用一種獨特的編譯方式，將 C 程式碼寫入到硬碟中，再使用一般的 C 編譯器來生成原生程式碼（native code）。詳見 [Vladmir Makarov 的 MJIT 組織](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)

想要使用 JIT 編譯器的話，只需在命令列或是 `$RUBYOPT` 的環境變數中指定 `--jit` 即可。指定 `--jit-verbose=1` 可將印出正在編譯中的 JIT 訊息。更多選項請參考 `ruby --help` 的輸出或是[文件](https://bugs.ruby-lang.org/projects/ruby/wiki/MJIT#Basic-usage)。

JIT 編譯器僅在透過 GCC、Clang、或是 Microsoft VC++ 建構 Ruby 以及編譯器可運行時進行支援。

相較於 Ruby 2.5，Ruby 2.6 在 CPU 密集場景的複雜性能測試 [Optcarrot](https://github.com/mame/optcarrot) 中，取得了 [1.7 倍的效能提升](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208)。然而，由於仍在實驗性質，許多記憶體密集場景，例如 Rails 應用等在此刻可能無法從中受益。更多詳細消息請參閱 [Ruby 2.6 JIT - Progress and Future](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf)。

請持續關注 Ruby 效能的全新時代。

## `RubyVM::AbstractSyntaxTree` [ 實驗性質 ]

Ruby 2.6 引入了 `RubyVM::AbstractSyntaxTree` 模組。 **無法保證此模組的未來相容性**

此模組擁有 `parse` 方法，解析給予的 Ruby 程式碼字串並回傳抽象語法樹 AST（Abstract Syntax Tree）節點，以及解析給予 Ruby 程式碼檔案並回傳 AST 節點的 `parse_file` 方法。

同樣也引入了 `RubyVM::AbstractSyntaxTree::Node` 類別，您可以從 `Node` 物件中獲取位置訊息和子節點，此功能為實驗性質。

## 其他注目的新功能

* 新增一個別名 `then` 到 `Kernel#yield_self` 中。[[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* 常數名稱可以非 ASCII 大寫字母開頭。[[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* 無盡範圍 [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  引入了無盡範圍 `(1..)`，如同無止盡般的運作，下面列出幾個典型的例子：

      ary[1..]                          # 與 ary[1..-1] 完全相同，少了神奇的 -1
      (1..).each {|index| ... }         # 從 index 1 開始無限循環
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* 新增 `Enumerable#chain` 和 `Enumerator#+`。[[Feature #15144]](https://bugs.ruby-lang.org/issues/15144)

* 為 `Proc` 和 `Method` 新增函式組合運算子 `<<` 和 `>>`。[[Feature #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; 與 f(g(3)) 相同
      (f >> g).call(3) # -> 15; 與 g(f(3)) 相同

* 新增 `Binding#source_location`。[[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)

  此方法回傳 binding 的原始碼路徑，為一個兩個元素的陣列 `__FILE__` 和 `__LINE__`。照理來說，`eval("[__FILE__, __LINE__]", binding)` 可以獲取相同的訊息，但我們打算改變這種情況以便 `Kernel#eval` 忽略 binding 的原始碼路徑 [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352)。因此，我們建議應使用 `Binding#source_location` 來取代 `Kernel#eval`。

* 新增 `exception:` 選項讓 `Kernel.#system` 在錯誤時引發例外處理而非回傳 `false`。[[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* 為 `Coverage` 新增 oneshot 模式。[[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)

  * 此模式會檢查「每一行原始碼至少被執行一次」，而不是「每行原始碼被執行了幾次」。每行原始碼的 hook 至多被調用一次，並會在調用後將 hook 移除。換句話說，移除後的程式運行時不會有額外的效能負擔。
  * 為 `Coverage.start` 方法新增 `:oneshot_lines` 參數。
  * 為 `Coverage.result` 方法新增 `:stop` 和 `:clear` 參數。若 `clear` 設爲 true，它會重置計數器。若 `stop` 設爲 true。它會禁用覆蓋測量。
  * 新增 `Coverage.line_stub`，其爲原始碼新建行數覆蓋存根（stub）提供了一個簡單的幫助函式。

* 新增 `FileUtils#cp_lr`。如同 `cp_r` 運作，但使用連結取代複製。[[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## 效能提升

* 提升 `Proc#call` 的速度，因為我們不需要再顧慮 `$SAFE` 了。[[Feature #14318]](https://bugs.ruby-lang.org/issues/14318)

  透過 `lc_fizzbuzz` 大量使用 `Proc#call` 的測試，我們測得了 1.4 倍效能提升。[[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* 提升了當 `block` 為 block 參數時 `block.call` 的效能。[[Feature #14330]](https://bugs.ruby-lang.org/issues/14330)

  結合了 Ruby 2.5 引入的 block 傳遞效能進步成果，現在 Ruby 2.6 更進一步提升傳遞 block 的呼叫效能，讓我們在 micro-benchmark 中，測得了 2.6 倍的效能提升。[[Feature #14045]](https://bugs.ruby-lang.org/issues/14045)

* 引入了瞬態堆積（`theap`）。[[Bug #14858]](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]](https://bugs.ruby-lang.org/issues/14989)

  `theap` 是用來管理短生命週期的指向特定類別（`Array`、`Hash`、`Object` 和 `Struct`）指標的堆積。舉例來說，新建小而短生命週期的 Hash 物件的效能提升了 2x。藉由 rdoc benchmark，我們測得了 6%-7% 的效能提升。

* 協程（coroutines）的原生實作 (`arm32`, `arm64`, `ppc64le`, `win32`, `win64`, `x86`, `amd64`) 顯著提升 Fiber 的上下文交換效能。[[Feature #14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield` 與 `Fiber#resume` 在 64 位元的 Linux 上提升了五倍的效能。對於密集使用 Fiber 的應用程序會有最高 5% 的性能提升。

## 自 2.5 起重要的變化

* `$SAFE` 成為了 Process 全域狀態，我們可以再次將其設為 `0`。[[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* 不再建議將 `safe_level` 參數傳遞給 `ERB.new` 的行為。`trim_mode` 和 `eoutvar` 參數被轉換成關鍵字參數。[[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* 將支援的 Unicode 版本升級至 11。我們計劃在 2.6 的小版本更新中升至 12 和 12.1 版本，包含對於[新日本年號](http://blog.unicode.org/2018/09/new-japanese-era.html)的支援。

* 合併 RubyGems 3.0.1。`--ri` 和 `--rdoc` 選項已被移除。請改用 `--document` 和 `--no-document` 選項。

* [Bundler](https://github.com/bundler/bundler) 現已作爲預設的 gems。

* 在例外處理區塊中，不含 `rescue` 的 `else` 將會引起語法錯誤。[實驗性質][[Feature #14606]](https://bugs.ruby-lang.org/issues/14606)

請參考[新聞](https://github.com/ruby/ruby/blob/v2_6_0/NEWS)或[提交紀錄](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)來進一步了解。

自 Ruby 2.5.0 以來，共計有 [6437 個文件變更，231471 行增加 (+)，98498 行刪減 (-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)！

聖誕快樂，佳節愉快，並且和 Ruby 2.6 一起享受編程吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
