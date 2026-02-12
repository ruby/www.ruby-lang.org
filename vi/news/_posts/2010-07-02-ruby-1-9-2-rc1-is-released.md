---
layout: news_post
title: "Ruby 1.9.2 RC1 đã được phát hành"
author: "Yugui"
lang: vi
---

Ruby 1.9.2 RC vừa được phát hành. Đây là bản ứng viên phát hành của
Ruby 1.9.2.

## Về Ruby 1.9.2

Ruby 1.9.2 sẽ tương thích chủ yếu với 1.9.1, ngoại trừ các thay đổi
sau:

* nhiều phương thức mới
* socket API mới (hỗ trợ IPv6)
* các encoding mới
* lớp `Random` hỗ trợ nhiều bộ sinh số ngẫu nhiên khác nhau
* `Time` đã được triển khai lại. Không còn vấn đề năm 2038.
* một số cải tiến regexp
* `$:` không còn bao gồm thư mục hiện tại
* `dl` được triển khai lại trên nền `libffi`
* thư viện `psych` mới bao bọc `libyaml`. Bạn có thể sử dụng thư viện
  này thay cho `syck`

Xem [NEWS][1] và [ChangeLog][2] để biết thêm chi tiết.

Khoảng 130 lỗi đã được sửa kể từ bản phát hành 1.9.2 preview 3. Tất cả
các lỗi lớn đã biết trong 1.9.2 đã được sửa, ngoại trừ [#3462][3].

Theo lịch trình, Ruby 1.9.2 sẽ được phát hành vào đầu tháng 8. Lịch
trình của Ruby 1.9.2 đã bị lùi lại để đảm bảo rằng 1.9.2 vượt qua
RubySpec. Hiện tại nó đã vượt qua hơn 99% RubySpecs. Hãy thử Ruby mới
và cho chúng tôi biết qua [hệ thống theo dõi lỗi][4] nếu bạn gặp bất
kỳ vấn đề nào.

## Tải về

* [ruby-1.9.2-rc1.tar.bz2][5]
  * SIZE: 8479087 bytes
  * MD5: 242dcfaed8359a6918941b55d0806bf0
  * SHA256: c2a680aa5472c8d04a71625afa2b0f75c030d3655a3063fe364cfda8b33c1480

* [ruby-1.9.2-rc1.tar.gz](URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.gz)
  * SIZE: 10779309 bytes
  * MD5: fdedd5b42ae89a9a46797823ad2d9acf
  * SHA256: 3e90036728342ce8463be00d42d4a36de70dabed96216c5f8a26ec9ba4b29537

* [ruby-1.9.2-rc1.zip][6]
  * SIZE: 12158992 bytes
  * MD5: 3da59c5d3567f6e1f1697abbef71f507
  * SHA256: 4f593a3d0873cea8f371a7fc7484cad7bc03acac0ada1970cb9f83a89bc27997



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_rc1
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_rc1
[3]: https://bugs.ruby-lang.org/issues/show/3462
[4]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.tar.bz2
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc1.zip
