---
layout: news_post
title: "Thay đổi cài đặt mặc định của ext/openssl"
author: "usa"
translator:
date: 2014-10-27 12:00:00 +0000
tags: security
lang: vi
---

Chúng tôi đã thay đổi cài đặt mặc định của ext/openssl trong Ruby 2.1.4, Ruby 2.0.0-p594 và Ruby 1.9.3-p550.
Với thay đổi này, các tùy chọn SSL/TLS không an toàn giờ đã bị tắt theo mặc định.
Tuy nhiên, với thay đổi này, có khả năng xảy ra một số vấn đề trong kết nối SSL.

## Chi tiết

OpenSSL vẫn triển khai các giao thức và cipher được coi là không an toàn ngày nay vì các lý do lịch sử.
Giống như lỗ hổng POODLE ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)), nếu bạn tiếp tục sử dụng OpenSSL với các tính năng không an toàn như vậy, bạn có thể không đảm bảo được an toàn của truyền thông mạng.
Vì vậy, dựa trên cuộc thảo luận trong [Bug #9424](https://bugs.ruby-lang.org/issues/9424), chúng tôi đã quyết định tắt các tùy chọn SSL/TLS không an toàn theo mặc định.
Nếu bạn cần hủy thay đổi này (hiển thị bên dưới), hãy áp dụng bản vá ngược để hoàn nguyên.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

Tuy nhiên, nếu bạn hủy thay đổi này, có rủi ro không đảm bảo được an toàn truyền thông mạng.
Bạn nên hiểu các hệ quả của thay đổi này trước khi loại bỏ nó.

### Thư viện đi kèm của Ruby

Thay đổi này được phản ánh trong net/http, net/imap và net/pop.
Vì DRb và WEBrick nhận cài đặt riêng, thay đổi này không ảnh hưởng đến chúng.

### Script sử dụng ext/openssl trực tiếp

Thay đổi này được phản ánh khi đối tượng `OpenSSL::SSL::SSLContext` được khởi tạo và phương thức instance `set_params` được gọi.

Cụ thể, mã như sau:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # if you want to change some options, such as cert store, verify mode and so on, you can pass such parameters within a hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

Khi sử dụng ext/openssl ở phía client, chúng tôi cho rằng có thể không có vấn đề gì với thay đổi này.
Tuy nhiên, nếu bạn sử dụng ext/openssl ở phía server và phản ánh thay đổi này, một số client cũ (Internet Explorer 6 trên Windows XP, trình duyệt trong điện thoại di động cũ, v.v.) có thể không kết nối được với server.

Việc bật thay đổi này hay không là quyết định của bạn, hãy cân nhắc các đánh đổi.

## Giải pháp tạm thời

Nếu bạn không thể cập nhật Ruby nhưng phải đối phó với các tùy chọn SSL/TLS không an toàn, hãy áp dụng monkey-patch sau:

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## Các phiên bản bị ảnh hưởng bởi thay đổi này

* Ruby 1.9.3 patchlevel 550 trở lên
* Ruby 2.0.0 patchlevel 594 trở lên
* Ruby 2.1.4 trở lên
* revision 48097 trở lên của trunk

## Lịch sử

* Công bố lần đầu vào 2014-10-27 12:00:00 (UTC)
