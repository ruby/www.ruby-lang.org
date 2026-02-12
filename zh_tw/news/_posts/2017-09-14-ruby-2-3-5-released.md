---
layout: news_post
title: "Ruby 2.3.5 發布"
author: "usa"
translator: "Vincent Lin"
date: 2017-09-14 12:00:00 +0000
lang: zh_tw
---

Ruby 2.3.5 發布了。

此次發布相較前次修正了約 70 個錯誤，包含幾次的安全性修復。
請參閱下方項目來進一步了解。

* [CVE-2017-0898: Kernel.sprintf 緩衝區掏空的安全性風險](/zh_tw/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)
* [CVE-2017-10784: WEBrick 基本認證的轉義序列注入安全性風險](/zh_tw/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)
* [CVE-2017-14033: OpenSSL ASN1 解碼時緩衝區掏空的安全性風險](/zh_tw/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)
* [CVE-2017-14064: 在生成 JSON 時堆積暴露的安全性風險](/zh_tw/news/2017/09/14/json-heap-exposure-cve-2017-14064/)
* [RubyGems 多個安全性風險](/zh_tw/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)
* 內建的 libyaml 更新至版本 0.1.7

參考 [ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_3_5) 來進一步了解。

## 已知問題

_（此段落於 2017 年 9 月 15 日加入）_

在 Ruby 2.3.5 發現了一個相容性問題。
Ruby 2.3.5 無法連結 libgmp 以及 jemalloc 。
我們將會在下個發布修正這個問題，但如果您正面臨這個問題且急需解決，請從下方連結取得補丁：

* [Ruby 2.4.2 以及 2.3.5 無法連結 libgmp 或 jemalloc](https://bugs.ruby-lang.org/issues/13899)

## 下載

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.bz2)

      SIZE:   14439326 bytes
      SHA1:   48302800c78ef9bbfc293ffcc4b6e2c728705bca
      SHA256: f71c4b67ba1bef424feba66774dc9d4bbe02375f5787e41596bc7f923739128b
      SHA512: 3ecc7c0ac10672166e1a58cfcd5ae45dfc637c22cec549a30975575cbe59ec39945d806e47661f45071962ef9404566007a982aedccb7d4241b4459cb88507df

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.gz)

      SIZE:   17836997 bytes
      SHA1:   3247e217d6745c27ef23bdc77b6abdb4b57a118f
      SHA256: 5462f7bbb28beff5da7441968471ed922f964db1abdce82b8860608acc23ddcc
      SHA512: cd6bbba4fb5a0ab5ce7aa6f3b89d021ea742c5aa7934e24b87554d10e2a3233d416051c11aee90f3d8714d168db523a7bf56ef4dafdd256fc8595169c2db496a

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.tar.xz)

      SIZE:   11437868 bytes
      SHA1:   ef388992fa71cd77c5be960dd7e3bec1280c4441
      SHA256: 7d3a7dabb190c2da06c963063342ca9a214bcd26f2158e904f0ec059b065ffda
      SHA512: c55e3b71241f505b6bbad78b3bd40235064faae3443ca14b77b6356556caed6a0d055dc2e2cd7ebdb5290ab908e06d2b7d68f72469af5017eda4b29664b0d889

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.5.zip)

      SIZE:   19887946 bytes
      SHA1:   09c80f9021fa2bfc04ae30a1939faad03b0f5b14
      SHA256: c9971e1ccb6e2f1ab32b1fe05416fce0b19a1cd9ba8fa095c77c4bdf2058e514
      SHA512: 6f14d0cc48d6eaf6168316cb45e22af8d2118ba058fd888ce930f12a22cf7e849e2e185cc7c516fe980f30ee9a942accf9d9e2d4b8a2e79c97b87d4bab704495

## 發佈記

感謝所有幫助此次發佈的朋友。

Ruby 2.3 的維護，包含此次發布，都是基於 Ruby 協會的『 Ruby 穩定版協議』。
