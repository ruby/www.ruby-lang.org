---
layout: news_post
title: "Ruby 1.9.3-p551 发布"
author: "usa"
translator: "cassiuschen"
date: 2014-11-13 12:00:00 +0000
lang: zh_cn
---

我们很高兴地宣布 Ruby 1.9.3-p551 发布了。

本次发布包括了一个针对 REXML 拒绝服务攻击（DoS）漏洞的安全修复。

下述日志中包含相似内容：
[预发布](https://www.ruby-lang.org/en/news/2014/10/27/ruby-1-9-3-p550-is-released/)中的[漏洞修复](https://www.ruby-lang.org/en/news/2014/10/27/rexml-dos-cve-2014-8080/),
但这次的发布中解决了 XML Entity Expansion的问题。
请看下述文章以了解详情。

* [CVE-2014-8090: Another Denial of Service XML Expansion](https://www.ruby-lang.org/en/news/2014/11/13/rexml-dos-cve-2014-8090/)


## 公告

Ruby 1.9.3 现在处于安全维护阶段。
这意味着我们不会再修复除安全问题以外的 bug。
而且，现在已经决定于明年 2 月份结束 1.9.3 版本的所有维护。
所以我们建议使用 1.9.3 的用户尽快迁移到新的版本。


## 下载

* [http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.bz2](http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.bz2)

      SIZE:   10049332 bytes
      MD5:    0d8b272b05c3449dc848bb7570f65bfe
      SHA256: b0c5e37e3431d58613a160504b39542ec687d473de1d4da983dabcf3c5de771e
      SHA512: 5ea40f8c40cf116030ffdedbe436c1fdbf9a50b7bb44bc890845c9c2a885c34da711bc1a9e9694788c2f4710f7e6e0adc4410aec1ab18a25a27168f25ac3d68c

* [http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz](http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz)

      SIZE:   12605119 bytes
      MD5:    0d8212f7bc89bab8ef521b04cd9df278
      SHA256: bb5be55cd1f49c95bb05b6f587701376b53d310eb1bb7c76fbd445a1c75b51e8
      SHA512: be12adf581ee76af70db117b44c6647c1df3d28fffa1b3379c6067e4aa1fb523dae7c9b130a51dcdcff268a8ee21a3d74f6f946135fb3ac6b90664f0a9df4a08

* [http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.xz](http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.xz)

      SIZE:   7704072 bytes
      MD5:    7367b1dfb2ba1d6abf6fd7db70e765f5
      SHA256: 44228297861f4dfdf23a47372a3e3c4c5116fbf5b0e10883417f2379874b55c6
      SHA512: 2dd4cd7494d0d9b1cc2a5c3710a2c771617a367d1ba6f5099adc2785e37efcb668c6508780562359a4a4c83733e349aa5cb4f8532e1f334f9f96543670d35729

* [http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.zip](http://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.zip)

      SIZE:   13987275 bytes
      MD5:    14a394b1d7b7031b34d4d1af64ee657e
      SHA256: cf468ccabd5cdef5047b8f02f4f71052fd3a9c87c12aba314f04748a451a63ec
      SHA512: 6ee550c7e435622114e3669393220a90946652eade0a83dab74970fff7088d5c2051bee9c272e2e6eccc36885b4f64928fc2d27c36584c1cc8dac91ce730d3ea

## 发布后记

我们对频繁地发布导致的不便深感抱歉。
感谢所有协助本次发布的朋友们。
