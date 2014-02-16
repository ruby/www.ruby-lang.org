---
layout: news_post
title: "Ruby 1.8.7 與 1.9.2 延長安全性維護時間"
author: "zzak"
translator: "Juanito Fatas"
date: 2013-12-17 20:49:03 +0000
lang: zh_tw
---

Ruby 1.8.7 與 1.9.2 將會持續提供安全性補丁直至 2014 年六月，即刻生效。

* Terence Lee([@hone02](https://twitter.com/hone02)) 與 Zachary Scott([@_zzak](https://twitter.com/_zzak)) 是預定的維護者。
* 六個月維護週期過後，可以找更多 Commiters 來繼續延長六個月。

本次的維護展延由 [Heroku][heroku] 促成，見 [A Patch in Time: Securing Ruby][securing-ruby] 文章來了解更多資訊。

### 回報問題

延長維護期間僅為 [1.8.7][source-187] 與 [1.9.2][source-192] 版本，提供安全性補丁。

我們非常重視安全性問題，如果您找到安全風險，請即刻至 security@ruby-lang.org 回報。這是非公開的郵件列表，您回報的問題會在問題修正後公布。

請參考 [ruby-lang.org/zh_tw/security][security-zhtw] 了解更多相關資訊。

### 關於發佈管理

如上所述，我們僅會更新安全性補丁與增加補丁版號（patchlevel）。

我們不會發佈 1.8.7 與 1.9.2 的新版本至 ruby-lang.org。但你可以自己從源碼打包出執行檔。

實際上我們無法回應任何維護需求，因為 ruby-core 繼續負責維護官方的發行版。由於我們團隊資源非常少，我們鼓勵你升級新版本，而不是沿用舊版本。

### 為何復辟 1.8.7？

您可能依稀記得約六個月前，[1.8.7 已日薄西山][sunset-187-zhtw]的消息。

由於 Ruby 核心成員不再維護 1.8.7 與 1.9.2 了，Terence 與 Zachary 會持續提供這倆版本的安全性更新，作為企業贊助 Ruby 的一部分。

過去也有過企業接手維護老舊版本的經驗。在 2009 年，當 Engine 發佈 Ruby 1.8.6-369 時，便移轉 Ruby 1.8.6 給 Engine Yard 接手維護。

### 鼓勵的話

藉此機會想鼓勵大家儘快升級至官方正式支援的版本。許多 Ruby 核心成員，花了無數心血來改善 Ruby 2.0+ 的效能與新功能，希望你能善用它。

感謝您的支持，一起讓 Ruby 變得更好吧！

[heroku]:        https://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-zhtw]: https://www.ruby-lang.org/zh_tw/security/
[sunset-187-zhtw]: https://www.ruby-lang.org/zh_tw/news/2013/06/30/we-retire-1-8-7/
