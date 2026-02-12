---
layout: news_post
title: "Ruby 2.0.0-p247 发布"
author: "nagachika"
translator: "Andor Chen"
date: 2013-06-27 11:00:03 +0000
lang: zh_cn
---

今天发布了 Ruby 2.0.0-p247。

这次发布的版本修正了一个 OpenSSL 相关的安全漏洞。

* [Hostname check bypassing vulnerability in SSL client
  (CVE-2013-4073)](/en/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

同时也修正了一些其他问题。

## 下载

你可以通过下面的方式下载这次发布的版本：

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.bz2)

      SIZE:   10804581 bytes
      MD5:    60913f3eec0c4071f44df42600be2604
      SHA256: 08e3d4b85b8a1118a8e81261f59dd8b4ddcfd70b6ae554e0ec5ceb99c3185e8a

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.tar.gz)

      SIZE:   13652782 bytes
      MD5:    c351450a0bed670e0f5ca07da3458a5b
      SHA256: 3e71042872c77726409460e8647a2f304083a15ae0defe90d8000a69917e20d3

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p247.zip)

      SIZE:   15100206 bytes
      MD5:    7548f781d868456e84afcd0327c7f894
      SHA256: 40c938238075b1e7e8df5d7ebfd069a45b93066318d91da9024d81b20a1c5a8a

## 改动

重大问题的修正如下所列。

更多内容请查看 [tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&amp;status_id=5)
和 [ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_0_0_247)。

### 关键词参数

* [#8040](https://bugs.ruby-lang.org/issues/8040) 改变关键词参数和必需指定参数的优先级
* [#8416](https://bugs.ruby-lang.org/issues/8416) 修正命名或匿名 `**` 参数 `super` 不调用父级方法的问题
* [#8463](https://bugs.ruby-lang.org/issues/8463) 修正 Proc 中自动分解命名参数的问题

### VM/语言处理

* [#8424](https://bugs.ruby-lang.org/issues/8424) 修正 TH_PUSH_TAG() 栈溢出时的无限循环
* [#8436](https://bugs.ruby-lang.org/issues/8436) 修正 `eval` 绑定无法使用 \__dir__ 的问题
* [#8489](https://bugs.ruby-lang.org/issues/8489) Tracepoint API: 修正使用 `next` 时未触发 B_RETURN_EVENT 的问题
* [#8341](https://bugs.ruby-lang.org/issues/8341) 修正 `block_given?` 以及块内容在多次调用由方法创建（使用 `method().to_proc()`）的 Proc 时始终存在的问题
* [#8531](https://bugs.ruby-lang.org/issues/8531) 修正 `block_given?` 以及块内容在多次调用由 `Symbol#to_proc` 创建的 Proc 时始终存在的问题

### RubyGems

内置的 RubyGems 升级到了 2.0.3。

### 编码

* [#8516](https://bugs.ruby-lang.org/issues/8516) 修正转换编码时 IO#readchar 返回错误数码的问题

### Windows

* [#8431](https://bugs.ruby-lang.org/issues/8431) 修正 Win32SP3 32 bit 系统中 File.read() 崩溃的问题

### 标准库

* [#8467](https://bugs.ruby-lang.org/issues/8467) 修正重置指针和遍历 GZIP IO 数据导致重大错误的问题
* [#8415](https://bugs.ruby-lang.org/issues/8415) 修正使用常用 CAPABILITY 时 `Net::IMAP#capability_response` 抛出 "Net::IMAP::ResponseParseError: unexpected token CRLF" 异常的问题

## 发布备注

这次发布的版本得益于众多提交者、测试人员和其他用户提交的错误报告，感谢他们的贡献。
