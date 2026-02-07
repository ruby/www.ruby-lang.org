---
layout: news_post
title: "Phát hành Ruby 2.5.1"
author: "naruse"
translator:
date: 2018-03-28 17:20:00 +0000
lang: vi
---

Ruby 2.5.1 đã được phát hành.

Bản phát hành này bao gồm một số bản sửa lỗi và bản sửa lỗi bảo mật.

* [CVE-2017-17742: Lỗ hổng tách phản hồi HTTP trong WEBrick](/en/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/)
* [CVE-2018-6914: Tạo tệp và thư mục ngoài ý muốn với duyệt thư mục trong tempfile và tmpdir](/en/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/)
* [CVE-2018-8777: Tấn công DoS bằng yêu cầu lớn trong WEBrick](/en/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/)
* [CVE-2018-8778: Lỗ hổng đọc dưới bộ đệm trong String#unpack](/en/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/)
* [CVE-2018-8779: Tạo socket ngoài ý muốn bằng byte NUL độc hại trong UNIXServer và UNIXSocket](/en/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/)
* [CVE-2018-8780: Duyệt thư mục ngoài ý muốn bằng byte NUL độc hại trong Dir](/en/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/)
* [Nhiều lỗ hổng bảo mật trong RubyGems](/en/news/2018/02/17/multiple-vulnerabilities-in-rubygems/)


Ngoài ra còn có một số bản sửa lỗi khác.
Xem [nhật ký commit](https://github.com/ruby/ruby/compare/v2_5_0...v2_5_1) để biết thêm chi tiết.

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.gz>

      SIZE:   15923244 bytes
      SHA1:   93fafd57a724974b951957c522cdc4478a6bdc2e
      SHA256: dac81822325b79c3ba9532b048c2123357d3310b2b40024202f360251d9829b1
      SHA512: 67badcd96fd3808cafd6bc86c970cd83aee7e5ec682f34e7353663d96211a6af314a4c818e537ec8ca51fbc0737aac4e28e0ebacf1a4d1e13db558b623a0f6b1

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.zip>

      SIZE:   19525307 bytes
      SHA1:   4fe511496f1eea0c3c1ac0c5f75ef11168ad1695
      SHA256: 5d8e490896c8353aa574be56ca9aa52c250390e76e36cd23df450c0434ada4d4
      SHA512: 490a52081e740b37f06215740734e9a6598ee9b492995b3161d720b5b05beadb4570aa526b3df01f686881b1e259aa7d4a59c1f398989dc2d5f8250342d986f7

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.bz2>

      SIZE:   14000644 bytes
      SHA1:   251fdb5ac10783b036fe923aa7986be582062361
      SHA256: 0f5d20f012baca865381a055e73f22db814615fee3c68083182cb78a4b3b30cb
      SHA512: 82e799ecf7257a9f5fe8691c50a478b0f91bd4bdca50341c839634b0da5cd76c5556965cb9437264b66438434c94210c949fe9dab88cbc5b3b7fa34b5382659b

* <https://cache.ruby-lang.org/pub/ruby/2.5/ruby-2.5.1.tar.xz>

      SIZE:   11348108 bytes
      SHA1:   0fb5da56f9e5fca45e36aa24ba842d935d1691c2
      SHA256: 886ac5eed41e3b5fc699be837b0087a6a5a3d10f464087560d2d21b3e71b754d
      SHA512: 31bacf58469953282cd5d8b51862dcf4b84dedb927c1871bc3fca32fc157fe49187631575a70838705fe246f4555647577a7ecc26894445a7d64de5503dc11b4

## Nhận xét phát hành

Nhiều committer, nhà phát triển và người dùng đã cung cấp báo cáo lỗi giúp
chúng tôi thực hiện bản phát hành này.
Cảm ơn những đóng góp của họ.
