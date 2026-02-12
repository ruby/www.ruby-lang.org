---
layout: news_post
title: "Phát hành Ruby 2.1.0-preview2"
author: "nurse"
translator:
date: 2013-11-22 22:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.1.0-preview2.
Vui lòng kiểm tra các tính năng mới trong Ruby 2.1 trước bản phát hành chính thức!

## Thay đổi đáng chú ý so với preview 1

* sửa [Tràn Heap trong phân tích số dấu phẩy động (CVE-2013-4164)](https://www.ruby-lang.org/vi/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/)
* "literal".freeze giờ được tối ưu hóa [#9042](https://bugs.ruby-lang.org/issues/9042)
* hậu tố f của String Literal đã bị loại bỏ [#9042](https://bugs.ruby-lang.org/issues/9042)
* sửa vấn đề tiêu tốn bộ nhớ trên RGenGC ([r43532](https://git.ruby-lang.org/ruby.git) và [r43755](https://git.ruby-lang.org/ruby.git))
* thêm Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* cập nhật các thư viện như json, nkf, rake, RubyGems, và RDoc.

## Tải về

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.bz2)

      SIZE:   11432454 bytes
      MD5:    9d566a9b2d2e7e35ad6125e2a14ce672
      SHA256: 780fddf0e3c8a219057d578e83367ecfac5e945054b9f132b3b93ded4802d1ce

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.tar.gz)

      SIZE:   14416029 bytes
      MD5:    ba2b95d174e156b417a4d580a452eaf5
      SHA256: a9b1dbc16090ddff8f6c6adbc1fd0473bcae8c69143cecabe65d55f95f6dbbfb

* [https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip](https://cache.ruby-lang.org/pub/ruby/2.1/ruby-2.1.0-preview2.zip)

      SIZE:   16110720 bytes
      MD5:    2ad1aa3d89ae32607cf14fc73b192de1
      SHA256: cc2f7f8e05daed716489e5480e6365a711a13ed7747dbc59e989a41fe2805076

## Thay đổi so với 2.0

Các thay đổi đáng chú ý:

* VM (method cache)
* RGenGC (Xem bài thuyết trình của ko1 tại [RubyKaigi](http://rubykaigi.org/2013/talk/S73) và [RubyConf 2013](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* thay đổi cú pháp
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * giá trị trả về của def [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * sử dụng số nguyên 128bit [#8509](https://bugs.ruby-lang.org/issues/8509)
  * sử dụng GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 và RubyGems 2.2.0.preview.2

Xem thêm chi tiết thay đổi: [NEWS trong kho Ruby (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

ko1 đã nói về các tính năng mới của Ruby 2.1 tại toruby: [All about Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) đã viết một bản tóm tắt hay trên blog: [What's new in Ruby 2.1?](http://rkh.im/ruby-2.1).

## Lời nhận xét về bản phát hành

Các vấn đề đã biết:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Xem thêm lịch phát hành và thông tin khác:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
