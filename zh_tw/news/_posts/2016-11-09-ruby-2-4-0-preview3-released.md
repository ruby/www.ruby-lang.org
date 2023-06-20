---
layout: news_post
title: "Ruby 2.4.0-preview3 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2016-11-09 09:00:00 +0000
lang: zh_tw
---

很高興告訴大家 Ruby 2.4.0-preview3 發佈了。

Ruby 2.4.0-preview3 是 Ruby 2.4.0 的第三個預覽版。
為了獲得社群的寶貴意見所以發佈了 preview3。
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

優化了 `[x, y].max` and `[x, y].min`，某些情況下不會產生暫時性陣列。

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

請嘗試並享受與 Ruby 2.4.0-preview3 的編碼時光，有任何問題敬請[不吝指出](https://github.com/ruby/ruby/wiki/How-To-Report)！

## 自 2.3 起重要的變化

* 支援 OpenSSL 1.1.0 版本
* ext/tk 從標準函式庫移除 [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC 從標準函式庫移除 [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

請參閱 [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview3/NEWS) 和
[ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview3/ChangeLog)
來進一步了解。

以上變化自 Ruby 2.3.0 以來，計有 [2470 個文件變更，新增代碼 283051 行，移除了 64902 行](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview3)！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.bz2>

      SIZE:   12615328 bytes
      SHA1:   fefe49f6a7d5b642936c324f3b05aaac827355db
      SHA256: 305a2b2c627990e54965393f6eb1c442eeddfa149128ccdd9f4334e2e00a2a52
      SHA512: 6602c65a7b1e3bc680acc48217108f4335e84fdd74a9cf06f2e2f9ad00a2fccacf9fa035a912bc9d5cc3f0c7a5e21475971dfac37b0364311ef3645f25c7ddf9

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.gz>

      SIZE:   15758023 bytes
      SHA1:   f6a6ec9f7fedad0bf4efee2e42801cc963f60dca
      SHA256: c35fe752ccfabf69bf48e6aab5111c25a05938b428936f780638e2111934c9dd
      SHA512: 68556d5252b6813b4c8eeba32733e940207f80694b5c5d20e69bf01eb52929ed2466496b05a895a5ad4831d430695e17624eb35b728b2d4d7cf02df756ac48b4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.tar.xz>

      SIZE:   9957596 bytes
      SHA1:   66592b1a52f985638d639e7c3dd6bdda4e0569d0
      SHA256: b14be2b5c80bff0d6894ae2b37afdb17a968413e70236ec860f3e2d670b4c317
      SHA512: 5be20f0b2609745790c2b22f2228e69a840f63c34a117a1f95fd5436af211f0a6db2758d513d3e095a2d97c53c80793579cb2a1e00e70cf72c487a88c4a40d33

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview3.zip>

      SIZE:   17579012 bytes
      SHA1:   15d08cff952da3844ae54887b7f74b12d47c9ee2
      SHA256: b95a8f67fb7d6e852db77c5660c8878c14d68eb72c5501dac164a7e640ecb06e
      SHA512: fa15e1b7ab0cab56c9a580e1b1e2fee250ee0b9c59546079675a1931a36e37131bd37d64033c75e05d8e9d9fcc33ce7850254d3acaca2136cf3bd08b070244f0

## 發佈記

另請參考發佈時程與其他資訊：

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
