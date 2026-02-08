---
layout: news_post
title: "Kế hoạch hỗ trợ cho Ruby 2.0.0 và Ruby 2.1"
author: "usa"
translator:
date: 2016-02-24 09:00:00 +0000
lang: vi
---

Chúng tôi thông báo kế hoạch hỗ trợ tương lai cho Ruby 2.0.0 và Ruby 2.1.

## Về Ruby 2.0.0

Như đã thông báo trước đó, tất cả hỗ trợ cho Ruby 2.0.0 đã kết thúc vào hôm nay.
Các bản sửa lỗi và bảo mật từ các phiên bản Ruby mới hơn sẽ không còn được
backport sang 2.0.0, và không có bản vá nào của 2.0.0 sẽ được phát hành nữa.

Chúng tôi đặc biệt khuyến nghị bạn nâng cấp lên Ruby 2.3 hoặc 2.2 càng sớm càng tốt.

Vui lòng liên hệ với chúng tôi qua danh sách thư ruby-core nếu bạn muốn tiếp tục bảo trì
nhánh 2.0.0 vì lý do chính đáng nào đó mà bạn không thể nâng cấp.

## Về Ruby 2.1

Chúng tôi dự định phát hành Ruby 2.1.9 vào cuối tháng 3.
Sau bản phát hành đó, chúng tôi sẽ kết thúc giai đoạn bảo trì bình thường của 2.1,
và bắt đầu giai đoạn bảo trì bảo mật.
Điều này có nghĩa là sau khi phát hành 2.1.9, chúng tôi sẽ không bao giờ backport
bất kỳ bản sửa lỗi nào sang 2.1 ngoại trừ các bản sửa bảo mật.

Chúng tôi khuyến nghị bạn bắt đầu lên kế hoạch nâng cấp lên Ruby 2.3 hoặc 2.2.

Nhân tiện, chúng tôi cũng dự định phát hành Ruby 2.1.10 ngay sau khi
phát hành 2.1.9. Đây không phải là bản sửa lỗi hay bản sửa bảo mật.
Chúng tôi chưa bao giờ có số phiên bản hai chữ số của Ruby.
Do đó, chúng tôi cho rằng việc kiểm thử một bản phát hành như vậy là quan trọng
mà không có bất kỳ bản sửa bảo mật nghiêm trọng nào.

Ruby 2.1.10 sẽ không bao gồm bất kỳ thay đổi nào từ 2.1.9,
ngoại trừ số phiên bản.
Bạn không cần sử dụng nó trong môi trường production, nhưng bạn nên kiểm thử trước
khi phát hành 2.1.11 mà có thể sẽ bao gồm các bản sửa bảo mật.
