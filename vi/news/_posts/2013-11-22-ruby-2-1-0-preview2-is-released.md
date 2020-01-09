---
layout: news_post
title: "Ruby 2.1.0-preview2 được phát hành"
author: "nurse"
translator: "Trung Lê"
date: 2013-11-22 22:00:00 +0000
lang: vi
---

Chúng tôi hân hạnh công bố ấn bản Ruby 2.1.0-preview2.
Xin giúp chúng tôi kiểm tra các chức năng mới của Ruby
2.1 trước khi bản cuối được phát hành!

## Các thay đổi so với preview 1

* Sửa [Heap Overflow in Floating Point Parsing (CVE-2013-4164)](https://www.ruby-lang.org/vi/news/2013/11/22/heap-overflow-in-floating-point-parsing-cve-2013-4164/)
* "literal".freeze nay được tối ưu hoá [#9042](https://bugs.ruby-lang.org/issues/9042)
* f suffix của String Literal bị xoá bỏ [#9042](https://bugs.ruby-lang.org/issues/9042)
* Sửa bộ nhớ bị chiếm đóng trên RGenGC ([r43532](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=43532) and [r43755](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?view=rev&revision=43755))
* Thêm hàm Exception#cause [#8257](https://bugs.ruby-lang.org/issues/8257)
* Nâng cấp thư viện như json, nkf, rake, RubyGems, và RDoc.

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

Các thay đổi đáng lưu ý:

* VM (method cache)
* RGenGC (Xem ko1's [RubyKaigi presentation](http://rubykaigi.org/2013/talk/S73) and [RubyConf 2013 presentation](http://www.atdot.net/~ko1/activities/rubyconf2013-ko1_pub.pdf))
* refinements [#8481](https://bugs.ruby-lang.org/issues/8481) [#8571](https://bugs.ruby-lang.org/issues/8571)
* thay đổi cú pháp
  * Rational/Complex Literal [#8430](https://bugs.ruby-lang.org/issues/8430)
  * giá trị trả về của hàm def [#3753](https://bugs.ruby-lang.org/issues/3753)
* Bignum
  * sử dụng 128bit integers [#8509](https://bugs.ruby-lang.org/issues/8509)
  * sử dụng GMP [#8796](https://bugs.ruby-lang.org/issues/8796)
* String#scrub [#8414](https://bugs.ruby-lang.org/issues/8414)
* Socket.getifaddrs [#8368](https://bugs.ruby-lang.org/issues/8368)
* RDoc 4.1.0.preview.2 và RubyGems 2.2.0.preview.2

Xem thêm chi tiết tại: [NEWS trong Ruby repository (WIP)](https://github.com/ruby/ruby/blob/v2_1_0_preview2/NEWS).

ko1 trình bày về các chức năng của Ruby 2.1 tại toruby: [Tất cả về Ruby 2.1](http://www.atdot.net/~ko1/activities/toruby05-ko1.pdf)

Konstantin Haase (@konstantinhaase) tóm tắt trong bài blog: [Có gì mới trong Ruby 2.1?](http://rkh.im/ruby-2.1).

## Chú thích

Các lỗi được biết:

[https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102](https://bugs.ruby-lang.org/projects/ruby-trunk/issues?query_id=102)

Xem lịch phát hành và các thông tin khác:

[https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210](https://bugs.ruby-lang.org/projects/ruby-master/wiki/ReleaseEngineering210)
