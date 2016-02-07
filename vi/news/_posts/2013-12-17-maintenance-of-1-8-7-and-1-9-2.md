---
layout: news_post
title: "Gia hạn bảo trì vá bảo mật cho Ruby 1.8.7 và 1.9.2"
author: "zzak"
translator: "Trung Lê"
date: 2013-12-17 20:49:03 +0000
lang: vi
---

Có hiệu lực ngay bây giờ, 1.8.7 và 1.9.2 sẽ được tiếp tục hỗ trợ các vá
bảo mật cho đến tháng 6, 2014.

* Terence Lee ([@hone02](https://twitter.com/hone02))
  và Zachary Scott ([@_zzak](https://twitter.com/_zzak))
  sẽ tiếp nhận vai trò bảo trì.
* Sau giai đoạn 6 tháng bảo trì, chúng tôi có thể thêm vào
  các thành viên cho 6 tháng tiếp theo.

Làm được gia hạn này là do sự giúp đỡ bởi [Heroku][heroku],
xem trên blog của họ [A Patch in Time: Securing Ruby][securing-ruby]
để biết thêm chi tiết.

### Thông báo các vấn đề

Trong giai đoạn gia hạn này, chúng tôi sẽ _chỉ_ áp các vá bảo mật vào mã
cho [1.8.7][source-187] và [1.9.2][source-192].

Chúng tôi coi bảo mật là một vấn đề hệ trọng, nếu bạn tìm thấy lỗ hổng
xin hãy báo cho chúng tôi qua security@ruby-lang.org.
Mailing list này riêng tư và các vấn đề thông báo sẽ được công bố
sau khi vá được phát hành.

Xin xem [ruby-lang.org/en/security][security-en] để biết thêm chi tiết.

### Về quản lý phát hành

Như tôi đã đề cập ở trên, chúng tôi sẽ chỉ áp dụng các vá bảo mật và
tăng cấp vá (patch level).

Chúng tôi sẽ không phát hành các bản được vá của 1.8.7 hoặc 1.9.2 trên ruby-lang.org.
Nhưng bạn có thể tùy thích đóng gói lại từ nguồn.

Lí do là vì chúng tôi không muốn tiếp nhận thêm các vé mới, bởi vì các ấn
bản chính sẽ tăng trách nhiệm của ruby-core trong việc theo dõi và bảo trì.
Nhóm của chúng tối hiện không đủ nguồn lực, nên chúng tôi khuyến khích nâng
cấp hơn là hỗ trợ các bản lỗi thời.

### Tại sao lài hồi sinh 1.8.7?

Bạn có thể nhớ công bố 6 tháng trước của bài [xế chiều 1.8.7][sunset-187-en].

Trong khi ruby-core sẽ không tiếp tục bảo trì 1.8.7 hay 1.9.2, Terence
và Zachary sẽ hỗ trợ các phiên bản vá lỗi như là một phần tài trợ công ty.

Trong quá khứ chúng tôi đã hỗ trợ các nhà cung cấp muốn bảo toàn các phiên
bản lỗi thời. Trong năm 2009, bao trì của Ruby 1.8.6 được chuyển giao cho
Engine Yard khi họ phát hành 1.8.6-p369.

### Lời ngỏ khuyến khích

Chúng tôi muốn nhân cơ hội này khuyến khích bạn nâng cấp lên các phiên
bản được hỗ trợ càng sớm càng tốt. Nhiều thành viên ruby-core đã bỏ ra
nhiều giờ để cải thiện tốc độ và chức năng của Ruby trong 2.0+ và chúng
tôi mong các bạn tận dụng nó.

Cảm bạn đã tiếp tục ủng hộ và hãy cùng làm cho Ruby tốt hơn!


[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-en]:   https://www.ruby-lang.org/en/security/
[sunset-187-en]: https://www.ruby-lang.org/en/news/2013/06/30/we-retire-1-8-7/
