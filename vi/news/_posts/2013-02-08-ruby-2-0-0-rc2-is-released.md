---
layout: news_post
title: "Phát hành Ruby 2.0.0-rc2"
author: "Yusuke Endoh"
date: 2013-02-08 14:34:17 +0000
lang: vi
---

Ruby 2.0.0-rc2 đã được phát hành. Đây sẽ là bản release candidate cuối
cùng của Ruby 2.0.0.

Vui lòng dùng thử, và báo cáo bất kỳ vấn đề nào nếu bạn phát hiện.

## Địa chỉ tải về

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2&gt;][1]

      SIZE:   10822239 bytes
      MD5:    e92420131bd7994513e0bf09a3e2a19b
      SHA256: d55f897bb04283c5fa80223d96d990fe8ecb598508dd59443b356cbba1f66145

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz&gt;][2]

      SIZE:   13616756 bytes
      MD5:    9d5e6f26db7c8c3ddefc81fdb19bd41a
      SHA256: 87072ab3e6d393d47f7402682364e4f24efe1c518969795cc01fcdeeb0e646f3

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip&gt;][3]

      SIZE:   15118480 bytes
      MD5:    1a2d33f1c50e32ca1532f8dea4790d53
      SHA256: c28e9baf3aa00b41b8823c16df436ae143e8a63e43e7a53302f23119e13d0ebf

## Tính năng mới trong 2.0.0

* Keyword arguments
* Enumerable#lazy
* Module#prepend
* \#to\_h: Quy ước cho việc chuyển đổi sang Hash
* %i: literal cho mảng symbol
* Cập nhật regexp engine: Onigmo (một fork của Oniguruma)
* Giới thiệu Enumerator#size và Range#size
* Hỗ trợ DTrace
* TracePoint
* Tối ưu hóa hiệu suất require (đặc biệt, trên Windows)
* Hỗ trợ NativeClient
* Cải thiện tài liệu
* Cải thiện xử lý ngắt bất đồng bộ
* Các tham số điều chỉnh kích thước stack khi khởi động
* Refinements \[thử nghiệm\]

... và nhiều cải tiến khác. Xem NEWS để biết chi tiết.

Dưới đây là một số bài giới thiệu từ bên thứ ba:

* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][4]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][5]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][6]
* [&lt;URL:http://timelessrepo.com/refinements-in-ruby&gt;][7]
  (Refinements)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][8]
  (tiếng Nhật)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][9]
  (Enumerator::Lazy, tiếng Nhật)

(Nếu bạn tình nguyện cung cấp thêm bài viết, chúng tôi có thể trích dẫn hoặc
tham chiếu chúng trong thông báo phát hành tiếp theo.)

## Ghi chú

### Không tương thích

Có ba điểm không tương thích đáng chú ý mà chúng tôi biết:

* Encoding mặc định cho các script ruby giờ là UTF-8 [\[#6679\]][10].
  Một số người báo cáo rằng điều này ảnh hưởng đến các chương trình hiện có,
  chẳng hạn như một số chương trình benchmark trở nên rất chậm
  [\[ruby-dev:46547\]][11]. Spec có thể thay đổi cho bản phát hành chính thức.
* iconv đã bị loại bỏ, trước đó đã bị deprecated khi M17N được giới thiệu
  trong ruby 1.9. Sử dụng String#encode, v.v. thay thế.
* Có sự thay đổi ABI [\[ruby-core:48984\]][12]. Chúng tôi nghĩ rằng người
  dùng bình thường có thể/nên cài đặt lại các thư viện mở rộng. Bạn nên lưu
  ý: \"KHÔNG SAO CHÉP CÁC FILE .so HOẶC .bundle TỪ 1.9\".

Có một số điểm không tương thích nhỏ hơn.
[\[ruby-core:49119\]][13] Vui lòng báo cáo bất kỳ điểm không tương thích nào
khác mà bạn phát hiện.

Tham khảo: Chúng tôi đang tạo ghi chú nâng cấp, nhưng một số phần đã lỗi thời.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft&gt;][14]

### Trạng thái của Refinements

2\.0.0 sẽ bao gồm refinements như một \"tính năng thử nghiệm\" vì chúng tôi
không thể thống nhất về spec chi tiết của nó. Lưu ý rằng hành vi có thể thay
đổi trong các phiên bản Ruby tương lai.

### Lời cảm ơn đặc biệt

Tôi đánh giá cao tất cả những người đã thử các bản preview và rc1! Tôi biết
ơn sự chăm chỉ của tất cả những người đóng góp trong việc sửa nhiều lỗi. Tôi
thực sự cảm ơn tất cả những người đã giúp tôi thực hiện bản phát hành này.



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-rc2.zip
[4]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[5]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[6]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[7]: http://timelessrepo.com/refinements-in-ruby
[8]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[9]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[10]: https://bugs.ruby-lang.org/issues/6679
[11]: https://blade.ruby-lang.org/ruby-dev/46547
[12]: https://blade.ruby-lang.org/ruby-core/48984
[13]: https://blade.ruby-lang.org/ruby-core/49119
[14]: https://bugs.ruby-lang.org/projects/ruby/wiki/200UpgradeNotesDraft
