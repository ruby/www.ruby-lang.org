---
layout: news_post
title: "Ruby 2.2.0-preview2 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2014-11-28 09:00:00 +0000
lang: zh_tw
---

很高興告訴大家 Ruby 2.2.0-preview2 發佈了。

Ruby 2.2.0-preview2 是 Ruby 2.2.0 第二個預覽版。針對使用者對 Ruby 的各式各樣的需求做了許多修正並添加了許多新功能與改良。

譬如，符號 GC 使得符號可以被垃圾回收器回收了。這降低了符號的記憶體使用量，因為在 2.2 版本之前，符號是不可以被 GC 回收的。Rails 5.0 將採用符號 GC 技術。僅支持 Ruby 2.2 以上的版本（參見 [Rails 官方文章](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)來了解更多細節）。

另外新搭載了增量化 GC，降低了 GC 所佔用的時間，對於運行 Rails 應用程式相當有用。

另一個與記憶體管理有關的新功能是給 configure.in 新增了一個設定，可以啟用 jemalloc，請參考 [Feature #9113](https://bugs.ruby-lang.org/issues/9113)。這是一個實驗性的功能，預設沒有開啟。我們需要蒐集使用場景與效能資料來確定有良好的效果，確定之後這個功能會預設開啟。

另一個重要的變更是[在 system() 和 spawn() 使用了 vfork(2)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)。這個變更預期可以大幅提昇 process 執行外部命令的速度。但 vfork(2) 是一個危險的系統呼叫，同樣我們需要蒐集使用場景和效能資料。

請試試看 Ruby 2.2.0-preview2 並享受與 Ruby 2.2.0-preview2 的編程時光，有任何問題或情報請告訴我們！

## 從 2.1 起重要的變更

* [增量化 GC](https://bugs.ruby-lang.org/issues/10137)（[YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs)）；
* [符號 GC](https://bugs.ruby-lang.org/issues/9634)（[presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc)）；
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)；
* 核心函式庫：
  * 支援 Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)；
  * 新增方法：
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071)、Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)；
    * Float#next_float、Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)；
    * File.birthtime、File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)；
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)。
* 系統內建函式庫：
  * 更新 Psych 至 2.0.6；
  * 更新 Rake 至 10.4.0（e47d0239）；
  * 更新 RDoc 至 4.2.0.alpha（21b241a）；
  * 更新 RubyGems 2.4.4+（2f6e42e）；
  * rubygems 2.4.4+ (2f6e42e)；
  * 更新 test-unit 至 3.0.7（從原碼庫移除，改綁定至 tarball 裡）；
  * 更新 minitest 至 5.4.3（從原碼庫移除，改綁定至 tarball 裡）；
  * 棄用 mathn。
* C API：
  * 移除棄用的 API。

到 [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS) 來了解更多細節。

以上變更總共有 1239 變更的檔案，程式碼新增 98343 行，移除了 61858 行。

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.bz2>
  * SIZE:   12505279 bytes
  * MD5:    d7abace25a8ffe861cb2807bef1c58a6
  * SHA256: 9e49583f3fad3888fefc85b719fdb210a88ef54d80f9eac439b7ca4232fa7f0b
  * SHA512: c654d4c047f9463a5fb81eaea0fa5ab7bf316962bc7fb0fb356861e6336ce8ce2162c7779d8b27f72d7bc0e9604b5e5af2910abcb0b0a1f197b3138eaddfd4a5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.gz>
  * SIZE:   15505521 bytes
  * MD5:    bde388d6f10012a92d5dc36196fd6755
  * SHA256: dfcef7b01bd3acb41da6689993ac8dd30e2ecd4fd14bc1a833f46188a9fe2614
  * SHA512: e2d316a679c15c021e40b0f9b7810b319c6a5e771a9b869fda35b6745aecac881bbb05d62192893799816a8673e05c8f17713f10ccdec077f546483608ab85c1
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.tar.xz>
  * SIZE:   9649216 bytes
  * MD5:    0d582e28b92ce9d1456e40fb8d821422
  * SHA256: d14d1fa045263fa242a515d7b9e8c485bf8a9ee9d9d3012dc2b6add0f3a370c6
  * SHA512: 4a8a75ab21b2bd43db4a22d9c63f189f3c7805d575d662b07a4ddc25aa5b156b0c23053d8c48eecf23d5e22f1ea7131467f1cdc48f9ae0a83214b4cd46b08491
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview2.zip>
  * SIZE:   17239396 bytes
  * MD5:    d94160c214016863932c25cc1ac6ff90
  * SHA256: 88d6c73ee1a4f5fe1f8ad37fe1f56c1ca50622f1338c20b9d46bbb5c2cd94040
  * SHA512: 0a021d31f54c47c5c3901ef6f2ab02a1bfb5cc698f971978c1e16b1aeda78fdadec0c1cdd48af1c8784b8f72ad00d35cf2433d78e20d4447fa0630e02b4e3917

## 發佈記

* [2.2.0 Known issues](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

同時請參考發佈行程表以及其他資訊：

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
