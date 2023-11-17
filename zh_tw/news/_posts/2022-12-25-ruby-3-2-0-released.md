---
layout: news_post
title: "Ruby 3.2.0 發布"
author: "naruse"
translator: "Bear Su"
date: 2022-12-25 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

我們很高興宣佈 Ruby {{ release.version }} 發佈了。Ruby 3.2 新增許多新功能及效能提升。


## 基於 WASI 的 WebAssembly 支援

這是首次基於 WASI 支援 WebAssembly。使得 CRuby binary 可用於網頁瀏覽器、Serverless Edge 環境、與其他 WebAssembly/WASI 嵌入式環境. 目前已通過 basic 與 bootstrap 測試，但不包括 Thread API。

![](https://i.imgur.com/opCgKy2.png)

### 背景

[WebAssembly (Wasm)](https://webassembly.org/) 最初是為了在網頁瀏覽器中安全快速地執行程式。但其目標 - 在不同的環境上安全又有效率的執行程式，不僅是 web 應用程式，也是其他一般應用程式的目標。

[WASI (The WebAssembly System Interface)](https://wasi.dev/) 被設計用於此使用場景。 儘管應用程式需要與作業系統溝通，但 WebAssembly 卻是運行在沒有系統介面的虛擬機中。WASI 將其標準化了。

Ruby 中的 WebAssembly/WASI 支援透過這些專案，允許 Ruby 開發者可以開發在相容此功能的平台上執行的應用程式。

### 使用場景

此支援功能使得開發者可以在 WebAssembly 環境上使用 CRuby。 其中一個範例就是 [TryRuby playground](https://try.ruby-lang.org/playground/) 的 CRuby 支援。現在您可以在您的網頁瀏覽器上嘗試原生的 CRuby。

### 技術特點

因為目前 WASI 和 WebAssembly 不斷地再改進與安全性理由，仍缺少一些功能來實現 Fiber、異常、和 GC。所以 CRuby 透過使用 Asyncify，一個在使用者空間的 binary 轉換技術，來彌補中間的差距。

並且，我們建置了 [a VFS on top of WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby)，讓我們可以很容易地將 Ruby 應用程式打包成單一 .wasm 檔案。簡化了 Ruby 應用程式的分發過程。

### Related links

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)


## 適用於生產環境的 YJIT

![](https://i.imgur.com/X9ulfac.png)

* YJIT 不再是實驗性功能。
    * 經過一年以上的生產工作負載測試，已證明相當穩定。
* YJIT 現在支援 x86-64 和 arm64/aarch64 架構的 Linux、MacOS、BSD 和其他 UNIX 平台。
    * 此發佈支援 Apple M1/M2、AWS Graviton、Raspberry Pi 4 和更多。
* 建置 YJIT 時需要 Rust 1.58.1+ 。 [[Feature #18481]]
    * 為了確保使用 YJIT 建置 CRuby，請安裝 rustc >= 1.58.0 並在執行 `./configure` 時加入 `--enable-yjit`。
    * 若執行時遇到任何問題請聯絡 YJIT 團隊。
* YJIT 3.2 版本比 3.1 更快，且耗用的記憶體開銷約為 1/3。
  * 整體而言，YJIT 在 [yjit-bench](https://github.com/Shopify/yjit-bench) 上比 Ruby 直譯器快 41%（幾何平均值）。
  * JIT 程式碼的物理記憶體是延遲分配的。與 Ruby 3.1 不同，Ruby process 的 RSS 被最小化，因為由 `--yjit-exec-mem-size` 分配的虛擬記憶體分頁在被 JIT 程式碼實際使用之前不會被映射到物理記憶體分頁。
  * 導入 Code GC，當 JIT 程式碼使用的記憶體達到 `--yjit-exec-mem-size` 時釋放所有 code pages。
  * `RubyVM::YJIT.runtime_stats` 除了現有的 `inline_code_size` 和 `outlined_code_size`，還會回傳 Code GC 指標
    `code_gc_count`、`live_page_count`、`freed_page_count`、和 `freed_code_size`。
* 大部分由 `RubyVM::YJIT.runtime_stats` 產生的統計資料可以在建置發佈時使用。
    * 只需要使用 `--yjit-stats` 執行 ruby 計算並輸出統計資料 (會產生一些運行開銷)。
* YJIT 現在經過最佳化可以使用 Object Shapes。[[Feature #18776]]
* 利用更細粒度的常數失效來在定義新常數時減少失效的程式碼。 [[Feature #18589]]
* `--yjit-exec-mem-size` 預設值改為 64 (MiB)。
* `--yjit-call-threshold` 預設值改為 30。

## Regexp 增強 ReDoS 防禦

眾所皆知 Regexp matching 所花的時間可能會非預期的久。如果您的程式使用效率可能較低的 Regexp 來比對不可信的輸入內容，攻擊者可能可以藉此來發動服務阻斷攻擊。(稱為 Regular expression DoS, or ReDoS)。

我們進行了兩項改進，可以顯著降低 ReDos 攻擊的影響。

### Improved Regexp matching algorithm

從 Ruby 3.2 開始，透過使用 memoization 技術，Regexp 的比對演算法得到了很大的改進。

```
# 這個比對在 Ruby 3.1 需要花費 10 秒。 而在 Ruby 3.2 只需要花費 0.003 秒。

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

改進後的演算法使得大部分的 Regexp (我們實驗中的 90%) 可以在線性時間內完成。

這個改善可能會花費與輸入長度成比例的記憶體。我們預期這不會有實際問題，因為這種記憶體分配通常都會延遲，而正常的 Regexp 最多可花費輸入長度 10 倍的記憶體。如果您在現實場景中使用 Regexp 進行比對時遇到記憶題不足的問題，請向我們回報。

最初提案： <https://bugs.ruby-lang.org/issues/19104>

### Regexp 逾時設定

上述的改善無法套用在某些 Regexp，像是包含進階功能 (例如：back-references 或是 look-around)，或有大量固定重複次數。作為備案，我們在 Regexp 比對中導入了逾時設定。


```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> 1 秒後拋出 Regexp::TimeoutError
```

注意 `Regexp.timeout` 是全域設定。如果您想要為一些特定的 Regexps 使用不同的逾時設定，您可以在呼叫 `Regexp.new` 時使用 `timeout` keyword。

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # 不會被中斷
```

最初提案：<https://bugs.ruby-lang.org/issues/17837>

## 其他值得注意的新功能

### SyntaxSuggest

* `syntax_suggest`(前 `dead_end`)功能已整合進 Ruby 了。這可以幫助您找到錯誤所在的位置，例如缺少或多餘的 `end`，以便您能更快修正，例如以下範例：

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
  ```

  [[Feature #18159]]


### ErrorHighlight

* 現在會指向 TypeError 和 ArgumentError 相關的參數。

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

### 語言功能

* 除了作為方法參數，匿名不定長度參數現在也可以傳遞為其他方法的參數。
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* 只接收單一參數的 proc 將不會自動解開封裝。 [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 與之前的版本
  # => 1
  # Ruby 3.2 與之後的版本
  # => [1, 2]
  ```

* 常數賦值評估順序將與單一屬性賦值評估順序保持一致。參考以下程式碼:

    ```ruby
    foo::BAR = baz
    ```

  `foo` 現在會在 `baz` 之前被呼叫。同樣地，在有多個賦值給常數的情況，會使用從左至右的順序評估。參考以下程式碼:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  現在使用下面的評估顺序:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Find pattern 不再是實驗性功能。
  [[Feature #18585]]

* 使用不定長度參數 (例如 `*args`) 的方法，如果同時希望可以作為 keyword 參數傳遞給 `foo(*args)`。必須標記為 `ruby2_keywords` (若還未標記)。
  換句話說，希望作為接收 keyword 參數的其他方法都毫無例外地必須標記為 `ruby2_keywords`。若某個函式庫需要使用 Ruby 3+，這會是一個較為容易的過渡升級方法。
  在此之前，當接受方法取得 `*args`時會保留 `ruby2_keywords` 標記，但這是一個錯誤且行為不一致。
  對於找到可能缺少 `ruby2_keywords` 標記的好方法是執行測試，在測試失敗的地方，找到最後一個接收 keyword 參數的方法，在哪裡使用 `puts nil, caller, nil`，並檢查每一個在呼叫鏈上的方法/區塊，是否都被正確地標記為 `ruby2_keywords`。[[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # 意外地 Ruby 2.7-3.1 在沒有 ruby2_keywords 的情況下可以成功
    # 執行，但在 3.2+ 卻是必需的。若需移除 ruby2_keywords，
    # #foo 和 #bar 需要將參數改成 (*args, **kwargs) 或 (...)
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## 效能提升

### MJIT

* MJIT 編譯器在 Ruby 已重新實作為標準函式庫 `ruby_vm/mjit/compiler`。
* MJIT 編譯器在 forked process 下執行，而不是在名為 MJIT worker 的原生執行緒下工作。[[Feature #18968]]
    * 因此，不再支援 Microsoft Visual Studio (MSWIN)。
* 不再支援 MinGW。[[Feature #18824]]
* 重新命名 `--mjit-min-calls` 為 `--mjit-call-threshold`.
* 將 `--mjit-max-cache` 預設值從 10000 改為 100。

### PubGrub

* Bundler 2.4 現在使用 [PubGrub](https://github.com/jhawthorn/pub_grub) resolver 而不是 [Molinillo](https://github.com/CocoaPods/Molinillo)。
  * PubGrub 是 Dart 程式語言的 `pub` 套件管理器使用的下一代求解演算法。
  * 這個變更可能會導致您得到不同的解析結果。請回報問題至 [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)。

* 在 Ruby 3.2，RubyGems 仍然使用 Molinillo resolver。我們計畫未來用 PubGrub 取代。

## 自 3.1 以來其他值得注意的變更

* Data
    * 新增了一個核心類別來表示簡單的不可變值物件。該類別類似於 Struct 並部分共用實作，但具有更精簡和嚴格的 API。 [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * 當 hash 為空時，`Hash#shift` 現在總是回傳 nil，取代以往回傳預設值或呼叫預設的 proc。 [[Bug #16908]]

* MatchData
    * 已新增 `MatchData#byteoffset`。 [[Feature #13110]]

* Module
    * 已新增 `Module.used_refinements`。 [[Feature #14332]]
    * 已新增 `Module#refinements`。 [[Feature #12737]]
    * 已新增 `Module#const_added`。 [[Feature #17881]]

* Proc
    * `Proc#dup` 回傳子類別的實體。 [[Bug #17545]]
    * `Proc#parameters` 現在接受 lambda keyword。 [[Feature #15357]]

* Refinement
    * 已新增 `Refinement#refined_class`。 [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * `parse`、`parse_file` 和 `of` 新增 `error_tolerant` 選項。[[Feature #19013]] 使用這個選項：
        1. SyntaxError 會被抑制
        2. 無效的輸入會回傳 AST
        3. 當解析器到達輸入結尾時但缺少 `end` 時會補充 `end`
        4. `end` 會基於縮排視為關鍵字

        ```ruby
        # Without error_tolerant option
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # With error_tolerant option
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` is treated as keyword based on indent
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * `parse`, `parse_file` 和 `of` 新增 `keep_tokens` 選項。 [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set 現在可以直接使用，不再需要先 `require "set"`。 [[Feature #16989]]
      目前是透過 `Set` 常數或呼叫 `Enumerable#to_set` 來自動載入。

* String
    * 已新增 `String#byteindex` 和 `String#byterindex`。 [[Feature #13110]]
    * 更新 Unicode 至 Version 15.0.0 和 Emoji Version 15.0。 [[Feature #18639]] (也適用於 Regexp)
    * 已新增 `String#bytesplice`。  [[Feature #18598]]

* Struct
    * `Struct.new` 不需要傳入 `keyword_init: true` 也可以透過 keyword 參數初始化。 [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # 從 Ruby 3.2 開始，以下程式碼也能在沒有 keyword_init: true 的情況下工作。
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

## 相容性問題

注意：不包含功能問題的修正。

### 被移除的常數

下列廢棄的常數已被移除。

* `Fixnum` 和 `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### 被移除的方法

下列廢棄的方法已被移除。

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Stdlib 相容性問題

### 不再綑綁第三方原始碼

* 我們不再綑綁第三方原始碼像是 `libyaml`, `libffi`。

    * psych 中的 libyaml 原始碼已經被移除。您可能需要在 Ubuntu/Debian 平台上安裝 `libyaml-dev`。 每個平台上的套件名稱有所不同。

    * `fiddle` 中綑綁的 libffi 原始碼也已經移除。

* Psych 和 fiddle 支援指定 libyaml 和 libffi 原始碼版本來靜態建置。您可以使用 libyaml-0.2.5 建置 psych 像是：

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    您也能使用 libffi-3.4.4 建置 fiddle，像是：

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## C API 更新

### 更新的 C APIs

The following APIs are updated.

* PRNG 更新
  * `rb_random_interface_t` 更新版本。
    使用此舊版介面建置的擴展函式庫還需要定義 `init_int32` 函式。

### 被移除的 C APIs

下列廢棄的 APIs 已被移除。

* `rb_cData` 變數。
* "taintedness" 和 "trustedness" 函式. [[Feature #16131]]

### 標準函式庫更新

* Bundler

    * bundle gem 新增 --ext=rust 支援，以便建立使用 Rust extensions 的簡單 gem。
      [[GH-rubygems-6149]]
    * 加速 cloning git repos。 [[GH-rubygems-4475]]

* RubyGems

    * cargo builder 新增 mswin 支援。 [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape` 變得比 `CGI.escapeHTML` 更快.
        * 當不需要跳脫任何字元時，不再分配 String 物件。
        * 當參數已經是 String 物件時，不再呼叫 `#to_s` 方法。
        * `ERB::Escape.html_escape` 已作為 `ERB::Util.html_escape` 的別名，尚未被 Rails monkey-patched。

* IRB

    * debug.gem 整合指令已新增：`debug`、`break`、`catch`,
      `next`、`delete`、`step`、`continue`、`finish`、`backtrace`、`info`
        * 即使您的 Gemfile 中沒有加入 `gem "debug"`，依然能夠使用它們。
        * 參見: [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * 已新增更多 Pry-like 指令與功能。
        * 已新增 `edit` 和 `show_cmds` (類似 Pry 的 `help`)。
        * `ls` 使用 `-g` 或 `-G` 選項來過濾輸出。
        * `show_source` 新增別名 `$` 並接受不含引號的輸入。
        * `whereami` 新增別名 `@`。

*   更新了以下的預設 gem。

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   更新了以下的 bundled gem。

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

請參閱 GitHub 發布如 [GitHub Releases of Logger](https://github.com/ruby/logger/releases) 和變更紀錄來了解更多關於預設 gems 與 bundled gems 的資訊。

參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}) 來了解更多。

自 Ruby 3.1.0 以來，計 [{{ release.stats.files_changed }} 檔案變更, {{ release.stats.insertions }} 行新增 (+), {{ release.stats.deletions }} 行刪減 (-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)！

聖誕快樂、佳節愉快，享受用 Ruby 3.2 寫程式的時光。

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

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
