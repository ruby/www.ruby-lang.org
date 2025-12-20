---
layout: news_post
title: "Ruby 4.0.0 preview3 發布"
author: "naruse"
translator: "Bear Su"
date: 2025-12-18 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview3" | first %}
我們很高興宣布 Ruby {{ release.version }} 發布了。 Ruby 4.0 導入了 Ruby::Box 和 "ZJIT"，以及其他改進功能。

## Ruby::Box

這是一項用來提供定義區隔的(實驗性質)新功能。
關於「Ruby Box」的詳細資訊，請參閱[doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md)。
[[Feature #21311]] [[Misc #21385]]

## 語法變更

* `*nil` 不再呼叫 `nil.to_a`，就跟 `**nil` 不呼叫 `nil.to_hash` 一樣。[[Feature #21047]]

* 位於行首的邏輯二元運算子(`||`、`&&`、`and` 和 `or`)會延續前一行的內容，如同 fluent dot。
  以下兩段程式碼是相同的效果：

    ```ruby
    if condition1
       && condition2
      ...
    end
    ```

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    [[Feature #20925]]

## 核心類別更新

注意：我們只列出特別的類別更新。

* Kernel

    * `Kernel#inspect` 現在會檢查是否存在 `#instance_variables_to_inspect` 方法，這讓開發者可以控制哪些實體變數(instance variables)可以顯示在 `#inspect` 的字串中：

        ```ruby
        class DatabaseConfig
          def initialize(host, user, password)
            @host = host
            @user = user
            @password = password
          end

          private def instance_variables_to_inspect = [:@host, :@user]
        end

        conf = DatabaseConfig.new("localhost", "root", "hunter2")
        conf.inspect #=> #<DatabaseConfig:0x0000000104def350 @host="localhost", @user="root">
        ```

        [[Feature #21219]]

    * 移除被棄用的行為：透過 `Kernel#open` 並在開頭使用 `|` 符號來建立 process。 [[Feature #19630]]

* Binding

    * `Binding#local_variables` 不再包含編號參數。
      同時，`Binding#local_variable_get` 和 `Binding#local_variable_set` 也不再處理編號參數。
      [[Bug #21049]]

* File

    * `File::Stat#birthtime` 現在可在核心與系統支援 statx 系統呼叫 的 Linux 上使用。 [[Feature #21205]]

* IO

    * `IO.select` 允許 `Float::INFINITY` 作為逾時參數。
      [[Feature #20610]]

    * 移除被棄用的行為：透過 `IO` 並在開頭使用 `|` 符號來建立行程 [[Feature #19630]]

* Math

    * 新增 `Math.log1p` 和 `Math.expm1`。 [[Feature #21527]]

* Method

    * `Method#source_location`、`Proc#source_location` 和 `UnboundMethod#source_location` 現在會回傳 5 個元素的擴展位置資訊：`[path, start_line, start_column, end_line, end_column]`。先前 2 個元素的格式 `[path, line]` 仍可透過對結果呼叫 `.take(2)` 來取得。 [[Feature #6012]]

* Proc

    * `Proc#parameters` 現在會將匿名可選參數顯示為 `[:opt]` 而非 `[:opt, nil]`，使得其輸出與匿名參數為必要時的格式保持一致。 [[Bug #20974]]

* Ractor

    * 新增了 `Ractor::Port` 類別，為 Ractor 之間的通訊提供了一種新的同步機制。 [[Feature #21262]]
        ```ruby
        port1 = Ractor::Port.new
        port2 = Ractor::Port.new
        Ractor.new port1, port2 do |port1, port2|
          port1 << 1
          port2 << 11
          port1 << 2
          port2 << 12
        end
        2.times{ p port1.receive } #=> 1, 2
        2.times{ p port2.receive } #=> 11, 12
        ```

        `Ractor::Port` 提供以下方法：

        * `Ractor::Port#receive`
        * `Ractor::Port#send` (或 `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        最後移除了 `Ractor.yield` 和 `Ractor#take` 。

    * 新增了 `Ractor#join` 與 `Ractor#value` 用於等待 Ractor 終止。這些方法與 `Thread#join` 及 `Thread#value` 類似。

    * 新增了 `Ractor#monitor` 與 `Ractor#unmonitor`，作為內部實作 `Ractor#join` 時所使用的低階介面。

    * `Ractor.select` 現在僅接受 Ractors 與 Ports。若傳入的是 Ractors，它會在該 Ractor 終止時回傳。

    * 新增了 `Ractor#default_port`。每個 `Ractor` 都有一個預設埠，供 `Ractor.send` 與 `Ractor.receive` 使用。

    * 移除了 `Ractor#close_incoming` 與 `Ractor#close_outgoing`。

    * 導入了 `Ractor.shareable_proc` 與 `Ractor.shareable_lambda` 以建立共享的 Proc 或 lambda。 [[Feature #21550]], [[Feature #21557]]

* Range

    * `Range#to_set` 與 `Enumerator#to_set` 現在會進行大小檢查，以避免發生無窮範圍的問題。 [[Bug #21654]]

    * `Range#overlap?` 現在能正確處理無限（無邊界）範圍。 [[Bug #21185]]

    * 已修正 `Range#max` 對於無開頭整數範圍的行為。 [[Bug #21174]] [[Bug #21175]]。

* Ruby

    * 定義了一個新的頂層模組 Ruby，其中包含與 Ruby 相關的常數。此模組在 Ruby 3.4 中已被預留，現在則是正式定義。 [[Feature #20884]]

* Ruby::Box

    * 這是一項用來提供定義區隔的(實驗性質)新功能。關於「Ruby Box」的詳細資訊，請參閱[doc/language/box.md](https://github.com/ruby/ruby/blob/master/doc/language/box.md)。
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` 現在是核心類別，而非自動載入的標準函式庫類別。
      [[Feature #21216]]

    * `Set#inspect` 現在回傳適合用於 `eval` 的字串，並使用 `Set[]` 語法（例如：使用 `Set[1, 2, 3]` 而非 `#<Set: {1, 2, 3}>`）。這讓它與 Array 和 Hash 等其他核心集合類別保持一致。 [[Feature #21389]]

    * 向 `Set#to_set` 與 `Enumerable#to_set` 傳遞參數的行為現在已被棄用。 [[Feature #21390]]

* Socket

    * `Socket.tcp` 與 `TCPSocket.new` 現在接受 `open_timeout` 關鍵字參數，可用於指定建立初始連線時的逾時時間。 [[Feature #21347]]

* String

    * 更新 Unicode 至版本 17.0.0 和 Emoji 版本 17.0。[[Feature #19908]][[Feature #20724]][[Feature #21275]]
        (也套用到 Regexp)

    * 已擴展 `String#strip`、`strip!`、`lstrip`、`lstrip!`、`rstrip` 和 `rstrip!`
      接受 `*selectors` 參數。 [[Feature #21552]]

* Thread

    * 導入了 `Thread#raise(cause:)` 參數支援，與 `Kernel#raise` 的用法類似。 [[Feature #21360]]

* Fiber

    * 導入了 `Fiber#raise(cause:)` 參數支援，與 `Kernel#raise` 的用法類似。 [[Feature #21360]]

* Fiber::Scheduler

    * 導入了 `Fiber::Scheduler#fiber_interrupt`，可用於拋出特定的例外來中斷 fiber。
      最初的使用案例是當 IO 操作關閉時，用來中斷正在等待該阻塞 IO 操作的 fiber。
      [[Feature #21166]]

* Pathname

    * Pathname 已從預設 gem 升級為 Ruby 的核心類別。
      [[Feature #17473]]

## 標準函式庫更新

以下預設 gem 變更為隨附 gem：

* ostruct 0.6.3
* pstore 0.2.0
* benchmark 0.5.0
* logger 1.7.0
* rdoc 6.17.0
* win32ole 1.9.2
* irb 1.15.3
* reline 0.6.3
* readline 0.0.4
* fiddle 1.1.8

我們只列出特別的標準函式庫更新。

其他變更列於以下章節。
若該項目在 GitHub 上有提供發布紀錄，我們也列出了從前一個隨附版本（即 Ruby 3.3.0）以來的發布歷史。

新增了以下預設 gem。

* win32-registry 0.1.2

更新了以下預設 gem。

* RubyGems 4.0.1
* bundler 4.0.1
* date 3.5.1
* digest 3.2.1
* english 0.8.1
* erb 6.0.0
* etc 1.4.6
* fcntl 1.3.0
* fileutils 1.8.0
* forwardable 1.4.0
* io-console 0.8.1
* io-nonblock 0.3.2
* io-wait 0.4.0.dev
* ipaddr 1.2.8
* json 2.17.1
* net-http 0.8.0
* openssl 4.0.0.pre
* optparse 0.8.1
* pp 0.6.3
* prism 1.6.0
* psych 5.3.0
* resolv 0.7.0
* stringio 3.1.9.dev
* strscan 3.1.6.dev
* timeout 0.5.0
* uri 1.1.1
* weakref 0.1.4
* zlib 3.2.2

更新了以下隨附 gem。

* minitest 5.26.2
* power_assert 3.0.1
* rake 13.3.1
* test-unit 3.7.3
* rexml 3.4.4
* net-ftp 0.3.9
* net-imap 0.5.12
* net-smtp 0.5.1
* matrix 0.4.3
* prime 0.1.4
* rbs 3.9.5
* typeprof 0.31.0
* debug 1.11.0
* base64 0.3.0
* bigdecimal 3.3.1
* drb 2.2.3
* syslog 0.3.0
* csv 3.3.5
* repl_type_completor 0.1.12

## 支援的平台

* Windows

    * 停止支援低於 14.0 (_MSC_VER 1900) 的 MSVC 版本。這意味著現在需要使用 Visual Studio 2015 或更新版本。

## 相容性問題

* 由於新增了 `Ractor::Port`，下列方法已從 Ractor 中移除：

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoging`

    [[Feature #21262]]

* `ObjectSpace._id2ref` 已被棄用。 [[Feature #15408]]

* `Process::Status#&` 和 `Process::Status#>>` 已被移除。
  它們在 Ruby 3.3. 被棄用。 [[Bug #19868]]

* `rb_path_check` 已被移除。
  此函數曾用在已於 Ruby 2.7 移除的 `$SAFE` 路徑檢查，且此函數先前就已被棄用。
  [[Feature #20971]]

## 標準函式庫相容問題

* CGI 函式庫已從預設 gem 中移除。現在僅針對以下方法提供 `cgi/escape`：

    * `CGI.escape` 和 `CGI.unescape`
    * `CGI.escapeHTML` 和 `CGI.unescapeHTML`
    * `CGI.escapeURIComponent` 和 `CGI.unescapeURIComponent`
    * `CGI.escapeElement` 和 `CGI.unescapeElement`

    [[Feature #21258]]

* 隨著 `Set` 從標準函式庫移至核心類別，`set/sorted_set.rb` 已被移除，且 `SortedSet` 不再是自動載入的常數。
  若要使用 `SortedSet`，請安裝 `sorted_set` gem 並執行 `require 'sorted_set'`。
  [[Feature #21287]]

## C API 更新

* IO

    * `rb_thread_fd_close` 已被棄用，現在沒有作用。如果您需要從 C 擴充功能將檔案描述符提供給 Ruby 程式碼，請使用 `RUBY_IO_MODE_EXTERNAL` 建立一個 `IO` 實體，並使用 `rb_io_close(io)` 來關閉它（這同時會中斷並等待該 `IO` 實體上所有進行中的操作）。
      直接關閉檔案描述符不會中斷進行中的操作，且可能導致未定義行為。
      換句話說，如果兩個 `IO` 物件共享同一個檔案描述符，關閉其中一個並不會影響另一個。
      [[Feature #18455]]

* GVL

    * `rb_thread_call_with_gvl` 現在不論是否持有 GVL 均可運作。這讓 gems 可以不必再檢查 `ruby_thread_has_gvl_p`。
      在使用 GVL 時仍請保持謹慎。 [[Feature #20750]]

* Set

    * 已新增 `Set` 的 C API。支援以下方法：
      [[Feature #21459]]

        * `rb_set_foreach`
        * `rb_set_new`
        * `rb_set_new_capa`
        * `rb_set_lookup`
        * `rb_set_add`
        * `rb_set_clear`
        * `rb_set_delete`
        * `rb_set_size`

## 實作改進

### Ractor

投入了大量心力來提升 Ractor 的穩定性、效能與易用性。這些改進使得 Ractor 的實作更接近脫離實驗性質的狀態。

* 效能提升
    * 凍結字串與符號表在內部使用無鎖雜湊集合。
    * 方法快取查詢在多數情況下避免了鎖定。
    * 類別（以及 geniv）的實體變數存取速度更快，並避免了鎖定。
    * 在分配物件時，避免了快取衝突。
    * `object_id` 在多數情況下避免了鎖定。
* 修復錯誤與可靠性
    * 修正了同時使用 Ractor 與 Thread 時可能發生的死鎖。
    * 修正了在 Ractor 中使用 require 與 autoload 的問題。
    * 修正了跨 Ractor 的編碼與轉碼問題。
    * 修正了垃圾回收操作與方法失效時的競爭條件。
    * 修正了啟動 Ractor 後，行程進行複製時的問題。

## JIT

* ZJIT
    * 若要啟用 `--zjit` 支援，請使用 Rust 1.85.0 或更新版本來編譯 Ruby。
    * 在 Ruby 4.0.0，ZJIT 的速度已超越直譯器，但尚未達到 YJIT 的水準。我們鼓勵大家嘗試 ZJIT，但目前建議不要將其部署於正式環境。
    * 我們的目標是在 Ruby 4.1 中讓 ZJIT 的速度超越 YJIT，並達到可供正式環境使用的水準。

* YJIT
    * `RubyVM::YJIT.runtime_stats`
        * `ratio_in_yjit` 不再於預設建置中運作。
          請使用 `--enable-yjit=stats` 在 `configure` 中啟用 `--yjit-stats`。
        * 預設統計新增 `invalidate_everything`，當所有程式碼被 TracePoint 無效化時遞增。
    * `RubyVM::YJIT.enable` 新增 `mem_size:` 和 `call_threshold:` 選項。
* RJIT
    * 移除 `--rjit`。我們將把第三方 JIT API 的實作移至 [ruby/rjit](https://github.com/ruby/rjit) 儲存庫。

## 其他變更

參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
來了解更多。

自 Ruby 3.4.0 以來，計 [{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }}  行刪減（-）](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)!

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

[Feature #6012]: https://bugs.ruby-lang.org/issues/6012
[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Feature #20971]: https://bugs.ruby-lang.org/issues/20971
[Bug #20974]:     https://bugs.ruby-lang.org/issues/20974
[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]:     https://bugs.ruby-lang.org/issues/21049
[Feature #21166]: https://bugs.ruby-lang.org/issues/21166
[Bug #21174]:     https://bugs.ruby-lang.org/issues/21174
[Bug #21175]:     https://bugs.ruby-lang.org/issues/21175
[Bug #21185]:     https://bugs.ruby-lang.org/issues/21185
[Feature #21205]: https://bugs.ruby-lang.org/issues/21205
[Feature #21216]: https://bugs.ruby-lang.org/issues/21216
[Feature #21219]: https://bugs.ruby-lang.org/issues/21219
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21262]: https://bugs.ruby-lang.org/issues/21262
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
[Feature #21287]: https://bugs.ruby-lang.org/issues/21287
[Feature #21311]: https://bugs.ruby-lang.org/issues/21311
[Feature #21347]: https://bugs.ruby-lang.org/issues/21347
[Feature #21360]: https://bugs.ruby-lang.org/issues/21360
[Misc #21385]:    https://bugs.ruby-lang.org/issues/21385
[Feature #21389]: https://bugs.ruby-lang.org/issues/21389
[Feature #21390]: https://bugs.ruby-lang.org/issues/21390
[Feature #21459]: https://bugs.ruby-lang.org/issues/21459
[Feature #21527]: https://bugs.ruby-lang.org/issues/21527
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
