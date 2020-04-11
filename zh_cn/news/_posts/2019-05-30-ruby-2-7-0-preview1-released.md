---
layout: news_post
title: "Ruby 2.7.0-preview1 已发布"
author: "naruse"
translator: "Delton Ding"
date: 2019-05-30 00:00:00 +0000
lang: zh_cn
---

我们很高兴宣布 Ruby 2.7.0-preview1 已发布。

此版本的发布是为了十二月发布的正式版收集反馈意见。此版本引入了大量新特性和性能提升，其中最值得注意的是：

* 紧凑 GC（Compaction GC）
* 模式匹配
* REPL 改进

## 紧凑 GC（Compaction GC）

此版本引入了 Compaction GC，可以对内存空间碎片进行整理。

某些多线程 Ruby 程序会导致内存碎片化，进而导致内存占用率提高和速度降低。

我们引入了 `GC.compact` 方法来压缩堆。此函数能压缩堆中的存活对象，以更少地占用内存分页。并且堆可能会变得对写入时复制（CoW）更友好。
[#15626](https://bugs.ruby-lang.org/issues/15626)

## 模式匹配 [实验性]

在函数式编程中非常常用的模式匹配功能，作为实验性功能被加入了。[#14912](https://bugs.ruby-lang.org/issues/14912) 它可以遍历一个对象，并在其满足某一模式时进行赋值。

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

关于更多信息，请查阅 [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7)。

## REPL 改进

`irb`，集成的交互环境 (REPL; Read-Eval-Print-Loop)，现已支持多行编辑，由 `reline`、`readline` 实现了纯 Ruby 的支持。它还提供 rdoc 集成。在 irb 中您可以为指定的类、模块或方法的显示引用。[#14683](https://bugs.ruby-lang.org/issues/14683)、[#14787](https://bugs.ruby-lang.org/issues/14787)、[#14918](https://bugs.ruby-lang.org/issues/14918) 此外，`binding.irb` 中显示的代码和核心类的检查结果现在已经可以彩色呈现。

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## 其它值得关注的新特性

* 方法引用运算符，<code>.:</code>，作为实验性功能加入了。[#12125]( https://bugs.ruby-lang.org/issues/12125)、[#13581]( https://bugs.ruby-lang.org/issues/13581)

* 实验性地加入了把编号参数作为默认的块参数的特性。[#4475](https://bugs.ruby-lang.org/issues/4475)

* 无头范围实验性地加入了。它可能尽管没有无限范围那么有用，但它对开发 DSL 是非常有用的。[#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # 与 ary[0..3]
      rel.where(sales: ..100) 等价

* 新增了 `Enumerable#tally`，它会计算每个元素出现的次数。

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## 性能改进

* JIT [实验性质]

  * 当优化假设不成功时，JIT 后的代码可能会被重新编译到优化程度较低的代码。

  * 当方法（Method）被认为是纯函数（pure）时，会进行方法内联优化。这种优化方法仍是实验性的，许多方法不被认为是纯函数。

  * `--jit-min-calls` 的默认值从 5 调整到 10,000。

  * `--jit-max-cache` 的默认值从 1,000 调整到 100。

## 其他自 2.6 版本以來显著的变化

* 现在进行块方法调用时，如果 `Proc.new` 和 `proc` 在没有 block 会产生警告。

* `lambda` 在方法调用时如果没有 block 会产生区块错误。

* Unicode 和 Emoji 版本从 11.0.0 更新至 12.0.0。[[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* 更新 Unicode 至 12.1.0 版本，新增对于新年号「令和」 U+32FF 的支持。[[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`、`Date#jisx0301` 和 `Date.parse` 展示支持新的日本年号作为非正式的扩展功能，直到新的 JIS X 0301 发布。[[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* 编译器需要支持 C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * 关于我们使用方言的具体信息请查阅：<https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

见 [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) 或 [提交日志](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) 以查看详情。

这些合并后，自 Ruby 2.6.0 已发生了 [1727 个文件变更，76022 行新增(+)，60286 行删除(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1)！

享受使用 Ruby 2.7 编程吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## Ruby 是什么

Ruby 是最初由 Matz（Yukihiro Matsumoto）于 1993 年开发，现在作为开源软件开发的语言。它可以在多个平台上运行，并在世界各地使用。尤其适合于网站的开发
