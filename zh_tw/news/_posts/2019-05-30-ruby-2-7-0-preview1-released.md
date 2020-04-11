---
layout: news_post
title: "Ruby 2.7.0-preview1 發佈"
author: "naruse"
translator: "Vincent Lin"
date: 2019-05-30 00:00:00 +0000
lang: zh_tw
---

我們很榮幸的宣布 Ruby 2.7.0-preview1 發布了。

為了計畫於十二月發布的最終版本，我們發布了預覽版本以收集回饋。他引入了許多新功能和性能提升，最值得注意的事：

* Compaction GC
* Pattern Matching
* REPL 改進

## Compaction GC

此版本引入了 Compaction GC，可以對零碎的記憶體空間進行整理。

某些多執行緒的 Ruby 程式可能會導致記憶體碎片化，進而導致記憶體使用率增高和速度降低。

引入了 `GC.compact` 方法來壓縮堆疊。此函數壓縮堆疊中的活動物件，以便可以使用更少的頁面，並且堆疊可能對於寫入時複製更友好。[#15626](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [實驗性質]

在函數式編程語言中廣泛地被使用的 Pattern matching，作為實驗性的功能加入了。[#14912](https://bugs.ruby-lang.org/issues/14912) 它可以遍歷給定的物件並在其比對成功時賦值。

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

更多詳細資訊，請參閱 [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)。

## REPL 改進

`irb`，綑綁交互環境 (REPL; Read-Eval-Print-Loop)，現已支持多行編輯，由 `reline`、`readline` 實現純 Ruby 的支援。它還提供 rdoc 集成。在 irb 中您可以為指定的類別、模組或方法的顯示引用。[#14683](https://bugs.ruby-lang.org/issues/14683)、[#14787](https://bugs.ruby-lang.org/issues/14787)、[#14918](https://bugs.ruby-lang.org/issues/14918) 此外，`binding.irb` 中顯示的程式碼行和核心類別的檢查結果現在已經有著色了。

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## 其他值得注意的新特點

* 方法引用運算符，<code>.:</code>，作為實驗性的功能加入了。[#12125]( https://bugs.ruby-lang.org/issues/12125)、[#13581]( https://bugs.ruby-lang.org/issues/13581)

* 默認為區塊參數的編號參數作為實驗性的功能加入了。[#4475](https://bugs.ruby-lang.org/issues/4475)

* 無始範圍試驗性的加入了。他可能沒有無盡範圍那麼有用，但他以 DSL 為目的來說是好的。[#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      rel.where(sales: ..100)

* 新增了 `Enumerable#tally`，它將會計算每個元素出現的次數。

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## 性能改進

* JIT [實驗性質]

  * 當最佳化假設不成功時，JIT 後的程式碼將會重新編譯為成最佳化程度較低的程式碼。

  * 當方法（Method）被認為是純粹（pure）時，執行方法內聯。這種最佳化的方法仍然是實驗性質，許多方法都不被認為是純粹的。

  * `--jit-min-calls` 的預設值從 5 調整至 10,000。

  * `--jit-max-cache` 的預設值從 1,000 調整至 100。

## 其他從 2.6 版本以來顯著的變化

* 現在 `Proc.new` 和 `proc` 沒有 block 時，在有區塊的方法調用時會產生警告。

* `lambda` 在方法調用時如果沒有 block 時會產生區塊錯誤。

* Unicode 和 Emoji 版本從 11.0.0 更新至 12.0.0。[[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* 更新 Unicode 至 12.1.0 版本，新增對於新年號令和 U+32FF 的支援。[[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`、`Date#jisx0301` 和 `Date.parse` 暫時支持新的日本年號作為非正式的擴充功能，直到新的 JIS X 0301 發佈。[[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* 編譯器需必需支援 C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * 關於我們語言的詳細資訊：<https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

請參考[新聞](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS)或[提交紀錄](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)來進一步了解。

伴隨著這些變動，自 Ruby 2.6.0 以來，共有 [1727 個檔案變更, 76022 行增加（+）, 60286 行刪減（-）](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)！

享受使用 Ruby 2.7 編程吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## Ruby 是什麼

Ruby 最初由 Matz（Yukihiro Matsumoto）於 1993 年開發出來，現在作為開源軟體開發。它可在多個平台上運行，並在世界各地使用，尤其適用於網站開發。
