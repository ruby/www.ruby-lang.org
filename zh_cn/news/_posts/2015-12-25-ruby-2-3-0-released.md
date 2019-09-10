---
layout: news_post
title: "Ruby 2.3.0 发布"
author: "naruse"
translator: "安道"
date: 2015-12-25 17:00:00 +0000
lang: zh_cn
---

我们很高兴地宣布：Ruby 2.3.0 发布了。

这是 Ruby 2.3 的第一个稳定版，引入了很多新功能，例如：

新增[冻结字符串字面量的标示符](https://bugs.ruby-lang.org/issues/11473)。Ruby 2.1 针对 `"str".freeze` 进行了优化，以减少分配给对象的空间。Ruby 2.3 引入了新的魔法注释和命令行选项，用于冻结源码文件中的所有字符串字面量。此外，可以使用 `--debug=frozen-string-literal` 命令行选项找到 `"can't modify frozen String"` 错误发生的地方。

引入了[安全调用运算符](https://bugs.ruby-lang.org/issues/11537)【也叫“孤寂运算符”（lonely operator）】——`.&`。C#、Groovy 和 Swift 已经有这个运算符，其作用是简化对 `nil` 的处理，例如 `obj&.foo`。另外，还增加了 `Array#dig` 和 `Hash#dig` 方法。注意，这与 [Active Support 中的 try! 方法](http://api.rubyonrails.org/v4.2.5/classes/Object.html#method-i-try-21)行为一致，不过只对 `nil` 做特殊处理。

[内置了 did_you_mean gem](https://bugs.ruby-lang.org/issues/11252)。出现 `NameError` 以及 `NoMethodError` 异常时，这个 gem 会显示可能正确的拼写，从而简化调试。

引入 [RubyVM::InstructionSequence#to_binary 和 .load_from_binary 方法](https://bugs.ruby-lang.org/issues/11788) 作为实验功能，用于创建 ISeq（字节码）预编译系统。

Ruby 2.3.0 还做了很多性能优化，例如：[重新设定方法入口的数据结构](https://bugs.ruby-lang.org/issues/11278)；[引入新的数据表结构](https://bugs.ruby-lang.org/issues/11420)；[优化 Proc#call 方法](https://bugs.ruby-lang.org/issues/11569)；在机器码层级对分配对象和调用方法的代码进行调优；[更智能的实例变量数据结构](https://bugs.ruby-lang.org/issues/11170)；[允许 Socket 和 I/O 使用“exceptions”关键字，提高非阻塞型 I/O 的性能](https://bugs.ruby-lang.org/issues/11229)；等等。详情参见 NEWS 文件中的“Implementation improvements”一节。

完整的新功能列表和兼容性说明，请參考 [NEWS 文件](https://github.com/ruby/ruby/blob/v2_3_0/NEWS)和 [ChangeLog 文件](https://github.com/ruby/ruby/blob/v2_3_0/ChangeLog)。

自 Ruby 2.2.0 发布以来，共有 [2946 个文件发生了变动，增加了 104057 行代码，删除了 59478 行代码](https://github.com/ruby/ruby/compare/v2_2_0...v2_3_0)！

圣诞快乐，节日愉快！享受用 Ruby 2.3 编程的美好时光吧！

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.bz2>

      SIZE:   14185617 bytes
      SHA1:   6c8a832d49d22755ea8c45b6d53faf2ccc6d6ac9
      SHA256: ec7579eaba2e4c402a089dbc86c98e5f1f62507880fd800b9b34ca30166bfa5e
      SHA512: 77b707359e754c3616699d21697752741497c719dc3d6fdfb55ed639e76d52560d293ae54cbe5c63be78dc73fbe60f1b8615d704d017bdfe1994aa9747d26a6c

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.gz>

      SIZE:   17648682 bytes
      SHA1:   2dfcf7f33bda4078efca30ae28cb89cd0e36ddc4
      SHA256: ba5ba60e5f1aa21b4ef8e9bf35b9ddb57286cb546aac4b5a28c71f459467e507
      SHA512: 914d0201ecefaeb67aca0531146d2e89900833d8d2a597ec8a19be94529ab6b4be367f9b0cee2868b407288896cc14b64d96150223cac0aef8aafc46fc3dd7cc

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.tar.xz>

      SIZE:   11294412 bytes
      SHA1:   96e620e38af351c8da63e40cfe217ec79f912ba1
      SHA256: 70125af0cfd7048e813a5eecab3676249582bfb65cfd57b868c3595f966e4097
      SHA512: d893c5e6db5a0533e0da48d899c619964388852ef90e7d1b92a4363d5f189cd2dba32a009581f62b9f42a8e6027975fc3c18b64faf356f5e3ac43a8d69ec5327

* <https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.0.zip>

      SIZE:   19840511 bytes
      SHA1:   3f88617568d9a4f491e8b32dca532363f73eaa71
      SHA256: 8270bdcbc6b62a18fdf1b75bd28d5d6fc0fc26b9bd778d422393a1b98006020a
      SHA512: a3f397bb3c9c19d9b797552c5d60bb01c82db884cfa966df84881125bea35713cffd99f88fb86b271bae72d9cfb09ad9b33838cffcf6365c091459479914fdef
