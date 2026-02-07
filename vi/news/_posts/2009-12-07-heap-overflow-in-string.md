---
layout: news_post
title: "Tràn bộ nhớ heap trong String (CVE-2009-4124)"
author: "Yugui"
lang: vi
---

Có một lỗ hổng tràn bộ nhớ heap trong `String#ljust`, `String#center`
và `String#rjust`. Điều này đã cho phép kẻ tấn công thực thi mã tùy ý
trong một số trường hợp hiếm.

* [CVE-2009-4124][1]

## Các phiên bản bị ảnh hưởng

* Tất cả các bản phát hành của Ruby 1.9.1.

Lỗ hổng này không ảnh hưởng đến dòng Ruby 1.8.

## Giải pháp

Vui lòng nâng cấp lên Ruby 1.9.1-p376.

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2&gt;][2]

## Ghi nhận

Ghi nhận Emmanouel Kellinis, KPMG London vì đã tiết lộ vấn đề cho đội
bảo mật Ruby.

## Thay đổi

* 2009-12-07 14:52 +0900 thêm liên kết đến CVE (nhưng chưa mở khi
  viết trang này)



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2009-4124
[2]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.1-p376.tar.bz2
