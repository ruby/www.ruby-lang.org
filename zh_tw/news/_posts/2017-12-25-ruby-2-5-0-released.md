---
layout: news_post
title: "Ruby 2.5.0 發佈"
author: "naruse"
translator: "Delton Ding"
date: 2017-12-25 00:00:00 +0000
lang: zh_tw
---

我們高興地宣佈 Ruby 2.5.0 已發佈。

Ruby 2.5.0 是 Ruby 2.5.0 的第一個穩定版本。此版本包括數個新功能和效能提升。例如：

## 新功能

* 允許在 do/end 區塊中 rescue/else/ensure。[[功能 #12906]](https://bugs.ruby-lang.org/issues/12906)
* 新增 `yield_self` 使用當前上下文 yield 區塊。不同於 `tap`，此方法會返回區塊的執行結果。[[功能 #6721&]](https://bugs.ruby-lang.org/issues/6721)
* 支援測量分支覆蓋率和方法覆蓋率。分支覆蓋指檢查哪些分支被覆蓋到，哪些沒有。方法覆蓋則指可以測量方法是否被呼叫。基於這些新功能進行測試，可以精準地知道哪些分支和方法被執行，並更精確地計算測試的程式碼覆蓋率。[[功能 #13901]](https://bugs.ruby-lang.org/issues/13901)
* 新增 Hash#slice [[功能 #8499]](https://bugs.ruby-lang.org/issues/8499) 和 Hash#transform_keys。[[功能 #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new 現在可以被用於含有關鍵字參數的類別。[[功能 #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none? 和 one? 可以接受模式作為參數。[[功能 #11286]](https://bugs.ruby-lang.org/issues/11286)
* 移除了最高層級常數的查找。[[功能 #11547]](https://bugs.ruby-lang.org/issues/11547)
* 我們最喜愛的函式庫之一 pp.rb，現已自動載入。無需再手寫 `require "pp"` 來載入。[[功能 #14123]](https://bugs.ruby-lang.org/issues/14123)
* 倒序（從舊到新）印出錯誤訊息。當終端視窗（TTY）中有較長的呼叫堆疊訊息時，你可在在最底部看到直接觸發問題的行。需要注意的是，僅當直接列印到終端時，才會倒序列印。[[功能 #8661]](https://bugs.ruby-lang.org/issues/8661) [試驗性質]

## 效能提升

* 通過在位元組碼中移除了全部 `trace` 指令提升了大約 5-10% 的效能。`trace` 指令的使用是為了提供 `TracePoint` 的支援。然而，在大多數情況下，`TracePoint` 不會被用到，`trace` 指令增加了額外的效能開銷。作為替代，我們實作了動態指令技術，詳見[[功能 #14104]](https://bugs.ruby-lang.org/issues/14104)。
* 通過 lazy 的 Proc 分配使參數傳區塊（例如 `def foo(&b); bar(&b); end`）時的效能相較於 Ruby 2.4 提升了約 3 倍。[[功能 #14045]](https://bugs.ruby-lang.org/issues/14045)
* 互斥鎖修改變得更輕量和快速。[[功能 #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB 現在模板生成原始碼的速度相較於 Ruby 2.4 提升了 2 倍。
* 提升了多個內建方法，例如 `Array#concat`, `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+` 等的效能。
* IO.copy\_stream 使用 copy\_file\_range(2) 來拷貝負載。[[功能 #13867]](https://bugs.ruby-lang.org/issues/13867)

## 自 2.4 起重要的變化

* SecureRandom 傾向使用作業系統方法而非 OpenSSL。[[漏洞 #9569]]((https://bugs.ruby-lang.org/issues/9569))
* 將 cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr, scanf, sdbm, stringio, strscan, webrick, zlib 從函式庫提升到預設 gem。
* 升級 [Onigmo](https://github.com/k-takata/Onigmo/) 到 6.1.3。
  * 新增 [absence operator](https://github.com/k-takata/Onigmo/issues/87)。
  * 注意，2.4.1 也同樣包含此變更。
* 更新到 Psych 3.0.2。
* 更新到 RubyGems 2.7.3。
* 更新到 RDoc 6.0.1。
  * [將 IRB 的詞法分析器更新為 Ripper](https://github.com/ruby/rdoc/pull/512)，极大提升了生成文件的速度。
  * 修復了許多最近幾年的錯誤。
  * 支援近幾年 Ruby 的新語法。
* 更新支援的 Unicode 版本至 10.0.0。
* `Thread.report_on_exception` 預設值現為 true，這對多執行緒程式的除錯很有幫助。[功能 #14143]
* IO#write 現接受多個參數 [[功能 #9323]](https://bugs.ruby-lang.org/issues/9323)

詳見 [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS) 或[commit 記錄](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)獲取詳細訊息。

自 Ruby 2.4.0 以來，已發生 [6158 個文件變更，348484 行增加(+)，82747 行刪減(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)！

聖誕快樂！享受你 Ruby 2.5 的編程之旅吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
