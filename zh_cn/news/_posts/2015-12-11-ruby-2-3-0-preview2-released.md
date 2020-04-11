---
layout: news_post
title: "Ruby 2.3.0-preview2 发布"
author: "naruse"
translator: "Alex S"
date: 2015-12-11 14:00:00 +0000
lang: zh_cn
---

很高兴告诉大家 Ruby 2.3.0-preview2 发布了。

Ruby 2.3.0-preview2 是 Ruby 2.3.0 系列的第二个预览版。
包含了许多改进与新功能。

引入[冰冻字串常量编译指示（Frozen String Literal Pragma）](https://bugs.ruby-lang.org/issues/11473)。Ruby 2.1 针对了 `"str".freeze` 进行优化，减少了对象的占用空间。Ruby 2.3 引入了新的魔法注解以及命令行选项，用来指定一个代码中的字符串，全部默认为无法修改的字符串（Frozen String）。除此之外，在除错时也可以通过使用 `--debug=frozen-string-literal` 来找到 `"can't modify frozen String"` 错误发生的地方。

[安全调用运算子](https://bugs.ruby-lang.org/issues/11537)（[又称孤独运算子](https://instagram.com/p/-M9l6mRPLR/) `&.`），引入了 C#、Groovy 以及 Swift 都有的安全调用运算子，用来简化 `nil` 的处理：`obj&.foo`。另新增了 `Array#dig` 和 `Hash#dig` 方法。

[did_you_mean 纳入标准函式库](https://bugs.ruby-lang.org/issues/11252)。did_you_mean gem 针对 `NameError` 以及 `NoMethodError` 会显示可能的正确拼写，进而简化除错。

引入 [RubyVM::InstructionSequence#to_binary 和 .load_from_binary](https://bugs.ruby-lang.org/issues/11788) 作为实验性的功能，用来实作 ISeq（bytecode）预编译系统。

Ruby 2.3 引入了许多性能优化，譬如：
[优化了 Proc#call](https://bugs.ruby-lang.org/issues/11569)、
[重新处理了方法进入点的资料结构](https://bugs.ruby-lang.org/issues/11278)、
[引入了新的资料结构：表](https://bugs.ruby-lang.org/issues/11420)，以及在机器码层级针对了内存分配与方法调用进行了调校，以及许多其他的性能优化。

请尝试并享受与 Ruby 2.3.0-preview2 的编码时光，有任何问题敬请回报！

## 自 2.2 起重要的变化

请参阅 [NEWS](https://github.com/ruby/ruby/blob/v2_3_0_preview2/NEWS) 和
[ChangeLog](https://github.com/ruby/ruby/blob/v2_3_0_preview2/ChangeLog)
来进一步了解。

以上变化自 Ruby 2.2.0 以来，计有 [1097 文件变更，新增代码 97466 行，移除了 58685 行](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0_preview2)。

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.bz2>

  * SIZE:   14126752 bytes
  * SHA1:   7e717ef7a0a1523ad696b5fe693f7f7a613a3810
  * SHA256: e9b0464e50b2e5c31546e6b8ca8cad71fe2d2146ccf88b7419bbe9626af741cb
  * SHA512: e397f321d4338edba8d005d871408775f03d975da90c8abcfdb457a1bc7e6c87efe58c53b2c3bc122e9f58f619767b271bcc8d5d9663ed4b4288c60556e8d288

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.gz>

  * SIZE:   17623519 bytes
  * SHA1:   2deaf3ccbbfc5e08d3d840a4f1c33ff5f62f931d
  * SHA256: cb1c745bda33ba9e812b48c87852571ef6486f985c5e6ff4508a137d1c9734a3
  * SHA512: 83022f99775eb139beec281d59029dcc7c59de1e313182685b0a785334ac53d0c445212460d00d065169b922949263f30a1f981e19fc6e59814e79e6e53ae8e0

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.tar.xz>

  * SIZE:   11249780 bytes
  * SHA1:   e1dfca06cd3c2cf6456a7feb0b1cd0752bde1a3b
  * SHA256: 7c3119268af87c137f415301b299281762453ad78f86e35562be014dabd67b11
  * SHA512: ab3376145d95a2188e6345984f0e5592c8d33515d7046a2ab2565dc418fa2306cdcf797aae9494d4d10446ada54ba638d8a8ad2d4b7510544d7eaea3de4faa87

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0-preview2.zip>

  * SIZE:   19841531 bytes
  * SHA1:   db7fa5291d90e0a9c6f75c0cd068bc54050520d6
  * SHA256: 90d036fd1ec40aa8f5493821ac162bf69f505c5977db54afe53b8bf689d79b9d
  * SHA512: 05784df420018aaae7d09d41e872df708e861cacc74dc8ee97a9e3ac7458cb12b937523ad6def34d5ae2890a0cf037a8d61e365beb88d28acd84879b9391ad65

## 发布记

其他资讯请参考发布日程安排：

[ReleaseEngineering23](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering23)
