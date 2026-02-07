---
layout: news_post
title: "Bản vá bảo mật cho module Ruby OpenSSL: Cho phép \"0/n splitting\" như biện pháp phòng chống tấn công TLS BEAST."
author: "Urabe Shyouhei"
lang: vi
---

Trong OpenSSL, tùy chọn `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS` cho kết nối SSL được sử dụng để ngăn chặn lỗ hổng TLS-CBC-IV được mô tả tại
[\[1\]][1]. Đây là vấn đề đã biết của TLSv1/SSLv3 nhưng gần đây nó thu hút nhiều sự chú ý với tấn công BEAST [\[2\]][2] (CVE-2011-3389). Các chủ đề liên quan đến Ruby có trên trình theo dõi lỗi của chúng tôi [\[3\]][3].

Cho đến nay, phần mở rộng Ruby OpenSSL sử dụng tùy chọn `SSL_OP_ALL`, tùy chọn kết hợp của OpenSSL cho các bản vá lỗi khác nhau vốn không gây hại, cho tất cả các kết nối SSL theo mặc định. Và nó chỉ cho phép người dùng thêm các tùy chọn khác nên bạn không thể loại bỏ tính năng đã có trong tùy chọn `SSL_OP_ALL`, như `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`. Điều này là có chủ đích vì nó không công khai các hằng số như `SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS`, nhưng chúng tôi nên cho phép bỏ thiết lập tùy chọn để phần mở rộng Ruby OpenSSL chèn các đoạn trống vào đầu các kết nối SSL (gọi là "0/n splitting") để phòng chống tấn công TLS BEAST.

[Bản phát hành này][4] định nghĩa thêm các hằng số và cho phép người dùng bỏ thiết lập các tùy chọn trong `SSL_OP_ALL`. Tùy chọn mặc định vẫn là `SSL_OP_ALL` nhưng bạn có thể thiết lập SSLSocket với "0/n splitting" để phòng chống BEAST như sau.

    ctx = SSLContext.new
    ctx.options = OP_ALL & ~OP_DONT_INSERT_EMPTY_FRAGMENTS
    ctx.verify_mode = OpenSSL::SSL::VERIFY_PEER
    SSLSocket.new(socket, ctx)

Cảm ơn Apple đã báo cáo vấn đề này.

LƯU Ý: Một số điểm cuối SSL được biết là có lỗi không thể xử lý "0/n splitting" đúng cách nên chúng tôi (và OpenSSL) không đặt đây là tùy chọn mặc định. Vui lòng kiểm tra kết nối SSL trước khi bật tính năng này trong môi trường sản xuất. Nếu điểm cuối mà bạn đang kết nối không thể xử lý "0/n splitting", bạn phải sử dụng giải pháp thay thế khác để phòng chống tấn công TLS BEAST, như bắt buộc sử dụng bộ mã hóa RC4. Để biết chi tiết, vui lòng tìm các thảo luận và tài nguyên liên quan đến CVE-2011-3389.



[1]: http://www.openssl.org/~bodo/tls-cbc.txt
[2]: https://www.cve.org/CVERecord?id=CVE-2011-3389
[3]: https://bugs.ruby-lang.org/5353
[4]: http://mla.n-z.jp/?ruby-talk=393484
