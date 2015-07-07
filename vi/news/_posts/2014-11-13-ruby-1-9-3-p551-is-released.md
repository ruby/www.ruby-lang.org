---
layout: news_post
title: "Ra mắt phiên bản Ruby 1.9.3-p551"
author: "usa"
translator: "hoasung01"
date: 2014-11-13 12:00:00 +0000
lang: vi
---

Chúng tôi xin thông báo phiên bản Ruby 1.9.3-p551.

Phiên bản này bao gồm bản sửa lỗi cho lỗ hổng DoS của REXML.
Tương tự như
[lỗ hổng đã sửa](https://www.ruby-lang.org/vi/news/2014/10/27/rexml-dos-cve-2014-8080/)
trong [phiên bản trưóc](https://www.ruby-lang.org/vi/news/2014/10/27/ruby-1-9-3-p550-is-released/),
nhưng những xử lý này cho các trường hợp mở rộng khác.
Xin xem chủ đề bên dưới để biết thêm chi tiết.

* [CVE-2014-8090: Tấn công từ chối dịch vụ giãn nở XML khác](https://www.ruby-lang.org/vi/news/2014/11/13/rexml-dos-cve-2014-8090/)


## Chú ý

Ruby 1.9.3 hiện đang trong quá trình bảo trì bảo mật.
Đìều này có nghĩa là chúng tôi chỉ sửa những lỗi liên quan đến bảo mật.
Và, tháng 2 năm sau, chúng tôi sẽ ngừng bảo trì Ruby 1.9.3.
Chúng tôi khuyến cáo người dùng Ruby 1.9.3 nên chuyển qua sử dụng phiên bản mới hơn.


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

## Ghi chú phiên bản

Xin lỗi về sự bất tiện thường xuyên trong khi phát hành.
Cảm ơn tất cả mọi ngưòi đã giúp đỡ.
