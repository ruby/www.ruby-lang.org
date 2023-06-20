---
layout: news_post
title: "Ruby 2.4.0-preview2 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2016-09-08 09:00:00 +0000
lang: zh_tw
---

很高興告訴大家 Ruby 2.4.0-preview2 發佈了。

Ruby 2.4.0-preview2 是 Ruby 2.4.0 的第二個預覽版。
為了獲得社群的寶貴意見發佈了此版本。
請不吝[至此反饋](https://github.com/ruby/ruby/wiki/How-To-Report)，你仍可以對將來的功能做出改變。

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

請嘗試並享受與 Ruby 2.4.0-preview2 的編碼時光，有任何問題敬請[不吝指出](https://github.com/ruby/ruby/wiki/How-To-Report)！

## 自 2.3 起重要的變化

* 支援 OpenSSL 1.1.0 版本
* ext/tk 從標準函式庫移除 [Feature #8539](https://bugs.ruby-lang.org/issues/8539)

請參閱 [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview2/NEWS) 和
[ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview2/ChangeLog)
來進一步了解。

以上變化自 Ruby 2.3.0 以來，計有 [2353 個文件變更，新增代碼 289057 行，移除了 73847 行](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview2)！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.bz2>

  * SIZE:   12463225 bytes
  * SHA1:   95a501624f1cf4bb0785d3e17afd0ad099f66385
  * SHA256: 2224c55b2d87b5c0f08d23a4618e870027dbc1cffbfb4a05efd19eac4ff4cf1d
  * SHA512: 0c9a59a2f57a99c4ee8539a30f41da1de7547566203f89d856e1be9dbb44365754e6c470145dc9336eb324e0feb2f53d9fef18a1564968ac21f9ee528905949f

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.gz>

  * SIZE:   15586514 bytes
  * SHA1:   492a13c4ddc1c0c218433acb00dcf7ddeef96fe0
  * SHA256: fec544836428aada2dc593a8cc42ce330798a805e49ecb807a0e21b386fd0b14
  * SHA512: 5a3de852a7611e79f38219ed7bb13772aaabb25538ca843d38743180a0cc939a4e34c008b61d578da785285196b6b8882270bddc17cbed481237db8afa4c54e4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.tar.xz>

  * SIZE:   9886832 bytes
  * SHA1:   95d5fd7d54d86497194f69ec433755a517dcde8f
  * SHA256: 6c2d25bedc50c2f19b0e349f0ffd9b9a83000d9cb6a677bf5372fb493d33e16a
  * SHA512: b9bd898d17583103ee61b4764ac86eb62c9661fca1f41ff0d06a15965a0a1ba581491d4b8a342e527d63e102b6ddcb2acebdabe5b246409ce9711e13f9428d5b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview2.zip>

  * SIZE:   17401564 bytes
  * SHA1:   5f3a5b2fd03f70d49e74ec36be3e0c110f6c17cc
  * SHA256: 4d0e466148283ad52208b1e1b70b018aefb7fa95b490fc862d5ea4ca284ecdd2
  * SHA512: 0ef2098d995238580245a4bcee843641199c1194189be13614611e2ffec329278072319a799d409eaf13b1cff45f05a0eae02d9ea8ccc69058fa49e03eca0130

## 發佈記

另請參考發佈時程與其他資訊：

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
