---
layout: news_post
title: "Ruby 2.2.0-rc1 发布"
author: "naruse"
translator: "Will"
date: 2014-12-18 09:00:00 +0000
lang: zh_cn
---

我们很高兴地宣布，Ruby 2.2.0-rc1 发布了。

RC1 版本之后，只会修改错误，不会再加新功能。

Ruby 2.2.0 的最终发布日期定为 2014 年 12 月 25 日。

Ruby 2.2.0 针对使用者日益增多的各类需求，进行了许多更新和修正，增加了许多新的功能。

例如，Ruby 的垃圾回收器现在可以回收符号类型对象。这会减少符号的内存占用，因为在 2.2 版本之前，GC 都是不能回收符号对象的。因为 Rails 5.0 版本将支持符号 GC，所以只支持 Ruby 2.2 或之后的版本（参考 [Rails 4.2 release post](http://weblog.rubyonrails.org/2014/12/19/Rails-4-2-final/) 获取更多信息）。

同时，新使用的增量垃圾回收器减少了停滞时间，对运行 Rails 应用非常有利。根据 [Rails log](http://weblog.rubyonrails.org/) 指出 Rails 5.0 的开发，将更多的利用增量 GC 和符号 GC。

另一个与内存管理相关的功能是给 `configure.in` 增加了新的选项，可以启用 jemalloc，请参考 [Feature #9113](https://bugs.ruby-lang.org/issues/9113)。这个功能还在实验阶段，目前默认没有开启，我们需要收集实际使用和性能的数据来确认有良好的效果。确认之后这个功能会默认开启。

新增了 [在 system() 和 spawn() 中使用 vfork(2)（日文）](http://www.a-k-r.org/d/2014-09.html#a2014_09_06) 实验性质的支持。这有机会大幅提升 Process 执行外部命令的速度。但 vfork(2) 仍未被完全理解，调用 vfork(2) 仍是一个有风险的系统调用。 我们希望通过收集使用情况和性能数据来确认是否有比较大的回报。

请尝试并享受用 Ruby 2.2.0-rc1 编程，并告诉我们你的发现。

## Ruby 2.1 以后的重要变更

* [增量 GC](https://bugs.ruby-lang.org/issues/10137) ([YARV Maniacs No.12](http://magazine.rubyist.net/?0048-YARVManiacs))
* [符号 GC](https://bugs.ruby-lang.org/issues/9634) ([presentation at RubyKaigi 2014](http://www.slideshare.net/authorNari/symbol-gc))
* configure --with-jemalloc [Feature #9113](https://bugs.ruby-lang.org/issues/9113)
* 核心函数库:
  * 支持 Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * 新的方法:
    * Enumerable#slice_after [#9071](https://bugs.ruby-lang.org/issues/9071)、Enumerable#slice_when [#9826](https://bugs.ruby-lang.org/issues/9826)
    * Float#next_float、Float#prev_float [#9834](https://bugs.ruby-lang.org/issues/9834)
    * File.birthtime、File#birthtime [#9647](https://bugs.ruby-lang.org/issues/9647)
    * String#unicode_normalize [#10084](https://bugs.ruby-lang.org/issues/10084)
* 内建函数库:
  * 升级 Psych 至 2.0.8；
  * 升级 Rake 至 10.4.0；
  * 升级 RDoc 至 4.2.0.alpha (21b241a)；
  * 升级 RubyGems 至 2.4.5；
  * 升级 test-unit 至 3.0.8（从代码目录删除，现绑定在 tarball 中）；
  * 升级 minitest 至 5.4.3（从代码目录删除，现绑定在 tarball 中）；
  * 弃用 mathn；
* C API；
  * 删除已弃用的 API；

参考 [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_rc1/NEWS) 获取更多信息。

自 Ruby 2.1.0 以来，修改了 1548 个文件，新增代码 123658 行, 移除代码 74306行！

## 下载

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

## 发布公告

* [2.2.0 版本已知的问题](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

同时请参考发布进程表及其他信息：

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
