---
layout: news_post
title: "Nhiều lỗ hổng bảo mật trong RubyGems"
author: "usa"
translator:
date: 2018-02-17 03:00:00 +0000
tags: security
lang: vi
---

Có nhiều lỗ hổng bảo mật trong RubyGems được đi kèm với Ruby.
Chúng được [báo cáo trên blog chính thức của RubyGems](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Chi tiết

Các lỗ hổng sau đã được báo cáo.

* Ngăn chặn path traversal khi ghi vào một basedir symlink nằm ngoài thư mục gốc.
* Sửa lỗi có thể xảy ra lỗ hổng Unsafe Object Deserialization trong gem owner.
* Diễn giải nghiêm ngặt các trường bát phân trong header tar.
* Đưa ra lỗi bảo mật khi có các tệp trùng lặp trong một package.
* Bắt buộc xác thực URL trên thuộc tính homepage của spec.
* Giảm thiểu lỗ hổng XSS trong thuộc tính homepage khi hiển thị qua gem server.
* Ngăn chặn vấn đề Path Traversal trong quá trình cài đặt gem.

Người dùng Ruby được khuyến nghị mạnh mẽ nên nâng cấp bản cài đặt Ruby hoặc áp dụng một trong các giải pháp tạm thời sau đây càng sớm càng tốt.

## Các phiên bản bị ảnh hưởng

* Ruby dòng 2.2: 2.2.9 trở về trước
* Ruby dòng 2.3: 2.3.6 trở về trước
* Ruby dòng 2.4: 2.4.3 trở về trước
* Ruby dòng 2.5: 2.5.0 trở về trước
* trước trunk revision 62422

## Giải pháp tạm thời

Về nguyên tắc, bạn nên nâng cấp bản cài đặt Ruby lên phiên bản mới nhất.
RubyGems 2.7.6 trở lên đã bao gồm bản sửa lỗi cho các lỗ hổng, vì vậy hãy nâng cấp RubyGems lên phiên bản mới nhất nếu bạn không thể nâng cấp Ruby.

```
gem update --system
```

Nếu bạn không thể nâng cấp RubyGems, bạn có thể áp dụng các bản vá sau đây như giải pháp tạm thời.

* [cho Ruby 2.2.9](https://bugs.ruby-lang.org/attachments/download/7030/rubygems-276-for-ruby22.patch)
* [cho Ruby 2.3.6](https://bugs.ruby-lang.org/attachments/download/7029/rubygems-276-for-ruby23.patch)
* [cho Ruby 2.4.3](https://bugs.ruby-lang.org/attachments/download/7028/rubygems-276-for-ruby24.patch)
* [cho Ruby 2.5.0](https://bugs.ruby-lang.org/attachments/download/7027/rubygems-276-for-ruby25.patch)

Về trunk, hãy cập nhật lên revision mới nhất.

## Ghi công

Báo cáo này dựa trên [blog chính thức của RubyGems](http://blog.rubygems.org/2018/02/15/2.7.6-released.html).

## Lịch sử

* Công bố lần đầu vào 2018-02-17 03:00:00 UTC
* Đề cập về việc nâng cấp Ruby vào 2018-03-29 01:00:00 UTC
