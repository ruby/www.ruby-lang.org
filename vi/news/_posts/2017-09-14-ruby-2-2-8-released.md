---
layout: news_post
title: "Phát hành Ruby 2.2.8"
author: "usa"
translator:
date: 2017-09-14 12:00:00 +0000
lang: vi
---

Ruby 2.2.8 đã được phát hành.
Bản phát hành này bao gồm một số bản sửa lỗi bảo mật.
Vui lòng xem các chủ đề bên dưới để biết chi tiết.

* [CVE-2017-0898: Lỗ hổng tràn bộ đệm dưới trong Kernel.sprintf](/vi/news/2017/09/14/sprintf-buffer-underrun-cve-2017-0898/)
* [CVE-2017-10784: Lỗ hổng chèn chuỗi thoát trong xác thực Basic của WEBrick](/vi/news/2017/09/14/webrick-basic-auth-escape-sequence-injection-cve-2017-10784/)
* [CVE-2017-14033: Lỗ hổng tràn bộ đệm dưới trong giải mã OpenSSL ASN1](/vi/news/2017/09/14/openssl-asn1-buffer-underrun-cve-2017-14033/)
* [CVE-2017-14064: Lỗ hổng lộ heap khi tạo JSON](/vi/news/2017/09/14/json-heap-exposure-cve-2017-14064/)
* [Nhiều lỗ hổng bảo mật trong RubyGems](/vi/news/2017/08/29/multiple-vulnerabilities-in-rubygems/)
* Cập nhật libyaml đi kèm lên phiên bản 0.1.7

Ruby 2.2 hiện đang trong giai đoạn bảo trì bảo mật, cho đến cuối tháng 3 năm 2018.
Sau ngày đó, việc bảo trì Ruby 2.2 sẽ kết thúc.
Chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch di chuyển sang các phiên bản Ruby mới hơn, chẳng hạn như 2.4 hoặc 2.3.

## Tải về

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.bz2)

      SIZE:   13374522 bytes
      SHA1:   d851324bf783221108ce79343fabbcd559b9e60b
      SHA256: b19085587d859baf9d7763f92e34a84632fceac5cc593ca2c0efa28ed8c6e44e
      SHA512: 83756cd1c91516962b83961e0de59d858618f7ed3e9795f930aab4f199d47a95ed8f867d8aa9b51d508be26d9babf2140117c88241168bac41e6ef702cfadf20

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.gz)

      SIZE:   16681654 bytes
      SHA1:   15a6fca1bfe0488b24a204708a287904028aa367
      SHA256: 8f37b9d8538bf8e50ad098db2a716ea49585ad1601bbd347ef84ca0662d9268a
      SHA512: b9d355232c1ca3e17b5d4dcb70f0720da75b82787e45eb4ede281290bf42643665385e55428495eb55c17f744395130b4d64ef78ca66c5a5ecb9f4c3b732fdea

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.tar.xz)

      SIZE:   10520648 bytes
      SHA1:   3a25914aafedc81952899298a18f9c3a4881d2d1
      SHA256: 37eafc15037396c26870f6a6c5bcd0658d14b46cd5e191a3b56d89dd22d561b0
      SHA512: e21004bee537f0c706f4ac9526507b414ddb6a8d721e8fad8d7fe88992a4f048eb5eb79f8d8b8af2a8b331dcfa74b560490218a1acb3532c2cdb4fb4909da3c9

* [https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.zip](https://cache.ruby-lang.org/pub/ruby/2.2/ruby-2.2.8.zip)

      SIZE:   18521461 bytes
      SHA1:   3b0142bad47e29f429903f6c4ca84540764b5e93
      SHA256: 58bf98b62d21d6cc622e6ef5c7d024db0458c6860199ab4c1bf68cdc4b36fa9d
      SHA512: 08cadfa72713f9e3348093c96af4c53f06f681bc29ada2d80f1c55faca6a59a3b2913aa2443bf645fea6f3840b32ce8ce894b358f972b1a295ee0860b656eb02

## Lời nhắn phát hành

Cảm ơn tất cả những người đã giúp đỡ cho bản phát hành này, đặc biệt là những người báo cáo lỗ hổng bảo mật.
