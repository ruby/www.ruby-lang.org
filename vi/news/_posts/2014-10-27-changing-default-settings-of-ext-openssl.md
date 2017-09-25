---
layout: news_post
title: "Thay đổi thiết lập mặc định của ext/openssl"
author: "usa"
translator: "Thomas Tran"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: vi
---

Chúng tôi đã thay đổi thiết lập mặc định của ext/openssl trên các phiên bản Ruby 2.1.4, 2.0.0-p594 và 1.9.3-p550. Với thay đổi này, các tuỳ chọn SSL/TLS không bảo mật bị mặc định vô hiệu hoá. Tuy nhiên, thay đổi này có khả năng gây ra một số vấn đề với kết nối SSL.

## Chi tiết

OpenSSL vẫn thực thi các giao thức và mật mã được xem là không bảo mật vào ngày nay bởi các hoàn cảnh lịch sử.
Giống như là lỗ hổng bảo mật POODLE ([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)), nếu bạn tiếp tục sử dụng OpenSSL với các tính năng không bảo mật đó, bạn có thể không thể đảm bảo sự an toàn của giao tiếp mạng.
Vì vậy, dựa trên cuộc thảo luận ở [Bug #9424](https://bugs.ruby-lang.org/issues/9424), chúng tôi quyết định vô hiệu hoá các tuỳ chọn không bảo mật của SSL/TLS ở mặc định.
Nếu bạn cần phải bỏ qua thay đổi này (xem ở dưới), hãy áp dụng bản vá ngược để thu hồi.

2.1.4
: [r48098](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?revision=48098&view=revision)

2.0.0-p594
: [r48110](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?revision=48110&view=revision)

1.9.3-p550
: [r48121](https://svn.ruby-lang.org/cgi-bin/viewvc.cgi?revision=48121&view=revision)

Tuy nhiên, nếu bạn bỏ qua thay đổi này, có nguy cơ là bạn không đảm bảo được sự an toàn của giao tiếp mạng.
Bạn nên hiểu trước khi làm điều đó.

### Các gói thư viện của Ruby

Thay đổi này ảnh hưởng đến net/http, net/imap và net/pop.
Tuy nhiên WEBrick và Drb lại không bởi vì chúng nhận các thiết lập một cách độc lập.

### Các kịch bản sử dụng ext/openssl trực tiếp

Thay đổi này ảnh hưởng khi một đối tượng `OpenSSL::SSL::SSLContext` được khởi tạo và phương thức `set_params` được gọi.
Cụ thể, đoạn code như sau:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # if you want to change some options, such as cert store, verify mode and so on, you can pass such parameters within a hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

Khi sử dụng ext/openssl ở phía client, chúng tôi cho rằng có thể không có vấn đề gì với thay đổi này. Tuy nhiên, nếu bạn đang sử dụng ext/openssl ở phía server và áp dụng thay đổi này, một vài client cũ (IE6, trình duyệt trên các máy điện thoại đời cũ, vv...) có thể không thể kết nối đến server.

Bạn sẽ là người quyết định có cho phép thay đổi này hay không, hãy cân nhắc lựa chọn.

## Giải pháp khác

Néu bạn không thể nâng cấp Ruby nhưng bạn phải đương đầu các tuỳ chọn SSL/TSL không bảo mật, hãy áp dụng bản vá tạm sau:

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

## Các phiên bản bị ảnh hưởng của thay đổi này

* Ruby 1.9.3 patchlevel 550 và sau đó
* Ruby 2.0.0 patchlevel 594 và sau đó
* Ruby 2.1.4 và sau đó
* Trunk: revision 48097 và sau đó

## Lịch sử

* Được phát hành đầu tiên vào 2014-10-27 12:00:00 (UTC)
