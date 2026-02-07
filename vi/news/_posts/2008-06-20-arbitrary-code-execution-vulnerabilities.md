---
layout: news_post
title: "Lỗ hổng thực thi mã tùy ý"
author: "Shugo Maeda"
lang: vi
---

Nhiều lỗ hổng trong Ruby có thể dẫn đến tình trạng từ chối dịch vụ
(DoS) hoặc cho phép thực thi mã tùy ý.

## Tác động

Với các lỗ hổng sau, kẻ tấn công có thể gây ra tình trạng từ chối dịch
vụ hoặc thực thi mã tùy ý.

* [CVE-2008-2662][1]
* [CVE-2008-2663][2]
* [CVE-2008-2725][3]
* [CVE-2008-2726][4]
* [CVE-2008-2664][5]

## Các phiên bản bị ảnh hưởng

1.8 series
: * 1\.8.4 và tất cả các phiên bản trước đó
  * 1\.8.5-p230 và tất cả các phiên bản trước đó
  * 1\.8.6-p229 và tất cả các phiên bản trước đó
  * 1\.8.7-p21 và tất cả các phiên bản trước đó

1.9 series
: * 1\.9.0-1 và tất cả các phiên bản trước đó

## Giải pháp

1.8 series
: Vui lòng nâng cấp lên 1.8.5-p231, hoặc 1.8.6-p230, hoặc 1.8.7-p22.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz&gt;][6]
    (md5sum: e900cf225d55414bffe878f00a85807c)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz&gt;][7]
    (md5sum: 5e8247e39be2dc3c1a755579c340857f)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz&gt;][8]
    (md5sum: fc3ede83a98f48d8cb6de2145f680ef2)

1.9 series
: Vui lòng nâng cấp lên 1.9.0-2.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz&gt;][9]
    (md5sum: 2a848b81ed1d6393b88eec8aa6173b75)

Các phiên bản này cũng sửa lỗ hổng của WEBrick
([CVE-2008-1891][10]).

Xin lưu ý rằng gói sửa lỗi này có thể đã có sẵn qua phần mềm quản lý
gói của bạn.

## Ghi nhận

Ghi nhận Drew Yao thuộc Apple Product Security đã tiết lộ vấn đề cho
Đội An ninh Ruby.

## Thay đổi

* 2008-06-21 00:29 +09:00 đã xóa các CVE ID sai (CVE-2008-2727,
  CVE-2008-2728).



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2662
[2]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2663
[3]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2725
[4]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2726
[5]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2664
[6]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz
[10]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1891
