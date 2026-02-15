---
layout: news_post
title: "Ruby 2.0.0-p247 發佈"
author: "nagachika"
translator: "Juanito Fatas"
date: 2013-06-27 11:00:03 +0000
lang: zh_tw
---

2013 年 06 月 27 日，Ruby 2.0.0-p247 發佈了。

本次發行版包含了與 OpenSSL 安全有關的修復。

* [Hostname check bypassing vulnerability in SSL client
  (CVE-2013-4073)](/en/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

並修復了一些其它的錯誤。

## 下載

你可以從這些地方來下載 Ruby 2.0.0-p247：

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2)

      大小:   10804581 bytes
      MD5:    60913f3eec0c4071f44df42600be2604
      SHA256: 08e3d4b85b8a1118a8e81261f59dd8b4ddcfd70b6ae554e0ec5ceb99c3185e8a

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz)

      大小:   13652782 bytes
      MD5:    c351450a0bed670e0f5ca07da3458a5b
      SHA256: 3e71042872c77726409460e8647a2f304083a15ae0defe90d8000a69917e20d3

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip)

      大小:   15100206 bytes
      MD5:    7548f781d868456e84afcd0327c7f894
      SHA256: 40c938238075b1e7e8df5d7ebfd069a45b93066318d91da9024d81b20a1c5a8a

## 變更

主要的修復如下：

參見 [tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5)
以及 [ChangeLog](https://github.com/ruby/ruby/blob//v2_0_0_247/ChangeLog) 來了解更多細節。

### 關鍵字參數 (keyword arguments)

* [#8040](https://bugs.ruby-lang.org/issues/8040) 更改了必要參數（mandatory arguments）與關鍵字參數的優先權。
* [#8416](https://bugs.ruby-lang.org/issues/8416) 修復有名字或匿名的 `**` 參數，不會呼叫 `super` 的錯誤。
* [#8463](https://bugs.ruby-lang.org/issues/8463) 修復 `Proc` 會自動展開 splat 參數的錯誤。

### VM/語言處理

* [#8424](https://bugs.ruby-lang.org/issues/8424) 修復當 `TH_PUSH_TAG()` 堆疊滿出時的無窮迴圈。
* [#8436](https://bugs.ruby-lang.org/issues/8436) 修復在 `eval` 綁定內無法使用 \__dir__ 的錯誤。
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API：修復使用 `next` 不會觸發 `B_RETURN_EVENT` 的錯誤。
* [#8341](https://bugs.ruby-lang.org/issues/8341) 修復 `block_given?`：實際的區塊與使用 `.to_proc` 方法所產生的區塊，在不同呼叫之中不會消失的錯誤。
* [#8531](https://bugs.ruby-lang.org/issues/8531) 修復 `block_given?`：實際的區塊與使用 `.to_proc` 方法所產生的區塊，在不同呼叫之中不會消失的錯誤。

### RubyGems

更新與 Ruby 2.0.0-p247 綁定的 RubyGems 版本至 2.0.3。

### 編碼

* [#8516](https://bugs.ruby-lang.org/issues/8516) 修復 IO#readchar 轉換編碼時會回傳錯誤編碼位置（code point）的錯誤。

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) 修復 `File.read()` 在 32 位元的 WIN32SP3 的錯誤。

### 標準函式庫

* [#8467](https://bugs.ruby-lang.org/issues/8467) 修復遍歷與倒回 gzipped IO 所導致的記憶段錯誤錯誤。
* [#8415](https://bugs.ruby-lang.org/issues/8415) 修復 Net::IMAP#capability_response 針對常見 CAPABILITY 卻拋出 "Net::IMAP::ResponseParseError: unexpected token CRLF" 的錯誤。

## 發佈後記

這次的發行版要感謝許多提交者、測試者以及熱心回報錯誤的使用者的幫助，感謝他們的貢獻。
