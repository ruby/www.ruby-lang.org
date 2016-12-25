---
layout: news_post
title: "Ruby 2.4.0 发布"
author: "naruse"
translator: "Delton Ding"
date: 2016-12-25 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.4.0 发布了。

Ruby 2.4.0 是 Ruby 2.4 的第一个稳定版本。
包含了很多新功能，比如：

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

# 性能提升

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

## 其他自 2.3 起显著的改变

* 支持 OpenSSL 1.1.0 版本（对 0.9.7 及之前版本不再支持）
* ext/tk 现已从标准库中移除 [Feature #8539](https://bugs.ruby-lang.org/issues/8539)
* XMLRPC 现已从标准库中移除 [Feature #12160](https://bugs.ruby-lang.org/issues/12160)

请参阅 [NEWS](https://github.com/ruby/ruby/blob/v2_4_0/NEWS)，或提交记录来了解更多细节。

圣诞快乐！愉快使用 Ruby 2.4 编程吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.bz2>

      SIZE:   12572424 bytes
      SHA1:   944d2588308391b20a89642472454d1dfe7b2360
      SHA256: 440bbbdc49d08d3650f340dccb35986d9399177ad69a204def56e5d3954600cf
      SHA512: bef7bb53f63fb74073d071cc125fb67b273ed0779ef43c2d2969089b9ca21fff1bd012281c5b748f7a3c24dd26e71730d7248c05a01cb23ab2089eb4d02115fe

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.gz>

      SIZE:   14104044 bytes
      SHA1:   d44a3c50a0e742341ed3033d5db79d865151a4f4
      SHA256: 152fd0bd15a90b4a18213448f485d4b53e9f7662e1508190aa5b702446b29e3d
      SHA512: 21c9f596b42dd9cba7a53963a59fed0c2e0c1eb960a4ac7087ea3eaa991ce9252d32639e1edcb75b1d709bc07c4820a6dc336ab427d0643c6e6498e0eacdbc8b

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.tar.xz>

      SIZE:   9906880 bytes
      SHA1:   038804bbd0e77508dd2510b729a9f3b325489b2e
      SHA256: 3a87fef45cba48b9322236be60c455c13fd4220184ce7287600361319bb63690
      SHA512: 975a5388592adc038461e0acebb6c0efee242891b2ea8621476401458efe2bc0fdd317d3bf99beb745b0b3808410efdff33862da29c95c027f457943721e3ab6

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.0.zip>

      SIZE:   15758757 bytes
      SHA1:   29e1bab11551011718c35a51827edcb55bd656fc
      SHA256: 5c2bbfa26fd6a15a2d70961874b0f3a386206fcc5f698e240dd8b0c9f0f18c5e
      SHA512: 31d932372ce490eeac0a70bc8dcf842909a90435422398d069c05cf01d994936064b8f4e60879e28a8655c1296eb8e180e348cb95e001ed6ca73cda0ff77de23
