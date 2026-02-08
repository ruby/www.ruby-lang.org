---
layout: news_post
title: "Phát hành Ruby 1.9.3-p551"
author: "usa"
translator:
date: 2014-11-13 12:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 1.9.3-p551.

Bản phát hành này bao gồm bản vá bảo mật cho lỗ hổng DoS của REXML.
Nó tương tự với
[lỗ hổng đã được sửa](https://www.ruby-lang.org/vi/news/2014/10/27/rexml-dos-cve-2014-8080/)
trong [bản phát hành trước](https://www.ruby-lang.org/vi/news/2014/10/27/ruby-1-9-3-p550-is-released/),
nhưng xử lý một trường hợp khác của mở rộng entity.
Vui lòng xem chủ đề bên dưới để biết thêm chi tiết.

* [CVE-2014-8090: Một lỗ hổng từ chối dịch vụ mở rộng XML khác](https://www.ruby-lang.org/vi/news/2014/11/13/rexml-dos-cve-2014-8090/)


## Lưu ý

Ruby 1.9.3 hiện đang trong giai đoạn bảo trì bảo mật.
Điều này có nghĩa là chúng tôi không bao giờ sửa lỗi ngoại trừ các vấn đề bảo mật.
Và, hiện tại, thời điểm kết thúc bảo trì 1.9.3 đã được lên lịch vào tháng 2 năm sau.
Chúng tôi khuyến nghị người dùng Ruby 1.9.3 nên di chuyển sang phiên bản mới hơn càng sớm càng tốt.


## Tải về

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.bz2](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.bz2)

      SIZE:   10049332 bytes
      MD5:    0d8b272b05c3449dc848bb7570f65bfe
      SHA256: b0c5e37e3431d58613a160504b39542ec687d473de1d4da983dabcf3c5de771e
      SHA512: 5ea40f8c40cf116030ffdedbe436c1fdbf9a50b7bb44bc890845c9c2a885c34da711bc1a9e9694788c2f4710f7e6e0adc4410aec1ab18a25a27168f25ac3d68c

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.gz)

      SIZE:   12605119 bytes
      MD5:    0d8212f7bc89bab8ef521b04cd9df278
      SHA256: bb5be55cd1f49c95bb05b6f587701376b53d310eb1bb7c76fbd445a1c75b51e8
      SHA512: be12adf581ee76af70db117b44c6647c1df3d28fffa1b3379c6067e4aa1fb523dae7c9b130a51dcdcff268a8ee21a3d74f6f946135fb3ac6b90664f0a9df4a08

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.xz](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.tar.xz)

      SIZE:   7704072 bytes
      MD5:    7367b1dfb2ba1d6abf6fd7db70e765f5
      SHA256: 44228297861f4dfdf23a47372a3e3c4c5116fbf5b0e10883417f2379874b55c6
      SHA512: 2dd4cd7494d0d9b1cc2a5c3710a2c771617a367d1ba6f5099adc2785e37efcb668c6508780562359a4a4c83733e349aa5cb4f8532e1f334f9f96543670d35729

* [https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.zip](https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p551.zip)

      SIZE:   13987275 bytes
      MD5:    14a394b1d7b7031b34d4d1af64ee657e
      SHA256: cf468ccabd5cdef5047b8f02f4f71052fd3a9c87c12aba314f04748a451a63ec
      SHA512: 6ee550c7e435622114e3669393220a90946652eade0a83dab74970fff7088d5c2051bee9c272e2e6eccc36885b4f64928fc2d27c36584c1cc8dac91ce730d3ea

## Ghi chú phát hành

Xin lỗi vì sự bất tiện khi phát hành thường xuyên.
Cảm ơn mọi người đã giúp đỡ cho bản phát hành.
