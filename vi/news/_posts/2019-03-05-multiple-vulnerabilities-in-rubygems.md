---
layout: news_post
title: "Nhiều lỗ hổng bảo mật trong RubyGems"
author: "hsbt"
translator:
date: 2019-03-05 00:00:00 +0000
tags: security
lang: vi
---

Có nhiều lỗ hổng bảo mật trong RubyGems đi kèm với Ruby.
Chúng đã được [báo cáo trên blog chính thức của RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Chi tiết

Các lỗ hổng sau đã được báo cáo.

* CVE-2019-8320: Xóa thư mục sử dụng symlink khi giải nén tar
* CVE-2019-8321: Lỗ hổng chèn chuỗi thoát trong `verbose`
* CVE-2019-8322: Lỗ hổng chèn chuỗi thoát trong `gem owner`
* CVE-2019-8323: Lỗ hổng chèn chuỗi thoát trong xử lý phản hồi API
* CVE-2019-8324: Cài đặt gem độc hại có thể dẫn đến thực thi mã tùy ý
* CVE-2019-8325: Lỗ hổng chèn chuỗi thoát trong thông báo lỗi

Người dùng Ruby được khuyến cáo nâng cấp bản cài đặt Ruby của bạn hoặc áp dụng một trong các biện pháp khắc phục sau đây càng sớm càng tốt.

## Phiên bản bị ảnh hưởng

* Dòng Ruby 2.3: tất cả
* Dòng Ruby 2.4: 2.4.5 và trước đó
* Dòng Ruby 2.5: 2.5.3 và trước đó
* Dòng Ruby 2.6: 2.6.1 và trước đó
* trước trunk revision 67168

## Biện pháp khắc phục

Về nguyên tắc, bạn nên nâng cấp bản cài đặt Ruby lên phiên bản mới nhất.
RubyGems 3.0.3 trở lên bao gồm bản sửa cho các lỗ hổng, vì vậy hãy nâng cấp RubyGems lên phiên bản mới nhất nếu bạn không thể nâng cấp Ruby.

```
gem update --system
```

Nếu bạn không thể nâng cấp RubyGems, bạn có thể áp dụng các bản vá sau như biện pháp khắc phục tạm thời.

* [cho Ruby 2.4.5](https://bugs.ruby-lang.org/attachments/7669)
* [cho Ruby 2.5.3](https://bugs.ruby-lang.org/attachments/7670)
* [cho Ruby 2.6.1](https://bugs.ruby-lang.org/attachments/7671)

Đối với Ruby trunk, hãy cập nhật lên revision mới nhất.

## Ghi nhận

Báo cáo này dựa trên [blog chính thức của RubyGems](http://blog.rubygems.org/2019/03/05/security-advisories-2019-03.html).

## Lịch sử

* Được công bố lần đầu vào 2019-03-05 00:00:00 UTC
* Liên kết đến các bản vá cập nhật vào 2019-03-06 05:26:27 UTC
* Đề cập về việc nâng cấp Ruby vào 2019-04-01 06:00:00 UTC
