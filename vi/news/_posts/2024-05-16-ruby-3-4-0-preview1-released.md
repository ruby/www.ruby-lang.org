---
layout: news_post
title: "Phát hành Ruby 3.4.0 preview1"
author: "naruse"
translator:
date: 2024-05-16 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.4.0-preview1" | first %}
Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}.

## Thay đổi ngôn ngữ

* Các chuỗi ký tự trong các tập tin không có comment `frozen_string_literal` giờ đây
  hoạt động như thể chúng bị đóng băng. Nếu chúng bị thay đổi, một cảnh báo deprecation sẽ được phát ra.
  Các cảnh báo này có thể được bật với `-W:deprecated` hoặc bằng cách đặt `Warning[:deprecated] = true`.
  Để tắt thay đổi này, bạn có thể chạy Ruby với tham số dòng lệnh `--disable-frozen-string-literal`.
  [[Feature #20205]]

* `it` được thêm để tham chiếu đến tham số block. [[Feature #18980]]

* Giờ đây hỗ trợ keyword splatting `nil` khi gọi phương thức.
  `**nil` được xử lý tương tự như `**{}`, không truyền keyword nào,
  và không gọi bất kỳ phương thức chuyển đổi nào.  [[Bug #20064]]

* Không còn cho phép truyền block trong index.  [[Bug #19918]]

* Không còn cho phép keyword arguments trong index.  [[Bug #20218]]

## Cập nhật các lớp lõi

Lưu ý: Chúng tôi chỉ liệt kê các cập nhật lớp nổi bật.

* Exception

  * Exception#set_backtrace giờ đây chấp nhận mảng `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` và `Fiber#raise` cũng chấp nhận định dạng mới này. [[Feature #13557]]

* Range

  * Range#size giờ đây ném TypeError nếu range không thể lặp. [[Misc #18984]]



## Vấn đề tương thích

Lưu ý: Không bao gồm các bản sửa lỗi tính năng.

* Thông báo lỗi và hiển thị backtrace đã được thay đổi.
  * Sử dụng dấu nháy đơn thay vì dấu backtick làm dấu mở ngoặc. [[Feature #16495]]
  * Hiển thị tên lớp trước tên phương thức (chỉ khi lớp có tên cố định). [[Feature #19117]]
  * `Kernel#caller`, các phương thức của `Thread::Backtrace::Location`, v.v. cũng được thay đổi tương ứng.

  ```
  Old:
  test.rb:1:in `foo': undefined method `time' for an instance of Integer
          from test.rb:2:in `<main>'

  New:
  test.rb:1:in 'Object#foo': undefined method 'time' for an instance of Integer
          from test.rb:2:in '<main>'
  ```


## Cập nhật C API

* `rb_newobj` và `rb_newobj_of` (và các macro tương ứng `RB_NEWOBJ`, `RB_NEWOBJ_OF`, `NEWOBJ`, `NEWOBJ_OF`) đã được loại bỏ. [[Feature #20265]]
* Loại bỏ hàm deprecated `rb_gc_force_recycle`. [[Feature #18290]]

## Cải thiện triển khai

* `Array#each` được viết lại bằng Ruby để có hiệu suất tốt hơn [[Feature #20182]].

## Thay đổi khác

* Truyền block cho một phương thức không sử dụng block đã truyền sẽ hiển thị
  cảnh báo ở chế độ verbose (`-w`).
  [[Feature #15554]]

* Định nghĩa lại một số phương thức lõi được tối ưu hóa đặc biệt bởi trình thông dịch
  và JIT như `String.freeze` hoặc `Integer#+` giờ đây sẽ phát ra cảnh báo hiệu suất
  (`-W:performance` hoặc `Warning[:performance] = true`).
  [[Feature #20429]]

Xem các bản phát hành trên GitHub như [Logger](https://github.com/ruby/logger/releases) hoặc
changelog để biết chi tiết về các gem mặc định hoặc gem đi kèm.

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tập tin thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa đi(-)](https://github.com/ruby/ruby/compare/v3_3_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.3.0!


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

[Feature #13557]: https://bugs.ruby-lang.org/issues/13557
[Feature #15554]: https://bugs.ruby-lang.org/issues/15554
[Feature #16495]: https://bugs.ruby-lang.org/issues/16495
[Feature #18290]: https://bugs.ruby-lang.org/issues/18290
[Feature #18980]: https://bugs.ruby-lang.org/issues/18980
[Misc #18984]:    https://bugs.ruby-lang.org/issues/18984
[Feature #19117]: https://bugs.ruby-lang.org/issues/19117
[Bug #19918]:     https://bugs.ruby-lang.org/issues/19918
[Bug #20064]:     https://bugs.ruby-lang.org/issues/20064
[Feature #20182]: https://bugs.ruby-lang.org/issues/20182
[Feature #20205]: https://bugs.ruby-lang.org/issues/20205
[Bug #20218]:     https://bugs.ruby-lang.org/issues/20218
[Feature #20265]: https://bugs.ruby-lang.org/issues/20265
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
