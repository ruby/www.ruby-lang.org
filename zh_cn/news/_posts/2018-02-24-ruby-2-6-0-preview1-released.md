---
layout: news_post
title: "Ruby 2.6.0-preview1 已发布"
author: "naruse"
translator: "Delton Ding"
date: 2018-02-24 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.6.0-preview1 已发布。

Ruby 2.6.0-preview1 是 Ruby 2.6.0 系列的首个测试版本。此次 preview1 发布比以往早，因为其包括了重要新特性：JIT。

## JIT

Ruby 2.6 引入了 JIT (Just-in-time) 编译器的初始实现。

JIT 编译器旨在提升任何 Ruby 程序的执行速度。不同于其他语言中常见的 JIT 编译器，Ruby 的 JIT 编译器进行 JIT 编译的过程非常独特。其将生成的 C 代码打印至磁盘并 spawn 常见的 C 编译器进行代码的生成工作。详见：[Vladimir Makarov 的 MJIT 组织](https://github.com/vnmakarov/ruby/tree/rtl_mjit_branch#mjit-organization)。

如何使用：在命令行或 `$RUBYOPT` 环境变量中指定 `--jit` 参数。指定 `--jit-verbose=1` 将允许打印 JIT 编译过程中的调试信息。详见 `ruby --help` 查看更多其他选项。

此 JIT 发布的主要目的是检查平台的兼容性，以及在 2.6 版本发布前找出安全风险。目前 JIT 编译器只当 Ruby 由 gcc 或 clang 编译后编译器仍可被运行时发现时可用，除此之外你暂时无法使用 JIT。

作为 2.6.0-preview1，我们在为 JIT 的基础设施作准备，所以实现了很少的优化。你可以通过此版本中的 micro benchmarks 测量出潜在的性能提升，但这并 **不是** 准备好接受最终性能测试的 Ruby JIT 编译器，特别是对于大型应用，例如 Rails 的测试。

我们正着手实现 JIT 编译器的内联方法，这将有助于大幅提升 Ruby 的性能。此外，我们计划增加支持的平台的数量，而下一个目标是支持 Visual Studio。

请保持对 Ruby 新时代性能的关注。

## 新特性

* 新增 `Random.bytes`。[功能 #4938]

* 新增 `Binding#source_location`。[功能 #14230]

  此方法以一个二元组数组 `__FILE__` 和 `__LINE__` 的形式返回 binding 的源代码路径。传统上，这可以通过执行 `eval("[__FILE__, __LINE__]", binding)` 来获得相同的数据。但我们计划改变这一行为让 `Kernel#eval` 忽略 `binding` 的源代码路径 [漏洞 #4352]。所以，用户需要通过新加入的方法来替代之前的 `Kernel#eval`。

* 增加 `:exception` 选项，以让 `Kernel.#system` 抛出错误而不是返回 `false`。[功能 #14386]

## 性能提升

* 提升 `Proc#call` 的速度，因为我们无需再关心 `$SAFE`。[功能 #14318]

  通过 `lc_fizzbuzz` 多次使用 `Proc#call` 的基准测试我们测量到了 1.4 倍性能提升 [漏洞 #10212]。

* 提升了当 `block` 是代码块参数时 `block.call` 的性能。[功能 #14330]

  Ruby 2.5 提升了代码块传递的性能。[功能 #14045] 另外，Ruby 2.6 提升了传递代码块调用时的性能。通过 micro-benchmark 我们观察到了 2.6 倍性能提升。

## 其他自 2.5 以来的重要变化

* `$SAFE` 成为了进程全局状态，我们可以再次将其设为 `0`。[功能 #14250]

* 不再建议将 `safe_level` 参数传递给 `ERB.new` 的行为。`trim_mode` 和 `eoutvar` 参数被转换成了关键词参数。[功能 #14256]

* 合并 RubyGems 2.7.6

见 [NEWS](https://github.com/ruby/ruby/blob/v2_6_0_preview1/NEWS) 或 [提交日志](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1) 以查看详情。

这些合并后，自 Ruby 2.5.0 已发生了 [1115 个文件变更，23023 行新增(+)，14748 行删除(-)](https://github.com/ruby/ruby/compare/v2_5_0...v2_6_0_preview1)！

今天 2 月 24 日，是 Ruby 25 周年的生日。祝 Ruby 生日快乐，并享受 Ruby 2.6.0-preview1 的编程吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.gz>

      SIZE:   16082501 bytes
      SHA1:   94b4a2f5f992dc9855364284e9c64316bf129c90
      SHA256: 2023c42676d9237481e1a97157d5e2ecc10db5e320d5b9cf872ec1d293265d61
      SHA512: 004696c4f087333ba7cb2285418dcce70f399966ae8fed817aab9759fd2d75beb088c4aeb294fcd4260112e8422f490cd4dbdfce402d73f96bb679b8bb3e1607

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.zip>

      SIZE:   19807007 bytes
      SHA1:   24d76f67bf913348eca783a2ecf6f3faf37299ae
      SHA256: 6c883927e80430cf07f2d90728d6c2c71164223f378a48ebf964d3b66319f623
      SHA512: 1e7f318cec1b7875fd9891df671078de7585b556695a2a85708483ddcacfd6e0b63b70ec2535e92ff981b4f72063721ed552df49688e066666fcd7ae520ae667

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.bz2>

      SIZE:   14104578 bytes
      SHA1:   9f0fb79643a4673a839b0c8496eccc6e1dbd022d
      SHA256: 8bd6c373df6ee009441270a8b4f86413d101b8f88e8051c55ef62abffadce462
      SHA512: d9cb270529a97670d54f43a0236fab072714e715c39277dab70b7a1843ec818e6700e47e1384c7256f9e0ae41ab2c0b768a0de38a5ecf4f4fff5da6ef5ad4944

* <https://cache.ruby-lang.org/pub/ruby/2.6/ruby-2.6.0-preview1.tar.xz>

      SIZE:   11423984 bytes
      SHA1:   bbbc89d760cdaadbca3cbff587295864edeff0af
      SHA256: 1d99139116e4e245ce543edb137b2a8873c26e9f0bde88d8cee6789617cc8d0e
      SHA512: d12ff29778d8d940344619881b4d8247c2fb6b44ac2b2dbddb7078828e893cfac9a5a95b5588f0afdbed52bdb6dea95cff1b9ce3ad47dfa62209e97dab8810b6
