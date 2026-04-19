---
layout: news_post
title: "Ruby 3.3.0-preview1 đã được phát hành"
author: "naruse"
translator:
date: 2023-05-12 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.3.0-preview1" | first %}

Chúng tôi vui mừng thông báo phiên bản Ruby {{ release.version }} đã được phát hành. Ruby 3.3 bổ sung một trình biên dịch JIT thuần Ruby mới có tên RJIT, sử dụng Lrama làm trình tạo parser, và nhiều cải thiện hiệu suất đặc biệt là YJIT.

## RJIT

* Giới thiệu trình biên dịch JIT thuần Ruby RJIT và thay thế MJIT.
  * RJIT chỉ hỗ trợ kiến trúc x86\_64 trên các nền tảng Unix.
  * Không giống như MJIT, nó không yêu cầu trình biên dịch C tại thời điểm chạy.
* RJIT chỉ tồn tại cho mục đích thử nghiệm.
  * Bạn nên tiếp tục sử dụng YJIT trong môi trường sản xuất.
* Nếu bạn quan tâm đến việc phát triển JIT cho Ruby, vui lòng xem [bài thuyết trình của k0kubun vào Ngày 3 của RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Sử dụng Lrama thay thế Bison

* Thay thế Bison bằng [trình tạo parser LALR Lrama](https://github.com/yui-knk/lrama) [Feature #19637](https://bugs.ruby-lang.org/issues/19637)
  * Nếu bạn quan tâm, vui lòng xem [Tầm nhìn tương lai của Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)

## YJIT

* Cải thiện hiệu suất đáng kể so với 3.2
  * Hỗ trợ cho splat và rest arguments đã được cải thiện.
  * Các thanh ghi được phân bổ cho các thao tác ngăn xếp của máy ảo.
  * Nhiều lời gọi với tham số tùy chọn được biên dịch hơn.
  * `Integer#!=`, `String#!=`, `Kernel#block_given?`, `Kernel#is_a?`,
    `Kernel#instance_of?`, `Module#===` được tối ưu hóa đặc biệt.
  * Các biến instance không còn thoát ra trình thông dịch
    với Object Shapes đa hình.
* Metadata cho mã đã biên dịch sử dụng ít bộ nhớ hơn nhiều.
* Cải thiện việc sinh mã trên ARM64
* Tùy chọn khởi động YJIT ở chế độ tạm dừng và sau đó bật thủ công
  * `--yjit-pause` và `RubyVM::YJIT.resume`
  * Điều này có thể được sử dụng để chỉ bật YJIT sau khi ứng dụng của bạn đã khởi động xong
* Tùy chọn theo dõi exit hiện hỗ trợ lấy mẫu
  * `--trace-exits-sample-rate=N`
* Nhiều bản sửa lỗi



## Các tính năng mới đáng chú ý khác

### Ngôn ngữ



## Cải thiện hiệu suất

* `defined?(@ivar)` được tối ưu hóa với Object Shapes.

## Các thay đổi đáng chú ý khác kể từ 3.2



## Vấn đề tương thích

Lưu ý: Không bao gồm các bản sửa lỗi tính năng.

### Các hằng số đã bị loại bỏ

Các hằng số không còn được dùng sau đây đã bị loại bỏ.



### Các phương thức đã bị loại bỏ

Các phương thức không còn được dùng sau đây đã bị loại bỏ.



## Vấn đề tương thích thư viện chuẩn

### `ext/readline` đã ngừng hoạt động

* Chúng tôi có `reline` là bản triển khai thuần Ruby tương thích với API `ext/readline`. Chúng tôi sẽ dựa vào `reline` trong tương lai. Nếu bạn cần sử dụng `ext/readline`, bạn có thể cài đặt `ext/readline` thông qua rubygems.org với `gem install readline-ext`.
* Chúng tôi không còn cần cài đặt các thư viện như `libreadline` hay `libedit`.

## Cập nhật C API

### Các C API đã được cập nhật

Các API sau đây đã được cập nhật.



### Các C API đã bị loại bỏ

Các API không còn được dùng sau đây đã bị loại bỏ.



## Cập nhật thư viện chuẩn



Các default gem sau đây đã được cập nhật.

* RubyGems 3.5.0.dev
* bigdecimal 3.1.4
* bundler 2.5.0.dev
* csv 3.2.7
* fiddle 1.1.2
* fileutils 1.7.1
* irb 1.6.4
* optparse 0.4.0.pre.1
* psych 5.1.0
* reline 0.3.3
* stringio 3.0.7
* strscan 3.0.7
* syntax_suggest 1.0.4
* time 0.2.2
* timeout 0.3.2
* uri 0.12.1

Các bundled gem sau đây đã được cập nhật.

* minitest 5.18.0
* rbs 3.1.0
* typeprof 0.21.7
* debug 1.8.0

Xem các bản phát hành trên GitHub như [Logger](https://github.com/ruby/logger/releases) hoặc
changelog để biết chi tiết về các default gem hoặc bundled gem.

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa đi(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.2.0!

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
