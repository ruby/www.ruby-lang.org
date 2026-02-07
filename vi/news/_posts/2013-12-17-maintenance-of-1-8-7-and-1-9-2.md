---
layout: news_post
title: "Gia hạn bảo trì bảo mật cho Ruby 1.8.7 và 1.9.2"
author: "zzak"
translator:
date: 2013-12-17 20:49:03 +0000
lang: vi
---

Có hiệu lực ngay lập tức, 1.8.7 và 1.9.2 sẽ được hỗ trợ các bản vá bảo mật
cho đến tháng 6 năm 2014.

* Terence Lee ([@hone02](https://twitter.com/hone02))
  và Zachary Scott ([@_zzak](https://twitter.com/_zzak))
  sẽ đảm nhận vai trò bảo trì.
* Sau giai đoạn bảo trì 6 tháng, chúng tôi có thể thêm các committer khác để
  gia hạn thêm 6 tháng nữa.

Việc gia hạn bảo trì này được thực hiện nhờ [Heroku][heroku],
xem bài viết trên blog của họ [A Patch in Time: Securing Ruby][securing-ruby]
để biết thêm thông tin.

### Báo cáo vấn đề

Trong giai đoạn bảo trì mở rộng này, chúng tôi sẽ _chỉ_ áp dụng các bản vá
bảo mật vào kho mã nguồn cho [1.8.7][source-187] và [1.9.2][source-192].

Chúng tôi rất coi trọng vấn đề bảo mật, nếu bạn phát hiện lỗ hổng, vui lòng
báo cáo ngay tới security@ruby-lang.org. Danh sách gửi thư này là riêng tư và
các vấn đề được báo cáo sẽ được công bố sau khi bản vá được phát hành.

Vui lòng xem [ruby-lang.org/en/security][security-en] để biết thêm thông tin.

### Về việc quản lý phát hành

Như đã đề cập ở trên, chúng tôi sẽ chỉ áp dụng các bản vá bảo mật và
tăng số patch level.

Chúng tôi sẽ không phát hành phiên bản vá của 1.8.7 hoặc 1.9.2 lên ruby-lang.org.
Tuy nhiên, bạn có thể tự do đóng gói lại binary từ mã nguồn.

Lý do là chúng tôi không muốn có thêm ticket mới, vì một bản phát hành chính thức
sẽ dẫn đến trách nhiệm tiếp tục bảo trì của ruby-core. Nguồn lực đội ngũ của
chúng tôi đã hạn chế, và chúng tôi muốn khuyến khích nâng cấp thay vì hỗ trợ
các phiên bản lỗi thời.

### Tại sao khôi phục 1.8.7?

Bạn có thể nhớ một thông báo khoảng 6 tháng trước về việc
[kết thúc vòng đời 1.8.7][sunset-187-en].

Mặc dù ruby-core sẽ không tiếp tục bảo trì 1.8.7 hoặc 1.9.2, Terence
và Zachary sẽ hỗ trợ các phiên bản này về mặt bảo mật như một phần của
chương trình tài trợ doanh nghiệp.

Trước đây, chúng tôi đã hỗ trợ các nhà cung cấp muốn bảo trì các phiên bản
cũ. Năm 2009, việc bảo trì Ruby 1.8.6 đã được chuyển giao cho Engine Yard
khi họ phát hành 1.8.6-p369.

### Lời khuyến khích

Chúng tôi muốn nhân cơ hội này khuyến khích bạn nâng cấp lên phiên bản Ruby
được hỗ trợ càng sớm càng tốt. Nhiều thành viên ruby-core đã dành vô số giờ
để cải thiện hiệu suất và tính năng của Ruby trong phiên bản 2.0+ và chúng tôi
mong bạn tận dụng điều đó.

Cảm ơn sự hỗ trợ liên tục của bạn và hãy cùng nhau làm Ruby tốt hơn!


[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-en]:   https://www.ruby-lang.org/en/security/
[sunset-187-en]: https://www.ruby-lang.org/en/news/2013/06/30/we-retire-1-8-7/
