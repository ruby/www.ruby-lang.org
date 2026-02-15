---
layout: news_post
title: "Ruby 1.9.3-p448 发布"
author: "usa"
translator: "Andor Chen"
date: 2013-06-27 11:00:02 +0000
lang: zh_cn
---

今天发布了 Ruby 1.9.3-p448。

这次发布的版本修正了一个 OpenSSL 相关的安全漏洞：

 * [Hostname check bypassing vulnerability in SSL client
   (CVE-2013-4073)](/en/news/2013/06/27/hostname-check-bypassing-vulnerability-in-openssl-client-cve-2013-4073/)

同时也修正了一些其他问题。

详情参见 [tickets](https://bugs.ruby-lang.org/projects/ruby-193/issues?set_filter=1&amp;status_id=5) 和 [ChangeLog](https://github.com/ruby/ruby/blob//v1_9_3_448/ChangeLog) for details.

## 下载

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.bz2](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.bz2)

      SIZE:   10052488 bytes
      MD5:    aa710d386e5903f78f0231868255e6af
      SHA256: a7372230357bfff8e4525fb8019046da521561fe66b02c25d8efc10c9877bc91

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.gz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.tar.gz)

      SIZE:   12559260 bytes
      MD5:    a893cff26bcf351b8975ebf2a63b1023
      SHA256: 2f35e186543a03bec5e603296d6d8828b94ca58bab049b67b1ceb61d381bc8a7

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.zip](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p448.zip)

      SIZE:   13873826 bytes
      MD5:    bb3b1108847abaab312c024f3c0bc6c3
      SHA256: d9f778d08a4c888d19379b09f0c661b1d2af3c062e25b94f647c29350f064cba

## 发布备注

这次发布的版本得益于很多人（提交者、贡献者和报告人员）的帮助，感谢你们！
