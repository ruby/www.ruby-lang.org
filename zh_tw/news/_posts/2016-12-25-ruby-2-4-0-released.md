---
layout: news_post
title: "Ruby 2.4.0 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2016-12-25 00:00:00 +0000
lang: zh_tw
---

我們很高興宣佈 Ruby 2.4.0 發佈了。

Ruby 2.4.0 是 Ruby 2.4 系列的第一個穩定版本。
包含了許多新功能，譬如：

## [Vladimir Makarov 改良了哈希表](https://bugs.ruby-lang.org/issues/12142)

透過引入 Open addressing 及包含順序的陣列來改善哈希表（st_table）的內部結構。這個改良經過多方論證，特別感謝 Yura Sokolov。

## Binding#irb：在 irb 像 `binding.pry` 一樣啟動一個 REPL

當您在除錯時，您可能常常使用 `p` 來查看變數的數值。有了 [pry](https://github.com/pry/pry) 以後，只要在應用裡面寫 `binding.pry`，就可以啟動一個 REPL 來執行任何 Ruby 程式進行除錯。[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a) 補丁給 irb 引入了類似的功能： `binding.irb`。

## [Unify Fixnum and Bignum into Integer](https://bugs.ruby-lang.org/issues/12005)

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

## 自 2.3 起重要的變化

* 支援 OpenSSL 1.1.0 版本
* ext/tk 從標準函式庫移除 [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC 從標準函式庫移除 [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

請參閱 [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS) 或 Commit Logs 來進一步了解。

以上變化自 Ruby 2.3.0 以來，計有 [2523 檔案變更，程式碼新增 289129 行，移除 84670 行](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0)！

聖誕快樂、佳節愉快，享受與 Ruby 2.4 編程的時光！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
