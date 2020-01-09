---
layout: news_post
title: "Ruby 2.2.0-preview2发布了"
author: "naruse"
translator: "Will"
date: 2014-11-28 09:00:00 +0000
lang: zh_cn
---

我们很高兴地宣布，Ruby 2.2.0-preview2 发布了。

Ruby 2.2.0-preview2 是 Ruby 2.2.0 的第二个预览版，针对使用者日益增多的各类需求，进行了许多更新和修正，增加了许多新的功能。

例如，符号 GC 使得符号对象可以被垃圾回收器回收了。这减少了符号的内存占用，因为在 2.2 版本之前，GC 都是不能回收符号对象的。因为 Rails 5.0 版本将支持对符号 GC，所以只支持 Ruby 2.2 或之后的版本（参考 [Rails blog post](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)获取更多信息）。

同时，新使用的增量垃圾回收器减少了停滞时间，对运行 Rails 应用非常有利。

另一个与内存管理相关的功能是给 `configure.in` 增加了新的选项，可以启用 jemalloc，请参考 [Feature #9113](https://bugs.ruby-lang.org/issues/9113)。这个功能还在实验阶段，目前默认没有开启，我们需要收集实际使用和性能的数据来确认有良好的效果。确认之后这个功能会默认开启。

另外一个是 [在 system() 和 spawn() 中使用 vfork(2) (日文)](http://www.a-k-r.org/d/2014-09.html#a2014_09_06)。这预计会大幅提升 Process 执行外部命令的速度。但 vfork(2) 仍是一个有风险的系统调用。 我们希望通过收集使用情况和性能数据来确认是否有比较大的回报。

请尝试并享受用 Ruby 2.2.0-preview2 编程，并告诉我们你的发现。

## Ruby 2.1 以后的重要变更

* [增量 GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [符号 GC](https://bugs.ruby-lang.org/issues/9634) ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* 核心函数库:
  * 支持 Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * 新的方法:
    * Enumerable#slice\_after [#9071](https://bugs.ruby-lang.org/issues/9071), Enumerable#slice\_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next\_float, Float#prev\_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime, File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode\_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* 内建函数库:
  * 升级 Psych 至 2.0.6；
  * 升级 Rake 至 10.4.0；
  * 升级 RDoc 至 4.2.0.alpha (21b241a)；
  * 升级 RubyGems 至 2.4.4+ (2f6e42e)；
  * 升级 rubygems 至 2.4.4+ (2f6e42e)；
  * 升级 test-unit 至 3.0.7（从代码目录删除，现绑定在 tarball 中）；
  * 升级 minitest 至 5.4.3（从代码目录删除，现绑定在 tarball 中）；
  * 弃用 mathn；
* C API；
  * 删除已弃用的 API；

参考 [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_preview2/NEWS) 获取更多信息。

以上改动，修改了 1239 个文件，新增代码 98343 行, 移除代码 61858行。

## 下载

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

## 发布公告

* [2.2.0 版本已知的问题](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

同时请参考发布进程表及其他信息：

* [ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
