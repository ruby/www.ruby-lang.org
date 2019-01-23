---
layout: news_post
title: "Ruby 2.6.0 已发布"
author: "naruse"
translator: "Delton Ding"
date: 2018-12-25 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.6.0 已发布。

Ruby 2.6.0 引入了许多新特性以及性能提升，其中最值得瞩目的是：

 * 全新的 JIT 编译器
 * `RubyVM::AbstractSyntaxTree` 模块

## JIT [实验性]

Ruby 2.6 引入了 JIT (Just-in-time) 编译器的初始实现。

JIT 编译器旨在提升任何 Ruby 程序的执行速度。不同于其他语言中常见的 JIT 编译器，Ruby 的 JIT 编译器进行 JIT 编译的过程非常独特。其将生成的 C 代码打印至磁盘并 spawn 常见的 C 编译器进行代码的生成工作。详见：[Vladimir Makarov 的 MJIT 组织](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)。

如何使用：在命令行或 `$RUBYOPT` 环境变量中指定 `--jit` 参数。指定 `--jit-verbose=1` 将允许打印 JIT 编译过程中的调试信息。详见 `ruby --help` 查看更多其他选项。

JIT 编译器需要在 Ruby 由 GCC、Clang 或 Microsoft VC++ 编译后，编译器仍可被运行时发现时才可用。

Ruby 2.6.0-rc1 在使用 CPU 密集型场景下的复杂 Benchmark Optcarrot <https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208> 进行测试后，比起 Ruby 2.5 取得了 [1.7 倍的性能提升](https://gist.github.com/k0kubun/d7f54d96f8e501bbbc78b927640f4208)。然而，许多内存密集型场景（例如 Rails）可能暂时无法从中获益。你可以查看 [Ruby 2.6 JIT - 进展与未来（英文）](https://medium.com/@k0kubun/ruby-2-6-jit-progress-and-future-84e0a830ecbf)来了解更多详情。

请保持对 Ruby 新时代性能的关注。

## RubyVM::AbstractSyntaxTree [试验性]

Ruby 2.6 引入了 `RubyVM::AbstractSyntaxTree` 模块。**但对于 AST 节点的向后兼容性不做保证。**

此模块提供 `parse` 方法，传入 Ruby 代码字符串，返回 AST（抽象语法树）节点。而 `parse_file` 方法则接受一个 Ruby 代码文件作为参数，返回 AST 节点。

同时引入了 `RubyVM::AbstractSyntaxTree::Node` 类，你可以从 `Node` 对象中获取位置信息和子节点。此功能尚处于实验性质。

## 其它新特性

* 为 `Kernel#yield_self` 添加了新别名 `then`。[[功能 #14594]](https://bugs.ruby-lang.org/issues/14594)

* 常量名现在可以以非 ASCII 大写字母开头。[[功能 #13770]](https://bugs.ruby-lang.org/issues/13770)

* 无限范围 [[功能 #12912]](https://bugs.ruby-lang.org/issues/12912)

  引入了无限范围 `(1..)`。这个范围没有终点，以下是使用场景的举例。

      ary[1..]                          # 等价于 ary[1..-1] 而不需要魔法的 -1
      (1..).each {|index| ... }         # 从 1 开始的无限循环
      ary.zip(1..) {|elem, index| ... } # ary.each.with_index(1) { ... }

* 新增 `Enumerable#chain` 与 `Enumerator#+` [[功能 #15144]](https://bugs.ruby-lang.org/issues/15144)

* 为 `Proc` 和 `Method` 新增了函数构造操作符 `<<` 与 `>>`。 [[功能 #6284]](https://bugs.ruby-lang.org/issues/6284)

      f = proc{|x| x + 2}
      g = proc{|x| x * 3}
      (f << g).call(3) # -> 11; identical to f(g(3))
      (f >> g).call(3) # -> 15; identical to g(f(3))

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

* 由于移除了对 `$SAFE` 临时赋值的支持，提升 `Proc#call` 的速度。[[功能 #14318]](https://bugs.ruby-lang.org/issues/14318)

  通过 `lc_fizzbuzz` 多次使用 `Proc#call` 的 benchmark 我们测量到了 1.4 倍性能提升 [[漏洞 #10212]]((https://bugs.ruby-lang.org/issues/10212))。

* 提升了当 `block` 是代码块参数时 `block.call` 的性能。[[功能 #14330]]((https://bugs.ruby-lang.org/issues/14330))

  通过与 Ruby 2.5 中引入的提升代码块传递的性能的方法结合，Ruby 2.6 进一步提升了传递代码块调用时的性能。通过 micro-benchmark 我们观察到了 2.6 倍性能提升。[[功能 #14045]](https://bugs.ruby-lang.org/issues/14045)

* 引入了瞬态堆 (theap)。 [[漏洞 #14858]](https://bugs.ruby-lang.org/issues/14858) [[功能 #14989]](https://bugs.ruby-lang.org/issues/14989)

  瞬态堆是用于管理指向特定类（Array、Hash、Object 和 Struct）短生命周期内存对象的堆。例如，创建小而短生命周期的哈希对象的速度提升到了 2 倍快。根据 rdoc benchmark，我们观察到了 6% 到 7% 的性能提升。

* 协程采用了原生实现（`arm32`、`arm64`、`ppc64le`、`win32`、`win64`、`x86`、`amd64`）显著提升了 Fiber 的性能。 [[功能 #14739]](https://bugs.ruby-lang.org/issues/14739)

  `Fiber.yield` 与 `Fiber#resume` 方法在 64 位 Linux 上提升了 5 倍性能。对于使用 Fiber 密集的程序，约有最高 5% 的性能提升。

## 其它自 2.5 以来值得注意的新特性

* `$SAFE` 成为了进程全局状态，我们可以再次将其设为 `0`。[[功能 #14250]](https://bugs.ruby-lang.org/issues/14250)

* 不再建议将 `safe_level` 参数传递给 `ERB.new` 的行为。`trim_mode` 和 `eoutvar` 参数被转换成了关键词参数。[[功能 #14256]](https://bugs.ruby-lang.org/issues/14256)

* 升级支持的 Unicode 版本至 11。我们计划在未来 Ruby 2.6 的小更新中升级至 12 和 12.1。其将引入新的[日本年号](http://blog.unicode.org/2018/09/new-japanese-era.html)。

* 合并 RubyGems 3.0.1，`--ri` 和 `--rdoc` 选项已被移除。请使用 `--document` 和 `--no-document` 选项来替代他们。

* 合并 [Bundler](https://github.com/bundler/bundler) 作为默认 gem。

* 不含 `rescue` 的 `else` 现在会引起语法错误。[实验性][[功能 #14606]](https://bugs.ruby-lang.org/issues/14606)

见 [NEWS](https://github.com/ruby/ruby/blob/v2_6_0/NEWS) 或 [提交日志](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0) 以查看详情。

这些合并后，自 Ruby 2.5.0 已发生了 [6437 个文件变更，231471 行新增(+)，98498 行删除(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0)！

圣诞快乐！享受你 Ruby 2.6 的编程之旅吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.gz>

      SIZE:   16687800 bytes
      SHA1:   c95f4e86e21390270dad3ebb94491fd42ee2ce69
      SHA256: f3c35b924a11c88ff111f0956ded3cdc12c90c04b72b266ac61076d3697fc072
      SHA512: 01f886b0c0782a06315c4a46414e9f2b66ee634ba4349c8e0697f511793ae3c56d2ad3cad6563f2b0fdcedf0ff3eba51b9afab907e7e1ac243475772f8688382

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.zip>

      SIZE:   20582054 bytes
      SHA1:   a804e63d18da12107e1d101918a3d8f4c5462a27
      SHA256: 8a4fb6ca58202495c9682cb88effd804398bd0ef023e3e36f001ca88d8b5855a
      SHA512: 16d66ec4a2c6a2e928d5b50e094a5efa481ac6e4d5ed77459d351ef19fe692aa59b68307e3e25229eec5f30ae2f9adae2663bafe9c9d44bfb45d3833d77839d4

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.bz2>

      SIZE:   14585856 bytes
      SHA1:   b8638eb806efbf7b6af87b24ccc6ad915f262318
      SHA256: c89ca663ad9a6238f4b1ec4d04c7dff630560c6e6eca6d30857c4d394f01a599
      SHA512: ca3daf9acf11d3db2900af21b66231bd1f025427a9d2212b35f6137ca03f77f57171ddfdb99022c8c8bcd730ff92a7a4af54e8a2a770a67d8e16c5807aa391f1

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0.tar.xz>

      SIZE:   11918536 bytes
      SHA1:   9ddaeba3505d2855460c8c653159fc0ac8928c0f
      SHA256: acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f
      SHA512: c56eaf85ef7b79deb34ee4590b143c07f4fc83eb79775290761aee5a7c63374659613538a41f25706ed6e19e49d5c67a1014c24d17f29948294c7abd0b0fcea8
