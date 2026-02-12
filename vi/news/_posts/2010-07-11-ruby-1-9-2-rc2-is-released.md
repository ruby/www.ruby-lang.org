---
layout: news_post
title: "Ruby 1.9.2 RC2 đã được phát hành"
author: "Yugui"
lang: vi
---

Ruby 1.9.2 RC2 vừa được phát hành. Đây là bản ứng viên phát hành thứ
hai của Ruby 1.9.2.

Thư viện psych đã được sửa kể từ bản ứng viên trước, và một số lỗi nhỏ
đã được sửa.

Xem [NEWS][1] và [ChangeLog][2] để biết thêm chi tiết.

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

Ruby 1.9.2 đã trở nên ổn định như chúng tôi mong đợi. Theo lịch trình,
Ruby 1.9.2 sẽ được phát hành vào đầu tháng 8. Lịch trình của Ruby
1.9.2 đã bị lùi lại để đảm bảo rằng 1.9.2 vượt qua RubySpec. Hiện tại
nó đã vượt qua hơn 99% RubySpecs. Hãy thử Ruby mới và cho chúng tôi
biết qua [hệ thống theo dõi lỗi][3] nếu bạn gặp bất kỳ vấn đề nào.

## Tải về

* [ruby-1.9.2-rc2.tar.bz2][4]
  * SIZE: 8480974 bytes
  * MD5: 4e4906d0aab711286b31f5a834860cc3
  * SHA256: 692ebae991b104482dc9f0d220c1afb6b690a338b3b815aaa4f62954d2fa1b4a

* [ruby-1.9.2-rc2.tar.gz][5]
  * SIZE: 10781884 bytes
  * MD5: d12cd39eee4d99bc54b52aba5a0ba4e1
  * SHA256: 5d523d99f928705ac1de84ade03283c468415c00f8b6755a8dd7a140828869b4

* [ruby-1.9.2-rc2.zip][6]
  * SIZE: 12161233 bytes
  * MD5: 05229b43981e4e5ce58b5fb2e98eee52
  * SHA256: 33f7f4cdd8444c2594728f70ac07477575a7cba5e7756bd3645f23e52605618c



[1]: https://git.ruby-lang.org/ruby.git/plain/NEWS?id=refs/tags/v1_9_2_rc2
[2]: https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v1_9_2_rc2
[3]: https://bugs.ruby-lang.org/projects/show/ruby-19/
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.bz2
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.tar.gz
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-rc2.zip
