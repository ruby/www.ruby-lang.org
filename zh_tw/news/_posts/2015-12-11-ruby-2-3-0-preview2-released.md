---
layout: news_post
title: "Ruby 2.3.0-preview2 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2015-12-11 14:00:00 +0000
lang: zh_tw
---

很高興告訴大家 Ruby 2.3.0-preview2 發佈了。

Ruby 2.3.0-preview2 是 Ruby 2.3.0 系列的第二個預覽版。
包含了許多改進與新功能。

引入[冰凍字串常量編譯指示（Frozen String Literal Pragma）](https://bugs.ruby-lang.org/issues/11473)。Ruby 2.1 針對了 `"str".freeze` 進行優化，減少了物件的佔用空間。Ruby 2.3 引入了新的魔法註解以及命令行選項，用來指定一個檔案裡的字串，全部默認為無法修改的字串（Frozen String）。除此之外，在除錯時也可以透過使用 `--debug=frozen-string-literal` 來找到 `"can't modify frozen String"` 錯誤發生的地方。

[安全調用運算子](https://bugs.ruby-lang.org/issues/11537)（[又稱孤獨運算子](https://instagram.com/p/-M9l6mRPLR/) `&.`），引入了 C#、Groovy 以及 Swift 都有的安全調用運算子，用來簡化 `nil` 的處理：`obj&.foo`。另新增了 `Array#dig` 和 `Hash#dig` 方法。

[did_you_mean 納入標準函式庫](https://bugs.ruby-lang.org/issues/11252)。did_you_mean gem 針對 `NameError` 以及 `NoMethodError` 會顯示可能的正確拼寫，進而簡化除錯。

引入 [RubyVM::InstructionSequence#to_binary 和 .load_from_binary](https://bugs.ruby-lang.org/issues/11788) 作為實驗性的功能，用來實作 ISeq（bytecode）預編譯系統。

Ruby 2.3 引入了許多效能優化，譬如：
[優化了 Proc#call](https://bugs.ruby-lang.org/issues/11569)、
[重新處理了方法進入點的資料結構](https://bugs.ruby-lang.org/issues/11278)、
[引入了新的資料結構：表](https://bugs.ruby-lang.org/issues/11420)，以及在機器碼層級針對了記憶體配置與方法呼叫進行了調校，以及許多其他的效能優化。

請嘗試並享受與 Ruby 2.3.0-preview2 的編碼時光，有任何問題敬請回報！

## 自 2.2 起重要的變化

請參閱 [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS) 和
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
來進一步了解。

以上變化自 Ruby 2.2.0 以來，計有 [1097 變更的檔案，程式碼新增 97466 行，移除了 58685 行](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2)。

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## 發佈記

其他資訊請參考發佈時程：

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
