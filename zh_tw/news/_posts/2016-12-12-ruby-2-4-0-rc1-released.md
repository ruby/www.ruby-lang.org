---
layout: news_post
title: "Ruby 2.4.0-rc1 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2016-12-12 09:00:00 +0000
lang: zh_tw
---

我們很高興宣佈 2.4.0-rc1 發佈了。

Ruby 2.4.0-rc1 是 Ruby 2.4.0 的第一個候選版本。
為了獲得社群的寶貴意見所以發佈了 rc1。
請不吝[至此反饋](https://github.com/ruby/ruby/wiki/How-To-Report)，您仍可以對將來的功能做出改變。

## [Vladimir Makarov 改良了哈希表](https://bugs.ruby-lang.org/issues/12142)

透過引入 Open addressing 及包含順序的陣列來改善哈希表（st_table）的內部結構。這個改良經過多方論證，特別感謝 Yura Sokolov。

## Binding#irb：在 irb 像 `binding.pry` 一樣啟動一個 REPL

當您在除錯時，您可能常常使用 `p` 來查看變數的數值。有了 [pry](https://github.com/pry/pry) 以後，只要在應用裡面寫 `binding.pry`，就可以啟動一個 REPL 來執行任何 Ruby 程式進行除錯。[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a) 補丁給 irb 引入了類似的功能： `binding.irb`。

## [Fixnum 和 Bignum 統整為 Integer](https://bugs.ruby-lang.org/issues/12005)

雖然 [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579) 沒有明確指定 Integer 類別的細節，但 CRuby 有兩個 Integer 類別：Fixnum 和 Bignum。 Ruby 2.4 統整為 Integer。所有有關 Fixnum 與 Bignum 的 C 語言擴充需要做出修正。

也請參考[這個議題](https://bugs.ruby-lang.org/issues/12005)和 [akr 的簡報](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf)。

## [字串支持 Unicode 的大小寫轉換](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` 除 ASCII 之外，現在也可以做 Unicode 的大小寫轉換了。

## 效能優化

Ruby 2.4 還包括以下效能優化及語法變更：

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

優化了 `[x, y].max` 和 `[x, y].min`，某些情況下不會產生暫時性陣列。

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

新增 `Regexp#match?` 方法，只做正則匹配，而不會產生參照物件及修改 `$~`，減少物件的分配。

### 其他效能改善

* [提昇實體變量的訪問速度](https://bugs.ruby-lang.org/issues/12274)

## 除錯

### [Thread#report_on_exception 和 Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

除非有另外的線程，明確地與執行中的線程進行 join，否則 Ruby 會忽略執行中線程的異常。啟用 `report_on_exception = true` 來觀察線程是否有未處理的異常而終止執行。

敬請給我們關於 `report_on_exception` 預設值以及 report-on-GC（會在線程尚未 join 前被 GC 時給出報告）的建議。

### [線程死鎖檢查現在會顯示線程的錯誤和相依線程](https://bugs.ruby-lang.org/issues/8214)

Ruby 在等待線程執行時會進行死鎖檢查，但檢查結果沒有足夠的資訊來除錯。
Ruby 2.4 的死鎖檢查會顯示錯誤資訊及相依的線程。

請嘗試並享受與 Ruby 2.4.0-rc1 的編碼時光，有任何問題敬請[不吝指出](https://github.com/ruby/ruby/wiki/How-To-Report)！

## 自 2.3 起重要的變化

* 支援 OpenSSL 1.1.0 版本
* ext/tk 從標準函式庫移除 [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC 從標準函式庫移除 [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

請參閱 [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS) 和
[ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_rc1/ChangeLog)
來進一步了解。

以上變化自 Ruby 2.3.0 以來，計有 [2519 檔案變更，程式碼新增 288606 行，移除 83896 行](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## 發佈記

同時請參考發佈時程及其他相關資訊：

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
