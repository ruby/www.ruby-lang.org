---
layout: news_post
title: "Ruby 4.0.0 發布"
author: "naruse"
translator: "Bear Su"
date: 2025-12-25 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "4.0.0" | first %}
我們很高興宣布 Ruby {{ release.version }} 發布了。
Ruby 4.0 導入了 Ruby::Box 和 "ZJIT"，以及許多改進功能。

## Ruby Box

Ruby Box 是一項用來提供定義區隔的(實驗性質)新功能。
可以透過設定環境變數 `RUBY_BOX=1` 啟用 Ruby Box。類別是 `Ruby::Box`。

在 Ruby Box 中載入的定義是互相隔離的。
Ruby Box 可以將從其他 boxes 載入的 monkey patches、全域/類別變數、類別/模組定義、和載入的原生/Ruby 函式庫做隔離。

預期的使用場景有：

* Run test cases in box to protect other tests when the test case uses monkey patches to override something
* 當測試案例使用 monkey patches 覆蓋時，在 box 環境中執行測試案例可以保護其他測試。
* 在 Ruby 進程中平行執行 Web 應用伺服器 boxes，以在應用程式伺服器上執行藍綠部署。
* 執行 Web 應用伺服器 boxes 來用 Ruby 程式碼檢查回應差異，評估特定時間段內的依賴更新。
* 作為基礎（底層）API，以實現某種「套件」（高層）API（尚未設計）。

參見  [Ruby::Box](https://docs.ruby-lang.org/en/master/Ruby/Box.html) 以了解更多關於「Ruby Box」的細節。
[[Feature #21311]] [[Misc #21385]]

## ZJIT

ZJIT 是一個新型的即時 (JIT) 編譯器，它是作為 YJIT 的下一代產品而開發的。
要建置支援 ZJIT 的 Ruby，您需要 Rust 1.85.0 或更高版本，指定 `--zjit` 參數啟用 ZJIT。

我們之所以為 Ruby 建立一個新的編譯器，是因為我們既想提高效能上限（更大的編譯單元大小和 SSA IR），並鼓勵更多外部貢獻（透過成為一個更傳統的編譯器）。
參見 [我們的部落格文章](https://railsatscale.com/2025-12-24-launch-zjit/) 來了解更多。

ZJIT 比直譯器快，但還不如 YJIT 快。
我們鼓勵您嘗試使用 ZJIT，但目前最好不要部署到生產環境中。
敬請期待 Ruby 4.1 的 ZJIT 版本。

## Ractor 改進

Ruby 的平行執行機制 Ractor 已經得到了多項改進。
導入了一個新的類別 `Ractor::Port`，用於解決與訊息發送和接收相關的問題。 (參見 [我們的部落格文章](https://dev.to/ko1/ractorport-revamping-the-ractor-api-98))。
此外，`Ractor.shareable proc` 讓在 Reactor 之間共用 `Proc` 物件變得更加容易。

在效能方面，許多內部資料結構都得到了改進，顯著減少了對全域鎖定的競爭，從而提高了平行執行的效率。
此外，Ractor 共用的內部資料也減少了，因此在平行執行時，CPU 快取競爭也相應降低。

Ractor 最初在 Ruby 3.0 中作為一項實驗性功能導入。我們計劃明年取消其「實驗性」狀態。

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

    之前：

    ```ruby
    if condition1 && condition2
      ...
    end
    ```

    ```ruby
    if condition1 &&
       condition2
      ...
    end
    ```

    [[Feature #20925]]

## 核心類別更新

注意：我們只列出特別的類別更新。

* Array

    * 新增 `Array#rfind` 提供比 `array.reverse_each.find` 更有效率的替代方法。 [[Feature #21678]]
    * 新增 `Array#find` 提供比 `Enumerable#find` 更有效率的 Override 方法。 [[Feature #21678]]

* Binding

    * `Binding#local_variables` 不再包含編號參數。
      同時，`Binding#local_variable_get` 、 `Binding#local_variable_set` 和 `Binding#local_variable_defined?` 也不再處理編號參數。
      [[Bug #21049]]

    * 新增`Binding#implicit_parameters`、`Binding#implicit_parameter_get`、和
      `Binding#implicit_parameter_defined?` 存取編號參數和 `it` 參數。 [[Bug #21049]]

* Enumerator

    * `Enumerator.produce` 現在接受一個可選的 `size` 關鍵字參數，用於指定列舉的大小。
      參數可以是個整數、`Float::INFINITY`、可呼叫的對象(如 lambda)、或是 `nil` 表示未知大小。
      未指定時，大小預設為 `Float::INFINITY`。

        ```ruby
        # 無限列舉
        enum = Enumerator.produce(1, size: Float::INFINITY, &:succ)
        enum.size  # => Float::INFINITY

        # 指定了已知/可計算大小的有限列舉
        abs_dir = File.expand_path("./baz") # => "/foo/bar/baz"
        traverser = Enumerator.produce(abs_dir, size: -> { abs_dir.count("/") + 1 }) {
          raise StopIteration if it == "/"
          File.dirname(it)
        }
        traverser.size  # => 4
        ```

      [[Feature #21701]]

* ErrorHighlight

    * 當拋出 ArgumentError 時，現在會顯示方法呼叫（呼叫者）和方法定義（被呼叫者）的程式碼片段。
      [[Feature #21543]]

      ```
      test.rb:1:in 'Object#add': wrong number of arguments (given 1, expected 2) (ArgumentError)

          caller: test.rb:3
          | add(1)
            ^^^
          callee: test.rb:1
          | def add(x, y) = x + y
                ^^^
              from test.rb:3:in '<main>'
      ```

* Fiber

    * 導入了 `Fiber#raise(cause:)` 參數支援，與 `Kernel#raise` 的用法類似。 [[Feature #21360]]

* Fiber::Scheduler

    * 導入了 `Fiber::Scheduler#fiber_interrupt`，可用於拋出特定的例外來中斷 fiber。
      最初的使用案例是當 IO 操作關閉時，用來中斷正在等待該阻塞 IO 操作的 fiber。
      [[Feature #21166]]

    * 導入 `Fiber::Scheduler#yield`，允許 Fiber 調度器在訊號異常被停用時繼續處理。
      [[Bug #21633]]

    * 重新導入 `Fiber::Scheduler#io_close` hook，用於非同步 `IO#close`。

    * 當刷新 IO 寫入緩衝區時呼叫 `Fiber::Scheduler#io_write`。
      [[Bug #21789]]

* File

    * `File::Stat#birthtime` 現在可在核心與系統支援 statx 系統呼叫 的 Linux 上使用。 [[Feature #21205]]

* IO

     * `IO.select` 允許 `Float::INFINITY` 作為逾時參數。
      [[Feature #20610]]

    * 移除被棄用的行為：透過 `IO` 並在開頭使用 `|` 符號來建立行程 [[Feature #19630]]

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

* Math

     * 新增 `Math.log1p` 和 `Math.expm1`。 [[Feature #21527]]

* Pathname

    * Pathname 已從預設 gem 升級為 Ruby 的核心類別。
      [[Feature #17473]]

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
        * `Ractor::Port#send` (or `Ractor::Port#<<`)
        * `Ractor::Port#close`
        * `Ractor::Port#closed?`

        最後移除了 `Ractor.yield` 和 `Ractor#take`。

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

    * 這是一項用來提供定義區隔的(實驗性質)新功能。關於「Ruby Box」的詳細資訊，請參閱[doc/language/box.md](https://docs.ruby-lang.org/en/4.0/language/box_md.html)。
      [[Feature #21311]] [[Misc #21385]]

* Set

    * `Set` 現在是核心類別，而非自動載入的標準函式庫類別。
      [[Feature #21216]]

    * `Set#inspect` 現在回傳適合用於 `eval` 的字串，並使用 `Set[]` 語法（例如：使用 `Set[1, 2, 3]` 而非 `#<Set: {1, 2, 3}>`）。這讓它與 Array 和 Hash 等其他核心集合類別保持一致。 [[Feature #21389]]

    * 向 `Set#to_set` 與 `Enumerable#to_set` 傳遞參數的行為現在已被棄用。 [[Feature #21390]]

* Socket

    * `Socket.tcp` 與 `TCPSocket.new` 現在接受 `open_timeout` 關鍵字參數，可用於指定建立初始連線時的逾時時間。 [[Feature #21347]]

    * 當使用者在 `TCPSocket.new` 中指定逾時時間時，在之前依據情況可能會引發 `Errno::ETIMEDOUT` 或 `IO::TimeoutError`。
      該行為已改為一致，現在始終會拋出 `IO::TimeoutError` 錯誤。
      （請注意，在 `Socket.tcp` 中，仍然存在類似情況下拋出 `Errno::ETIMEDOUT` 異常的可能，在這兩種情況下，`Errno::ETIMEDOUT` 異常都可能在作業系統層級發生逾時時拋出。 ）

* String

    * 更新 Unicode 至版本 17.0.0 和 Emoji 版本 17.0。[[Feature #19908]][[Feature #20724]][[Feature #21275]]
        (也套用到 Regexp)

    * 已擴展 `String#strip`、`strip!`、`lstrip`、`lstrip!`、`rstrip` 和 `rstrip!`
      接受 `*selectors` 參數。 [[Feature #21552]]

* Thread

    * 導入了 `Thread#raise(cause:)` 參數支援，與 `Kernel#raise` 的用法類似。 [[Feature #21360]]


## 標準函式庫更新

我們只列出特別的標準函式庫更新。

若該項目在 GitHub 上有提供發布紀錄，我們也列出了從前一個隨附版本（即 Ruby 3.4.0）以來的發布歷史。

以下預設 gem 變更為隨附 gem：

* ostruct 0.6.3
  * 0.6.1 to [v0.6.2][ostruct-v0.6.2], [v0.6.3][ostruct-v0.6.3]
* pstore 0.2.0
  * 0.1.4 to [v0.2.0][pstore-v0.2.0]
* benchmark 0.5.0
  * 0.4.0 to [v0.4.1][benchmark-v0.4.1], [v0.5.0][benchmark-v0.5.0]
* logger 1.7.0
  * 1.6.4 to [v1.6.5][logger-v1.6.5], [v1.6.6][logger-v1.6.6], [v1.7.0][logger-v1.7.0]
* rdoc 7.0.2
  * 6.14.0 to [v6.14.1][rdoc-v6.14.1], [v6.14.2][rdoc-v6.14.2], [v6.15.0][rdoc-v6.15.0], [v6.15.1][rdoc-v6.15.1], [v6.16.0][rdoc-v6.16.0], [v6.16.1][rdoc-v6.16.1], [v6.17.0][rdoc-v6.17.0], [v7.0.0][rdoc-v7.0.0], [v7.0.1][rdoc-v7.0.1], [v7.0.2][rdoc-v7.0.2], [v7.0.3][rdoc-v7.0.3]
* win32ole 1.9.2
  * 1.9.1 to [v1.9.2][win32ole-v1.9.2]
* irb 1.16.0
  * 1.14.3 to [v1.15.0][irb-v1.15.0], [v1.15.1][irb-v1.15.1], [v1.15.2][irb-v1.15.2], [v1.15.3][irb-v1.15.3], [v1.16.0][irb-v1.16.0]
* reline 0.6.3
  * 0.6.0 to [v0.6.1][reline-v0.6.1], [v0.6.2][reline-v0.6.2], [v0.6.3][reline-v0.6.3]
* readline 0.0.4
* fiddle 1.1.8
  * 1.1.6 to [v1.1.7][fiddle-v1.1.7], [v1.1.8][fiddle-v1.1.8]

新增了以下預設 gem。

* win32-registry 0.1.2

更新了以下預設 gem。

* RubyGems 4.0.3
* bundler 4.0.3
* date 3.5.1
  * 3.4.1 to [v3.5.0][date-v3.5.0], [v3.5.1][date-v3.5.1]
* delegate 0.6.1
  * 0.4.0 to [v0.5.0][delegate-v0.5.0], [v0.6.0][delegate-v0.6.0], [v0.6.1][delegate-v0.6.1]
* digest 3.2.1
  * 3.2.0 to [v3.2.1][digest-v3.2.1]
* english 0.8.1
  * 0.8.0 to [v0.8.1][english-v0.8.1]
* erb 6.0.1
  * 4.0.4 to [v5.1.2][erb-v5.1.2], [v5.1.3][erb-v5.1.3], [v6.0.0][erb-v6.0.0], [v6.0.1][erb-v6.0.1]
* error_highlight 0.7.1
* etc 1.4.6
* fcntl 1.3.0
  * 1.2.0 to [v1.3.0][fcntl-v1.3.0]
* fileutils 1.8.0
  * 1.7.3 to [v1.8.0][fileutils-v1.8.0]
* forwardable 1.4.0
  * 1.3.3 to [v1.4.0][forwardable-v1.4.0]
* io-console 0.8.2
  * 0.8.1 to [v0.8.2][io-console-v0.8.2]
* io-nonblock 0.3.2
* io-wait 0.4.0
  * 0.3.2 to [v0.3.3][io-wait-v0.3.3], [v0.3.5.test1][io-wait-v0.3.5.test1], [v0.3.5][io-wait-v0.3.5], [v0.3.6][io-wait-v0.3.6], [v0.4.0][io-wait-v0.4.0]
* ipaddr 1.2.8
* json 2.18.0
  * 2.9.1 to [v2.10.0][json-v2.10.0], [v2.10.1][json-v2.10.1], [v2.10.2][json-v2.10.2], [v2.11.0][json-v2.11.0], [v2.11.1][json-v2.11.1], [v2.11.2][json-v2.11.2], [v2.11.3][json-v2.11.3], [v2.12.0][json-v2.12.0], [v2.12.1][json-v2.12.1], [v2.12.2][json-v2.12.2], [v2.13.0][json-v2.13.0], [v2.13.1][json-v2.13.1], [v2.13.2][json-v2.13.2], [v2.14.0][json-v2.14.0], [v2.14.1][json-v2.14.1], [v2.15.0][json-v2.15.0], [v2.15.1][json-v2.15.1], [v2.15.2][json-v2.15.2], [v2.16.0][json-v2.16.0], [v2.17.0][json-v2.17.0], [v2.17.1][json-v2.17.1], [v2.18.0][json-v2.18.0]
* net-http 0.9.1
  * 0.6.0 to [v0.7.0][net-http-v0.7.0], [v0.8.0][net-http-v0.8.0], [v0.9.0][net-http-v0.9.0], [v0.9.1][net-http-v0.9.1]
* openssl 4.0.0
  * 3.3.1 to [v3.3.2][openssl-v3.3.2], [v4.0.0][openssl-v4.0.0]
* optparse 0.8.1
  * 0.6.0 to [v0.7.0][optparse-v0.7.0], [v0.8.0][optparse-v0.8.0], [v0.8.1][optparse-v0.8.1]
* pp 0.6.3
  * 0.6.2 to [v0.6.3][pp-v0.6.3]
* prism 1.7.0
  * 1.5.2 to [v1.6.0][prism-v1.6.0], [v1.7.0][prism-v1.7.0]
* psych 5.3.1
  * 5.2.2 to [v5.2.3][psych-v5.2.3], [v5.2.4][psych-v5.2.4], [v5.2.5][psych-v5.2.5], [v5.2.6][psych-v5.2.6], [v5.3.0][psych-v5.3.0], [v5.3.1][psych-v5.3.1]
* resolv 0.7.0
  * 0.6.2 to [v0.6.3][resolv-v0.6.3], [v0.7.0][resolv-v0.7.0]
* stringio 3.2.0
  * 3.1.2 to [v3.1.3][stringio-v3.1.3], [v3.1.4][stringio-v3.1.4], [v3.1.5][stringio-v3.1.5], [v3.1.6][stringio-v3.1.6], [v3.1.7][stringio-v3.1.7], [v3.1.8][stringio-v3.1.8], [v3.1.9][stringio-v3.1.9], [v3.2.0][stringio-v3.2.0]
* strscan 3.1.6
  * 3.1.2 to [v3.1.3][strscan-v3.1.3], [v3.1.4][strscan-v3.1.4], [v3.1.5][strscan-v3.1.5], [v3.1.6][strscan-v3.1.6]
* time 0.4.2
  * 0.4.1 to [v0.4.2][time-v0.4.2]
* timeout 0.6.0
  * 0.4.3 to [v0.4.4][timeout-v0.4.4], [v0.5.0][timeout-v0.5.0], [v0.6.0][timeout-v0.6.0]
* uri 1.1.1
  * 1.0.4 to [v1.1.0][uri-v1.1.0], [v1.1.1][uri-v1.1.1]
* weakref 0.1.4
  * 0.1.3 to [v0.1.4][weakref-v0.1.4]
* zlib 3.2.2
  * 3.2.1 to [v3.2.2][zlib-v3.2.2]

更新了以下隨附 gem。

* minitest 6.0.0
* power_assert 3.0.1
  * 2.0.5 to [v3.0.0][power_assert-v3.0.0], [v3.0.1][power_assert-v3.0.1]
* rake 13.3.1
  * 13.2.1 to [v13.3.0][rake-v13.3.0], [v13.3.1][rake-v13.3.1]
* test-unit 3.7.5
  * 3.6.7 to [3.6.8][test-unit-3.6.8], [3.6.9][test-unit-3.6.9], [3.7.0][test-unit-3.7.0], [3.7.1][test-unit-3.7.1], [3.7.2][test-unit-3.7.2], [3.7.3][test-unit-3.7.3], [3.7.4][test-unit-3.7.4], [3.7.5][test-unit-3.7.5]
* rexml 3.4.4
* rss 0.3.2
  * 0.3.1 to [0.3.2][rss-0.3.2]
* net-ftp 0.3.9
  * 0.3.8 to [v0.3.9][net-ftp-v0.3.9]
* net-imap 0.6.2
  * 0.5.8 to [v0.5.9][net-imap-v0.5.9], [v0.5.10][net-imap-v0.5.10], [v0.5.11][net-imap-v0.5.11], [v0.5.12][net-imap-v0.5.12], [v0.5.13][net-imap-v0.5.13], [v0.6.0][net-imap-v0.6.0], [v0.6.1][net-imap-v0.6.1], [v0.6.2][net-imap-v0.6.2]
* net-smtp 0.5.1
  * 0.5.0 to [v0.5.1][net-smtp-v0.5.1]
* matrix 0.4.3
  * 0.4.2 to [v0.4.3][matrix-v0.4.3]
* prime 0.1.4
  * 0.1.3 to [v0.1.4][prime-v0.1.4]
* rbs 3.10.0
  * 3.8.0 to [v3.8.1][rbs-v3.8.1], [v3.9.0.dev.1][rbs-v3.9.0.dev.1], [v3.9.0.pre.1][rbs-v3.9.0.pre.1], [v3.9.0.pre.2][rbs-v3.9.0.pre.2], [v3.9.0][rbs-v3.9.0], [v3.9.1][rbs-v3.9.1], [v3.9.2][rbs-v3.9.2], [v3.9.3][rbs-v3.9.3], [v3.9.4][rbs-v3.9.4], [v3.9.5][rbs-v3.9.5], [v3.10.0.pre.1][rbs-v3.10.0.pre.1], [v3.10.0.pre.2][rbs-v3.10.0.pre.2], [v3.10.0][rbs-v3.10.0]
* typeprof 0.31.1
* debug 1.11.1
  * 1.11.0 to [v1.11.1][debug-v1.11.1]
* base64 0.3.0
  * 0.2.0 to [v0.3.0][base64-v0.3.0]
* bigdecimal 4.0.1
  * 3.1.8 to [v3.2.0][bigdecimal-v3.2.0], [v3.2.1][bigdecimal-v3.2.1], [v3.2.2][bigdecimal-v3.2.2], [v3.2.3][bigdecimal-v3.2.3], [v3.3.0][bigdecimal-v3.3.0], [v3.3.1][bigdecimal-v3.3.1], [v4.0.0][bigdecimal-v4.0.0], [v4.0.1][bigdecimal-v4.0.1]
* drb 2.2.3
  * 2.2.1 to [v2.2.3][drb-v2.2.3]
* syslog 0.3.0
  * 0.2.0 to [v0.3.0][syslog-v0.3.0]
* csv 3.3.5
  * 3.3.2 to [v3.3.3][csv-v3.3.3], [v3.3.4][csv-v3.3.4], [v3.3.5][csv-v3.3.5]
* repl_type_completor 0.1.12

### RubyGems and Bundler

Ruby 4.0 隨附 RubyGems 和 Bundler 4。詳情請參閱以下連結。

* [Upgrading to RubyGems/Bundler 4 - RubyGems Blog](https://blog.rubygems.org/2025/12/03/upgrade-to-rubygems-bundler-4.html)
* [4.0.0 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/03/4.0.0-released.html)
* [4.0.1 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/09/4.0.1-released.html)
* [4.0.2 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/17/4.0.2-released.html)
* [4.0.3 Released - RubyGems Blog](https://blog.rubygems.org/2025/12/23/4.0.3-released.html)

## 支援的平台

* Windows

    * 停止支援低於 14.0 (_MSC_VER 1900) 的 MSVC 版本。這意味著現在需要使用 Visual Studio 2015 或更新版本。

## 相容性問題

* 由於新增了 `Ractor::Port`，下列方法已從 Ractor 中移除：

    * `Ractor.yield`
    * `Ractor#take`
    * `Ractor#close_incoming`
    * `Ractor#close_outgoing`

    [[Feature #21262]]

* `ObjectSpace._id2ref` 已被棄用。 [[Feature #15408]]

* `Process::Status#&` 和 `Process::Status#>>` 已被移除。
  它們在 Ruby 3.3. 被棄用。 [[Bug #19868]]

* `rb_path_check` 已被移除。
  此函數曾用在已於 Ruby 2.7 移除的 `$SAFE` 路徑檢查，且此函數先前就已被棄用。
  [[Feature #20971]]

* 現在對於「參數數量錯誤」的 `ArgumentError` 的 backtrace 會包含接收者的類別名稱或模組名稱（例如，在 `Foo#bar` 中，而不是在 `bar` 中）。
  [[Bug #21698]]

* Backtraces 不再顯示「內部」幀。這些方法現在看起來像是在 Ruby 原始檔中，與其他 C 語言實作的方法保持一致。
  [[Bug #20968]]

  之前：
  ```
  ruby -e '[1].fetch_values(42)'
  <internal:array>:211:in 'Array#fetch': index 42 outside of array bounds: -1...1 (IndexError)
          from <internal:array>:211:in 'block in Array#fetch_values'
          from <internal:array>:211:in 'Array#map!'
          from <internal:array>:211:in 'Array#fetch_values'
          from -e:1:in '<main>'
  ```

  之後：
  ```
  $ ruby -e '[1].fetch_values(42)'
  -e:1:in 'Array#fetch_values': index 42 outside of array bounds: -1...1 (IndexError)
          from -e:1:in '<main>'
  ```

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


* Net::HTTP

    * 對於帶有請求主體的請求（例如，`POST`、`PUT`），已移除如果未明確設定標頭，預設自動將 `Content-Type` 標頭設為 `application/x-www-form-urlencoded` 的行為。
      如果您的應用程式依賴此自動預設值，則您的要求現在將不帶 Content-Type 標頭發送，這可能會破壞與某些伺服器的相容性。
      [[GH-net-http #205]]

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

* `Class#new`（例如 `Object.new`）在所有情況下都更快，尤其是在傳遞關鍵字參數時。此功能也已整合到 YJIT 和 ZJIT 中。 [[Feature #21254]]
* 不同大小集區的 GC heaps 現在獨立增長，當只有部分集區包含長期存活的物件時，可以減少記憶體使用量。
* 在包含大量物件的分頁上 GC 掃描速度更快。
* 「Generic ivar」物件（String、Array、`TypedData` 等）現在使用新的內部「fields」對象，以加快實例變數的存取速度。
* GC 避免在首次使用之前維護內部的 `id2ref` 表，從而加快了 `object_id` 的分配和 GC 掃描的速度。
* `object_id` 和 `hash` 在類別與模組物件上更快。
* 較大的大數整數可以使用可變寬度分配來保持嵌入狀態。
* `Random`、`Enumerator::Product`、`Enumerator::Chain`、`Addrinfo`,
  `StringScanner`、和一些內部物件現在也受到寫入屏障保護，這降低了 GC 的開銷。

### Ractor

投入了大量心力來提升 Ractor 的穩定性、效能與易用性。這些改進使得 Ractor 的實作更接近脫離實驗性質的狀態。

* 效能提升
    * 凍結字串與符號表在內部使用無鎖雜湊集合。 [[Feature #21268]]
    * 方法快取查詢在多數情況下避免了鎖定。
    * 類別（以及 eneric ivar）的實體變數存取速度更快，並避免了鎖定。
    * 使用 per-ractor counter 在分配物件時避免 CPU 快取衝突。
    * 使用 thread-local counter 在 in xmalloc/xfree 時避免 CPU 快取衝突。
    * `object_id` 在多數情況下避免了鎖定。
* 修復錯誤與可靠性
    * 修正了同時使用 Ractor 與 Thread 時可能發生的死鎖。
    * 修正了在 Ractor 中使用 require 與 autoload 的問題。
    * 修正了跨 Ractor 的編碼與轉碼問題。
    * 修正了垃圾回收操作與方法失效時的競爭條件。
    * 修正了啟動 Ractor 後，行程進行複製時的問題。
    * 現在在 Ractors 下垃圾收集器的分配計數是準確的。
    * 修正了垃圾回收後 TracePoints 無法正常工作的問題。 [[Bug #19112]]

## JIT

* ZJIT
    * 導入 [基於實驗性方法的 JIT 編譯器](https://docs.ruby-lang.org/en/master/jit/zjit_md.html)。
       如果可用，在執行時使用 `--zjit` 選項或呼叫 `RubyVM::ZJIT.enable` 啟用 ZJIT，。
      若要啟用 `--zjit` 支援，請使用 Rust 1.85.0 或更新版本來編譯 Ruby。
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


參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
來了解更多。

自 Ruby 3.4.0 以來，計 [{{ release.stats.files_changed }} 檔案變更，{{ release.stats.insertions }} 行新增（+），{{ release.stats.deletions }} 行刪減（-）](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)。

耶誕快樂、佳節愉快，享受與 Ruby 4.0 一起寫程式的時光！

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

[Feature #15408]: https://bugs.ruby-lang.org/issues/15408
[Feature #17473]: https://bugs.ruby-lang.org/issues/17473
[Feature #18455]: https://bugs.ruby-lang.org/issues/18455
[Bug #19112]:     https://bugs.ruby-lang.org/issues/19112
[Feature #19630]: https://bugs.ruby-lang.org/issues/19630
[Bug #19868]:     https://bugs.ruby-lang.org/issues/19868
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #20750]: https://bugs.ruby-lang.org/issues/20750
[Feature #20884]: https://bugs.ruby-lang.org/issues/20884
[Feature #20925]: https://bugs.ruby-lang.org/issues/20925
[Bug #20968]:     https://bugs.ruby-lang.org/issues/20968
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
[Feature #21254]: https://bugs.ruby-lang.org/issues/21254
[Feature #21258]: https://bugs.ruby-lang.org/issues/21258
[Feature #21268]: https://bugs.ruby-lang.org/issues/21268
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
[Feature #21543]: https://bugs.ruby-lang.org/issues/21543
[Feature #21550]: https://bugs.ruby-lang.org/issues/21550
[Feature #21552]: https://bugs.ruby-lang.org/issues/21552
[Feature #21557]: https://bugs.ruby-lang.org/issues/21557
[Bug #21633]:     https://bugs.ruby-lang.org/issues/21633
[Bug #21654]:     https://bugs.ruby-lang.org/issues/21654
[Feature #21678]: https://bugs.ruby-lang.org/issues/21678
[Bug #21698]:     https://bugs.ruby-lang.org/issues/21698
[Feature #21701]: https://bugs.ruby-lang.org/issues/21701
[Bug #21789]:     https://bugs.ruby-lang.org/issues/21789
[GH-net-http #205]: https://github.com/ruby/net-http/issues/205
[ostruct-v0.6.2]: https://github.com/ruby/ostruct/releases/tag/v0.6.2
[ostruct-v0.6.3]: https://github.com/ruby/ostruct/releases/tag/v0.6.3
[pstore-v0.2.0]: https://github.com/ruby/pstore/releases/tag/v0.2.0
[benchmark-v0.4.1]: https://github.com/ruby/benchmark/releases/tag/v0.4.1
[benchmark-v0.5.0]: https://github.com/ruby/benchmark/releases/tag/v0.5.0
[logger-v1.6.5]: https://github.com/ruby/logger/releases/tag/v1.6.5
[logger-v1.6.6]: https://github.com/ruby/logger/releases/tag/v1.6.6
[logger-v1.7.0]: https://github.com/ruby/logger/releases/tag/v1.7.0
[rdoc-v6.14.1]: https://github.com/ruby/rdoc/releases/tag/v6.14.1
[rdoc-v6.14.2]: https://github.com/ruby/rdoc/releases/tag/v6.14.2
[rdoc-v6.15.0]: https://github.com/ruby/rdoc/releases/tag/v6.15.0
[rdoc-v6.15.1]: https://github.com/ruby/rdoc/releases/tag/v6.15.1
[rdoc-v6.16.0]: https://github.com/ruby/rdoc/releases/tag/v6.16.0
[rdoc-v6.16.1]: https://github.com/ruby/rdoc/releases/tag/v6.16.1
[rdoc-v6.17.0]: https://github.com/ruby/rdoc/releases/tag/v6.17.0
[rdoc-v7.0.0]: https://github.com/ruby/rdoc/releases/tag/v7.0.0
[rdoc-v7.0.1]: https://github.com/ruby/rdoc/releases/tag/v7.0.1
[rdoc-v7.0.2]: https://github.com/ruby/rdoc/releases/tag/v7.0.2
[rdoc-v7.0.3]: https://github.com/ruby/rdoc/releases/tag/v7.0.3
[win32ole-v1.9.2]: https://github.com/ruby/win32ole/releases/tag/v1.9.2
[irb-v1.15.0]: https://github.com/ruby/irb/releases/tag/v1.15.0
[irb-v1.15.1]: https://github.com/ruby/irb/releases/tag/v1.15.1
[irb-v1.15.2]: https://github.com/ruby/irb/releases/tag/v1.15.2
[irb-v1.15.3]: https://github.com/ruby/irb/releases/tag/v1.15.3
[irb-v1.16.0]: https://github.com/ruby/irb/releases/tag/v1.16.0
[reline-v0.6.1]: https://github.com/ruby/reline/releases/tag/v0.6.1
[reline-v0.6.2]: https://github.com/ruby/reline/releases/tag/v0.6.2
[reline-v0.6.3]: https://github.com/ruby/reline/releases/tag/v0.6.3
[fiddle-v1.1.7]: https://github.com/ruby/fiddle/releases/tag/v1.1.7
[fiddle-v1.1.8]: https://github.com/ruby/fiddle/releases/tag/v1.1.8
[date-v3.5.0]: https://github.com/ruby/date/releases/tag/v3.5.0
[date-v3.5.1]: https://github.com/ruby/date/releases/tag/v3.5.1
[delegate-v0.5.0]: https://github.com/ruby/delegate/releases/tag/v0.5.0
[delegate-v0.6.0]: https://github.com/ruby/delegate/releases/tag/v0.6.0
[delegate-v0.6.1]: https://github.com/ruby/delegate/releases/tag/v0.6.1
[digest-v3.2.1]: https://github.com/ruby/digest/releases/tag/v3.2.1
[english-v0.8.1]: https://github.com/ruby/english/releases/tag/v0.8.1
[erb-v5.1.2]: https://github.com/ruby/erb/releases/tag/v5.1.2
[erb-v5.1.3]: https://github.com/ruby/erb/releases/tag/v5.1.3
[erb-v6.0.0]: https://github.com/ruby/erb/releases/tag/v6.0.0
[erb-v6.0.1]: https://github.com/ruby/erb/releases/tag/v6.0.1
[fcntl-v1.3.0]: https://github.com/ruby/fcntl/releases/tag/v1.3.0
[fileutils-v1.8.0]: https://github.com/ruby/fileutils/releases/tag/v1.8.0
[forwardable-v1.4.0]: https://github.com/ruby/forwardable/releases/tag/v1.4.0
[io-console-v0.8.2]: https://github.com/ruby/io-console/releases/tag/v0.8.2
[io-wait-v0.3.3]: https://github.com/ruby/io-wait/releases/tag/v0.3.3
[io-wait-v0.3.5.test1]: https://github.com/ruby/io-wait/releases/tag/v0.3.5.test1
[io-wait-v0.3.5]: https://github.com/ruby/io-wait/releases/tag/v0.3.5
[io-wait-v0.3.6]: https://github.com/ruby/io-wait/releases/tag/v0.3.6
[io-wait-v0.4.0]: https://github.com/ruby/io-wait/releases/tag/v0.4.0
[json-v2.10.0]: https://github.com/ruby/json/releases/tag/v2.10.0
[json-v2.10.1]: https://github.com/ruby/json/releases/tag/v2.10.1
[json-v2.10.2]: https://github.com/ruby/json/releases/tag/v2.10.2
[json-v2.11.0]: https://github.com/ruby/json/releases/tag/v2.11.0
[json-v2.11.1]: https://github.com/ruby/json/releases/tag/v2.11.1
[json-v2.11.2]: https://github.com/ruby/json/releases/tag/v2.11.2
[json-v2.11.3]: https://github.com/ruby/json/releases/tag/v2.11.3
[json-v2.12.0]: https://github.com/ruby/json/releases/tag/v2.12.0
[json-v2.12.1]: https://github.com/ruby/json/releases/tag/v2.12.1
[json-v2.12.2]: https://github.com/ruby/json/releases/tag/v2.12.2
[json-v2.13.0]: https://github.com/ruby/json/releases/tag/v2.13.0
[json-v2.13.1]: https://github.com/ruby/json/releases/tag/v2.13.1
[json-v2.13.2]: https://github.com/ruby/json/releases/tag/v2.13.2
[json-v2.14.0]: https://github.com/ruby/json/releases/tag/v2.14.0
[json-v2.14.1]: https://github.com/ruby/json/releases/tag/v2.14.1
[json-v2.15.0]: https://github.com/ruby/json/releases/tag/v2.15.0
[json-v2.15.1]: https://github.com/ruby/json/releases/tag/v2.15.1
[json-v2.15.2]: https://github.com/ruby/json/releases/tag/v2.15.2
[json-v2.16.0]: https://github.com/ruby/json/releases/tag/v2.16.0
[json-v2.17.0]: https://github.com/ruby/json/releases/tag/v2.17.0
[json-v2.17.1]: https://github.com/ruby/json/releases/tag/v2.17.1
[json-v2.18.0]: https://github.com/ruby/json/releases/tag/v2.18.0
[net-http-v0.7.0]: https://github.com/ruby/net-http/releases/tag/v0.7.0
[net-http-v0.8.0]: https://github.com/ruby/net-http/releases/tag/v0.8.0
[net-http-v0.9.0]: https://github.com/ruby/net-http/releases/tag/v0.9.0
[net-http-v0.9.1]: https://github.com/ruby/net-http/releases/tag/v0.9.1
[openssl-v3.3.2]: https://github.com/ruby/openssl/releases/tag/v3.3.2
[openssl-v4.0.0]: https://github.com/ruby/openssl/releases/tag/v4.0.0
[optparse-v0.7.0]: https://github.com/ruby/optparse/releases/tag/v0.7.0
[optparse-v0.8.0]: https://github.com/ruby/optparse/releases/tag/v0.8.0
[optparse-v0.8.1]: https://github.com/ruby/optparse/releases/tag/v0.8.1
[pp-v0.6.3]: https://github.com/ruby/pp/releases/tag/v0.6.3
[prism-v1.6.0]: https://github.com/ruby/prism/releases/tag/v1.6.0
[prism-v1.7.0]: https://github.com/ruby/prism/releases/tag/v1.7.0
[psych-v5.2.3]: https://github.com/ruby/psych/releases/tag/v5.2.3
[psych-v5.2.4]: https://github.com/ruby/psych/releases/tag/v5.2.4
[psych-v5.2.5]: https://github.com/ruby/psych/releases/tag/v5.2.5
[psych-v5.2.6]: https://github.com/ruby/psych/releases/tag/v5.2.6
[psych-v5.3.0]: https://github.com/ruby/psych/releases/tag/v5.3.0
[psych-v5.3.1]: https://github.com/ruby/psych/releases/tag/v5.3.1
[resolv-v0.6.3]: https://github.com/ruby/resolv/releases/tag/v0.6.3
[resolv-v0.7.0]: https://github.com/ruby/resolv/releases/tag/v0.7.0
[stringio-v3.1.3]: https://github.com/ruby/stringio/releases/tag/v3.1.3
[stringio-v3.1.4]: https://github.com/ruby/stringio/releases/tag/v3.1.4
[stringio-v3.1.5]: https://github.com/ruby/stringio/releases/tag/v3.1.5
[stringio-v3.1.6]: https://github.com/ruby/stringio/releases/tag/v3.1.6
[stringio-v3.1.7]: https://github.com/ruby/stringio/releases/tag/v3.1.7
[stringio-v3.1.8]: https://github.com/ruby/stringio/releases/tag/v3.1.8
[stringio-v3.1.9]: https://github.com/ruby/stringio/releases/tag/v3.1.9
[stringio-v3.2.0]: https://github.com/ruby/stringio/releases/tag/v3.2.0
[strscan-v3.1.3]: https://github.com/ruby/strscan/releases/tag/v3.1.3
[strscan-v3.1.4]: https://github.com/ruby/strscan/releases/tag/v3.1.4
[strscan-v3.1.5]: https://github.com/ruby/strscan/releases/tag/v3.1.5
[strscan-v3.1.6]: https://github.com/ruby/strscan/releases/tag/v3.1.6
[time-v0.4.2]: https://github.com/ruby/time/releases/tag/v0.4.2
[timeout-v0.4.4]: https://github.com/ruby/timeout/releases/tag/v0.4.4
[timeout-v0.5.0]: https://github.com/ruby/timeout/releases/tag/v0.5.0
[timeout-v0.6.0]: https://github.com/ruby/timeout/releases/tag/v0.6.0
[uri-v1.1.0]: https://github.com/ruby/uri/releases/tag/v1.1.0
[uri-v1.1.1]: https://github.com/ruby/uri/releases/tag/v1.1.1
[weakref-v0.1.4]: https://github.com/ruby/weakref/releases/tag/v0.1.4
[zlib-v3.2.2]: https://github.com/ruby/zlib/releases/tag/v3.2.2
[power_assert-v3.0.0]: https://github.com/ruby/power_assert/releases/tag/v3.0.0
[power_assert-v3.0.1]: https://github.com/ruby/power_assert/releases/tag/v3.0.1
[rake-v13.3.0]: https://github.com/ruby/rake/releases/tag/v13.3.0
[rake-v13.3.1]: https://github.com/ruby/rake/releases/tag/v13.3.1
[test-unit-3.6.8]: https://github.com/test-unit/test-unit/releases/tag/3.6.8
[test-unit-3.6.9]: https://github.com/test-unit/test-unit/releases/tag/3.6.9
[test-unit-3.7.0]: https://github.com/test-unit/test-unit/releases/tag/3.7.0
[test-unit-3.7.1]: https://github.com/test-unit/test-unit/releases/tag/3.7.1
[test-unit-3.7.2]: https://github.com/test-unit/test-unit/releases/tag/3.7.2
[test-unit-3.7.3]: https://github.com/test-unit/test-unit/releases/tag/3.7.3
[test-unit-3.7.4]: https://github.com/test-unit/test-unit/releases/tag/3.7.4
[test-unit-3.7.5]: https://github.com/test-unit/test-unit/releases/tag/3.7.5
[rss-0.3.2]: https://github.com/ruby/rss/releases/tag/0.3.2
[net-ftp-v0.3.9]: https://github.com/ruby/net-ftp/releases/tag/v0.3.9
[net-imap-v0.5.9]: https://github.com/ruby/net-imap/releases/tag/v0.5.9
[net-imap-v0.5.10]: https://github.com/ruby/net-imap/releases/tag/v0.5.10
[net-imap-v0.5.11]: https://github.com/ruby/net-imap/releases/tag/v0.5.11
[net-imap-v0.5.12]: https://github.com/ruby/net-imap/releases/tag/v0.5.12
[net-imap-v0.5.13]: https://github.com/ruby/net-imap/releases/tag/v0.5.13
[net-imap-v0.6.0]: https://github.com/ruby/net-imap/releases/tag/v0.6.0
[net-imap-v0.6.1]: https://github.com/ruby/net-imap/releases/tag/v0.6.1
[net-imap-v0.6.2]: https://github.com/ruby/net-imap/releases/tag/v0.6.2
[net-smtp-v0.5.1]: https://github.com/ruby/net-smtp/releases/tag/v0.5.1
[matrix-v0.4.3]: https://github.com/ruby/matrix/releases/tag/v0.4.3
[prime-v0.1.4]: https://github.com/ruby/prime/releases/tag/v0.1.4
[rbs-v3.8.1]: https://github.com/ruby/rbs/releases/tag/v3.8.1
[rbs-v3.9.0.dev.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.dev.1
[rbs-v3.9.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.1
[rbs-v3.9.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.9.0.pre.2
[rbs-v3.9.0]: https://github.com/ruby/rbs/releases/tag/v3.9.0
[rbs-v3.9.1]: https://github.com/ruby/rbs/releases/tag/v3.9.1
[rbs-v3.9.2]: https://github.com/ruby/rbs/releases/tag/v3.9.2
[rbs-v3.9.3]: https://github.com/ruby/rbs/releases/tag/v3.9.3
[rbs-v3.9.4]: https://github.com/ruby/rbs/releases/tag/v3.9.4
[rbs-v3.9.5]: https://github.com/ruby/rbs/releases/tag/v3.9.5
[rbs-v3.10.0.pre.1]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.1
[rbs-v3.10.0.pre.2]: https://github.com/ruby/rbs/releases/tag/v3.10.0.pre.2
[rbs-v3.10.0]: https://github.com/ruby/rbs/releases/tag/v3.10.0
[debug-v1.11.1]: https://github.com/ruby/debug/releases/tag/v1.11.1
[base64-v0.3.0]: https://github.com/ruby/base64/releases/tag/v0.3.0
[bigdecimal-v3.2.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.0
[bigdecimal-v3.2.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.1
[bigdecimal-v3.2.2]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.2
[bigdecimal-v3.2.3]: https://github.com/ruby/bigdecimal/releases/tag/v3.2.3
[bigdecimal-v3.3.0]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.0
[bigdecimal-v3.3.1]: https://github.com/ruby/bigdecimal/releases/tag/v3.3.1
[bigdecimal-v4.0.0]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.0
[bigdecimal-v4.0.1]: https://github.com/ruby/bigdecimal/releases/tag/v4.0.1
[drb-v2.2.3]: https://github.com/ruby/drb/releases/tag/v2.2.3
[syslog-v0.3.0]: https://github.com/ruby/syslog/releases/tag/v0.3.0
[csv-v3.3.3]: https://github.com/ruby/csv/releases/tag/v3.3.3
[csv-v3.3.4]: https://github.com/ruby/csv/releases/tag/v3.3.4
[csv-v3.3.5]: https://github.com/ruby/csv/releases/tag/v3.3.5
