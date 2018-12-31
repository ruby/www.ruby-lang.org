---
layout: news_post
title: "Ruby 2.6.0-rc1 已發佈"
author: "naruse"
translator: Delton Ding
date: 2018-12-06 00:00:00 +0000
lang: zh_tw
---

我們很榮幸的宣布 Ruby 2.6.0-rc1 發布了。

Ruby 2.6.0-rc1 是 Ruby 2.6.0 的第一個候選版本。此版本包括數個新特性和效能提升。例如：

## JIT

Ruby 2.6 引入了 JIT（Just-in-time）編譯器初始實作。

JIT 編譯器專注於提升任何 Ruby 程式的執行速度。不同於其他語言的 JIT 編譯器，Ruby 的 JIT 使用一種獨特的編譯方式，將 C 程式碼寫入到硬碟中，再使用一般的 C 編譯器來生成原生程式碼（native code）。詳見 [Vladmir Makarov 的 MJIT 組織](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)

如何使用：只需在命令列或是 $RUBYOPT 的環境變數中指定 "--jit" 即可。指定 "--jit-verbose=1" 可將印出正在編譯中的 JIT 訊息。更多選項請參考 "ruby --help"。

此次 JIT 預覽版發布的主要目為提供使用者檢查是否適用於您的平台，並且在 2.6 正式版本發布前找出安全性風險。現行的 JIT 編譯器僅在透過 gcc clang 或 Microsoft VC++ 建構 Ruby 以及編譯器可運行時進行支援，除此之外你無法使用它。

在 2.6.0-rc1 中，我們相比 Ruby 2.5 在 CPU 密集場景的性能測試 Optcarrot<https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208> 中，取得了 1.7 倍的效能提升。我們正着手優化記憶體密集場景例如 Rails 應用中的執行效能。

請持續關注 Ruby 效能的全新時代。

## RubyVM::AbstractSyntaxTree [ 實驗性質 ]

Ruby 2.6 引入了 `RubyVM::AbstractSyntaxTree` 模組。

此模組擁有 `parse` 方法，解析給予的 Ruby 程式碼字串並回傳抽象語法樹 AST（Abstract Syntax Tree）節點，以及解析給予 Ruby 程式碼檔案並回傳 AST 節點的 `parse_file` 方法。

同樣也引入了 `RubyVM::AbstractSyntaxTree::Node` 類別，您可以從 `Node` 物件中獲取位置訊息和子結點，此功能為實驗性質，無法保證 AST 節點結構的相容性。

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

* `FileUtils#cp_lr`。[[Feature #4189]](https://bugs.ruby-lang.org/issues/4189)

## 效能提升

* 提升 `Proc#call`的速度，因為我們不需要再顧慮 `$SAFE` 了。[[Feature #14318]](https://bugs.ruby-lang.org/issues/14318) 透過 `lc_fizzbuzz` 大量使用 `Proc#call` 的測試，我們測得了 1.4 倍效能提升。[[Bug #10212]](https://bugs.ruby-lang.org/issues/10212)

* 提升了當 `block` 為 block 參數時 `block.call` 的效能。[[Feature #14330]](https://bugs.ruby-lang.org/issues/14330) Ruby 2.5 提升了 block 傳遞效能。[[Feature #14045]](https://bugs.ruby-lang.org/issues/14045) 另外，Ruby 2.6 提升了 block 傳遞的呼叫效能。藉由 micro-benchmark 我們測得了 2.6 倍的提升。

* 引入了瞬態堆積（theap）。[Bug #14858] [Feature #14989] teap 是用來管理短生命週期的指向特定類別（Array、Hash、Object 和 Struct）指標的堆積。舉例來說，新建小而短生命週期的 Hash 物件的效能提升了 2x。藉由 rdoc benchmark，我們測得了 6%-7% 的效能提升。

## 自 2.5 起重要的變化

* $SAFE 成為了 Process 全域狀態，我們可以再次將其設為 0。[[Feature #14250]](https://bugs.ruby-lang.org/issues/14250)

* 不再建議將 safe_level 參數傳遞給 ERB.new 的行為。trim_mode 和 eoutvar 參數被轉換成關鍵字參數。[[Feature #14256]](https://bugs.ruby-lang.org/issues/14256)

* 將支援的 Unicode 版本升級至 11。我們計劃在 2.6 的小版本更新中升至 12 和 12.1 版本。

* 合併 RubyGems 3.0.0.beta3。`--ri` 和 `--rdoc` 選項已被移除。請改用 `--document` 和 `--no-document` 選項。

* 合併 [Bundler](https://github.com/bundler/bundler) 作爲預設 gems。

請參考 [新聞](https://github.com/ruby/ruby/blob/v2_6_0_rc1/NEWS)
或 [提交紀錄](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
來進一步了解。

自 Ruby 2.5.0 以來，共計有
[6376 個文件變更，227364 行增加(+)，51599 行刪減(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc1)
！

與 Ruby 2.6.0-rc1 一起享受編程吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.gz>

      SIZE:   16823448 bytes
      SHA1:   889db7731fd43f6dbf7f31ffdb0a29bba1a8d356
      SHA256: 6d6183639ed9c02320d7132e97c65489a39e24d8b55fc4ed35ac53d1189cb61d
      SHA512: ad101adee5c43f3645561e73970f15d4e9141f707da69a92e224575c665949e18ca53389e5315fca2ea3934d77967a59e304353cde4a915537e7c4e4ee20be73

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.zip>

      SIZE:   20737499 bytes
      SHA1:   457e39aee1978da5e42af42a6ad230421544aa07
      SHA256: 2bcdf468de499e4d6983d60d63dcc883f4c54fdc05a08a54eb93d315477bc4cc
      SHA512: 0842fae8a199f6c1e76f5d775edbf468e18a54f0419324eb73595e0268c728c71733371d71dc2fa342105dbc487987ca5556948a9ef067276a7b5f552462802a

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.bz2>

      SIZE:   14607078 bytes
      SHA1:   269fe9d414d7731e4a63959fadffe5c50c08ce0e
      SHA256: b4e9c0e8801946e9f0baba30948955f4341e9e04f363c206b7bd774208053eb5
      SHA512: cbd6281b2aab6fbce3f699c1ab57e5423304dca7a547a0b3cd4e8e980326dc7b85b2ca2bfaf3f3a648d40f4222fdf1740d81d422790ee7ae1ba1ed33eb11e3e8

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc1.tar.xz>

      SIZE:   11851908 bytes
      SHA1:   3b93fdf1c5bd969ab4fe0a8176a6cf64e4597e6e
      SHA256: 21d9d54c20e45ccacecf8bea4dfccd05edc52479c776381ae98ef6a7b4afa739
      SHA512: 3d93d8d80e4900e8b3a27f904ed60581cebc6c55f4ab7acafc81e95001f92f3ea4ddec2da6169b1ed5e0146f7b7c35c1c13b3243955d5825c72170834fe933f3
