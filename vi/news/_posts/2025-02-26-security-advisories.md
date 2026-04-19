---
layout: news_post
title: "Khuyến cáo bảo mật: CVE-2025-27219, CVE-2025-27220 và CVE-2025-27221"
author: "hsbt"
translator:
date: 2025-02-26 07:00:00 +0000
tags: security
lang: vi
---

Chúng tôi đã công bố các khuyến cáo bảo mật cho CVE-2025-27219, CVE-2025-27220 và CVE-2025-27221. Vui lòng đọc chi tiết bên dưới.

## CVE-2025-27219: Từ chối dịch vụ trong `CGI::Cookie.parse`.

Có khả năng xảy ra DoS trong gem cgi. Lỗ hổng này đã được gán mã định danh CVE [CVE-2025-27219](https://www.cve.org/CVERecord?id=CVE-2025-27219). Chúng tôi khuyến nghị nâng cấp gem cgi.

### Chi tiết

`CGI::Cookie.parse` mất thời gian siêu tuyến tính để phân tích chuỗi cookie trong một số trường hợp. Đưa chuỗi cookie được tạo thủ công độc hại vào phương thức có thể dẫn đến Từ chối Dịch vụ.

Vui lòng cập nhật gem CGI lên phiên bản 0.3.5.1, 0.3.7, 0.4.2 hoặc mới hơn.

### Phiên bản bị ảnh hưởng

* Gem cgi phiên bản <= 0.3.5, 0.3.6, 0.4.0 và 0.4.1.

### Ghi nhận

Cảm ơn [lio346](https://hackerone.com/lio346) đã phát hiện vấn đề này. Cũng cảm ơn [mame](https://github.com/mame) đã sửa lỗ hổng này.

## CVE-2025-27220: ReDoS trong `CGI::Util#escapeElement`.

Có khả năng xảy ra Từ chối Dịch vụ bằng Biểu thức Chính quy (ReDoS) trong gem cgi. Lỗ hổng này đã được gán mã định danh CVE [CVE-2025-27220](https://www.cve.org/CVERecord?id=CVE-2025-27220). Chúng tôi khuyến nghị nâng cấp gem cgi.

### Chi tiết

Biểu thức chính quy được sử dụng trong `CGI::Util#escapeElement` dễ bị tấn công ReDoS. Đầu vào được tạo thủ công có thể dẫn đến tiêu thụ CPU cao.

Lỗ hổng này chỉ ảnh hưởng đến Ruby 3.1 và 3.2. Nếu bạn đang sử dụng các phiên bản này, vui lòng cập nhật gem CGI lên phiên bản 0.3.5.1, 0.3.7, 0.4.2 hoặc mới hơn.

### Phiên bản bị ảnh hưởng

* Gem cgi phiên bản <= 0.3.5, 0.3.6, 0.4.0 và 0.4.1.

### Ghi nhận

Cảm ơn [svalkanov](https://hackerone.com/svalkanov) đã phát hiện vấn đề này. Cũng cảm ơn [nobu](https://github.com/nobu) đã sửa lỗ hổng này.


## CVE-2025-27221: Rò rỉ userinfo trong `URI#join`, `URI#merge` và `URI#+`.

Có khả năng rò rỉ userinfo trong gem uri. Lỗ hổng này đã được gán mã định danh CVE [CVE-2025-27221](https://www.cve.org/CVERecord?id=CVE-2025-27221). Chúng tôi khuyến nghị nâng cấp gem uri.

### Chi tiết

Các phương thức `URI#join`, `URI#merge`, và `URI#+` giữ lại userinfo, chẳng hạn như `user:password`, ngay cả sau khi host bị thay thế. Khi tạo URL đến host độc hại từ URL chứa userinfo bí mật bằng các phương thức này, và có người truy cập URL đó, có thể xảy ra rò rỉ userinfo ngoài ý muốn.

Vui lòng cập nhật gem URI lên phiên bản 0.11.3, 0.12.4, 0.13.2, 1.0.3 hoặc mới hơn.

### Phiên bản bị ảnh hưởng

* Gem uri phiên bản < 0.11.3, 0.12.0 đến 0.12.3, 0.13.0, 0.13.1 và 1.0.0 đến 1.0.2.

### Ghi nhận

Cảm ơn [Tsubasa Irisawa (lambdasawa)](https://hackerone.com/lambdasawa) đã phát hiện vấn đề này. Cũng cảm ơn [nobu](https://github.com/nobu) đã sửa thêm lỗ hổng này.

## Lịch sử

* Công bố lần đầu vào 2025-02-26 7:00:00 (UTC)
