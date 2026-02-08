---
layout: news_post
title: "Phát hành Ruby 2.5.0-rc1"
author: "naruse"
translator:
date: 2017-12-14 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.5.0-rc1.

Ruby 2.5.0-rc1 là bản phát hành ứng viên đầu tiên của Ruby 2.5.0.
Phiên bản này giới thiệu một số tính năng mới và cải thiện hiệu suất, ví dụ:

## Tính năng mới

* In backtrace và thông báo lỗi theo thứ tự ngược nếu STDERR không thay đổi và là tty.
  [Feature #8661] [thử nghiệm]

* Loại bỏ tìm kiếm hằng số cấp cao nhất.  [Feature #11547]

* rescue/else/ensure được phép sử dụng bên trong khối do/end.  [Feature #12906]

* Thêm yield\_self.  [Feature #6721]

## Cải thiện hiệu suất

* Sử dụng kỹ thuật instrumentation động cho TracePoint hooks thay vì dùng lệnh
  "trace" để tránh chi phí hiệu suất. [Feature #14104]

* Hiệu suất truyền block bằng tham số block được cải thiện nhờ kỹ thuật
  "Lazy Proc allocation". [Feature #14045]

* Mutex được viết lại nhỏ hơn và nhanh hơn. [Feature #13517]

* SecureRandom hiện ưu tiên nguồn do hệ điều hành cung cấp thay vì OpenSSL. [Bug #9569]

## Các thay đổi đáng chú ý khác kể từ 2.4

* Cập nhật Onigmo lên 6.1.3.
  Nó thêm [toán tử vắng mặt](https://github.com/k-takata/Onigmo/issues/87).
  Lưu ý rằng Ruby 2.4.1 cũng bao gồm thay đổi này.
* Thêm Bundler vào thư viện chuẩn.
* Cập nhật RubyGems lên 2.7.0.
* Cập nhật RDoc lên 6.0.0.
  * Thay đổi lexer từ dựa trên IRB sang Ripper;
    điều này cải thiện đáng kể tốc độ tạo tài liệu.
    [https://github.com/ruby/rdoc/pull/512]
  * Sửa rất nhiều lỗi từ khoảng mười mấy năm qua.
  * Hỗ trợ cú pháp Ruby mới từ vài năm gần đây.
* Cập nhật phiên bản Unicode được hỗ trợ lên 10.0.0.

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_5_0_rc1/NEWS)
hoặc nhật ký thay đổi để biết chi tiết.

Với những thay đổi đó,
[6162 tập tin thay đổi, 339744 dòng thêm(+), 28699 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_4_0...v2_5_0_rc1)
kể từ Ruby 2.4.0!

Hãy tận hưởng Ruby 2.5.0-rc1!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.gz>

      SIZE:   31049529 bytes
      SHA1:   15df7e8ff99f360a14f7747a07a3021447d65594
      SHA256: 46c11b347522de174566503d35d2b46e1529b979d292b1f7f7019cfedcd4b07f
      SHA512: 41cd298e99d7a25fe5f2ec42946ae5dbc4421bb18f39350ba8a1b02e999541ec1b21b5f6ce0489b3a159f47e37d409178ba7c21c00e177b0fdb410ca6e9d6142

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.zip>

      SIZE:   35579788 bytes
      SHA1:   b7ae42eb733d4a0e3a2d135c9f8d4af043daa728
      SHA256: 9858e39fd2e7bf207cc9f8846197b11ada5f4424f433ff4df149fe3d48be8e36
      SHA512: 86c93791d312fd2175909020e448a44892740feb809a532ed706c6d850cb92722fb7ca02ecbdf7a1fbeb5b4f42f1338ce9a15b7c0a41055937bd1fdfb4be6f11

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.bz2>

      SIZE:   29238901 bytes
      SHA1:   6aad74ed3d30de63c6ff22048cd0fcbcbe123586
      SHA256: 862a8e9e52432ba383660a23d3e87af11dbc18c863a19ef6367eb8259fc47c09
      SHA512: bf0eb114097f9e505ff846f25e7556a2fb393573b4e8b773f94cf5b47998e221f3962a291db15a3cdbdf4ced5a523812937f80d95f4ee3f7b13c4e37f178d7a7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.0-rc1.tar.xz>

      SIZE:   26096412 bytes
      SHA1:   05cacd0341b7a23cc68239c2061640643a30da38
      SHA256: a479a1bce69b2cf656821f10104dcb8b426922b56d3d6cbdf48318842fae752c
      SHA512: 9f9040abf69337439a3f31b80d440d97736555b0df6533d9d34c141ce52226bc40c3f4f7e596e74b080c879e933649c17a073c893be1a304d9a883bab02e9494
