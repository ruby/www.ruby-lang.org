---
layout: news_post
title: "Phát hành Ruby 4.0.0 preview2"
author: "naruse"
translator: "Ngọc Lê"
date: 2025-11-17 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "4.0.0-preview2" | first %}
Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}. Ruby 4.0 cập nhật phiên bản Unicode lên 17.0.0, và nhiều cải tiến khác.

## Thay đổi ngôn ngữ

* `*nil` không còn gọi `nil.to_a`, tương tự như cách `**nil` không
  gọi `nil.to_hash`.  [[Feature #21047]]

## Cập nhật các lớp lõi

Lưu ý: Chúng tôi chỉ liệt kê các cập nhật đáng chú ý của các lớp lõi.

* Binding

    * `Binding#local_variables` không còn bao gồm các tham số được đánh số.
      Ngoài ra, `Binding#local_variable_get` và `Binding#local_variable_set` từ chối xử lý các tham số được đánh số.
      [[Bug #21049]]

* IO

    * `IO.select` chấp nhận +Float::INFINITY+ làm đối số timeout.
      [[Feature #20610]]

* String

    * Cập nhật Unicode lên Phiên bản 17.0.0 và Emoji Phiên bản 17.0. [[Feature #19908]][[Feature #20724]][[Feature #21275]]
        (cũng áp dụng cho Regexp)


## Cập nhật thư viện chuẩn

Lưu ý: Chúng tôi chỉ liệt kê các cập nhật đáng chú ý của thư viện chuẩn.

* ostruct 0.6.1
* pstore 0.2.0
* benchmark 0.4.0
* logger 1.7.0
* rdoc 6.13.1
* win32ole 1.9.2
* irb 1.15.2
* reline 0.6.1
* readline 0.0.4
* fiddle 1.1.6

## Vấn đề tương thích

Lưu ý: Không bao gồm các bản sửa lỗi tính năng.



## Vấn đề tương thích thư viện chuẩn


## Cập nhật C API


## JIT

* YJIT
    * Thống kê YJIT
        * `ratio_in_yjit` không còn hoạt động trong bản build mặc định.
          Sử dụng `--enable-yjit=stats` khi `configure` để kích hoạt nó với `--yjit-stats`.
        * Thêm `invalidate_everything` vào thống kê mặc định, được
          tăng lên khi mọi mã bị vô hiệu hóa bởi TracePoint.
    * Thêm các tùy chọn `mem_size:` và `call_threshold:` cho `RubyVM::YJIT.enable`.
* ZJIT
    * Thêm trình biên dịch JIT dựa trên phương thức thử nghiệm.
      Sử dụng `--enable-zjit` khi `configure` để kích hoạt hỗ trợ `--zjit`.
    * Tính đến Ruby 4.0.0-preview2, ZJIT chưa sẵn sàng để tăng tốc hầu hết các benchmark.
      Vui lòng chưa đánh giá ZJIT vội. Hãy chờ bản phát hành Ruby 4.0.
* RJIT
    * `--rjit` đã bị loại bỏ. Chúng tôi sẽ chuyển triển khai API JIT bên thứ ba
      sang kho lưu trữ [ruby/rjit](https://github.com/ruby/rjit).

## Thay đổi khác



Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi này, [{{ release.stats.files_changed }} tệp thay đổi, {{ release.stats.insertions }} thêm(+), {{ release.stats.deletions }} xóa(-)](https://github.com/ruby/ruby/compare/v3_4_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.4.0!

## Tải về

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby là gì

Ruby được phát triển lần đầu bởi Matz (Yukihiro Matsumoto) vào năm 1993,
và hiện được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng
và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.

[Feature #21047]: https://bugs.ruby-lang.org/issues/21047
[Bug #21049]: https://bugs.ruby-lang.org/issues/21049
[Feature #20610]: https://bugs.ruby-lang.org/issues/20610
[Feature #19908]: https://bugs.ruby-lang.org/issues/19908
[Feature #20724]: https://bugs.ruby-lang.org/issues/20724
[Feature #21275]: https://bugs.ruby-lang.org/issues/21275
