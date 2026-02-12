---
layout: news_post
title: "Phát hành Ruby 2.3.7"
author: "usa"
translator:
date: 2018-03-28 17:00:00 +0000
lang: vi
---

Ruby 2.3.7 đã được phát hành.

Bản phát hành này bao gồm khoảng 70 bản sửa lỗi sau bản phát hành trước, và cũng bao gồm một số bản sửa lỗi bảo mật.
Vui lòng kiểm tra các chủ đề dưới đây để biết chi tiết.

* [CVE-2017-17742: Lỗ hổng tách phản hồi HTTP trong WEBrick](/vi/news/2018/03/28/http-response-splitting-in-webrick-cve-2017-17742/)
* [CVE-2018-8777: Tấn công DoS bằng yêu cầu lớn trong WEBrick](/vi/news/2018/03/28/large-request-dos-in-webrick-cve-2018-8777/)
* [CVE-2018-6914: Tạo tệp và thư mục ngoài ý muốn với duyệt thư mục trong tempfile và tmpdir](/vi/news/2018/03/28/unintentional-file-and-directory-creation-with-directory-traversal-cve-2018-6914/)
* [CVE-2018-8778: Lỗ hổng đọc dưới bộ đệm trong String#unpack](/vi/news/2018/03/28/buffer-under-read-unpack-cve-2018-8778/)
* [CVE-2018-8779: Tạo socket ngoài ý muốn bằng byte NUL độc hại trong UNIXServer và UNIXSocket](/vi/news/2018/03/28/poisoned-nul-byte-unixsocket-cve-2018-8779/)
* [CVE-2018-8780: Duyệt thư mục ngoài ý muốn bằng byte NUL độc hại trong Dir](/vi/news/2018/03/28/poisoned-nul-byte-dir-cve-2018-8780/)
* [Nhiều lỗ hổng bảo mật trong RubyGems](/vi/news/2018/02/17/multiple-vulnerabilities-in-rubygems/)

Xem [ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_3_7) để biết chi tiết.

Sau bản phát hành này, chúng tôi sẽ kết thúc giai đoạn bảo trì thông thường của Ruby 2.3,
và bắt đầu giai đoạn bảo trì bảo mật.
Điều này có nghĩa là sau khi phát hành 2.3.7, chúng tôi sẽ không bao giờ backport bất kỳ bản sửa lỗi nào
cho 2.3 ngoại trừ các bản sửa lỗi bảo mật.
Thời hạn giai đoạn bảo trì bảo mật được lên kế hoạch là 1 năm.
Khi kết thúc thời hạn này, hỗ trợ chính thức cho Ruby 2.3 sẽ chấm dứt.
Do đó, chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch nâng cấp lên Ruby 2.5 hoặc 2.4.

## Tải về

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.bz2)

      SIZE:   14421177 bytes
      SHA1:   3bb88965405da5e4de2432eeb445fffa8a66fb33
      SHA256: 18b12fafaf37d5f6c7139c1b445355aec76baa625a40300598a6c8597fc04d8e
      SHA512: e72754f7703f0706c4b0bccd053035536053451fe069a55427984cc0bc5692b86bd51c243c5f62f78527c66b08300d2e4aa19b73e6ded13d6020aa2450e66a7d

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.gz)

      SIZE:   17859100 bytes
      SHA1:   540996fec64984ab6099e34d2f5820b14904f15a
      SHA256: 35cd349cddf78e4a0640d28ec8c7e88a2ae0db51ebd8926cd232bb70db2c7d7f
      SHA512: 1ceccf00981d6d60e7587e89a04cc028f976950313ee445db5afd03e323472d3e69a35423733b24f9cbd9729f034cf80d2233b5c159764839f5bee4ca7052fe0

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.xz](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.tar.xz)

      SIZE:   11438124 bytes
      SHA1:   c489248730cbce7721edd3e97de81e68eec938b2
      SHA256: c61f8f2b9d3ffff5567e186421fa191f0d5e7c2b189b426bb84498825d548edb
      SHA512: fd91c8db3d3aa4cc962a62f27b4d1a71f6b5567ab836e6dbfbbb1553eb269d11e12faf9e36af6c489c33b54fd89dab99bfe81a563158b704877f0628d6f5bc5a

* [https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.zip](https://cache.ruby-lang.org/pub/ruby/2.3/ruby-2.3.7.zip)

      SIZE:   19911423 bytes
      SHA1:   ec6870b39125238d8d57d642225592896ed3b6d9
      SHA256: ffa42eeff928624a05dc7ad39426c855c6e9a757417f17b6fe9e54664ec91012
      SHA512: c85255a7f43c7df2fb11be4f9aa96e2ae70a94d3e963ccff4d8c1349ad6d455d9a436812efb24c91e451e68b8f81e5d335c6d5811b2a0e945a7070c305054434

## Nhận xét phát hành

Cảm ơn tất cả những ai đã hỗ trợ cho bản phát hành này.

Việc bảo trì Ruby 2.3, bao gồm bản phát hành này, dựa trên "Thỏa thuận về phiên bản ổn định của Ruby" của Hiệp hội Ruby.
