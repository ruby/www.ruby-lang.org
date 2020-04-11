---
layout: news_post
title: "Ruby 2.2.0-preview1 发布了"
author: "naruse"
translator: "li-thy-um"
date: 2014-09-18 09:00:00 +0000
lang: zh_cn
---

我们很高兴地宣布发布 Ruby 2.2.0-preview1 版。

Ruby 2.2.0-preview1 是 Ruby 2.2.0 的首个预览版。
为了满足对 Ruby 日益多样和扩大的需求，这次发布包括了许多新的功能和改进。

例如，Symbol GC 使得 Symbol 可以被回收。
因为在 Ruby 2.2 发布以前，GC 无法回收 Symbol，所以这减少了 Symbol 的内存占用。
Rails 5.0 将会依赖 Symbol GC，它将只支持 Ruby 2.2 及之后的版本。（更多细节请参考 [Rails' blog post](http://weblog.rubyonrails.org/2014/8/20/Rails-4-2-beta1/)。）

同时，新的增量 GC 减少了垃圾回收的暂停时间。
这对于运行 Rails 应用很有帮助。

希望您使用 Ruby 2.2.0-preview1 编程愉快！

## 相对 2.1 版的主要更新

* [Incremental GC](https://bugs.ruby-lang.org/issues/10137)
* [Symbol GC](https://bugs.ruby-lang.org/issues/9634)
* 核心库:
  * 支持 Unicode 7.0 [#9092](https://bugs.ruby-lang.org/issues/9092)
  * 新方法:
    * Enumerable#slice_after
    * Float#next_float, Float#prev_float
    * File.birthtime, File#birthtime
* 依赖库:
  * 升级 Psych 2.0.6
  * 升级 Rake 10.3.2+ (e47d0239)
  * 升级 RDoc 4.2.0.alpha (21b241a)
  * 升级 RubyGems 2.4.1+ (713ab65)
  * 升级 test-unit 3.0.1 (从资料库中删除，但捆绑在压缩包中)
  * 升级 minitest 5.4.1 (从资料库中删除，但捆绑在压缩包中)
  * 弃用 mathn
* C API
  * 移除了弃用 API

更多细节请参考 [NEWS in Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_2_0_preview1/NEWS)。

所有更新中，有 1239 个文件被更新，98343 处插入（+），61858 处删除（-）

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.bz2>
  * SIZE:   12385780 bytes
  * MD5:    767b132eec3e70b14afe5884a7a767b1
  * SHA256: a3614c389de06b1636d8b919f2cd07e85311486bda2cb226a5549657a3610af5
  * SHA512: 2f1190f5d8cd1fa9962d1ff416dae97759d032a96801d77bc6b10136eba59dde1a554ff8c0c2d9ce0d3c1361d4dd12ad573b1266fd53b90ab238d8ce39e6b862
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.gz>
  * SIZE:   15419211 bytes
  * MD5:    f78fc9ec907fe622822abf3aa839c1b4
  * SHA256: 7a49493d148a38eff9ab13e88601686985cadf2de86276ae796f5443deab3abb
  * SHA512: 34381eee1d31cc1dad87e6d57ba71153c4db034b697cf7f0010fa432bb037e8eef5a90936a658f8f07b9b1eaa18f0b5c02ea113c78f39061514724373622a3b5
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.tar.xz>
  * SIZE:   9617132 bytes
  * MD5:    96cde140b3211780d58b36af023143d5
  * SHA256: 7ed01a518b8c4d65bfb887cf6e0809977c88abeb5bb70c9fe8df754966820411
  * SHA512: 1241fd9a6e583544576177f372e245845b9df1427104b595963e37d7348a7d1c5558c6f6bf6ca5f1856d0d4a8f4a54a8948d4b6d78fb7943d6c7458691f34f6d
* <https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.0-preview1.zip>
  * SIZE:   17161678 bytes
  * MD5:    df34e9d6a447b21a4e7fa261d51bb881
  * SHA256: 2fa6c0cbddd1566a8658e16a34b6ae2f9eda2a8eeee4113561b3948d066f44a0
  * SHA512: 615b35c0a0bc408b28af9d9220ccd1658c718c7657ae7ad3f8318d38850bec760b1738c43454986b105857a7ffc2fea95294b964e5ea26a915d6fd9d510351b7

## 发布评论

* [2.2.0 已知问题](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=115)

又见发布时间表和其他信息：

[ReleaseEngineering22](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering22)
