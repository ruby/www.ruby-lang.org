---
layout: news_post
title: "Ruby 2.0.0-p195 发布"
author: "nagachika"
translator: "Andor Chen"
date: 2013-05-14 13:00:01 +0000
lang: zh_cn
---

Ruby 2.0.0-p195 发布了，这是 2.0.0 的第一个补丁版本。

此次发布的版本修正了 Ruby DL / Fiddle 扩展的安全问题。

* [Object taint bypassing in DL and Fiddle in Ruby
  (CVE-2013-2065)](/en/news/2013/05/14/taint-bypass-dl-fiddle-cve-2013-2065/)

同时还修正了很多错误，做了优化，并改正了文档。

## 下载

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.bz2)

      大小:   10807456 bytes
      MD5:    2f54faea6ee1ca500632ec3c0cb59cb6
      SHA256: 0be32aef7a7ab6e3708cc1d65cd3e0a99fa801597194bbedd5799c11d652eb5b

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz)

      大小:   13641558 bytes
      MD5:    0672e5af309ae99d1703d0e96eff8ea5
      SHA256: a2fe8d44eac3c27d191ca2d0ee2d871f9aed873c74491b2a8df229bfdc4e5a93

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.zip)

      大小:   15092199 bytes
      MD5:    924fe4bea72b1b258655211998631791
      SHA256: 81a4dc6cc09e491d417a51e5983c4584eff849e2a186ec3affdbe5bc15cd7db5

## 变动

主要的修正如下。详细说明参见
[ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_0_0_195) 或
[Tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&status_id=5)。

感谢所有的贡献者。

### 核心 - prepend

- \#7841 Module#prepend 现在能够识别循环前置。
- \#7843 修正移除前置方法引起的异常。
- \#8357 修正 Module#prepend 对 Module 比较操作符的影响。
- \#7983 修正 Module#prepend 无法为 Fixnum 类添加操作符方法的问题。
- \#8005 修正定义为 private/protected 的方法在植入的类中无法调用的问题。
- \#8025 修正 Module#included_modules 包含类名的问题。

### 核心 - 关键字参数

- \#7922 修正未命名剩余参数引起的 SyntaxError 异常。
- \#7942 只接受关键字参数的方法，定义时参数两旁可以不加括号。
- \#8008 修正使用关键字参数时调用 super 的问题。
- \#8236 修正调用 `super' 时处理剩余参数和关键字参数的问题。
- \#8260 非符号键不应该当做关键字参数。

### 核心 - Refinements

- \#7925 修正 refinements 功能在块中调用 super 的问题。

### 核心 - GC

- \#8092 增强 GC.stat[:heap_live_num] 的精确度。
- \#8146 避免非必要的堆增长。
- \#8145 修正 RUBY_FREE_MIN 特大值引起的无限内存使用增长。

### 核心 - 正则表达式

- \#7972 修正正则表达式 POSIX 空格组位置的影响。
- \#7974 修正正则表达式不区分大小写组无法使用的问题。
- \#8023 修正 /m 模式下向后环视失败的问题。
- \#8001 修正 \Z 匹配的准确度。

### 核心 - 其他

- \#8063 修正 D_FORTIFY_SOURCE=2 环境（例如 Ubuntu）中，潜在的内存使用冲突，并避免程序终止。
- \#8175 修正 ARGF#skip 未达到文档说明功能的问题。
- \#8069 File.expand_path('something', '~') 在 Windows 平台上已支持家目录。
- \#8220 修正执行 defined? () 时引起的“段错误”（segmentation fault）。
- \#8367 修正 defined?(super) 返回结果倒退的问题。
- \#8283 修正 Dir.glob 不递归隐藏目录的问题。
- \#8165 修正 require 加载包含非 ASCII 字符路径引起的问题。
- \#8290 修正 String#inspect 处理 NUL 字符时的不兼容问题。
- \#8360 修正某些平台中 Thread#join(Float::INFINITY) 引起的“段错误”。

### RubyGems

- 内置的 RubyGems 版本升级到 2.0.2+。
- \#7698 修正 RubyGems 安装扩展库时的不兼容问题。
- \#8019 修正 gem list --remote 无法使用的问题。

### 标准库

- \#7911 修正 File.fnmatch 混合使用 US-ASCII 和 UTF-8 编码路径时抛出的异常。
- \#8240 修正 OpenSSL::SSL::SSLSocket 破坏其他连接或 GC 中文件的问题。
- \#8183 修正 CGI.unescapeHTML 无法解码大写字母形式的字符值引用（&#Xnnnn）。

### 编译/平台类问题

- \#7830 修正编译时编译器报错。
- \#7950 修正在 mswin/VC 平台中使用 --with-static-linked-ext 参数时引起编译失败的问题。
