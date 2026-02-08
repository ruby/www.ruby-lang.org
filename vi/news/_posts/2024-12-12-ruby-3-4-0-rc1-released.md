---
layout: news_post
title: "Phát hành Ruby 3.4.0 rc1"
author: "naruse"
translator:
date: 2024-12-12 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.4.0-rc1" | first %}
Chúng tôi vui mừng thông báo phát hành Ruby {{ release.version }}.

## Prism

Chuyển trình phân tích mặc định từ parse.y sang Prism. [[Feature #20564]]

## GC Mô-đun

* Các triển khai bộ thu gom rác (GC) thay thế có thể được tải động
  thông qua tính năng bộ thu gom rác mô-đun. Để bật tính năng này,
  cấu hình Ruby với `--with-modular-gc` khi build. Các thư viện GC có thể được
  tải tại thời điểm chạy bằng biến môi trường `RUBY_GC_LIBRARY`.
  [[Feature #20351]]

* Bộ thu gom rác tích hợp của Ruby đã được tách ra thành một tập tin riêng tại
  `gc/default/default.c` và tương tác với Ruby thông qua API được định nghĩa trong
  `gc/gc_impl.h`. Bộ thu gom rác tích hợp giờ đây cũng có thể được build dưới dạng
  thư viện bằng `make modular-gc MODULAR_GC=default` và được bật bằng
  biến môi trường `RUBY_GC_LIBRARY=default`. [[Feature #20470]]

* Một thư viện GC thử nghiệm được cung cấp dựa trên [MMTk](https://www.mmtk.io/).
  Thư viện GC này có thể được build bằng `make modular-gc MODULAR_GC=mmtk` và
  được bật bằng biến môi trường `RUBY_GC_LIBRARY=mmtk`. Điều này yêu cầu
  bộ công cụ Rust trên máy build. [[Feature #20860]]


## Thay đổi ngôn ngữ

* Các chuỗi ký tự trong các tập tin không có comment `frozen_string_literal` giờ đây phát ra cảnh báo deprecation
  khi chúng bị thay đổi.
  Các cảnh báo này có thể được bật với `-W:deprecated` hoặc bằng cách đặt `Warning[:deprecated] = true`.
  Để tắt thay đổi này, bạn có thể chạy Ruby với tham số dòng lệnh `--disable-frozen-string-literal`.
  [[Feature #20205]]

* `it` được thêm để tham chiếu đến tham số block. [[Feature #18980]]

* Giờ đây hỗ trợ keyword splatting `nil` khi gọi phương thức.
  `**nil` được xử lý tương tự như `**{}`, không truyền keyword nào,
  và không gọi bất kỳ phương thức chuyển đổi nào.  [[Bug #20064]]

* Không còn cho phép truyền block trong index.  [[Bug #19918]]

* Không còn cho phép keyword arguments trong index.  [[Bug #20218]]

## YJIT

TL;DR:
* Hiệu suất tốt hơn trên hầu hết các benchmark trên cả nền tảng x86-64 và arm64.
* Giảm sử dụng bộ nhớ cho metadata biên dịch
* Nhiều bản sửa lỗi. YJIT giờ đây ổn định hơn và được kiểm tra kỹ hơn.

Tính năng mới:
* Thêm giới hạn bộ nhớ thống nhất qua tùy chọn dòng lệnh `--yjit-mem-size` (mặc định 128MiB)
  theo dõi tổng sử dụng bộ nhớ YJIT và trực quan hơn so với
  tùy chọn cũ `--yjit-exec-mem-size`.
* Thêm nhiều thống kê luôn có sẵn qua `RubyVM::YJIT.runtime_stats`
* Thêm nhật ký biên dịch để theo dõi những gì được biên dịch qua `--yjit-log`
  * Phần cuối nhật ký cũng có sẵn tại thời điểm chạy qua `RubyVM::YJIT.log`
* Thêm hỗ trợ cho hằng số chia sẻ trong chế độ multi-ractor
* Giờ đây có thể theo dõi các lần thoát được đếm với `--yjit-trace-exits=COUNTER`

Tối ưu hóa mới:
* Context nén giảm bộ nhớ cần thiết để lưu trữ metadata YJIT
* Cải thiện bộ cấp phát với khả năng cấp phát thanh ghi cho biến cục bộ
* Khi YJIT được bật, sử dụng nhiều nguyên thủy Core hơn được viết bằng Ruby:
  * `Array#each`, `Array#select`, `Array#map` được viết lại bằng Ruby để có hiệu suất tốt hơn [[Feature #20182]].
* Khả năng inline các phương thức nhỏ/đơn giản như:
  * Phương thức rỗng
  * Phương thức trả về hằng số
  * Phương thức trả về `self`
  * Phương thức trực tiếp trả về một tham số
* Codegen chuyên biệt cho nhiều phương thức runtime hơn
* Tối ưu hóa `String#getbyte`, `String#setbyte` và các phương thức chuỗi khác
* Tối ưu hóa các phép toán bitwise để tăng tốc thao tác bit/byte cấp thấp
* Nhiều tối ưu hóa gia tăng khác

## Cập nhật các lớp lõi

Lưu ý: Chúng tôi chỉ liệt kê các cập nhật lớp nổi bật.

* Exception

  * `Exception#set_backtrace` giờ đây chấp nhận mảng `Thread::Backtrace::Location`.
    `Kernel#raise`, `Thread#raise` và `Fiber#raise` cũng chấp nhận định dạng mới này. [[Feature #13557]]

* Range

  * `Range#size` giờ đây ném `TypeError` nếu range không thể lặp. [[Misc #18984]]



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
[Feature #20351]: https://bugs.ruby-lang.org/issues/20351
[Feature #20429]: https://bugs.ruby-lang.org/issues/20429
[Feature #20470]: https://bugs.ruby-lang.org/issues/20470
[Feature #20564]: https://bugs.ruby-lang.org/issues/20564
[Feature #20860]: https://bugs.ruby-lang.org/issues/20860
