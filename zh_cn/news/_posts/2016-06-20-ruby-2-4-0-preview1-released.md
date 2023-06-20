---
layout: news_post
title: "Ruby 2.4.0-preview1 发布"
author: "naruse"
translator: "Alex S"
date: 2016-06-20 09:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.4.0-preview1 发布了。

Ruby 2.4.0-preview1 是 Ruby 2.4.0 的首个预览版。
这个预览版的发布比平常早一点，因为它包括了很多新功能和改进。
敬请给我们[反馈](https://github.com/ruby/ruby/wiki/How-To-Report)，因为你还可以改变一些功能。

## [统一 Fixnum 和 Bignum 为 Integer](https://bugs.ruby-lang.org/issues/12005)

虽然 [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
没有明确指定 Integer 类的细节，CRuby 有两个显式的 Integer 类：Fixnum 和 Bignum。
Ruby 2.4 把它们统一为 Integer。

## [字符串支持 Unicode 大小写及其他类型](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` 现在可以做 Unicode 的大小写及其他类型，而不仅仅是 ASCII 类型转换。

## 性能提升

Ruby 2.4 还包括以下性能提升，和一些语法改进：

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` and `[x, y].min` 被优化，不会某些情况下创建临时数组。

### [Regexp#match?](https://bugs.ruby-lang.org/issues/8110)

添加 `Regexp#match?`，它只做正则匹配，而不会创建后向引用对象和改变 `$~`，可以减少对象的创建。

### 其他性能提升

* [提速实例变量的访问](https://bugs.ruby-lang.org/issues/12274)

## 调试

### [Thread#report_on_exception 和 Thread.report_on_exception](https://bugs.ruby-lang.org/issues/6647)

Ruby 忽视线程中的异常，除非另一个线程显式地执行直至结束。
通过设置 `report_on_exception = true`，你会注意到如果一个线程终止了因为未处理的异常。

请向我们反馈 `report_on_exception` 的默认值应该是什么和垃圾回收报告。

### [线程死锁检查现在会显示线程的栈和依赖](https://bugs.ruby-lang.org/issues/8214)

Ruby 在线程等待地时候会进行死锁检查，但是检查的结果没有足够的信息用来调试。
Ruby 2.4 死锁检查会显示他们的栈信息和依赖线程。

尝试并且享受用与 Ruby 2.4.0-preview1 的编码时光，有任何问题，敬请[反馈](https://github.com/ruby/ruby/wiki/How-To-Report)!

## 自 2.3 起显著的改变

请参阅 [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_preview1/NEWS) 和
[ChangeLog](https://github.com/ruby/ruby/blob/v2_4_0_preview1/ChangeLog)
来进一步了解。

以上变化自 Ruby 2.3.0 以来，计有 [1140 个文件变更，新增代码 33126 行，移除了 50993 行](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_preview1)！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.bz2>

  * SIZE:   14108114 bytes
  * SHA1:   7dcc42548d0724d83b6589ab98f34282845d7bcd
  * SHA256: 17570f0b84215ca82252f10c167ee50bc075383c018420c6b2601ae1cade0649
  * SHA512: c9873e8686eb54dbde61d6e23cd5197beebccd6cb31fd12c82763ebe1fde17095d7514d9d93c2c82b238032c98691df5479dc2d666a8a590e0fc54450ec29cb5

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.gz>

  * SIZE:   17605452 bytes
  * SHA1:   1003a1e57547d81f4bb979c0f40f242afc284cd5
  * SHA256: 80d02f49f40e7ce07b70bee7efda751b0595a349a017306e9fe8caad5da13e64
  * SHA512: 4b603ab4ff9ea7e8bb8053aa4b638839d534241466d7f0e4d5bca3f2ea416694c2ea391790f1ffdc07fa538918d27707621741eb0ddc7bd00eb9d7628622787a

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.tar.xz>

  * SIZE:   11155800 bytes
  * SHA1:   bc33085277266f5a09a143bf6817affcb77f8e7f
  * SHA256: 62942c7300727469fe3d2b43e5a5c772d4836cf624a1d644bdece2afaca472c8
  * SHA512: dfc2c6642d49fa95383817a6dc82c416b3218ddfdaf882d6d2e5a7da22d0a5ac142e516a57aa96214070f3c7551d275044233ac052c82d67189b01c39847aad4

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-preview1.zip>

  * SIZE:   19904781 bytes
  * SHA1:   25c16ee91bbcb0224f80e20d938f5c08832973f7
  * SHA256: fd588aea1558b1171f87a3dd342ee207b8995a2c0a8241d7aa15bcfa16036854
  * SHA512: f2fff35ff9157a4b31177b3d6b91bdaad04c22b3c626c3a5e5ec9a31b103f9607b31c909ef27880065cfdbcfa5d6901a6db89d22e0c645666d069c5b6dd1818b

## 发布记

其他资讯请参考发布日程安排：

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
