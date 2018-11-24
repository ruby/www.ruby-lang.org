---
layout: news_post
title: "Ruby 2.6.0-preview2 發布"
author: "naruse"
translator: "Vincent Lin"
date: 2018-05-31 00:00:00 +0000
lang: zh_tw
---

我們很榮幸的宣布 Ruby 2.6.0-preview2 發布了。

Ruby 2.6.0-preview2 是 Ruby 2.6.0 第二個預覽版。
此次的 preview2 發布的平常還要早一些，因為它包含了一個重要新功能，JIT。

## JIT

Ruby 2.6 引入了 JIT（Just-in-time）編譯器初始實作。

JIT 編譯器專注於提升任何 Ruby 程式的執行速度。不同於其他語言的 JIT 編譯器，Ruby 的 JIT 使用一種獨特的編譯方式，將 C 程式碼寫入到硬碟中，再使用一般的 C 編譯器來生成原生程式碼（native code）。詳見：https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization

如何使用：只需在命令列或是 $RUBYOPT 的環境變數中指定 "--jit" 即可。
指定 "--jit-verbose=1" 可將印出正在編譯中的 JIT 訊息。更多選項請參考 "ruby --help"。

此次 JIT 預覽版發布的主要目為提供使用者檢查是否適用於您的平台，並且在 2.6 正式版本發布前找出安全性風險。
現行的 JIT 編譯器僅在透過 gcc 或是 clang 建構 Ruby 以及編譯器可運行時進行支援，除此之外你無法使用它。

在 2.6.0-preview2 中，我們僅準備基本的 JIT 架構和完成少許的最佳化。
您可以透過此次的發布評估未來潛在的效能提升，但 Ruby 的 JIT 編譯器尚未準備好最終的性能測試，特別是運用在像 Rails 這樣的大型應用程序上。

我們將會在 JIT 編譯器中實現 iniling 方法，預期將會把 Ruby 的效能提升一個量級。
另外，我們還會增加支援的平台，下一個計畫支援的是 Visual Studio。

請持續關注 Ruby 效能的全新時代。

## RubyVM::AST [實驗性質]

Ruby 2.6 引入了 `RubyVM::AST` 模組。

此模組擁有 `parse` 方法，解析給予的 Ruby 程式碼字串並回傳抽象語法樹 AST（Abstract Syntax Tree）節點，以及解析給予 Ruby 程式碼檔案並回傳 AST 節點的 `parse_file` 方法。

同樣也引入了 `RubyVM::AST::Node` 類別，您可以從 `Node` 物件中獲取位置訊息和子結點，此功能為實驗性質，無法保證 AST 節點結構的兼容性。

## 新功能

* 新增一個別名 `then` 到 `Kernel#yield_self` 中。[Feature #14594]

* 現在 `else` 沒有 `rescue` 的話會導致語法錯誤。[ 實驗性質 ]

* 常數名稱可以非 ASCII 大寫字母開頭。[Feature #13770]

* 無盡範圍 [Feature#12912]

  引入了無盡範圍 `(1..)`，如同無止盡般的運作，下面列出幾個典型的例子：

      ary[1..]                          # 與 ary[1..-1] 完全相同，少了神奇的 -1
      (1..).each {|index| ... }         # 從 index 1 開始無限循環
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* 新增 Binding#source_location. [Feature #14230]
  * 此方法回傳 binding 的原始碼路徑，為一個兩個元素的陣列 `__FILE__` 和 `__LINE__`。照理來說，`eval("[__FILE__, __LINE__]", binding)` 可以獲取相同的訊息，但我們打算改變這種情況以便 `Kernel#eval` 忽略 binding 的原始碼路徑 [Bug #4352]。因此，使用者應使用這個新引入的方法來取代 `Kernel#eval`。

* 新增 :exception 選項讓 Kernel.#system 引發錯誤而非回傳 false。[Feature #14386]

## 效能提升

* 提升 `Proc#call`的速度，因為我們不需要再顧慮 `$SAFE` 了。[Feature #14318]
  透過 `lc_fizzbuzz` 大量使用 `Proc#call` 的測試，我們測得了 1.4 倍效能提升。[Bug #10212]

* 提升了當 `block` 為 block 參數時 `block.call` 的效能。[Feature #14330]
  Ruby 2.5 提升了 block 傳遞效能。[Feature #14045]
  另外，Ruby 2.6 提升了 block 傳遞的呼叫效能。藉由 micro-benchmark 我們測得了 2.6 倍的提升。

## 自 2.5 起重要的變化

* $SAFE 成為了 Process 全域狀態，我們可以再次將其設為 0。[Feature #14250]

* 不再建議將 safe_level 參數傳遞給 ERB.new 的行為。trim_mode 和 eoutvar 參數被轉換成關鍵字參數。[Feature #14256]

* 合併 RubyGems 3.0.0.beta1。

請參考 [新聞](https://github.com/ruby/ruby/blob/v2_6_0_preview2/NEWS)
或 [提交紀錄](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
來進一步了解。

自 Ruby 2.5.0 以來，共計有
[4699 個文件變更，45744 行增加(+)，30885 行刪減(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)
！

與 Ruby 2.6.0-preview2 一起享受編程吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.gz>

      SIZE:   16170732 bytes
      SHA1:   6867b00e81af0b70fcb6f1aa7fc22d89d48a7d12
      SHA256: ee15ab35f17c942b1f41bd792f2494f639affff6e03babf44708b72fdbb6de34
      SHA512: 95c5a277785dfeb3006503e1b9ccccefdf6ce29669d4576f0191ee6986ba0e3567fbbed18a8d2b1f147d637434e4a3a4fdf47d84995e10ad4a354950e9092690

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.zip>

      SIZE:   19850776 bytes
      SHA1:   eba80a09b552ce3142fd571ff5867a13736d170e
      SHA256: 97fc187b90570fce110d22803a319ab04e68700692b2b6b4e9961886f1a931e5
      SHA512: d5501819635bda64ac3dc717815652b692302b44a7cdf4c08edfa5cb9ec7f79a70fffc534879b316a4a9584825ed3c0948667beae2d7c313de58583931b981f4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.bz2>

      SIZE:   14209461 bytes
      SHA1:   a9b1b4f359601b94b3f5b77115fcbf3790ff69cd
      SHA256: d8ede03d5ad3abd9d2c81cf0ad17a41d22b747c003cc16fd59befb2aaf48f0b2
      SHA512: 3872227e9b1c97c206d19bf1e6ce15a38ee15a26c431b4436605dea67affcf16372358984df76b35e7abaa902c15c16f533ac7af47e3031dea9451bbe459b693

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.xz>

      SIZE:   11525372 bytes
      SHA1:   e795abe1a4f828b3d851f7148b4bf6c9d9a7e7fd
      SHA256: 00ddfb5e33dee24469dd0b203597f7ecee66522ebb496f620f5815372ea2d3ec
      SHA512: bef3e90e97d6e58889cd500c591c579b728ca5833022b690182c0bf4d661e437b3a2ca33470dac35fcf693897819b9d7f500c0f71b707e2fcdcb0644028f2c03
