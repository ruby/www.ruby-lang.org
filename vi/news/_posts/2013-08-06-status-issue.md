---
layout: news_post
title:  "Sự cố dịch vụ của ruby-lang.org"
author: "hsbt"
translator: "Trung Lê"
date:   2013-08-06 04:00:00 UTC
lang:   vi
---

Một vài dịch vụ cung cấp bởi ruby-lang.org đã bị ngưng do
một số sự cố với server của ruby-lang.org.

Một số ảnh hưởng:

 * Toàn bộ mailing lists bởi ruby-lang.org ngưng hoạt động.
 * Các gói tarball của Ruby do ftp.ruby-lang.org phân phối đều không kết nối.
 * Nếu bạn tìm cache của DNS cũ, bạn sẽ không kết nối www.ruby-lang.org.

Chúng tôi đang khắc phục sự cố trên trong thời điểm này.

## Cập nhật (9:33 UTC)

Lí do sự cố là do lỗi phần cứng.

Chúng tôi đã khắc phục các sự cố sau:

 * Toàn bộ mailing list đã được phục hồi nhưng vẫn còn một số sự cố. Chúng
 tôi vẫn đang tiếp tục khắc phục.
 * ftp.ruby-lang.org đã hoạt động lại thông qua http và ftp.

Nếu bạn tìm ra được các vấn đề khác, xin báo cho chúng tôi biết (bằng tiếng Anh) qua https://github.com/ruby/www.ruby-lang.org/issues.

## Cập nhật (13:18 UTC)

Chúng tôi ngưng ftp.ruby-lang.org qua http và ftp vì một số gói cũ của Ruby
đã bị hư hỏng. MD5 không còn đúng như chúng tôi nghĩ.

Chúng tôi vẫn đang tiếp tục điều tra và khắc phục. Thông tin chi tiết có
tại https://github.com/ruby/www.ruby-lang.org/issues/259.
