---
layout: news_post
title: "Ruby 2.6.0-preview1 已發佈"
author: "naruse"
translator: "Delton Ding"
date: 2018-02-24 00:00:00 +0000
lang: zh_tw
---

我們高興地宣佈 Ruby 2.6.0-preview1 已發佈。

Ruby 2.6.0-preview1 是 Ruby 2.6.0 的首個預覽版本。此次 preview1 發佈比以往早，因為其包括了重要新功能：JIT。

## JIT

Ruby 2.6 引入了 JIT (Just-in-time) 編譯器的初始實作。

JIT 編譯器旨在提升任何 Ruby 程式的執行速度。不同於其他語言中常見的 JIT 編譯器，Ruby 的 JIT 編譯器進行 JIT 編譯的過程非常獨特。其將生成的 C 程式碼寫到硬碟並 spwan 常見的 C 編譯器進行目的碼的生成工作。詳見：[Vladimir Makarov 的 MJIT Organization](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)。

如何使用：在終端或 `$RUBYOPT` 環境變數中指定 `--jit` 參數。指定 `--jit-verbose=1` 將允許列印 JIT 編譯過程中的除錯訊息。詳見 `ruby --help` 查看更多的選項。

此 JIT 發佈的主要目的是檢查平台的相容性，以及在 2.6 版本發佈前找出安全風險。目前 JIT 編譯器只當 Ruby 由 gcc 或 clang 編譯后編譯器仍可被運行環境發現時可用，除此之外你暫時無法使用 JIT。

作為 2.6.0-preview1，我們在為 JIT 的基礎設施作準備，所以實作了很少的優化。你可以通過此版本中的 micro benchmarks 測量出潛在的效能提升，但這並**不是**準備好接受最終效能測試的 Ruby JIT 編譯器，特別是對於大型應用，例如 Rails 的測試。

我們正著手實作 JIT 編譯器的內聯方法，這將有助於大幅提升 Ruby 的效能。此外，我們計劃支持更多平台，而下一個目標是支持 Visual Studio。

請保持對 Ruby 新時代效能的關注。

## 新功能

* 新增 `Random.bytes`。[Feature #4938]

* 新增 `Binding#source_location`。[Feature #14230]

  此方法以一個二元組陣列 `__FILE__` and `__LINE__` 的形式返回 `binding` 的原始碼路徑。傳統上，這可以通過執行 `eval("[__FILE__, __LINE__]", binding)` 來獲得相同的資料。但我們計劃改變這一行為讓 `Kernel#eval` 忽略 `binding` 的原始碼路徑 [Bug #4352]。所以，用戶需要通過新加入的方法來替代之前的 `Kernel#eval`。

* 增加 `:exception` 選項，以讓 `Kernel.#system` 拋出例外而不是返回 `false`。[Feature #14386]

## 效能提升

* 提升 `Proc#call` 的速度，因為我們無需再關心 `$SAFE`。[Feature #14318]

  通過 `lc_fizzbuzz` 多次使用 `Proc#call` 的基準化測試，我們測得了 1.4 倍效能提升 [Bug #10212]。

* 提升了當 `block` 是 block 參數時 `block.call` 的效能。[Feature #14330]

  Ruby 2.5 提升了 block 傳遞的效能。[Feature #14045] 另外，Ruby 2.6 提升了傳遞 block 調用時的效能。通過 micro-benchmark 我們測得了 2.6 倍效能提升。

## 自 2.5 起重要的變化

* `$SAFE` 成為了 Process 全域狀態，我們可以再次將其設為 `0`。[Feature #14250]

* 不再建議將 `safe_level` 參數傳遞給 `ERB.new` 的行為。`trim_mode` 和 `eoutvar` 参数被轉換成了關鍵詞參數。[Feature #14256]

* 合併 RubyGems 2.7.6

見 [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview1/NEWS) 或 [commit 記錄](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)來進一步了解。

以上自 Ruby 2.5.0 計有 [1115 個文件變更，新增代碼 23023 行，移除了 14748 行](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)！

今天 2 月 24 日，是 Ruby 25 週年的生日。祝 Ruby 生日快樂，享受 Ruby 2.6.0-preview1 吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.gz>

      SIZE:   16082501 bytes
      SHA1:   94b4a2f5f992dc9855364284e9c64316bf129c90
      SHA256: 2023c42676d9237481e1a97157d5e2ecc10db5e320d5b9cf872ec1d293265d61
      SHA512: 004696c4f087333ba7cb2285418dcce70f399966ae8fed817aab9759fd2d75beb088c4aeb294fcd4260112e8422f490cd4dbdfce402d73f96bb679b8bb3e1607

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.zip>

      SIZE:   19807007 bytes
      SHA1:   24d76f67bf913348eca783a2ecf6f3faf37299ae
      SHA256: 6c883927e80430cf07f2d90728d6c2c71164223f378a48ebf964d3b66319f623
      SHA512: 1e7f318cec1b7875fd9891df671078de7585b556695a2a85708483ddcacfd6e0b63b70ec2535e92ff981b4f72063721ed552df49688e066666fcd7ae520ae667

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.bz2>

      SIZE:   14104578 bytes
      SHA1:   9f0fb79643a4673a839b0c8496eccc6e1dbd022d
      SHA256: 8bd6c373df6ee009441270a8b4f86413d101b8f88e8051c55ef62abffadce462
      SHA512: d9cb270529a97670d54f43a0236fab072714e715c39277dab70b7a1843ec818e6700e47e1384c7256f9e0ae41ab2c0b768a0de38a5ecf4f4fff5da6ef5ad4944

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.xz>

      SIZE:   11423984 bytes
      SHA1:   bbbc89d760cdaadbca3cbff587295864edeff0af
      SHA256: 1d99139116e4e245ce543edb137b2a8873c26e9f0bde88d8cee6789617cc8d0e
      SHA512: d12ff29778d8d940344619881b4d8247c2fb6b44ac2b2dbddb7078828e893cfac9a5a95b5588f0afdbed52bdb6dea95cff1b9ce3ad47dfa62209e97dab8810b6
