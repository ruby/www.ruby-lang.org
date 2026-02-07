---
layout: news_post
title: "Datadog cung cấp hỗ trợ cộng đồng OSS cho ruby-lang.org"
author: "hsbt"
translator:
date: 2024-05-30 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo rằng trang web chính thức của Ruby, ruby-lang.org, đã áp dụng Datadog để giám sát thông qua [chương trình hỗ trợ cộng đồng OSS của Datadog](https://opensource.datadoghq.com/projects/oss-program/).

Điều này cho phép chúng tôi giám sát hiệu quả hiệu suất và tính khả dụng của trang web theo thời gian thực cho người dùng Ruby. Các lợi ích chính khi sử dụng Datadog bao gồm:

## Khả năng quan sát CDN

cache.ruby-lang.org được cung cấp bởi Fastly là hạ tầng quan trọng nhất của hệ sinh thái Ruby. Datadog cho phép giám sát hiệu suất Mạng Phân phối Nội dung (CDN). Nó theo dõi tỷ lệ cache, tỷ lệ lỗi, nâng cao trải nghiệm người dùng.

## Trực quan hóa dữ liệu thống nhất

Chúng tôi có nhiều dịch vụ web cho ruby-lang.org. Datadog cho phép trực quan hóa dữ liệu phân tích log cùng với các số liệu và dữ liệu giám sát hiệu suất ứng dụng (APM) trong cùng các bảng điều khiển.

## Khả năng quan sát JIT Trace

Bằng cách sử dụng khả năng tracing của Datadog, chúng tôi có thể nắm bắt các trace khi yêu cầu đi qua máy chủ web và cơ sở dữ liệu. Điều này giúp xác định các điểm nghẽn và các yêu cầu có vấn đề.

Chúng tôi đã công bố [bảng điều khiển công khai](https://p.ap1.datadoghq.com/sb/1271b83e-af90-11ee-9072-da7ad0900009-01633a8fa8c0b0c0051f1889afdf55dc) về các số liệu quan trọng của chúng tôi. Chúng tôi sẽ cập nhật bảng điều khiển khi tiếp tục cải thiện giám sát, đặc biệt là hiệu suất YJIT.

Chúng tôi hy vọng rằng việc áp dụng Datadog sẽ góp phần cải thiện hiệu suất trang web cho cộng đồng Ruby. Hãy tiếp tục sử dụng ruby-lang.org và tận hưởng trải nghiệm người dùng được nâng cao.
