---
layout: news_post
title: "Ruby 2.4.2 发布"
author: "nagachika"
translator: "Delton Ding"
date: 2017-09-14 00:00:00 +0000
lang: zh_cn
---

我们高兴地宣布 Ruby 2.4.2 发布了。这个版本修复了数个安全问题。

* [CVE-2017-0898: Kernel.sprintf 缓冲区欠载缺陷](/zh_cn/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)
* [CVE-2017-10784: WEBrick 基本认证转义序列缺陷](/zh_cn/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)
* [CVE-2017-14033: OpenSSL ASN1 解码时缓冲区欠载缺陷](/zh_cn/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)
* [CVE-2017-14064: 生成 JSON 时的堆暴露缺陷](/zh_cn/news/2017/09/14/json-heap-exposure-cve-2017-14064/)
* [RubyGems 发现多个漏洞](/zh_cn/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)
* 升级内置 libyaml gem 至 0.1.7 版本

这还包括许多其他 Bug 修复。查阅 [提交日志](https://github.com/ruby/ruby/compare/v2_4_1...v2_4_2) 以获取更多详情。

## 已知问题

(这一章节于 2017 年 9 月 15 日追加。)

Ruby 2.4.2 中发现了一处兼容性问题。Ruby 2.4.2 无法链接 libgmp 和 jemalloc。我们将会在下个版本中修复这一问题，但如果您正面临这一问题并急需解决，请从下面的链接中获取补丁：

* [Ruby 2.4.2 和 2.3.5 无法链接 libgmp 和 jemalloc](https://bugs.ruby-lang.org/issues/13899)

## 下载

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.bz2>

      SIZE:   12607283 bytes
      SHA1:   a8a50a9297ff656e5230bf0f945acd69cc02a097
      SHA256: 08e72d0cbe870ed1317493600fbbad5995ea3af2d0166585e7ecc85d04cc50dc
      SHA512: 1a5302d2558089a6b91b815fff9b75a29e690f10861de5fdd48211f3f45025a70dad7495f216e6af9c62d72e69ed316f1a52fada704bdc7e6d8c094d141ea77c

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.gz>

      SIZE:   14187859 bytes
      SHA1:   b096124469e31e4fc3d00d2b61b11d36992e6bbd
      SHA256: 93b9e75e00b262bc4def6b26b7ae8717efc252c47154abb7392e54357e6c8c9c
      SHA512: 96c236bdcd09b2e7cf429da631a487fc00f1255443751c03c8abeb4c2ce57079ad60ef566fecc0bf2c7beb2f080e2b8c4d30f321664547b2dc7d2a62aa1075ef

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.tar.xz>

      SIZE:   10046412 bytes
      SHA1:   8373e32c63bba2180799da091b572664aa9faf6f
      SHA256: 748a8980d30141bd1a4124e11745bb105b436fb1890826e0d2b9ea31af27f735
      SHA512: c1d42272fb0d94b693452e703b0ea4942bf59cbd4b08ba83bf039f54be97ebc88511632413da0164970b4cf97bc302bccb88aab48edfa8fa147498e7ee741595

* <https://cache.ruby-lang.org/pub/ruby/2.4/ruby-2.4.2.zip>

      SIZE:   15645325 bytes
      SHA1:   861b51de9db0d822ef141ad04383c76aa3cd2fff
      SHA256: 37d7cb27d8abd4b143556260506306659930548652343076f7f8470f07818824
      SHA512: 234765091528be1310ac315868f84ae6c505aa696672929df2f00828c1bbdc7cbcb2fc690eab4e73efde6be9104584ba7b6944853861f6d05e775b124ce8dfd5

## 发布记

许多提交者、开发者和提交了安全报告的用户们帮助了这个版本的发行。感谢他们的贡献。
