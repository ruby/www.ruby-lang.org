---
layout: news_post
title:  "Sự cố dịch vụ của ruby-lang.org"
author: "hsbt"
translator: "antipop"
date:   2013-08-06 04:00:00 +0000
lang:   vi
---

Một số dịch vụ do ruby-lang.org cung cấp đã bị dừng, vì các máy chủ của
ruby-lang.org hiện đang ngừng hoạt động.

Ảnh hưởng như sau:

 * Tất cả mailing list do ruby-lang.org cung cấp đều ngừng hoạt động.
 * Các gói tar của Ruby phân phối qua ftp.ruby-lang.org không thể truy cập.
 * Nếu bạn tra cứu DNS cache cũ, bạn không thể truy cập www.ruby-lang.org.

Chúng tôi đang sửa chữa các dịch vụ này.

## Cập nhật (2013-08-06 9:33 UTC)

Nguyên nhân của các vấn đề hôm nay là lỗi phần cứng.
Chúng tôi đã sửa chữa các vấn đề sau:

 * Tất cả mailing list đã hoạt động trở lại, nhưng chúng tôi vẫn còn một số vấn đề. Chúng tôi đang sửa chữa.
 * ftp.ruby-lang.org đã có thể truy cập lại qua http và ftp.

Nếu bạn phát hiện vấn đề khác, vui lòng báo cáo tại
https://github.com/ruby/www.ruby-lang.org/issues.

## Cập nhật (2013-08-06 13:18 UTC)

Chúng tôi đã dừng ftp.ruby-lang.org qua http và ftp, vì một số gói Ruby cũ bị hỏng. MD5 không khớp như mong đợi.

Chúng tôi đang điều tra. Thông tin chi tiết có thể được tìm thấy trong issue sau.
https://github.com/ruby/www.ruby-lang.org/issues/259

## Cập nhật (2013-08-07 05:08 UTC)

Chúng tôi đã xác nhận rằng các gói sau bị hỏng. Chúng tôi đã khôi phục các gói này từ http://mirrorservice.org/sites/ftp.ruby-lang.org/pub/ruby/.

<pre>
ruby-1.9.3-p426.tar.bz2
ruby-1.9.3-p426.tar.gz
ruby-1.9.3-p426.zip
ruby-1.9.3-p429.tar.bz2
ruby-1.9.3-p429.tar.gz
ruby-1.9.3-p429.zip
ruby-2.0.0-p0.tar.bz2
ruby-2.0.0-p0.tar.gz
ruby-2.0.0-p0.zip
ruby-2.0.0-p195.tar.bz2
ruby-2.0.0-p195.tar.gz
ruby-2.0.0-p195.zip
</pre>

Chúng tôi đã kiểm tra rằng checksum MD5 của các file này giống với trong các thông báo phát hành. ftp.ruby-lang.org qua http và ftp đã hoạt động trở lại.

## Cập nhật (2013-08-09 10:30 UTC)

Một số dịch vụ của chúng tôi đã hoạt động trở lại, sau khi bị tạm ngừng từ ngày 6 tháng 8 năm 2013 do sự cố máy chủ chúng tôi đã báo cáo trước đó:

  * Mailing list: Chúng tôi đã thay đổi phần mềm cung cấp dịch vụ từ FML sang Mailman.
    * Chi tiết, vui lòng kiểm tra tại http://lists.ruby-lang.org.
  * Phân phối gói: Bạn có thể tải các gói chúng tôi cung cấp từ ftp.ruby-lang.org qua cả http và ftp.
  * Gói snapshot: Chúng tôi đã khởi động lại việc build và đóng gói snapshot hàng ngày.

Nếu bạn phát hiện bất kỳ vấn đề nào với dịch vụ của chúng tôi, vui lòng thông báo tại https://github.com/ruby/www.ruby-lang.org/issues.
