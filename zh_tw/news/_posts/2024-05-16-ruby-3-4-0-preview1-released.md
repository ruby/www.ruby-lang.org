---
layout: news_post
title: "Ruby 3.4.0 preview1 發布"
author: "naruse"
translator: "Bear Su"
date: 2024-05-16 00:00:00 +0000
lang: zh_tw
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview1" | first %}
我們很高興宣布 Ruby {{ release.version }} 發布了。

## 語法變更

* 沒有 `frozen_string_literal` 註解的檔案中的字串文字，現在行為會跟被凍結一樣。如果它們被修改則會發出棄用警告。
  這些警告可以透過 `-W:deprecated` 或 `Warning[:deprecated] = true` 啟用。
  若要停用此變更，您可以在執行 Ruby 時加上參數 `--disable-frozen-string-literal`。 [[Feature #20205]]

* 新增 `it` 來引用 block 的傳入參數。 [[Feature #18980]]

* 現在呼叫方法支援使用 Keyword splatting `nil`。
  `**nil` 的處理方式與 `**{}` 類似，不會傳遞 keywords，也不會呼叫任何轉換方法。 [[Bug #20064]]

* Block passing 不再允許作為索引。 [[Bug #19918]]

* 不定長度參數不再允許作為索引。 [[Bug #20218]]

## 核心類別更新

注意：我們只列出特別的類別更新。

* Exception

  * Exception#set_backtrace 現在可接受 `Thread::Backtrace::Location` 陣列。
    `Kernel#raise`、`Thread#raise` 和 `Fiber#raise` 也接受同樣的新格式。 [[Feature #13557]]

* Range

  * Range#size 如果 range 無法迭代的話，現在會拋出 TypeError。 [[Misc #18984]]

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
          from test.rb:2:in `<main>'
  ```


## C API 更新

* `rb_newobj` 和 `rb_newobj_of` (和相對應的巨集 `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) 已經被移除。 [[Feature #20265]]
* 移除已廢棄的函式 `rb_gc_force_recycle`。 [[Feature #18290]]

## 實作改善

* `Array#each` 用 Ruby 重寫並有更好的效能 [[Feature #20182]]。

## Miscellaneous changes

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
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
