---
layout: news_post
title: "Ruby 2.4.0-rc1 发布"
author: "naruse"
translator: "Delton Ding"
date: 2016-12-12 09:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.4.0-rc1 发布了。

Ruby 2.4.0-rc1 是 Ruby 2.4.0 的第一个候选版本。
发布 rc1 版本是为了从社区得带更多反馈。
请[发送反馈](https://github.com/ruby/ruby/wiki/How-To-Report)，
因为你可以帮助修复这些功能。

## [哈希表的提升（由 Vladimir Makarov 提供）](https://bugs.ruby-lang.org/issues/12142)

通过使用开放定址法及有序的数组來提升哈希表（st_table）的内部结构。
这个改进被大量讨论，特别感谢 Yura Sokolov。

## Binding#irb：像 `binding.pry` 一样启动一个 REPL

当你在调试时，你可能常用 `p` 来查看变量值。
在 [pry](https://github.com/pry/pry) 的帮助下，你可以通过 `binding.pry`，
在应用内部启动一个 REPL，并执行任何代码。
[r56624](https://github.com/ruby/ruby/commit/493e48897421d176a8faf0f0820323d79ecdf94a)
这次提交给 irb 提供了类似的功能。

## [Fixnum 和 Bignum 合并成 Integer](https://bugs.ruby-lang.org/issues/12005)

虽然 [ISO/IEC 30170:2012](http://www.iso.org/iso/iso_catalogue/catalogue_tc/catalogue_detail.htm?csnumber=59579)
没有明确指定 Integer 的实现细节，但 CRuby 有两个 Integer 类：Fixnum 和 Bignum。Ruby 2.4 合并为 Integer。
所有有关 Fixnum 与 Bignum 的 C 语言扩展需要做出修正。

请参考[这个工单](https://bugs.ruby-lang.org/issues/12005)和 [akr 的演示文稿](http://www.a-k-r.org/pub/2016-09-08-rubykaigi-unified-integer.pdf)。

## [字符串支持 Unicode 的大小写转换](https://bugs.ruby-lang.org/issues/10085)

`String/Symbol#upcase/downcase/swapcase/capitalize(!)` 除了 ASCII 之外，现在也可以做 Unicode 的大小写转换了。

## 性能提升

Ruby 2.4 还包括以下性能提升，和一些语法改进：

### [Array#max, Array#min](https://bugs.ruby-lang.org/issues/12172)

`[x, y].max` 和 `[x, y].min` 被优化，不会某些情况下创建临时数组。

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

尝试并且享受用与 Ruby 2.4.0-rc1 的编码时光，有任何问题，敬请[反馈](https://github.com/ruby/ruby/wiki/How-To-Report)!

## 其他自 2.3 起显著的改变

* 支持 OpenSSL 1.1.0 版本（对 0.9.7 及之前版本不再支持）
* ext/tk 现已从标准库中移除 [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC 现已从标准库中移除 [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

请参阅 [NEWS](https://github.com/ruby/ruby/blob/v2_4_0_rc1/NEWS)，或提交记录来了解更多细节。

Ruby 2.3.0 以来，已有 [2519 个文件变更，新增代码 288606 行，移除了 83896 行](https://github.com/ruby/ruby/compare/v2_3_0...v2_4_0_rc1)！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.bz2>

      SIZE:   12512729 bytes
      SHA1:   a0439652a97a2406b691e8a1e586e2cf08c258ba
      SHA256: 3b156b20f9df0dd62cbeeb8e57e66ea872d2a5b55fabdef1889650122bcc2ea7
      SHA512: b43902ac7794487197df55a45256819d2e7540b77f1ed4eb68def3e0473ee98860a400862075bafadbde74f242e1dfe36a18cd6fe05ac42aae1ea6dddc9978ce

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.gz>

      SIZE:   14098505 bytes
      SHA1:   6b242f9ec7b908c9aa26e497440684ba06d86927
      SHA256: e41ada7650eed2a5800534d1201ba7c88f1627085659df994f47ab4c5e327745
      SHA512: 26d3c60483ce2d6eaabd7077085102fad6633f18cf5d772bacf6f563670030cb7bba22d54d8b7dfa5eac8b52990371c4a6ad1c095dff6f6b3a7bbe1a8ffb3754

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.tar.xz>

      SIZE:   9930088 bytes
      SHA1:   7c404e8bec9859f708927f7203d4f42187e678b7
      SHA256: 3f014b3186d10676da6c512d14c65db23ccc4bf200fed9d7c6f9a58fd1e3295b
      SHA512: 22e209e28da1f2394f50c0a7dd5d0d4d4c0c5a6b5b0b02260fad0267a0940b98f0e2b0f36a44f87d1612555cb3022f43cd136a5186c7f87650aa20264408d415

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0-rc1.zip>

      SIZE:   15785968 bytes
      SHA1:   7d82386434ccbb1701f2995286bf29c8b9179e01
      SHA256: 14e6910e36618cddffeb22bad5f1052f907dc31ec93d4aa945bca0905d8a52c4
      SHA512: 5dd89320d429e5bd5faf3709be7e5b70f7355304d6324d7ac13a69187e5f1446ad5988c8186bc33f4fea8934288294f9d16fea173f39b2b39967746c4b03d1d4

## 发布记

有关于发布时间表和其他信息请参考：

[ReleaseEngineering24](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering24)
