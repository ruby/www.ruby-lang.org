---
layout: news_post
title: "Ruby 2.3.0 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2015-12-25 17:00:00 +0000
lang: zh_tw
---

我們很高興的宣佈 Ruby 2.3.0 發佈了。

Ruby 2.3.0 是 Ruby 2.3.0 版本的第一個穩定版。
包含了許多新功能，譬如：

新增[冰凍字串常量編譯指示（Frozen String Literal Pragma）](https://bugs.ruby-lang.org/issues/11473)
。Ruby 2.1 針對了 `"str".freeze` 進行優化，減少了物件的佔用空間。Ruby 2.3 引入了新的魔法註解以及命令行選項，用來指定一個檔案裡的字串，全部默認為無法修改的字串（Frozen String）。除此之外，在除錯時也可以透過使用 `--debug=frozen-string-literal` 來找到 `"can't modify frozen String"` 錯誤發生的地方。

[安全調用運算子](https://bugs.ruby-lang.org/issues/11537)（[又稱孤獨運算子](https://instagram.com/p/-M9l6mRPLR/) `&.`），引入了 C#、Groovy 以及 Swift 都有的安全調用運算子，用來簡化 `nil` 的處理：`obj&.foo`。另新增了 `Array#dig` 和 `Hash#dig` 方法。注意，安全調用運算子的行為和 [Active Support 的 try!](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21)一樣，僅處理 `nil`。

[did_you_mean 納入標準函式庫](https://bugs.ruby-lang.org/issues/11252)。did_you_mean gem 針對 `NameError` 以及 `NoMethodError` 會顯示可能的正確拼寫，進而簡化除錯。

引入 [RubyVM::InstructionSequence#to_binary 和 .load_from_binary](https://bugs.ruby-lang.org/issues/11788) 作為實驗性的功能，用來實作 ISeq（bytecode）預編譯系統。

Ruby 2.3 包含了效能優化。比如，
[重理了方法進入點的資料結構](https://bugs.ruby-lang.org/issues/11278),
[引入了新的資料表結構](https://bugs.ruby-lang.org/issues/11420),
[優化了 Proc#call](https://bugs.ruby-lang.org/issues/11569),
machine code level tuning for object allocation and method calling code,
[實體變數使用了更智能的資料結構](https://bugs.ruby-lang.org/issues/11170),
[Socket 和 I/O 允許使用 “exceptions” 關鍵字來達到高效能非組塞式 I/O](https://bugs.ruby-lang.org/issues/11229)
and so on. Check "Implementation improvements" section in NEWS file.

完整新功能清單與相容性說明，請參考 [NEWS](https://github.com/ruby/ruby/blob/v2_3_0/NEWS) 以及 [ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog)。

自 Ruby v2.2.0 以來，計有 [2946 變更的檔案，程式碼新增 104057 行，移除 59478 行](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0)！

聖誕快樂，佳節愉快，享受與 Ruby 2.3 編程的時光吧！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
