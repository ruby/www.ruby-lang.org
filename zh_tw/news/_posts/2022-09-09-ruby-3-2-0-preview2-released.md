---
layout: news_post
title: "Ruby 3.2.0 Preview 2 發布"
author: "naruse"
translator: "Bear Su"
date: 2022-09-09 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.2.0-preview2" | first %}

我們很高興宣佈 Ruby {{ release.version }} 發佈了. Ruby 3.2 新增許多新功能及效能提升.


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


### 相關連結

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)

## Regexp 逾時設定

新增 Regexp matching 的逾時設定。

```ruby
Regexp.timeout = 1.0

/^a*b?a*$/ =~ "a" * 50000 + "x"
#=> 1 秒後拋出 Regexp::TimeoutError
```

眾所皆知 Regexp matching 所花的時間可能會非預期的久。如果您的程式使用效率可能較低的 Regexp 來比對不可信的輸入內容，攻擊者可能可以藉此來發動服務阻斷攻擊。(稱為 Regular expression DoS, or ReDoS)。

根據您的 Ruby 應用程式需求，可以透過設定 `Regexp.timeout` 來避免或是減輕被 DoS 的風險。請在您的應用程式中嘗試使用，我們歡迎您的任何建議。

注意 `Regexp.timeout` 是全域設定。如果您想要為一些特定的 Regexps 使用不同的逾時設定，您可以在呼叫 `Regexp.new` 時使用 `timeout` keyword。

```ruby
Regexp.timeout = 1.0

# 這個 regexp 沒有超時設定
long_time_re = Regexp.new("^a*b?a*$", timeout: nil)

long_time_re =~ "a" * 50000 + "x" # 不會被中斷
```

最初提案：https://bugs.ruby-lang.org/issues/17837


## 其他值得注意的新功能

### 不再綑綁第三方原始碼

* 我們不再綑綁第三方原始碼像是 `libyaml`, `libffi`。

    * psych 中的 libyaml 原始碼已經被移除。您可能需要在 Ubuntu/Debian 平台上安裝 `libyaml-dev`。 每個平台上的套件名稱有所不同。

    * libffi 將在 preview2 從 `fiddle` 中移除。

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

### YJIT

* 支援 arm64 / aarch64 架構的 UNIX 平台。
* 建置 YJIT 時需要 Rust 1.58.1+ 。 [[Feature #18481]]

## 自 3.1 以來其他值得注意的變更

* Hash
    * 當 hash 為空時， Hash#shift 現在總是回傳 nil，取代以往回傳預設值或呼叫預設的 proc。 [[Bug #16908]]

* MatchData
    * 已新增 MatchData#byteoffset。 [[Feature #13110]]

* Module
    * 已新增 Module.used_refinements。 [[Feature #14332]]
    * 已新增 Module#refinements。 [[Feature #12737]]
    * 已新增 Module#const_added。 [[Feature #17881]]

* Proc
    * Proc#dup 回傳子類別的實體。 [[Bug #17545]]
    * Proc#parameters 現在接受 lambda keyword。 [[Feature #15357]]

* Refinement
    * 已新增 Refinement#refined_class。 [[Feature #12737]]

* Set
    * Set 現在可以直接使用，不再需要先 `require "set"`。 [[Feature #16989]]
      目前是透過 `Set` 常數或呼叫 `Enumerable#to_set` 來自動載入。

* String
    * 已新增 String#byteindex 和 String#byterindex。 [[Feature #13110]]
    * 更新 Unicode 至 Version 14.0.0 和 Emoji Version 14.0。 [[Feature #18037]] (也適用於 Regexp)
    * 已新增 String#bytesplice。  [[Feature #18598]]

* Struct
    * `Struct.new` 不需要傳入 `keyword_init: true` 也可以透過 keyword 參數初始化。 [[Feature #16806]]

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

* `Psych` 不再綑綁 libyaml 原始碼.
  使用者需要透過套件管理系統自行安裝 libyaml 函式庫。 [[Feature #18571]]

## C API 更新

### 被移除的 C APIs

下列廢棄的 APIs 已被移除。

* `rb_cData` 變數。
* "taintedness" 和 "trustedness" 函式. [[Feature #16131]]

### 標準函式庫更新

*   下列的預設 gem 已被更新。

    * TBD

*   下列的 bundled gem 已被更新。

    * TBD

*   下列的預設 gem 現在是 bundled gems。你需要在 bundler 環境下將這些函式庫加入到 `Gemfile` 中。

    * TBD

參見 [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
和 [commit logs](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}) 來了解更多。

自 Ruby 3.1.0 以來，計 [{{ release.stats.files_changed }} 檔案變更, {{ release.stats.insertions }} 行新增 (+), {{ release.stats.deletions }} 行刪減 (-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)！

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



[Feature #12005]: https://bugs.ruby-lang.org/issues/12005
[Feature #12655]: https://bugs.ruby-lang.org/issues/12655
[Feature #12737]: https://bugs.ruby-lang.org/issues/12737
[Feature #13110]: https://bugs.ruby-lang.org/issues/13110
[Feature #14332]: https://bugs.ruby-lang.org/issues/14332
[Feature #15231]: https://bugs.ruby-lang.org/issues/15231
[Feature #15357]: https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:     https://bugs.ruby-lang.org/issues/15928
[Feature #16131]: https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:     https://bugs.ruby-lang.org/issues/16466
[Feature #16806]: https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:     https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:     https://bugs.ruby-lang.org/issues/16908
[Feature #16989]: https://bugs.ruby-lang.org/issues/16989
[Feature #17351]: https://bugs.ruby-lang.org/issues/17351
[Feature #17391]: https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:     https://bugs.ruby-lang.org/issues/17545
[Feature #17881]: https://bugs.ruby-lang.org/issues/17881
[Feature #18037]: https://bugs.ruby-lang.org/issues/18037
[Feature #18159]: https://bugs.ruby-lang.org/issues/18159
[Feature #18351]: https://bugs.ruby-lang.org/issues/18351
[Bug #18487]:     https://bugs.ruby-lang.org/issues/18487
[Feature #18571]: https://bugs.ruby-lang.org/issues/18571
[Feature #18585]: https://bugs.ruby-lang.org/issues/18585
[Feature #18598]: https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:     https://bugs.ruby-lang.org/issues/18625
[Bug #18633]:     https://bugs.ruby-lang.org/issues/18633
[Feature #18685]: https://bugs.ruby-lang.org/issues/18685
[Bug #18782]:     https://bugs.ruby-lang.org/issues/18782
[Feature #18788]: https://bugs.ruby-lang.org/issues/18788
[Feature #18809]: https://bugs.ruby-lang.org/issues/18809
[Feature #18481]: https://bugs.ruby-lang.org/issues/18481
