---
layout: news_post
title: "Phát hành Ruby 2.1.0-preview1"
author: "nurse"
translator:
date: 2013-09-23 07:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.1.0-preview1.
Vui lòng xem các tính năng mới trong Ruby 2.1 trước bản phát hành chính thức!

## Tải về

Chúng tôi khuyến nghị sử dụng
[https://cache.ruby-lang.org/pub/ruby/2.1/](https://cache.ruby-lang.org/pub/ruby/2.1/)
qua Fastly.

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.bz2)

      SIZE:   11475553 bytes
      MD5:    d32d1ea23988399afadbd21c5a7a37fc
      SHA256: 860b90d28b214393fd9d77ac2ad65b384d8249cd59b658c668cf0c7bad1db341

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.tar.gz)

      SIZE:   14449544 bytes
      MD5:    9df4f546f6b961895ba58a8afdf857da
      SHA256: 747472fb33bcc529f1000e5320605a7e166a095d3805520b989e73b33c05b046

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview1.zip)

      SIZE:   16124069 bytes
      MD5:    f9bc3f9a10174a022381ce2c60a59e64
      SHA256: 28855621f7d364277e7f258d5cc380e005896ef8ebc36e5cbf78d2bf763c291b

## Thay đổi

Các thay đổi đáng chú ý:

* VM (method cache)
* RGenGC (Xem bài thuyết trình của ko1 tại [RubyKaigi](http://rubykaigi.org/2013/talk/S73) và [EuRuKo](http://www.atdot.net/~ko1/activities/Euruko2013-ko1.pdf))
* refinements
* cú pháp
  * Decimal Literal
  * Frozen String Literal
* giá trị trả về của def
* Bignum
  * 128bit
  * GMP
* String#scrub
* Socket.getifaddrs
* RubyGems mới

Xem thêm chi tiết thay đổi: [NEWS trong kho Ruby (WIP)](https://github.com/ruby/ruby/blob/trunk/NEWS).

ko1 đã trình bày tại toruby: [Tóm tắt Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) đã viết một bản tóm tắt hay trên blog của anh ấy: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Lời nhận xét về bản phát hành

Các vấn đề đã biết:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Xem thêm lịch phát hành và thông tin khác:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
