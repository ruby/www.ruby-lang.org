---
layout: news_post
title: "Ruby 2.5.0 已发布"
author: "naruse"
translator: "Delton Ding"
date: 2017-12-25 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.5.0 已发布。

Ruby 2.5.0 是 2.5 系列首个稳定版。此版本包括数个新特性和性能提升，例如：

## 新特性

* 允许在 do/end 中直接使用 rescue/else/ensure。[[功能 #12906]](https://bugs.ruby-lang.org/issues/12906)
* 新增 `yield_self` 来使用当前上下文 yield 代码块。不同于 `tap`，此方法会返回代码块的运行结果。[[功能 #6721&]](https://bugs.ruby-lang.org/issues/6721)
* 支持测量分支代码覆盖和方法代码覆盖。分支代码覆盖指检查哪些分支被覆盖到，哪些没有。而方法覆盖指可以测量方法是否被调用。基于这些新特性运行你的测试用例，你可以精确地知道哪些分支和方法被运行，并更精确地计算测试的代码覆盖程度。[[功能 #13901]](https://bugs.ruby-lang.org/issues/13901)
* 新增 Hash#slice [[功能 #8499]](https://bugs.ruby-lang.org/issues/8499) 和 Hash#transform_keys。[[功能 #13583]](https://bugs.ruby-lang.org/issues/13583)
* Struct.new 现在可以被用于创建含有关键字参数的类。[[功能 #11925]](https://bugs.ruby-lang.org/issues/11925)
* Enumerable#any?, all?, none? 和 one? 可以接受一个模式作为参数。[[功能 #11286]](https://bugs.ruby-lang.org/issues/11286)
* 删除顶层常量查找。[[功能 #11547]](https://bugs.ruby-lang.org/issues/11547)
* 我们最喜爱的库之一 pp.rb，现已自动加载。无需手动写 `require "pp"` 来加载。[[功能 #14123]](https://bugs.ruby-lang.org/issues/14123)
* 逆序打印（从旧到新）调用跟踪和错误消息。当在终端（TTY）中有较长的调用跟踪信息时，你可以从最底部看到直接触发问题的行。需要注意的是，仅当在直接输出到终端时，才会逆序打印。[[功能 #8661]](https://bugs.ruby-lang.org/issues/8661) [试验性]

## 性能提升

* 通过在字节码中移除了全部 `trace` 指令提升了大约 5-10% 的性能。`trace` 指令的引入是为了提供 `TracePoint` 的支持。然而，在大多数情况，`TracePoint` 不会被用到，`trace` 指令增加了额外的开销。作为替代，我们实现了一个动态指令技术，详情见 [[功能 #14104]](https://bugs.ruby-lang.org/issues/14104)。
* 通过懒惰 Proc 分配使 block 参数传递代码块（例如 `def foo(&b); bar(&b); end`）的性能相较于 Ruby 2.4 提升了约 3 倍。[[功能 #14045]](https://bugs.ruby-lang.org/issues/14045)
* 互斥锁的复写变得更轻量和快速。[[功能 #13517]](https://bugs.ruby-lang.org/issues/13517)
* ERB 现在模板生成代码的速度相较于 Ruby 2.4 提升 2 倍。
* 提升了多个内置方法例如 `Array#concat`, `Enumerable#sort_by`, `String#concat`, `String#index`, `Time#+` 等的性能。
* IO.copy\_stream 使用 copy\_file\_range(2) 来拷贝负载。[[功能 #13867]](https://bugs.ruby-lang.org/issues/13867)

## 与 2.4 相比的重要变化

* SecureRandom 倾向使用操作系统方法而非 OpenSSL。[[漏洞 #9569]]((https://bugs.ruby-lang.org/issues/9569))
* 将 cmath, csv, date, dbm, etc, fcntl, fiddle, fileutils, gdbm, ipaddr, scanf, sdbm, stringio, strscan, webrick, zlib 从标准库中提升到默认 gem。
* 升级 [Onigmo](https://github.com/k-takata/Onigmo/) 到 6.1.3。
  * 添加 [缺位运算符](https://github.com/k-takata/Onigmo/issues/87)。
  * 注意，Ruby 2.4.1 也包含这项改动。
* 更新到 Psych 3.0.2。
* 更新到 RubyGems 2.7.3。
* 更新到 RDoc 6.0.1。
  * [词法分析程序由 IRB 更换为 Ripper](https://github.com/ruby/rdoc/pull/512)，极大提升了生成文档的速度。
  * 修正近十年来的大量缺陷。
  * 支持近些年 Ruby 的新句法。
* 更新到 Unicode 10.0.0。
* `Thread.report_on_exception` 默认值现为 true，这对调试多线程程序很有帮助。[功能 #14143]
* IO#write 现接受多个参数 [[功能 #9323]](https://bugs.ruby-lang.org/issues/9323)

详见 [NEWS](https://github.com/ruby/ruby/blob/v2_5_0/NEWS) 或[提交记录](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)以查看详情。

自 Ruby 2.4.0 以来，已有 [6158 个文件更改，348484 行增加(+)，82747 行删减(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0)！

圣诞快乐！享受你 Ruby 2.5 的编程之旅吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.gz>

      SIZE:   15834941 bytes
      SHA1:   58f77301c891c1c4a08f301861c26b1ea46509f6
      SHA256: 46e6f3630f1888eb653b15fa811d77b5b1df6fd7a3af436b343cfe4f4503f2ab
      SHA512: 0712fe68611f5d0cd6dd54b814f825478e64b6a62bdf67bce431f4dca2dc00b1a33f77bebfbcd0a151118a1152554ab457decde435b424aa1f004bc0aa40580d

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.zip>

      SIZE:   19495617 bytes
      SHA1:   700b6f55d689a5c8051c8c292b9e77a1b50bf96e
      SHA256: 94559ea6e3c619423da604e503ce1dc1c465d6e0747a07fbdc5f294acaf14c24
      SHA512: e4324064cee8c65b80192e3eff287e915d2d40464d300744c36fb326ae4b1846911400a99d4332192d8a217009d3a5209b43eb5e8bc0b739035bef89cc493e84

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.bz2>

      SIZE:   13955820 bytes
      SHA1:   827b9a3bcffa86d1fc9ed96d403cb9dc37731688
      SHA256: d87eb3021f71d4f62e5a5329628ac9a6665902173296e551667edd94362325cc
      SHA512: 8f6fdf6708e7470f55bc009db2567cd8d4e633ad0678d83a015441ecf5b5d88bd7da8fb8533a42157ff83b74d00b6dc617d39bbb17fc2c6c12287a1d8eaa0f2c

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0.tar.xz>

      SIZE:   11292472 bytes
      SHA1:   9c7babcf9e299be3f197d9091024ae458f1a1273
      SHA256: 1da0afed833a0dab94075221a615c14487b05d0c407f991c8080d576d985b49b
      SHA512: 55714a33d7661fe8b432f73c34fd67b49699f8b79df1cbd680a74899124d31111ab0f444677672aac1ba725820182940d485efb2db0bf2bc96737c5d40c54578
