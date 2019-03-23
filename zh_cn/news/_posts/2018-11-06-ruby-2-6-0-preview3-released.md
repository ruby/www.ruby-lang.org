---
layout: news_post
title: "Ruby 2.6.0-preview3 已发布"
author: "naruse"
translator: "Delton Ding"
date: 2018-11-06 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.6.0-preview3 已发布。

Ruby 2.6.0-preview3 是 Ruby 2.6.0 系列的第三个测试版本。此次 preview3 的发布意在发布候选版前测试新特性。

## JIT
Ruby 2.6 引入了 JIT (Just-in-time) 编译器的初始实现。

JIT 编译器旨在提升任何 Ruby 程序的执行速度。不同于其他语言中常见的 JIT 编译器，Ruby 的 JIT 编译器进行 JIT 编译的过程非常独特。其将生成的 C 代码打印至磁盘并 spawn 常见的 C 编译器进行代码的生成工作。详见：[Vladimir Makarov 的 MJIT 组织](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)。

如何使用：在命令行或 `$RUBYOPT` 环境变量中指定 `--jit` 参数。指定 `--jit-verbose=1` 将允许打印 JIT 编译过程中的调试信息。详见 `ruby --help` 查看更多其他选项。

此 JIT 发布的主要目的是检查平台的兼容性，以及在 2.6 版本发布前找出安全风险。目前 JIT 编译器只当 Ruby 由 gcc clang 或 Microsoft VC++ 编译后，编译器仍可被运行时发现时可用，除此之外你暂时无法使用 JIT。

Ruby 2.6.0 preview3 在使用 CPU 密集型场景下的复杂 Benchmark Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208> 进行测试后，比起 Ruby 2.5 取得了 1.7 倍的性能提升。我们会进一步提升其在内存密集型场景，例如 Rails 应用中的性能。

请保持对 Ruby 新时代性能的关注。

## RubyVM::AST [试验性]

Ruby 2.6 引入了 `RubyVM::AST` 模块。

此模块提供 `parse` 方法，传入 Ruby 代码字符串，返回 AST（抽象语法树）节点。而 `parse_file` 方法则接受一个 Ruby 代码文件作为参数，返回 AST 节点。

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

* 新增 oneshot 模式 [[功能 #15022]](https://bugs.ruby-lang.org/issues/15022)
  * 此模式检查「每一行代码是否都至少被执行一次」，而不是「每行代码被执行了几次」。每行代码的 hook 至多被调用一次，并会在调用后将 hook 标识移除。换句话说，移除后的代码运行将没有额外的性能开销。
  * 为 `Coverage.start` 方法新增 `:oneshot_lines` 关键字参数。
  * 为 `Coverage.result` 方法新增 `:stop` 和 `:clear` 关键字参数。如果 `clear` 被设置为 true，它会清空计数器。如果 `stop` 被设置为 true，它会禁用覆盖测量。
  * 新增 `Coverage.line_stub`，其为从源代码新建代码覆盖存根（stub）提供了一个简单的帮助函数。

* `FileUtils#cp_lr`.  [[功能 #4189]](https://bugs.ruby-lang.org/issues/4189)

## 性能提升

* 提升 `Proc#call` 的速度，因为我们无需再关心 `$SAFE`。[[功能 #14318]](https://bugs.ruby-lang.org/issues/14318)

  通过 `lc_fizzbuzz` 多次使用 `Proc#call` 的 benchmark 我们测量到了 1.4 倍性能提升 [[漏洞 #10212]]((https://bugs.ruby-lang.org/issues/10212))。

* 提升了当 `block` 是代码块参数时 `block.call` 的性能。[[功能 #14330]]((https://bugs.ruby-lang.org/issues/14330))

  Ruby 2.5 提升了代码块传递的性能。[[功能 #14045]](https://bugs.ruby-lang.org/issues/14045) 另外，Ruby 2.6 提升了传递代码块调用时的性能。通过 micro-benchmark 我们观察到了 2.6 倍性能提升。

* 引入了瞬态堆 (theap)。 [[漏洞 #14858]](https://bugs.ruby-lang.org/issues/14858) [[功能 #14989]](https://bugs.ruby-lang.org/issues/14989) 瞬态堆是用于管理指向特定类（Array、Hash、Object 和 Struct）短生命周期内存对象的堆。例如，创建小而短生命周期的哈希对象的速度提升到了 2 倍快。根据 rdoc benchmark，我们观察到了 6% 到 7% 的性能提升。

## 其他自 2.5 以来的重要变化

* `$SAFE` 成为了进程全局状态，我们可以再次将其设为 `0`。[[功能 #14250]](https://bugs.ruby-lang.org/issues/14250)

* 不再建议将 `safe_level` 参数传递给 `ERB.new` 的行为。`trim_mode` 和 `eoutvar` 参数被转换成了关键词参数。[[功能 #14256]](https://bugs.ruby-lang.org/issues/14256)

* 合并 RubyGems 3.0.0.beta2，`--ri` 和 `--rdoc` 选项已被移除。请使用 `--document` 和 `--no-document` 选项来替代他们。

* 合并 [Bundler](https://github.com/bundler/bundler) 作为默认 gem。

见 [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview3/NEWS) 或 [提交日志](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3) 以查看详情。

这些合并后，自 Ruby 2.5.0 已发生了 [6474 个文件变更，171888 行新增(+)，46617 行删除(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview3)！

享受 Ruby 2.6.0-preview3 的编程吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.gz>

      SIZE:   17071670 bytes
      SHA1:   67836fda11fa91e0b988a6cc07989fbceda025b4
      SHA256: 60243e3bd9661e37675009ab66ba63beacf5dec748885b9b93916909f965f27a
      SHA512: 877278cd6e9b947f5bb6ed78136efb232dcc9c5c218b7236576171e7c3cd7f6b7d10d07d8402014a14aba1fcd1913a4370f0725c561ead41d8a3fe92029f7f76

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.zip>

      SIZE:   21537655 bytes
      SHA1:   45f3c90dfffe03b746f21f24152666e361cbb41a
      SHA256: 9152af9e700349dcfa2eec196dd91587d42d70a6837fa2c415ebba1167587be1
      SHA512: 335de36cf56706326f4acc4bbd35be01e0ac5fff30d0a69b2e1630ba4c78f0e711822d1623d0099a517c824b154917d2f60be192dfb143a422cf1d17b38e1183

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.bz2>

      SIZE:   14973451 bytes
      SHA1:   5f2df5d8c5a3888ccb915d36a3532ba32cda8791
      SHA256: 1f09a2ac1ab26721923cbf4b9302a66d36bb302dc45e72112b41d6fccc5b5931
      SHA512: d1693625723796e8902f3e4c4fae444f2912af9173489f7cf18c99db2a217afc971b082fce7089e39f8edd54d762d2b4e72843c8306ed29b05ccb15ac03dbb5b

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview3.tar.xz>

      SIZE:   12291692 bytes
      SHA1:   7f8216247745215e9645568e7a02140f9a029b31
      SHA256: 9856d9e0e32df9e5cdf01928eec363d037f1a76dab2abbf828170647beaf64fe
      SHA512: b4d3b17ecf96272c43cd7518c0b54dee63fc1150ad143e1d9c9d708506fe78676c80eb96cc47b8d46d1128bd483a53f16c944963a03d1f99f00131b74714df7b
