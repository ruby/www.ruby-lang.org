---
layout: news_post
title: "Nhiều lỗ hổng bảo mật trong RubyGems"
author: "usa"
translator:
date: 2017-08-29 12:00:00 +0000
tags: security
lang: vi
---

Có nhiều lỗ hổng bảo mật trong RubyGems được đi kèm với Ruby.
Chúng đã được [báo cáo trên blog chính thức của RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Chi tiết

Các lỗ hổng bảo mật sau đã được báo cáo.

* Lỗ hổng chiếm đoạt yêu cầu DNS. (CVE-2017-0902)
* Lỗ hổng chuỗi thoát ANSI. (CVE-2017-0899)
* Lỗ hổng DoS trong lệnh query. (CVE-2017-0900)
* Lỗ hổng trong trình cài đặt gem cho phép gem độc hại ghi đè lên các tệp tùy ý. (CVE-2017-0901)

Người dùng Ruby được khuyến nghị mạnh mẽ nâng cấp hoặc thực hiện một trong các biện pháp khắc phục sau đây càng sớm càng tốt.

## Các phiên bản bị ảnh hưởng

* Ruby nhánh 2.2: 2.2.7 và trước đó
* Ruby nhánh 2.3: 2.3.4 và trước đó
* Ruby nhánh 2.4: 2.4.1 và trước đó
* trước trunk revision 59672

## Biện pháp khắc phục

Nếu bạn không thể nâng cấp Ruby, hãy nâng cấp RubyGems lên phiên bản mới nhất.
RubyGems 2.6.13 hoặc mới hơn bao gồm bản sửa lỗi cho các lỗ hổng này.

```
gem update --system
```

Nếu bạn không thể nâng cấp RubyGems, bạn có thể áp dụng các bản vá sau đây như một biện pháp khắc phục.

* [cho Ruby 2.2.7](https://bugs.ruby-lang.org/attachments/download/6690/rubygems-2613-ruby22.patch)
* [cho Ruby 2.3.4](https://bugs.ruby-lang.org/attachments/download/6691/rubygems-2613-ruby23.patch)
* cho Ruby 2.4.1: cần 2 bản vá. Áp dụng lần lượt như sau:
  1. [RubyGems 2.6.11 lên 2.6.12](https://bugs.ruby-lang.org/attachments/download/6692/rubygems-2612-ruby24.patch)
  2. [RubyGems 2.6.12 lên 2.6.13](https://bugs.ruby-lang.org/attachments/download/6693/rubygems-2613-ruby24.patch)

Đối với trunk, hãy cập nhật lên revision mới nhất.

## Ghi công

Báo cáo này dựa trên [blog chính thức của RubyGems](http://blog.rubygems.org/2017/08/27/2.6.13-released.html).

## Lịch sử

* Được công bố lần đầu vào 2017-08-29 12:00:00 UTC
* Thêm số CVE vào 2017-08-31 2:00:00 UTC
* Đề cập về việc nâng cấp Ruby vào 2017-09-15 12:00:00 UTC
