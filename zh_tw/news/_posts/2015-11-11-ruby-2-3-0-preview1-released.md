---
layout: news_post
title: "Ruby 2.3.0-preview1 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2015-11-11 14:00:00 +0000
lang: zh_tw
---

很高興告訴大家 Ruby 2.3.0-preview1 發佈了。

Ruby 2.3.0-preview1 是 Ruby 2.3.0 版本的初次亮相。
包含了許多改進與新功能。

引入[冰凍字串常量編譯指示（Frozen String Literal
Pragma）](https://bugs.ruby-lang.org/issues/11473)。Ruby 2.1 針對了 `"str".freeze` 進行優化，減少了物件的佔用空間。Ruby 2.3 引入了新的魔法註解以及命令行選項，用來指定一個檔案裡的字串，全部默認為無法修改的字串（Frozen String）。除此之外，在除錯時也可以透過使用 `--enable-frozen-string-literal-debug` 來找到 `"can't modify frozen String"` 錯誤發生的地方。

[安全調用運算子（Safe navigation operator）](https://bugs.ruby-lang.org/issues/11537)，引入了 C#、Groovy 以及 Swift 都有的安全調用運算子，用來簡化 `nil` 的處理：`obj&.foo`。另新增了 `Array#dig` 和 `Hash#dig` 方法。

[did_you_mean 納入標準函式庫](https://bugs.ruby-lang.org/issues/11252)。did_you_mean gem 針對 `NameError` 以及 `NoMethodError` 會顯示可能的正確拼寫，進而簡化除錯。

請嘗試並享受與 Ruby 2.3.0-preview1 的編碼時光，有任何問題敬請回報！

## 自 2.2 起重要的變化

* 待定

請參閱 [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview1/NEWS) 和
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview1/ChangeLog)
來進一步了解。

以上變化自 Ruby 2.2.0 以來，計有 1036 變更的檔案，程式碼新增 81312 行，移除了 51322 行。

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.bz2>

  * SIZE:   14174035 bytes
  * SHA1:   55ad4f04d7a33ab780458ee0999de9f6124217ea
  * SHA256: 42b9c9e1740a5abe2855d11803524370bd95744c8dcb0068572ed5c969ac7f0f
  * SHA512: ae6d46c87f59e1fd3703b76dfc45bfcf208625f95ab9f4559f0b9f7050e8681f1a6e419f5fa06b704c83e56879c3a9ff1337dba443bcfca76fadb49c97d97a93

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.gz>

  * SIZE:   17560800 bytes
  * SHA1:   6249572e5dca27d8c73a0cbf036e24e5d88fe82f
  * SHA256: dc8f9d48392a2bb226df5f4b4fd2074d81af155cdf3f3799139a6e31e012aefe
  * SHA512: 58384ef6e743dde20ea263692dab86ce9d6d22d722ef4c02a84396aa3128ce06d933d9b69078a3cd666d72320a8a6ffdc93296bc0d5338595b2a44c29d4db383

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.tar.xz>

  * SIZE:   11225228 bytes
  * SHA1:   85b4f631efa4b6435b2b41df6ce6c46da294c4d4
  * SHA256: a88e19d9dc001db8f49ca3986a8a4e69980affff876854585725e40de0eedcd8
  * SHA512: 3be0f3ed4de73509b2f6975fe3fbe28bb4d51df87db6e2c0019e8a107edf49be60b2127ba5b18bca91f9f5964b07f1adde3042dac6327017359eeb130760672b

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview1.zip>

  * SIZE:   19777010 bytes
  * SHA1:   3458666c250dd333ac4b537be25f1913dd311ea1
  * SHA256: 0fc1d4450e9141f541038a4433f8fb49fb929e43c7bf5985685a4fa7b213a811
  * SHA512: f53653cf11d8dce1d627f7db3a15acca29c74c78735406a5d64bbbdc39fac232ef63110eb4d83521bef40c6f3006d55bbeaf54d1ddab1d4b6e5a13cee9247e85

## 發佈記

其他資訊請參考發佈時程：

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
