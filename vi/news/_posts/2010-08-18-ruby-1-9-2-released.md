---
layout: news_post
title: "Ruby 1.9.2 đã được phát hành"
author: "Yugui"
lang: vi
---

Ruby 1.9.2 đã được phát hành. Đây là phiên bản ổn định mới nhất của
dòng 1.9.

### Về Ruby 1.9.2

Ruby 1.9.2 mới gần như tương thích với 1.9.1, ngoại trừ các thay đổi
sau:

* Nhiều phương thức mới
* Socket API mới (hỗ trợ IPv6 cải tiến)
* Các encoding mới
* Lớp Random mới hỗ trợ nhiều bộ sinh số ngẫu nhiên
* Time được triển khai lại. Lỗi năm 2038 đã được sửa.
* Cải tiến regex
* $: không còn bao gồm thư mục hiện tại.
* dl được triển khai lại trên nền libffi.
* Thư viện psych mới bao bọc libyaml có thể thay thế syck.

Xem [NEWS][1] và [ChangeLog][2] để biết thêm thông tin chi tiết.

Ruby 1.9.2 vượt qua hơn 99% [RubySpec][3].

### Các nền tảng được hỗ trợ

Ruby 1.9 hỗ trợ bốn cấp độ.

Được hỗ trợ
: Chúng tôi đã kiểm tra rằng Ruby 1.9.2 hoạt động tốt trên hầu hết
  các nền tảng này.

  * Debian GNU/Linux 5.0 на IA32.

Nỗ lực hỗ trợ
: Chúng tôi đã kiểm tra rằng Ruby 1.9.2 hoạt động tốt trên hầu hết
  các nền tảng này.

  * mswin32, x64-mswin64, mingw32
  * MacOS X 10.5 (Intel) và 10.6
  * FreeBSD 6 và mới hơn (amd64, IA32)
  * Solaris 10
  * Symbian OS

Nỗ lực hỗ trợ
: Chúng tôi đã kiểm tra rằng Ruby 1.9.2 hoạt động tốt trên hầu hết
  các nền tảng này với các sửa đổi nhỏ. Các bản vá được chấp nhận.

  * Các bản phân phối Linux khác
  * Các phiên bản MacOS X khác.
  * cygwin
  * AIX 5
  * Các hệ thống tương thích POSIX khác
  * BeOS (Haiku)

### FAQ

Thư viện chuẩn được cài đặt trong /usr/local/lib/ruby/1.9.1
: Phiên bản này là "phiên bản tương thích thư viện." Ruby 1.9.2 gần
  như tương thích với 1.9.1, nên thư viện được cài đặt trong thư mục
  1.9.1.

Nó gây ra LoadError
: `$:` không còn bao gồm thư mục hiện tại. Một số script có thể cần
  sửa đổi để hoạt động đúng.

### Tải về

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2&gt;][4]
  SIZE
  : 8495472 bytes

  MD5
  : d8a02cadf57d2571cd4250e248ea7e4b

  SHA256
  : e9710990ed8c2e794123aba509010471915fb13c27dae0118831d2001a9c8d3b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz&gt;][5]
  SIZE
  : 10787899 bytes

  MD5
  : 755aba44607c580fddc25e7c89260460

  SHA256
  : 8c0c4e261a921b5c406bf9e76ac23bf3c915651534e9d1b9e8c5d0bee4a7285c

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip&gt;][6]
  SIZE
  : 12159728 bytes

  MD5
  : e57a393ccd62ddece4c63bd549d8cf7f

  SHA256
  : e61521af06da71fde9f0c7c08baaf7415614d00c86ec5a7ab08b60a4f3185b2a



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_0
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_0
[3]: https://github.com/ruby/spec
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p0.zip
