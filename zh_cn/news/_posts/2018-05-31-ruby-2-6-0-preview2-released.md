---
layout: news_post
title: "Ruby 2.6.0-preview2 已发布"
author: "naruse"
translator: "Delton Ding"
date: 2018-05-31 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.6.0-preview2 已发布。

Ruby 2.6.0-preview2 是 Ruby 2.6.0 系列的第二个测试版本。此次 preview2 发布比以往早，因为其包括了重要新特性：JIT。

## JIT

Ruby 2.6 引入了 JIT (Just-in-time) 编译器的初始实现。

JIT 编译器旨在提升任何 Ruby 程序的执行速度。不同于其他语言中常见的 JIT 编译器，Ruby 的 JIT 编译器进行 JIT 编译的过程非常独特。其将生成的 C 代码打印至磁盘并 spawn 常见的 C 编译器进行代码的生成工作。详见：[Vladimir Makarov 的 MJIT 组织](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)。

如何使用：在命令行或 `$RUBYOPT` 环境变量中指定 `--jit` 参数。指定 `--jit-verbose=1` 将允许打印 JIT 编译过程中的调试信息。详见 `ruby --help` 查看更多其他选项。

此 JIT 发布的主要目的是检查平台的兼容性，以及在 2.6 版本发布前找出安全风险。目前 JIT 编译器只当 Ruby 由 gcc 或 clang 编译后编译器仍可被运行时发现时可用，除此之外你暂时无法使用 JIT。

作为 2.6.0-preview2，我们在为 JIT 的基础设施作准备，所以实现了很少的优化。你可以通过此版本中的 micro benchmarks 测量出潜在的性能提升，但这并 **不是** 准备好接受最终性能测试的 Ruby JIT 编译器，特别是对于大型应用，例如 Rails 的测试。

我们正着手实现 JIT 编译器的内联方法，这将有助于大幅提升 Ruby 的性能。此外，我们计划增加支持的平台的数量，而下一个目标是支持 Visual Studio。

请保持对 Ruby 新时代性能的关注。

## RubyVM::AST [试验性]

Ruby 2.6 引入了 `RubyVM::AST` 模块。

此模块提供 `parse` 方法，传入 Ruby 代码字符串，返回 AST（抽象语法树） 节点。而 `parse_file` 方法则接受一个 Ruby 代码文件作为参数，返回 AST 节点。

同时引入了 `RubyVM::AST::Node` 类，你可以从 `Node` 对象中获取位置信息和子节点。此功能尚处于实验性质，对于 AST 节点的兼容性不做保证。

## 新特性

* 为 `Kernel#yield_self` 添加了新别名 `then`。[[功能 #14594]](https://bugs.ruby-lang.org/issues/14594)

* 不含 `rescue` 的 `else` 现在会引起语法错误。[实验性质]

* 常量名现在可以以非 ASCII 大写字母开头。[[功能 #13770]](https://bugs.ruby-lang.org/issues/13770)

* 无限范围 [[功能 #12912]](https://bugs.ruby-lang.org/issues/12912)

  引入了无限范围 `(1..)`。这个范围没有终点，以下是使用场景的举例。

      ary[1..]                          # 等价于 ary[1..-1] 而不需要魔法的 -1
      (1..).each {|index| ... }         # 从 1 开始的无限循环
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* 新增 `Binding#source_location`。[[功能 #14230]](https://bugs.ruby-lang.org/issues/14230)

  此方法以一个二元组数组 `__FILE__` 和 `__LINE__` 的形式返回 binding 的源代码路径。传统上，这可以通过执行 `eval("[__FILE__, __LINE__]", binding)` 来获得相同的数据。但我们计划改变这一行为让 `Kernel#eval` 忽略 `binding` 的源代码路径 [[漏洞 #4352]](https://bugs.ruby-lang.org/issues/4352)。所以，用户需要通过新加入的方法来替代之前的 `Kernel#eval`。

* 增加 `:exception` 选项，以让 `Kernel.#system` 抛出错误而不是返回 `false`。[[功能 #14386]](https://bugs.ruby-lang.org/issues/14386)

## 性能提升

* 提升 `Proc#call` 的速度，因为我们无需再关心 `$SAFE`。[[功能 #14318]](https://bugs.ruby-lang.org/issues/14318)

  通过 `lc_fizzbuzz` 多次使用 `Proc#call` 的 benchmark 我们测量到了 1.4 倍性能提升 [[漏洞 #10212]]((https://bugs.ruby-lang.org/issues/10212))。

* 提升了当 `block` 是代码块参数时 `block.call` 的性能。[[功能 #14330]]((https://bugs.ruby-lang.org/issues/14330))

  Ruby 2.5 提升了代码块传递的性能。[[功能 #14045]](https://bugs.ruby-lang.org/issues/14045) 另外，Ruby 2.6 提升了传递代码块调用时的性能。通过 micro-benchmark 我们观察到了 2.6 倍性能提升。

## 其他自 2.5 以来的重要变化

* `$SAFE` 成为了进程全局状态，我们可以再次将其设为 `0`。[[功能 #14250]](https://bugs.ruby-lang.org/issues/14250)

* 不再建议将 `safe_level` 参数传递给 `ERB.new` 的行为。`trim_mode` 和 `eoutvar` 参数被转换成了关键词参数。[[功能 #14256]](https://bugs.ruby-lang.org/issues/14256)

* 合并 RubyGems 3.0.0.beta1

见 [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview2/NEWS) 或 [提交日志](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2) 以查看详情。

这些合并后，自 Ruby 2.5.0 已发生了 [4699 个文件变更，45744 行新增(+)，30885 行删除(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview2)！

享受 Ruby 2.6.0-preview2 的编程吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.gz>

      SIZE:   16170732 bytes
      SHA1:   6867b00e81af0b70fcb6f1aa7fc22d89d48a7d12
      SHA256: ee15ab35f17c942b1f41bd792f2494f639affff6e03babf44708b72fdbb6de34
      SHA512: 95c5a277785dfeb3006503e1b9ccccefdf6ce29669d4576f0191ee6986ba0e3567fbbed18a8d2b1f147d637434e4a3a4fdf47d84995e10ad4a354950e9092690

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.zip>

      SIZE:   19850776 bytes
      SHA1:   eba80a09b552ce3142fd571ff5867a13736d170e
      SHA256: 97fc187b90570fce110d22803a319ab04e68700692b2b6b4e9961886f1a931e5
      SHA512: d5501819635bda64ac3dc717815652b692302b44a7cdf4c08edfa5cb9ec7f79a70fffc534879b316a4a9584825ed3c0948667beae2d7c313de58583931b981f4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.bz2>

      SIZE:   14209461 bytes
      SHA1:   a9b1b4f359601b94b3f5b77115fcbf3790ff69cd
      SHA256: d8ede03d5ad3abd9d2c81cf0ad17a41d22b747c003cc16fd59befb2aaf48f0b2
      SHA512: 3872227e9b1c97c206d19bf1e6ce15a38ee15a26c431b4436605dea67affcf16372358984df76b35e7abaa902c15c16f533ac7af47e3031dea9451bbe459b693

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview2.tar.xz>

      SIZE:   11525372 bytes
      SHA1:   e795abe1a4f828b3d851f7148b4bf6c9d9a7e7fd
      SHA256: 00ddfb5e33dee24469dd0b203597f7ecee66522ebb496f620f5815372ea2d3ec
      SHA512: bef3e90e97d6e58889cd500c591c579b728ca5833022b690182c0bf4d661e437b3a2ca33470dac35fcf693897819b9d7f500c0f71b707e2fcdcb0644028f2c03
