---
layout: news_post
title: "Ruby 2.4.0-preview1 發布"
author: "naruse"
translator: "Alex S"
date: 2016-06-20 18:00:00 +0900
lang: zh_tw
---

我們高興地宣布 Ruby 2.4.0-preview1 發布了。

Ruby 2.4.0-preview1 是 Ruby 2.4.0 的首個預覽版。
這個預覽版的發布比平常早一點，因為它包括了很多新功能和改進。
敬請給我們[反饋](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)，因為你還可以改變一些功能。

## [統一 Fixnum 和 Bignum 為 Integer]((https://bugs.ruby-lang.org/issues/12005)

雖然 [ISO/IED 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579) 
沒有明確指定 Integer 類的細節，CRuby 有兩個顯式的 Integer 類：Fixnum 和 Bignum。
Ruby 2.4 把它們統一為 Integer。

## [字符串支持 Unicode 大小寫及其他類型](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` 現在可以做 Unicode 的的大小寫及其他類型，而不僅僅是 ASCII 類型轉換。

## 性能提升

Ruby 2.4 還包括以下性能提升，和一些語法改進：

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` and `[x, y].min` 被優化，不會某些情況下創建臨時數組。

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

添加 `Regexp#match?`，它只做正則匹配，而不會創建後向引用對象和改變 `$~`，可以減少對象的創建。

### 其他性能提升

* [提速實例變量的訪問](https://bugs.ruby-lang.org/issues/12274)

## 調試

### [Thread#report_on_exception 和 Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby 忽視線程中的異常，除非另一個線程顯式地執行直至結束。
通過設置 `report_on_exception = true`，你會注意到如果一個線程終止了因為未處理的異常。

請向我們反饋 `report_on_exception` 的默認值應該是什麼和垃圾回收報告。

### [線程死鎖檢查現在會顯示線程的棧和依賴](https://bugs.ruby-lang.org/issues/8214)

Ruby 在線程等待地時候會進行死鎖檢查，但是檢查的結果沒有足夠的信息用來調試。
Ruby 2.4 死鎖檢查會顯示他們的棧信息和依賴線程。

嘗試並且享受用與 Ruby 2.4.0-preview1 的編碼時光，有任何問題，敬請[反饋](https://bugs.ruby-lang.org/projects/ruby/wiki/HowToReport)!

## 自 2.3 起顯著的改變

請參閱 [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS) 和
[ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
來進一步了解。

以上變化自 Ruby 2.3.0 以來，計有 1140 個文件變更，新增代碼 33126 行，移除了 50993 行！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## 發布記

其他資訊請參考發布日程安排：

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-trunk/wiki/ReleaseEngineering24)