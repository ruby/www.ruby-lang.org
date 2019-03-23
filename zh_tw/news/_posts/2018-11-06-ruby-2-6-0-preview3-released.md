---
layout: news_post
title: "Ruby 2.6.0-preview3 已發佈"
author: "naruse"
translator: "Delton Ding"
date: 2018-11-06 00:00:00 +0000
lang: zh_tw
---

我們很榮幸的宣布 Ruby 2.6.0-preview3 發布了。

Ruby 2.6.0-preview3 是 Ruby 2.6.0 第三個預覽版。此次 preview3 的發佈意在發佈候選版前測試新特性。

## JIT

Ruby 2.6 引入了 JIT（Just-in-time）編譯器初始實作。

JIT 編譯器專注於提升任何 Ruby 程式的執行速度。不同於其他語言的 JIT 編譯器，Ruby 的 JIT 使用一種獨特的編譯方式，將 C 程式碼寫入到硬碟中，再使用一般的 C 編譯器來生成原生程式碼（native code）。詳見 [Vladmir Makarov 的 MJIT 組織](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)

如何使用：只需在命令列或是 $RUBYOPT 的環境變數中指定 "--jit" 即可。指定 "--jit-verbose=1" 可將印出正在編譯中的 JIT 訊息。更多選項請參考 "ruby --help"。

此次 JIT 預覽版發布的主要目為提供使用者檢查是否適用於您的平台，並且在 2.6 正式版本發布前找出安全性風險。現行的 JIT 編譯器僅在透過 gcc clang 或 Microsoft VC++ 建構 Ruby 以及編譯器可運行時進行支援，除此之外你無法使用它。

在 2.6.0-preview3 中，我們相比 Ruby 2.5 在 CPU 密集場景的性能測試 Optcarrot<https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208> 中，取得了 1.7 倍的效能提升。我們正着手優化記憶體密集場景例如 Rails 應用中的執行效能。

請持續關注 Ruby 效能的全新時代。

## RubyVM::AST [ 實驗性質 ]

Ruby 2.6 引入了 `RubyVM::AST` 模組。

此模組擁有 `parse` 方法，解析給予的 Ruby 程式碼字串並回傳抽象語法樹 AST（Abstract Syntax Tree）節點，以及解析給予 Ruby 程式碼檔案並回傳 AST 節點的 `parse_file` 方法。

同樣也引入了 `RubyVM::AST::Node` 類別，您可以從 `Node` 物件中獲取位置訊息和子結點，此功能為實驗性質，無法保證 AST 節點結構的兼容性。

## 新功能

* 新增一個別名 `then` 到 `Kernel#yield_self` 中。[[Feature #14594]](https://bugs.ruby-lang.org/issues/14594)

* 現在 `else` 沒有 `rescue` 的話會導致語法錯誤。[ 實驗性質 ]

* 常數名稱可以非 ASCII 大寫字母開頭。[[Feature #13770]](https://bugs.ruby-lang.org/issues/13770)

* 無盡範圍 [[Feature #12912]](https://bugs.ruby-lang.org/issues/12912)

  引入了無盡範圍 `(1..)`，如同無止盡般的運作，下面列出幾個典型的例子：

      ary[1..]                          # 與 ary[1..-1] 完全相同，少了神奇的 -1
      (1..).each {|index| ... }         # 從 index 1 開始無限循環
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* 新增 Binding#source_location. [[Feature #14230]](https://bugs.ruby-lang.org/issues/14230)
  * 此方法回傳 binding 的原始碼路徑，為一個兩個元素的陣列 `__FILE__` 和 `__LINE__`。照理來說，`eval("[__FILE__, __LINE__]", binding)` 可以獲取相同的訊息，但我們打算改變這種情況以便 `Kernel#eval` 忽略 binding 的原始碼路徑 [[Bug #4352]](https://bugs.ruby-lang.org/issues/4352)。因此，使用者應使用這個新引入的方法來取代 `Kernel#eval`。

* 新增 :exception 選項讓 Kernel.#system 引發錯誤而非回傳 false。[[Feature #14386]](https://bugs.ruby-lang.org/issues/14386)

* 新增 oneshot 模式 [[Feature#15022]](https://bugs.ruby-lang.org/issues/15022)
  * 此模式會檢查「每一行原始碼至少被執行一次」，而不是「每行原始碼被執行了幾次」。每行原始碼的 hook 至多被調用一次，並會在調用後將 hook 移除。換句話說，移除後的程式運行時不會有額外的效能開銷。
  * 爲 `Coverage.start` 方法新增 `:oneshot_lines` 參數。
  * 爲 `Coverage.result` 方法新增 `:stop` 和 `:clear` 參數。若 `clear` 設爲 true，它會清空計數器。若 `stop` 設爲 true。它會禁用覆蓋測量。
  * 新增 Coverage.line_stub，其爲原始碼新建覆蓋存根（stub）提供了一個簡單的幫助函式。

* `FileUtils#cp_lr`.  [[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## 效能提升

* 提升 `Proc#call`的速度，因為我們不需要再顧慮 `$SAFE` 了。[[Feature #14318]](https://bugs.ruby-lang.org/issues/14318) 透過 `lc_fizzbuzz` 大量使用 `Proc#call` 的測試，我們測得了 1.4 倍效能提升。[[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* 提升了當 `block` 為 block 參數時 `block.call` 的效能。[[Feature #14330]](https://bugs.ruby-lang.org/issues/14330) Ruby 2.5 提升了 block 傳遞效能。[[Feature #14045]](https://bugs.ruby-lang.org/issues/14045) 另外，Ruby 2.6 提升了 block 傳遞的呼叫效能。藉由 micro-benchmark 我們測得了 2.6 倍的提升。

* 引入了瞬態堆積（theap）。[[Bug #14858](https://bugs.ruby-lang.org/issues/14858) [[Feature #14989]]((https://bugs.ruby-lang.org/issues/14989)) teap 是用來管理短生命週期的指向特定類別（Array、Hash、Object 和 Struct）指標的堆積。舉例來說，新建小而短生命週期的 Hash 物件的效能提升了 2x。藉由 rdoc benchmark，我們測得了 6%-7% 的效能提升。

## 自 2.5 起重要的變化

* $SAFE 成為了 Process 全域狀態，我們可以再次將其設為 0。[[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* 不再建議將 safe_level 參數傳遞給 ERB.new 的行為。trim_mode 和 eoutvar 參數被轉換成關鍵字參數。[[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* 合併 RubyGems 3.0.0.beta2。`--ri` 和 `--rdoc` 選項已被移除。請改用 `--document` 和 `--no-document` 選項。

* 合併 [Bundler](https://github.com/bundler/bundler) 作爲缺省 gems。

請參考 [新聞](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS)
或 [提交紀錄](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
來進一步了解。

自 Ruby 2.5.0 以來，共計有
[6474 個文件變更，171888 行增加(+)，46617 行刪減(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)
！

與 Ruby 2.6.0-preview3 一起享受編程吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.gz>

      SIZE:   17071670 bytes
      SHA1:   67836fda11fa91e0b988a6cc07989fbceda025b4
      SHA256: 60243e3bd9661e37675009ab66ba63beacf5dec748885b9b93916909f965f27a
      SHA512: 877278cd6e9b947f5bb6ed78136efb232dcc9c5c218b7236576171e7c3cd7f6b7d10d07d8402014a14aba1fcd1913a4370f0725c561ead41d8a3fe92029f7f76

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.zip>

      SIZE:   21537655 bytes
      SHA1:   45f3c90dfffe03b746f21f24152666e361cbb41a
      SHA256: 9152af9e700349dcfa2eec196dd91587d42d70a6837fa2c415ebba1167587be1
      SHA512: 335de36cf56706326f4acc4bbd35be01e0ac5fff30d0a69b2e1630ba4c78f0e711822d1623d0099a517c824b154917d2f60be192dfb143a422cf1d17b38e1183

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.bz2>

      SIZE:   14973451 bytes
      SHA1:   5f2df5d8c5a3888ccb915d36a3532ba32cda8791
      SHA256: 1f09a2ac1ab26721923cbf4b9302a66d36bb302dc45e72112b41d6fccc5b5931
      SHA512: d1693625723796e8902f3e4c4fae444f2912af9173489f7cf18c99db2a217afc971b082fce7089e39f8edd54d762d2b4e72843c8306ed29b05ccb15ac03dbb5b

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.xz>

      SIZE:   12291692 bytes
      SHA1:   7f8216247745215e9645568e7a02140f9a029b31
      SHA256: 9856d9e0e32df9e5cdf01928eec363d037f1a76dab2abbf828170647beaf64fe
      SHA512: b4d3b17ecf96272c43cd7518c0b54dee63fc1150ad143e1d9c9d708506fe78676c80eb96cc47b8d46d1128bd483a53f16c944963a03d1f99f00131b74714df7b
