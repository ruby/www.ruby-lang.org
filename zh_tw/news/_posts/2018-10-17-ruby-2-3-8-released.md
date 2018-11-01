---
layout: news_post
title: "Ruby 2.3.8 已發佈"
author: "usa"
translator: "Delton Ding"
date: 2018-10-17 17:00:00 +0000
lang: zh_tw
---

Ruby 2.3.8 已發佈。

此次發佈修復了數個安全性缺陷，請查看下述主題以獲取詳情。

* [CVE-2018-16396: 特定命令下受污染標記未能如實展開到 Array#pack 和 String#unpack 結果中](/zh_cn/news/2018/10/17/not-propagated-taint-flag-in-some-formats-of-pack-cve-2018-16396/)
* [CVE-2018-16395: OpenSSL::X509::Name 相等檢查未正常工作](/zh_cn/news/2018/10/17/openssl-x509-name-equality-check-does-not-work-correctly-cve-2018-16395/)

此次更新亦包含一個非安全性修復以支援 Windows 10 2018 年 10 月版本上的 Visual Studio。

Ruby 2.3 處於安全維護期，並將於 2019 年 3 月底停止維護。此後 Ruby 2.3 的全部維護將終止。我們建議您開始規劃遷移到更新版本的 Ruby，例如 Ruby 2.5 或 2.4。

## 下載

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.bz2)

      SIZE:   14418609 bytes
      SHA1:   91b31abdba00a346c155fd32bd32d3cec3b73bc4
      SHA256: 4d1a3a88e8cf9aea624eb73843fbfc60a9a281582660f86d5e4e00870397407c
      SHA512: 6d79e0d25757fd37188a8db3e630a52539bce7927fcb779a2ce9a97b9e5f330753035c16843552f1a1fb6c9a1e5c0f916b3cc8b5c0bfe81e20f35f8442e40ae8

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.gz)

      SIZE:   17858806 bytes
      SHA1:   69311991a9cd2c8e3c86a0dbbaaf915ae91f0bec
      SHA256: b5016d61440e939045d4e22979e04708ed6c8e1c52e7edb2553cf40b73c59abf
      SHA512: 43b02f2f9de6baf281f09a49fd07367127b4de1fb14473380d06bfa7667990d8f722ae2d33cf7d15b02f7e799515f21aebd308897c4c2a5461ebab4049d6c7ef

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.tar.xz)

      SIZE:   11465792 bytes
      SHA1:   9771acdad851bbf0ef349bb7da5d0ffc91a860ed
      SHA256: 910f635d84fd0d81ac9bdee0731279e6026cb4cd1315bbbb5dfb22e09c5c1dfe
      SHA512: 06373050e6c1af9cb6a5863aef878b21c8a45fd0e68414e3d546cb73ec3028207d3acc0a9326428f172b9347a30bbe69a16f9dc0bdb739161d677adb2d888095

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.8.zip)

      SIZE:   19911652 bytes
      SHA1:   ad9e0ec7c874701832c9e224eb5b9e2258f3a041
      SHA256: ec9792d0473a22954ad25cd0c531fc672679c1a5eaeefa08caf9e1288852796f
      SHA512: 732d69cd55f1c273a02005306720fd8fc9d77398177db9509452be31820976b54b30319d9e6bc36fb6bcd7af656f807ef6c26d8955012c8b20424912a2f51bf8

## 發佈記

感謝所有幫助發佈這一版本的人。
