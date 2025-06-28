---
layout: news_post
title: "Ruby 3.4.0 發布"
author: "naruse"
translator: "Bear Su"
date: 2024-12-25 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.4.0" | first %}
我們很高興宣布 Ruby {{ release.version }} 發佈了。 Ruby 3.4 加入了 `it` 區塊參數參考變數，
將 Prism 作為預設的解析器，為 socket 函式庫加入 Happy Eyeballs Version 2 支援，改進 YJIT，加入 Modular GC，與其他更多。

## 導入 `it`

加入 `it` 參考沒有變數名稱的區塊參數。 [[Feature #18980]]

```ruby
ary = ["foo", "bar", "baz"]

p ary.map { it.upcase } #=> ["FOO", "BAR", "BAZ"]
```

`it` 行為與 `_1` 類似。當意圖在區塊中只想使用 `_1` 時，其他編號的參數例如 `_2` 也可能會出現，這會對讀者造成額外的認知負擔。因此 `it` 被導入作為一個方便的別名。在使用 `it` 能表示自身的簡單情境下使用 `it`，例如在單行區塊中。

## Prism 先在是預設解析器

預設的解析器從 parse.y 切換為 Prism。 [[Feature #20564]]

這是一項內部改進，使用者應該看不到什麼變化。如果您發現任何相容性問題，請向我們回報。

若要使用傳統的解析器，請使用指令列參數 `--parser=parse.y`。

## socket 函式庫新功能 Happy Eyeballs Version 2 (RFC 8305)

socket 函式庫引入新功能[Happy Eyeballs 版本2 (RFC 8305)](https://datatracker.ietf.org/doc/html/rfc8305)，這是在許多程式語言廣泛採用實現更好連接的最新標準化版本，在 `TCPSocket.new`（`TCPSocket.open`）和 `Socket.tcp`。
這項改進使 Ruby 能夠提供高效、可靠的網路連接，適應現代網路環境。

在 Ruby 3.3 之前，這些方法會連續執行名稱解析和連接。透過該演算法，它們現在的運作方式如下：

1. 同時執行 IPv6 和 IPv4 名稱解析
2. 嘗試連接已解析的 IP 位址，優先考慮 IPv6，並以 250 毫秒間隔錯開平行連線嘗試。
3. 回傳第一個成功的連接，同時取消任何其他連接

這樣可確保即使特定協定或 IP 位址發生延遲或不可用，也能將連線延遲降至最低。

此功能預設為啟用，因此無需額外設定即可使用。若要全域停用此功能，請設定環境變數 `RUBY_TCP_NO_FAST_FALLBACK=1` 或呼叫 `Socket.tcp_fast_fallback=false`。或者，若要針對單一方法停用此功能，請使用關鍵字引數 `fast_fallback: false`。

## YJIT

### TL;DR

* 在 x86-64 與 arn64 平台上的大多數基準測試都有更好的效能
* 減少編輯後設資料的的記憶體用量
* 修復多個錯誤。YJIT 現在更加勇健且有更好的測試。

### 新功能

* 指令列選項
    * 透過 `--yjit-mem-size` 指令選項新增統一記憶體限制 (預設 128MiB)，該功能追蹤總 YJIT 記憶體用量，而且比舊的 `--yjit-exec-mem-size` 更為直觀
    * 透過 `--yjit-log` 加入編譯紀錄來追蹤哪些被編譯
* Ruby API
    * 可以在運行環境透過 `RubyVM::YJIT.log` 取得紀錄結尾
* YJIT stats
    * 現在總是可以透過 `RubyVM::YJIT.runtime_stats` 取得更多統計數據：
       invalidation、inlining、和 metadata encoding。

### 新的改善

* 透過壓縮上下文來減少儲存 YJIT 後設資料所需的記憶體空間
* 改善後的分配器能為本地變數分配暫存器
* 當啟用 YJIT 時，使用更多用 Ruby 邊寫的核心程式：
  * 使用 Ruby 改寫`Array#each`、`Array#select`、`Array#map` 提高效能 [[Feature #20182]].
* 能夠內聯小型/簡單的方法，例如：
  * 空方法
  * 回傳常數的方法
  * 回傳 `self` 的方法
  * 直接回傳參數的方法
* 適用於更多執行環境方法的程式碼產生器
* 改善 `String#getbyte`、`String#setbyte` 和其他字串方法
* 改善位元計算來加速低階位元/位元組操作
* 各種其他的增量改善

## 模組化垃圾收集器

* 模組化垃圾收集器功能可以動態載入替代垃圾收集器實作。
  要啟用該功能，在建置 Ruby 時設定 `--with-modular-gc`。
  垃圾收集器函式庫可以在運行環境使用環境變數 `RUBY_GC_LIBRARY` 載入。
  [[Feature #20351]]

* Ruby 內建的垃圾收集器已經切分成不同的檔案 `gc/default/default.c`，並使用在 `gc/gc_impl.h` 定義的 API 與 Ruby 互動。
  內建的垃圾收集器現在也可以用 `make modular-gc MODULAR_GC=default` 建置為函式庫，並使用環境變數 `RUBY_GC_LIBRARY=default` 啟用。[[Feature #20470]]

* 基於 [MMTk](https://www.mmtk.io/) 提供了一個實驗性的垃圾收集器函式庫。
  該垃圾收集器函式庫可以使用 `make modular-gc MODULAR_GC=mmtk` 建置，並使用環境變數 `RUBY_GC_LIBRARY=mmtk` 啟用。
  建置主機上需要有 Rust 工具鏈。[[Feature #20860]]

## 語法變更

* 沒有 `frozen_string_literal` 註解的檔案中的字串文字，現在行為會跟被凍結一樣。如果它們被修改則會發出棄用警告。
  這些警告可以透過 `-W:deprecated` 或 `Warning[:deprecated] = true` 啟用。
  若要停用此變更，您可以在執行 Ruby 時加上參數 `--disable-frozen-string-literal`。 [[Feature #20205]]

* 現在呼叫方法支援使用 Keyword splatting `nil`。
  `**nil` 的處理方式與 `**{}` 類似，不會傳遞 keywords，也不會呼叫任何轉換方法。 [[Bug #20064]]

* Block passing 不再允許作為索引。 [[Bug #19918]]

* 不定長度參數不再允許作為索引。 [[Bug #20218]]

* 頂級名稱 `::Ruby` 現在被保留，且會在 `Warning[:deprecated]` 時警告。  [[Feature #20884]]

## 核心類別更新

注意：我們只列出特別的類別更新。

* Exception

  * `Exception#set_backtrace` 現在可接受 `Thread::Backtrace::Location` 陣列。
    `Kernel#raise`、`Thread#raise` 和 `Fiber#raise` 也接受同樣的新格式。 [[Feature #13557]]

* GC

    * 加入 `GC.config` 允許在垃圾收集器中指定設定變數。[[Feature #20443]]

    * 引入 GC 設定參數 `rgengc_allow_full_mark`。當 `false` GC 只會標記年輕的物件。預設為 `true`。[[Feature #20443]]

* Ractor

    * 在 Ractor 中允許使用 `require`。該 requiring 程序會在主要 Ractor 執行。
      加入 `Ractor._require(feature)` 在主要 Ractor 執行 requiring 程序。[[Feature #20627]]

    * 加入 `Ractor.main?`。 [[Feature #20627]]

    * 加入 `Ractor.[]` 和 `Ractor.[]=` 存取目前 Ractor 的 ractor local storage。[[Feature #20715]]

    * 加入 `Ractor.store_if_absent(key){ init }` 在執行緒安全下初始化 ractor 本地變數。[[Feature #20875]]

* Range

  * `Range#size` 如果 range 無法迭代的話，現在會拋出 `TypeError`。 [[Misc #18984]]


## 標準函式庫更新

注意：我們只列出特別的標準函式庫更新。

* RubyGems
    * gem push 新增 `--attestation` 選項。它允許將簽章儲存到 [sigstore.dev]

* Bundler
    * 新增 `lockfile_checksums` 設定，可以在新的 lockfiles 包含 checksums。
    * bundle lock 新增 `--add-checksums` 選項將 checksums 加入到現有的 lockfile

* JSON

    * `JSON.parse` 比 json-2.7.x 相比效能提升約 1.5 倍。

* Tempfile

    * Tempfile.create 實作了關鍵字參數 `anonymous: true`。
      `Tempfile.create(anonymous: true)` 會立即刪除該建立的暫存檔案。
      因此應用程式不需要自行刪除該檔案。
      [[Feature #20497]]

* win32/sspi.rb

    * 這個函式庫已從 Ruby 儲存庫分離至 [ruby/net-http-sspi]。
      [[Feature #20775]]

下列的預設 gem 現在是 bundled gems。

- mutex_m 0.3.0
- getoptlong 0.2.1
- base64 0.2.0
- bigdecimal 3.1.8
- observer 0.1.2
- abbrev 0.1.2
- resolv-replace 0.1.1
- rinda 0.2.0
- drb 2.2.1
- nkf 0.2.0
- syslog 0.2.0
- csv 3.3.2
- repl_type_completor 0.1.9

## 相容性問題

注意：不包含功能問題的修正。

* 錯誤訊息與 backtrace 的顯示改變。
  * 使用單引號 (`'`) 取代反引號 (`` ` ``) 作為起始引號。 [[Feature #16495]]
  * 在方法名稱前顯示類別名稱 (僅當類別有固定名稱時)。 [[Feature #19117]]
  * `Kernel#caller`、`Thread::Backtrace::Location` 的方法等等，也做了對應的改變。

  ```
  舊:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  新:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```

* Hash#inspect 渲染變更。 [[Bug #20433]]

    * 符號鍵將會以現代符號鍵語法顯示： `"{user: 1}"`
    * 其他鍵現在會在 `=>` 周圍加上空白：`'{"user" => 1}'`，之前沒有將上空白：`'{"user"=>1}'`

* Kernel#Float() 現在接受忽略小數位數的數值字串。 [[Feature #20705]]

  ```rb
  Float("1.")    #=> 1.0 (之前，拋出 ArgumentError)
  Float("1.E-1") #=> 0.1 (之前，拋出 ArgumentError)
  ```

* String#to_f 現在接受忽略小數位數的數值字串。注意指定指數後結果將會改變。[[Feature #20705]]

  ```rb
  "1.".to_f    #=> 1.0
  "1.E-1".to_f #=> 0.1 (之前，回傳 1.0)
  ```

* Refinement#refined_class 已被移除。 [[Feature #19714]]

## 標準函式庫相容性問題

* DidYouMean

    * `DidYouMean::SPELL_CHECKERS[]=` 和 `DidYouMean::SPELL_CHECKERS.merge!` 已被移除。

* Net::HTTP

    * 移除以下已廢棄的常數：
        * `Net::HTTP::ProxyMod`
        * `Net::NetPrivate::HTTPRequest`
        * `Net::HTTPInformationCode`
        * `Net::HTTPSuccessCode`
        * `Net::HTTPRedirectionCode`
        * `Net::HTTPRetriableCode`
        * `Net::HTTPClientErrorCode`
        * `Net::HTTPFatalErrorCode`
        * `Net::HTTPServerErrorCode`
        * `Net::HTTPResponseReceiver`
        * `Net::HTTPResponceReceiver`

      這些常數在 2012 年被廢棄。

* Timeout

    * Timeout.timeout 拒絕負數值。 [[Bug #20795]]

* URI

    * 將預設解析器從 RFC 2396 標準改成 RFC 3986 標準。
      [[Bug #19266]]

## 更新的 C API

* `rb_newobj` 和 `rb_newobj_of` (和相對應的巨集 `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) 已經被移除。 [[Feature #20265]]
* 移除已廢棄的函式 `rb_gc_force_recycle`。 [[Feature #18290]]

## 其他變更

* 將 block 傳遞給不使用傳入 block 的方法，會在 verbose 模式 (`-w`) 下顯示警告。
  [[Feature #15554]]

* 當重新定義一些由直譯器與 JIT 特別最佳化的核心方法，例如 `String.freeze` 和 `Integer#+`，現在會發出效能類型警告 (`-W:performance` or `Warning[:performance] = true`)。
  [[Feature #20429]]

參見 [NEWS](https://docs.ruby-lang.org/en/3.4/NEWS_md.html)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
來了解更多。

自 Ruby 3.3.0 以來，計 [{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }} 行刪減（-）](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)。

耶誕快樂、佳節愉快，享受與 Ruby 3.4 一起寫程式的時光！

## 下載

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby 是什麼

Ruby 最初由 Matz（Yukihiro Matsumoto）於 1993 年開發的開源軟體。可以在許多平台上執行。使用者來自世界各地，特別活躍於網路開發領域。

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19266]:     https://bugs.ruby-lang.org/issues/19266
[Feature #19714]: https://bugs.ruby-lang.org/issues/19714
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20443]: https://bugs.ruby-lang.org/issues/20443
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20497]: https://bugs.ruby-lang.org/issues/20497
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Bug #20620]: https://bugs.ruby-lang.org/issues/20620
[Feature #20627]: https://bugs.ruby-lang.org/issues/20627
[Feature #20705]: https://bugs.ruby-lang.org/issues/20705
[Feature #20715]: https://bugs.ruby-lang.org/issues/20715
[Feature #20775]: https://bugs.ruby-lang.org/issues/20775
[Bug #20795]: https://bugs.ruby-lang.org/issues/20795
[Bug #20433]: https://bugs.ruby-lang.org/issues/20433
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
[Feature #20875]: https://bugs.ruby-lang.org/issues/20875
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[sigstore.dev]: https://www.sigstore.dev
[ruby/net-http-sspi]: https://github.com/ruby/net-http-sspi
