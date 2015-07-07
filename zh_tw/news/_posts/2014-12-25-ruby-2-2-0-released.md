---
layout: news_post
title: "Ruby 2.2.0 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2014-12-25 09:00:00 +0000
lang: zh_tw
---

我們很高興的宣佈 Ruby 2.2.0 發佈了。

Ruby 2.2 針對使用者對 Ruby 各式各樣的需求，做了許多修正、加了許多新功能與改良。

譬如，垃圾回收器現在可以回收符號物件了。這降低了符號的記憶體使用量，因為在 2.2 版本之前，符號是不可以被 GC 回收的。Rails 5.0 將採用符號 GC 技術，也就是要求使用 Ruby 2.2 以上的版本（進一步了解請參考 [Rails 官方 4.2 發佈一文](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/)）。

同時也減少了新搭載的增量垃圾回收器的停滯時間，對於執行 Rails 應用程式來說很有用。[Rails blog](http://weblog.rubyonrails.org/)表示 Rails 5.0 的開發將會完善利用增量 GC 和符號 GC。

另一個與記憶體管理有關的新功能是給 configure.in 新增了一個設定，可以啟用 jemalloc，請參考 [Feature #9113](https://bugs.ruby-lang.org/issues/9113)。這是一個實驗性的功能，預設沒有開啟。我們需要蒐集使用場景與效能資料來確定有良好的效果，確定之後這個功能會預設開啟。

另外加入了一個實驗性的支持，system() 和 spawn() 呼叫和 vfork(2) 一同使用。進一步了解請閱讀 [tanaka-san 的部落格（日文）](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)。這個變更預期可以大幅提昇 process 執行外部命令的速度。但 vfork(2) 是一個晦澀的呼叫，可能是個危險的系統呼叫。我們想試試看究竟能提昇多少效能和了解最佳使用場景。

請試試看 Ruby 2.2.0 並享受與 Ruby 2.2.0 的編程時光，有任何發現請告訴我們！

## 自 2.1 起重要的變更

* [增量化 GC](https://bugs.ruby-lang.org/issues/10137)（[YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs)）；
* [符號 GC](https://bugs.ruby-lang.org/issues/9634)（[RubyKaigi 2014 簡報介紹](http://www.slideshare.net/authorNari/symbol-gc)）；
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)；
* 核心函式庫：
  * 支援 Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)；
  * 新方法：
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071)、Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)；
    * Float#next_float、Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)；
    * File.birthtime、File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)；
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)。
* 系統內建函式庫：
  * 更新 Psych 至 2.0.8；
  * 更新 Rake 至 10.4.2；
  * 更新 RDoc 至 4.2.0；
  * 更新 RubyGems 2.4.5；
  * 更新 test-unit 至 3.0.8（從原碼庫移除，改綁定至 tarball 裡）；
  * 更新 minitest 至 5.4.3（從原碼庫移除，改綁定至 tarball 裡）；
  * 棄用 mathn。
* C API：
  * 移除棄用的 API。

參見 [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0/NEWS) 來了解更多細節。

自 Ruby v2.1.0 以來，計有 1557 變更的檔案，程式碼新增 125039 行，移除 74376 行！

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.bz2>
  * SIZE:   13304042 bytes
  * MD5:    d03cd4690fec1fff81d096d1c1255fde
  * SHA256: 1c031137999f832f86be366a71155113675b72420830ce432b777a0ff4942955
  * SHA512: 04edc53e8cd1732c3ca61ebeb1d6133614beb10f77f9abb80d8d36352fe8aa205112068e460bf600b2c7e81e0ddcc3b311e7e027c320366f1bd992b3e378a6ad
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.gz>
  * SIZE:   16494584 bytes
  * MD5:    cd03b28fd0b555970f5c4fd481700852
  * SHA256: 7671e394abfb5d262fbcd3b27a71bf78737c7e9347fa21c39e58b0bb9c4840fc
  * SHA512: 1ba0c68e1c8d2b60bbd1e218cf36463edbe34cf9418d7593702b631e68d02297465f752e71395f6cfa4104f4cd70a1eb44381ffb74bc7801758b830931fdcfc6
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.tar.xz>
  * SIZE:   10304244 bytes
  * MD5:    54b43c6c6c9dd4c4b08ceb03ad0ded7a
  * SHA256: 848714e280fc5fb44dbac3b060b206e56c1947006324ee68a174d68b483ef8ca
  * SHA512: cd7e52faa464df8aca7ccfa23a5f06248e1ad82bc8c9f1829aa1b51ff37b15973b8caaa68e914d837325b8d59427fda4f3cad82c50925e1c84e688324a2a155d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0.zip>
  * SIZE:   18441027 bytes
  * MD5:    f8e1d0cee4f2d9535a9529ed23ae3700
  * SHA256: e06c1e2b1248cf881749833084b2bec93f7612676009190ff9bc89b8fd07c29f
  * SHA512: 364dd927b496520d95a1b06c68e1a265015f4cab08bdf3efaa323d385e7bf075eae47f2e1db78a629db0f3c0c1ed24e086603ba21e2da02ac06dd3c8b716766e
