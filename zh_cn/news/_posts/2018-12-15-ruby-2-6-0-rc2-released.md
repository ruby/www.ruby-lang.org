---
layout: news_post
title: "Ruby 2.6.0-rc2 已发布"
author: "naruse"
translator: "Delton Ding"
date: 2018-12-15 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.6.0-rc-2 已发布。

Ruby 2.6.0-rc2 是 Ruby 2.6.0 的第二个候选版本。发布 RC2 是为了测试将内置的 Bundler 1.17 升级至 2.0。此版本包括数个新特性和性能提升，例如：

## JIT

Ruby 2.6 引入了 JIT (Just-in-time) 编译器的初始实现。

JIT 编译器旨在提升任何 Ruby 程序的执行速度。不同于其他语言中常见的 JIT 编译器，Ruby 的 JIT 编译器进行 JIT 编译的过程非常独特。其将生成的 C 代码打印至磁盘并 spawn 常见的 C 编译器进行代码的生成工作。详见：[Vladimir Makarov 的 MJIT 组织](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)。

如何使用：在命令行或 `$RUBYOPT` 环境变量中指定 `--jit` 参数。指定 `--jit-verbose=1` 将允许打印 JIT 编译过程中的调试信息。详见 `ruby --help` 查看更多其他选项。

此 JIT 发布的主要目的是检查平台的兼容性，以及在 2.6 版本发布前找出安全风险。目前 JIT 编译器只当 Ruby 由 gcc clang 或 Microsoft VC++ 编译后，编译器仍可被运行时发现时可用，除此之外你暂时无法使用 JIT。

Ruby 2.6.0-rc2 在使用 CPU 密集型场景下的复杂 Benchmark Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208> 进行测试后，比起 Ruby 2.5 取得了 1.7 倍的性能提升。我们会进一步提升其在内存密集型场景，例如 Rails 应用中的性能。

请保持对 Ruby 新时代性能的关注。

## RubyVM::AbstractSyntaxTree [试验性]

Ruby 2.6 引入了 `RubyVM::AbstractSyntaxTree` 模块。

此模块提供 `parse` 方法，传入 Ruby 代码字符串，返回 AST（抽象语法树）节点。而 `parse_file` 方法则接受一个 Ruby 代码文件作为参数，返回 AST 节点。

同时引入了 `RubyVM::AbstractSyntaxTree::Node` 类，你可以从 `Node` 对象中获取位置信息和子节点。此功能尚处于实验性质，对于 AST 节点的兼容性不做保证。

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

* `FileUtils#cp_lr`。[[功能 #4189]](https://bugs.ruby-lang.org/issues/4189)

## 性能提升

* 提升 `Proc#call` 的速度，因为我们无需再关心 `$SAFE`。[[功能 #14318]](https://bugs.ruby-lang.org/issues/14318)

  通过 `lc_fizzbuzz` 多次使用 `Proc#call` 的 benchmark 我们测量到了 1.4 倍性能提升 [[漏洞 #10212]]((https://bugs.ruby-lang.org/issues/10212))。

* 提升了当 `block` 是代码块参数时 `block.call` 的性能。[[功能 #14330]]((https://bugs.ruby-lang.org/issues/14330))

  Ruby 2.5 提升了代码块传递的性能。[[功能 #14045]](https://bugs.ruby-lang.org/issues/14045) 另外，Ruby 2.6 提升了传递代码块调用时的性能。通过 micro-benchmark 我们观察到了 2.6 倍性能提升。

* 引入了瞬态堆 (theap)。 [[漏洞 #14858]](https://bugs.ruby-lang.org/issues/14858) [[功能 #14989]](https://bugs.ruby-lang.org/issues/14989) 瞬态堆是用于管理指向特定类（Array、Hash、Object 和 Struct）短生命周期内存对象的堆。例如，创建小而短生命周期的哈希对象的速度提升到了 2 倍快。根据 rdoc benchmark，我们观察到了 6% 到 7% 的性能提升。

## 其他自 2.5 以来的重要变化

* `$SAFE` 成为了进程全局状态，我们可以再次将其设为 `0`。[[功能 #14250]](https://bugs.ruby-lang.org/issues/14250)

* 不再建议将 `safe_level` 参数传递给 `ERB.new` 的行为。`trim_mode` 和 `eoutvar` 参数被转换成了关键词参数。[[功能 #14256]](https://bugs.ruby-lang.org/issues/14256)

* 升级支持的 Unicode 版本至 11。我们计划在未来 Ruby 2.6 的小更新中升级至 12 和 12.1。

* 合并 RubyGems 3.0.0.beta3，`--ri` 和 `--rdoc` 选项已被移除。请使用 `--document` 和 `--no-document` 选项来替代他们。

* 合并 [Bundler](https://github.com/bundler/bundler) 作为默认 gem。

见 [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_rc2/NEWS) 或 [提交日志](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2) 以查看详情。

这些合并后，自 Ruby 2.5.0 已发生了 [6411 个文件变更，228864 行新增(+)，97600 行删除(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_rc2)！

享受 Ruby 2.6.0-rc2 的编程吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.gz>

      SIZE:   16723556 bytes
      SHA1:   a4d7f8c8c3584a60fe1a57d03d80162361fe3c78
      SHA256: 9c0245e96379246040f1fd0978f8e447e7f47cdccbdaffdb83302a995276b62b
      SHA512: 789f608f93db6e12835911f3105d9abe2fabb67cd22dc3bafdff38716ac56974925738e7f7788ebef5bdf67b6fd91f84a4ee78a3e5d072cfc8ee0972de737b08

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.zip>

      SIZE:   20643747 bytes
      SHA1:   c1a2898949d929dd952880f1c1c2bac2ef2609b4
      SHA256: e8a446cf1f2ffc14483604de0a5e12c2578dd2f672ae87798ca2bbb9b7b73899
      SHA512: 2d06feae13f485f5da59574672b14d03881ed532d652648f94e2435f5d81df623b5ef532b8ba8e0b9bc4ee6baf7c0328a5610eab753a9020a0fea2673254c76c

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.bz2>

      SIZE:   14581998 bytes
      SHA1:   94bbee97de4955e67effb7f512c58300617a3a09
      SHA256: b3d03e471e3136f43bb948013d4f4974abb63d478e8ff7ec2741b22750a3ec50
      SHA512: 9bfbe83fd3699b71bae2350801d8c967eb128e79b62a9d36fc0f011b83c53cab28a280939f4cc9f0a28f9bf02dce8eea30866ca4d06480dc44289400abf580ba

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-rc2.tar.xz>

      SIZE:   11908088 bytes
      SHA1:   13a7f06d832dc28989e3e4321490a6ba528ed023
      SHA256: d620b3d87b3190867304067f3ce77f5305f7ec1b2e73b09c17710c97c028986d
      SHA512: a3dc43c0bc70dfdb9ff0d18b5b9797bbf332524f5d3bbb7940cf4e32286ca715808acfd11ebf3cdbe358a2466b7c6b5be3a7a784af7eb95c071fe1f8b4ab1261
