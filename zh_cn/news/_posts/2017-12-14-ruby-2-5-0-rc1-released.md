---
layout: news_post
title: "Ruby 2.5.0-rc1 已发布"
author: "naruse"
translator: "Delton Ding"
date: 2017-12-14 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.5.0-rc1 已发布。

Ruby 2.5.0-rc1 是 Ruby 2.5.0 的第一个预览版。此版本包括数个新特性和性能提升，例如：

## 新特性

* 错误信息中的栈调用将以颠倒的顺序输出到 STDERR，但在 tty 中保持不变。[Feature #8661] [试验性]

* 顶层常量查询被移除。[Feature #11547]

* rescue/else/ensure 在 do/end 代码块中被允许。[Feature #12906]

* yield\_self [Feature #6721]

## 性能提升

* 使用 TracePoint 钩子的动态指令替代 "trace" 指令以降低间接开销。[Feature #14104]

* 通过懒惰 Proc 分配提升了使用 block 参数传递代码块的性能。[Feature #14045]

* 互斥锁的复写变得更轻量和快速。[Feature #13517]

* SecureRandom 倾向使用操作系统方法而非 OpenSSL。[Bug #9569]

## 其他自 2.4 版本其的重要变化

* 合并 Onigmo 至 6.1.3 版本。增加 [absent 运算符](https://github.com/k-takata/Onigmo/issues/87)。注意，Ruby 2.4.1 也包含次更新。
* 合并 bundler 到标准库。
* 合并 rubygems-2.7.0。
* 合并 rdoc-6.0.0.beta3。用 Ripper 替代了 lexer IRB。这大大提高了文档生成的速度。 https://github.com/ruby/rdoc/pull/512。还包括
  * 修复了过去数年大量的 bug。
  * 支持过去数年 Ruby 的新语法。
* 升级 Unicode 版本至 10.0.0。

详见 [NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS) 或提交记录以查看详情。

自 Ruby 2.4.0 以来，已有 [6162 个文件更改，339744 行增加(+)，28699 行删减(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)！

享受 Ruby 2.5.0-rc1 吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz>

      SIZE:   31049529 bytes
      SHA1:   15df7e8ff99f360a14f7747a07a3021447d65594
      SHA256: 46c11b347522de174566503d35d2b46e1529b979d292b1f7f7019cfedcd4b07f
      SHA512: 41cd298e99d7a25fe5f2ec42946ae5dbc4421bb18f39350ba8a1b02e999541ec1b21b5f6ce0489b3a159f47e37d409178ba7c21c00e177b0fdb410ca6e9d6142

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.zip>

      SIZE:   35579788 bytes
      SHA1:   b7ae42eb733d4a0e3a2d135c9f8d4af043daa728
      SHA256: 9858e39fd2e7bf207cc9f8846197b11ada5f4424f433ff4df149fe3d48be8e36
      SHA512: 86c93791d312fd2175909020e448a44892740feb809a532ed706c6d850cb92722fb7ca02ecbdf7a1fbeb5b4f42f1338ce9a15b7c0a41055937bd1fdfb4be6f11

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.bz2>

      SIZE:   29238901 bytes
      SHA1:   6aad74ed3d30de63c6ff22048cd0fcbcbe123586
      SHA256: 862a8e9e52432ba383660a23d3e87af11dbc18c863a19ef6367eb8259fc47c09
      SHA512: bf0eb114097f9e505ff846f25e7556a2fb393573b4e8b773f94cf5b47998e221f3962a291db15a3cdbdf4ced5a523812937f80d95f4ee3f7b13c4e37f178d7a7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.xz>

      SIZE:   26096412 bytes
      SHA1:   05cacd0341b7a23cc68239c2061640643a30da38
      SHA256: a479a1bce69b2cf656821f10104dcb8b426922b56d3d6cbdf48318842fae752c
      SHA512: 9f9040abf69337439a3f31b80d440d97736555b0df6533d9d34c141ce52226bc40c3f4f7e596e74b080c879e933649c17a073c893be1a304d9a883bab02e9494
