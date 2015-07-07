---
layout: news_post
title: "Ruby 2.2.0 发布了"
author: "naruse"
translator: "Will(@Airmacho)"
date: 2014-12-25 09:00:00 +0000
lang: zh_cn
---

我们很高兴地宣布 Ruby 2.2.0 发布了。

Ruby 2.2.0 版本针对日益增多的各类需求，进行了许多更新和修正，增加了许多新的功能。

例如，Ruby 的垃圾回收器现在可以回收符号对象了。这会减少符号对象的内存占用，在 2.2.0 版本之前，GC 都是不能回收符号对象的。Rails 5.0 将开始使用符号GC技术，将只支持 Ruby 2.2 或之后的版本（参考 [Rails 4.2 官方发布](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/)来获取更多内容）。

同时，新使用的增量垃圾回收器减少了停滞时间，对运行 Rails 应用非常有利。根据 [Rails log](http://weblog.rubyonrails.org/)指出 Rails 5.0 的开发，将更多的利用增量 GC 和符号 GC。

另一个与内存管理相关的功能是给`configure.in`增加了新的选项，可以启用 jemalloc，请参考 [Feature #9113](https://bugs.ruby-lang.org/issues/9113)。这个功能还在实验阶段，目前默认没有开启，我们需要收集实际使用和性能的数据来确认有良好的效果。确认之后这个功能会默认开启。

另外一个实验性的支持是用 vfork(2) 配合 system() 和 spawn() 使用。你可以阅读 [tanaka-san 的博客（日文）](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)来了解个更多信息。这个更改预计会大幅提升 process 执行外部命令的速度。但 vfork(2) 仍被完全理解，可能是一个危险的系统调用。我们会继续实验，直到通过收集性能数据和使用情况实例了解到究竟能提升多少效能。

请尝试并享受 Ruby 2.2.0，并告诉我们你的发现。

## Ruby 2.1 以后的重要变更

* [增量 GC](https://bugs.ruby-lang.org/issues/10137)
  ([在 RubyConf2014 上的演讲：“Ruby 解释器的增量 GC”](http://www.atdot.net/~ko1/activities/2014_rubyconf_pub.pdf))
* [符号 GC](https://bugs.ruby-lang.org/issues/9634)
  ([RubyKaigi2014 演讲](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* 核心函数库：
  * 支持 Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * 新的方法:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071)、
      Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float、Float#prev_float
      [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime、File#birthtime
      [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* 内建函数库:
  * 升级 Psych 至 2.0.8；
  * 升级 Rake 至 10.4.2；
  * 升级 RDoc 至 4.2.0；
  * 升级 RubyGems 至 2.4.5；
  * 升级 test-unit 至 3.0.8（从代码目录删除，现绑定在 tarball 中）；
  * 升级 minitest 至 5.4.3（从代码目录删除，现绑定在 tarball 中）；
  * 弃用 mathn；
* C API；
  * 删除已弃用的API。

参考 [NEWS in Ruby repository](https://github.com/ruby/ruby/blob/v2_2_0/NEWS)了解更多。

自 Ruby 2.1 以来，已修改 1557 个文件，新增代码 125039 行，移除代码 74376 行！

## 下载

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
