---
layout: news_post
title: "Ruby 2.2.0-rc1 發佈"
author: "naruse"
translator: "Juanito Fatas"
date: 2014-12-18 09:00:00 +0000
lang: zh_tw
---

我們很高興宣佈 2.2.0-rc1 發佈了。
RC1 版本之後，就只會修正錯誤，不會加新功能。
Ruby 2.2.0 最終發佈日預定為 2014 年 12 月 25 日。

Ruby 2.2 針對使用者對 Ruby 各式各樣的需求，做了許多修正、加了許多新功能與改良。

譬如，垃圾回收器現在可以回收符號物件了。這降低了符號的記憶體使用量，因為在 2.2 版本之前，符號是不可以被 GC 回收的。Rails 5.0 將採用符號 GC 技術，也就是要求使用 Ruby 2.2 以上的版本（進一步了解請參考 [Rails 官方 4.2 發佈一文](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/)）。

同時也減少了新搭載的增量垃圾回收器的停滯時間，對於執行 Rails 應用程式來說很有用。[Rails blog](http://weblog.rubyonrails.org/)表示 Rails 5.0 的開發將會完善利用增量 GC 和符號 GC。

另一個與記憶體管理有關的新功能是給 configure.in 新增了一個設定，可以啟用 jemalloc，請參考 [Feature #9113](https://bugs.ruby-lang.org/issues/9113)。這是一個實驗性的功能，預設沒有開啟。我們需要蒐集使用場景與效能資料來確定有良好的效果，確定之後這個功能會預設開啟。


另外加入了一個實驗性的支持，system() 和 spawn() 呼叫和 vfork(2) 一同使用。進一步了解請閱讀 [tanaka-san 的部落格（日文）](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)。這個變更預期可以大幅提昇 process 執行外部命令的速度。但 vfork(2) 是一個晦澀的呼叫，可能是個危險的系統呼叫。我們想試試看究竟能提昇多少效能和了解最佳使用場景。

請試試看 Ruby 2.2.0-rc1 並享受與 Ruby 2.2.0-rc1 的編程時光，有任何發現請告訴我們！

## 從 2.1 起重要的變更

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
  * 更新 Rake 至 10.4.0；
  * 更新 RDoc 至 4.2.0.alpha（21b241a）；
  * 更新 RubyGems 2.4.5；
  * 更新 test-unit 至 3.0.8（從原碼庫移除，改綁定至 tarball 裡）；
  * 更新 minitest 至 5.4.3（從原碼庫移除，改綁定至 tarball 裡）；
  * 棄用 mathn。
* C API：
  * 移除棄用的 API。

參見 [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) 來了解更多細節。

自 Ruby v2.1.0 以來，計有 1548 變更的檔案，程式碼新增 123658 行，移除 74306 行。

## 下載

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.bz2>
  * SIZE:   12475612 bytes
  * MD5:    7144732d30dd4547c0a59862b3345d54
  * SHA256: e6a1f8d45ea749bdc92eb1269b77ec475bc600b66039ff90d77db8f50820a896
  * SHA512: 181201168360bee37dceeef3481a69e8a333a5d329680031fd9d371d30ac64460bbdf4db07546133024f541774e51301f1630cfd988c5e5bf2464834f3abe6bf
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.gz>
  * SIZE:   15531233 bytes
  * MD5:    51f218fabc3ceb7bf3fe5f4f87ddebd3
  * SHA256: a59c8db71b967015ad7c259ba8ef638c7943ec78580412bb86e97791a9322b6b
  * SHA512: 4a35e78c4c0747f9c79e506e98acc117efb0be72fc103d6f9c13d5eb5efa5c6d6748f491526fc7ebb24397f25238f06d552f841e9e898be30aa7cd6c2df38494
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.tar.xz>
  * SIZE:   9675108 bytes
  * MD5:    3f482b88eda45c1bc6bab1921763ce52
  * SHA256: dcfad9bb6e0b513b03f08f86b195da6a6a7045559b558d3493decac0e0abb86c
  * SHA512: 3ec8955d8a269a1e5f28c3e0e6023bd613f244c83914a4a8c96d2761b11914c21ce67cfadb2bcebc480d9c0b9c7b54da6dfa67cdf4b4350db2a85d379265ffed
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-rc1.zip>
  * SIZE:   17219660 bytes
  * MD5:    49f5aae44c00f4d57be47576c29a53bd
  * SHA256: 1bd3e83d44b4e5879b4ecdc496d19905bc03637a8c88027c2dc98a369f1ebb83
  * SHA512: bf0e39e5add532ca338095ad6eaaafbe4f84cc9df1e8d4bad986c44e17614623430c2670d9751865e8d645cb483007d5473be82536b985ccab40a7dde72c4161

## 發佈記

* [2.2.0 已知問題](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

同時請參考發佈時程及其他相關資訊：

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
