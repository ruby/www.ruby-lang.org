---
layout: news_post
title: "Ruby 3.4.0 rc1 發布"
author: "naruse"
translator: "Bear Su"
date: 2024-12-12 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.4.0-rc1" | first %}
我們很高興宣布 Ruby {{ release.version }} 發佈了。

## Prism

預設的解析器從 parse.y 切換為 Prism。 [[Feature #20564]]

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

* 新增 `it` 來引用 block 的傳入參數。 [[Feature #18980]]

* 現在呼叫方法支援使用 Keyword splatting `nil`。
  `**nil` 的處理方式與 `**{}` 類似，不會傳遞 keywords，也不會呼叫任何轉換方法。 [[Bug #20064]]

* Block passing 不再允許作為索引。 [[Bug #19918]]

* 不定長度參數不再允許作為索引。 [[Bug #20218]]

## YJIT

TL;DR:
* 在 x86-64 與 arn64 平台上的大多數基準測試都有更好的效能
* 減少編輯後設資料的的記憶體用量
* 修復多個錯誤。YJIT 現在更加勇健且有更好的測試。

新功能：
* 透過 `--yjit-mem-size` 指令選項新增統一記憶體限制 (預設 128MiB)，該功能追蹤總 YJIT 記憶體用量，而且比舊的 `--yjit-exec-mem-size` 更為直觀
* 現在總是可以透過 `RubyVM::YJIT.runtime_stats` 取得更多統計數據
* 透過 `--yjit-log` 加入編譯紀錄來追蹤哪些被編譯
  * 可以在運行環境透過 `RubyVM::YJIT.log` 取得紀錄結尾
* 在 multi-ractor 模式中支援分享常數
* 現在可以使用 `--yjit-trace-exits=COUNTER` 來追蹤已計數的 exits

新的改善：
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

## 核心類別更新

注意：我們只列出特別的類別更新。

* Exception

  * `Exception#set_backtrace` 現在可接受 `Thread::Backtrace::Location` 陣列。
    `Kernel#raise`、`Thread#raise` 和 `Fiber#raise` 也接受同樣的新格式。 [[Feature #13557]]

* Range

  * `Range#size` 如果 range 無法迭代的話，現在會拋出 `TypeError`。 [[Misc #18984]]



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

## 更新的 C API

* `rb_newobj` 和 `rb_newobj_of` (和相對應的巨集 `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) 已經被移除。 [[Feature #20265]]
* 移除已廢棄的函式 `rb_gc_force_recycle`。 [[Feature #18290]]

## 其他變更

* 將 block 傳遞給不使用傳入 block 的方法，會在 verbose 模式 (`-w`) 下顯示警告。
  [[Feature #15554]]

* 當重新定義一些由直譯器與 JIT 特別最佳化的核心方法，例如 `String.freeze` 和 `Integer#+`，現在會發出效能類型警告 (`-W:performance` or `Warning[:performance] = true`)。
  [[Feature #20429]]

請參閱 GitHub 發布如 [Logger](https://github.com/ruby/logger/releases) 和變更紀錄來了解更多關於預設 gems 與 bundled gems 的資訊。

參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
來了解更多。

自 Ruby 3.3.0 以來，計 [{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }} 行刪減（-）](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)。


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
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
