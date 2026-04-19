---
layout: news_post
title: "Phát hành Ruby 2.0.0-p0"
author: "Yusuke Endoh"
date: 2013-02-24 09:06:22 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.0.0-p0.

Ruby 2.0.0 là bản phát hành ổn định đầu tiên của dòng Ruby 2.0, với nhiều
tính năng mới và cải tiến để đáp ứng nhu cầu ngày càng đa dạng và mở rộng
cho Ruby.

Hãy tận hưởng lập trình với Ruby 2.0.0!

## Tải về

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2&gt;][1]

      SIZE:   10814890 bytes
      MD5:    895c1c581f8d28e8b3bb02472b2ccf6a
      SHA256: c680d392ccc4901c32067576f5b474ee186def2fcd3fcbfa485739168093295f

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz&gt;][2]

      SIZE:   13608925 bytes
      MD5:    50d307c4dc9297ae59952527be4e755d
      SHA256: aff85ba5ceb70303cb7fb616f5db8b95ec47a8820116198d1c866cc4fff151ed

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip&gt;][3]

      SIZE:   15037340 bytes
      MD5:    db5af5d6034646ad194cbdf6e50f49ee
      SHA256: 0d0af6a9c8788537efd8d7d2358ce9468e6e2b7703dacba9ebd064d8b7da5f99

## Ruby 2.0.0 là gì

### Tính năng mới

Một số điểm nổi bật:

* Tính năng cốt lõi của ngôn ngữ
  * Keyword arguments, mang lại sự linh hoạt cho thiết kế API
  * Module#prepend, một cách mới để mở rộng class
  * Literal %i, tạo mảng symbol một cách dễ dàng
  * \_\_dir\_\_, trả về tên thư mục của file đang được thực thi
  * Encoding mặc định UTF-8, giúp bỏ qua nhiều magic comment

* Thư viện tích hợp
  * Enumerable#lazy và Enumerator::Lazy, cho luồng lazy (có thể vô hạn)
  * Enumerator#size và Range#size, cho việc đánh giá kích thước lazy
  * \#to\_h, quy ước mới cho việc chuyển đổi sang Hash
  * Onigmo, regexp engine mới (một fork của Oniguruma)
  * API xử lý ngoại lệ bất đồng bộ

* Hỗ trợ debug
  * Hỗ trợ DTrace, cho phép chẩn đoán runtime trong môi trường production
  * TracePoint, API tracing được cải thiện

* Cải thiện hiệu suất
  * Tối ưu GC bằng bitmap marking
  * Tối ưu Kernel#require giúp Rails khởi động rất nhanh
  * Tối ưu VM như method dispatch
  * Tối ưu phép toán Float

Ngoài ra, dù là tính năng thử nghiệm, 2.0.0 bao gồm Refinements, thêm một
khái niệm mới vào tính module hóa của Ruby.

Xem thêm NEWS để biết nhiều tính năng, cải tiến và chi tiết hơn.

### Tính tương thích

Chúng tôi cũng đã chú ý đến thiết kế 2.0.0 để nó tương thích với 1.9. Việc
di chuyển từ 1.9 sang 2.0 sẽ dễ dàng hơn so với từ 1.8 sang 1.9. (Các điểm
không tương thích đáng chú ý được mô tả sau.)

Thực tế, nhờ sự nỗ lực của các bên thứ ba, một số ứng dụng phổ biến như Rails
và tDiary đã được báo cáo hoạt động trên phiên bản release candidate của
2.0.0.

### Tài liệu

Chúng tôi cũng đã cải thiện tài liệu, điều mà nhiều rubyist đã yêu cầu.
Chúng tôi đã thêm một lượng lớn rdoc cho các module và phương thức. 2.0.0 sẽ
được tài liệu hóa khoảng 75% trong khi 1.9.3 chỉ khoảng 60%. Ngoài ra, chúng
tôi đã thêm mô tả về cú pháp Ruby. Bạn có thể xem:

{% highlight sh %}
ri ruby:syntax
{% endhighlight %}

### Tính ổn định

Lưu ý rằng không giống 1.9.0, 2.0.0 LÀ một bản phát hành ổn định, mặc dù
số TEENY là 0. Tất cả tác giả thư viện được khuyến nghị mạnh mẽ hỗ trợ
2.0.0. Như đã nói ở trên, việc di chuyển từ 1.9 sang 2.0 sẽ tương đối dễ
dàng.

Ruby 2.0.0 đã sẵn sàng cho sử dụng thực tế, và chắc chắn sẽ cải thiện cuộc
sống Ruby của bạn.

## Ghi chú

### Bài giới thiệu

Dưới đây là một số bài giới thiệu về tính năng 2.0.0 từ bên thứ ba:

* [&lt;URL:http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example&gt;][4]
  (toàn diện, khuyến nghị)
* [&lt;URL:https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0&gt;][5]
  (toàn diện, khuyến nghị)
* [&lt;URL:http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html&gt;][6]
  (ngắn gọn, tiếng Nhật)
* [&lt;URL:https://speakerdeck.com/nagachika/rubyist-enumeratorlazy&gt;][7]
  (chỉ Enumerator::Lazy, tiếng Nhật)

Các bài viết sau cũng hữu ích, nhưng đã lỗi thời liên quan đến refinement:

* [&lt;URL:http://rubysource.com/a-look-at-ruby-2-0/&gt;][8]
* [&lt;URL:https://speakerdeck.com/a\_matsuda/ruby-2-dot-0-on-rails&gt;][9]
* [&lt;URL:http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/&gt;][10]
* [&lt;URL:http://www.infoq.com/news/2012/11/ruby-20-preview1&gt;][11]

Ngoài ra, số mới nhất của \"Rubyist Magazine\" bao gồm một số bài viết được
viết bởi chính các tác giả tính năng để giới thiệu một số tính năng mới của
2.0.0.

* [&lt;URL:http://jp.rubyist.net/magazine/?0041-200Special&gt;][12]

Mặc dù chúng được viết bằng tiếng Nhật, bản dịch tiếng Anh được lên kế
hoạch trong tương lai.

### Không tương thích

Có năm điểm không tương thích đáng chú ý mà chúng tôi biết:

* Encoding mặc định cho các script ruby giờ là UTF-8 \[#6679\]. Một số người
  báo cáo rằng điều này ảnh hưởng đến các chương trình hiện có, chẳng hạn
  như một số chương trình benchmark trở nên rất chậm \[ruby-dev:46547\].
* Iconv đã bị loại bỏ, trước đó đã bị deprecated khi M17N được giới thiệu
  trong ruby 1.9. Sử dụng String#encode, v.v. thay thế.
* Có sự thay đổi ABI \[ruby-core:48984\]. Chúng tôi nghĩ rằng người dùng
  bình thường có thể/nên cài đặt lại các thư viện mở rộng. Bạn nên lưu ý:
  KHÔNG SAO CHÉP CÁC FILE .so HOẶC .bundle TỪ 1.9.
* \#lines, #chars, #codepoints, #bytes giờ trả về Array thay vì Enumerator
  \[#6670\]. Thay đổi này cho phép bạn tránh cách dùng phổ biến
  \"lines.to\_a\". Sử dụng #each\_line, v.v. để lấy Enumerator.
* Object#inspect luôn trả về chuỗi dạng
  #&lt;ClassName:0x...&gt; thay vì ủy thác cho #to\_s. \[#2152\]

Có một số điểm không tương thích nhỏ hơn.
\[ruby-core:49119\]

### Trạng thái của Refinements

Chúng tôi đã thêm tính năng gọi là Refinements, thêm một khái niệm mới vào
tính module hóa của Ruby. Tuy nhiên, xin lưu ý rằng Refinements vẫn là tính
năng thử nghiệm: chúng tôi có thể thay đổi đặc tả trong tương lai. Mặc dù
vậy, chúng tôi muốn bạn thử nghiệm và cho chúng tôi ý kiến. Phản hồi của
bạn sẽ giúp hoàn thiện tính năng thú vị này.

## Lời cảm ơn

Rất nhiều người đã đóng góp cho 2.0.0. Ngay cả một lời cảm ơn không đầy đủ
chỉ cho một vài phần đóng góp cũng đã quá lớn để chèn vào đây. Xin lỗi
nhưng hãy cho phép tôi thêm liên kết đến trang cảm ơn đặc biệt.

* [&lt;URL:https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks&gt;][13]

Cảm ơn tất cả mọi người!



[1]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p0.zip
[4]: http://blog.marc-andre.ca/2013/02/23/ruby-2-by-example
[5]: https://speakerdeck.com/shyouhei/whats-new-in-ruby-2-dot-0
[6]: http://el.jibun.atmarkit.co.jp/rails/2012/11/ruby-20-8256.html
[7]: https://speakerdeck.com/nagachika/rubyist-enumeratorlazy
[8]: http://rubysource.com/a-look-at-ruby-2-0/
[9]: https://speakerdeck.com/a_matsuda/ruby-2-dot-0-on-rails
[10]: http://globaldev.co.uk/2012/11/ruby-2-0-0-preview-features/
[11]: http://www.infoq.com/news/2012/11/ruby-20-preview1
[12]: http://jp.rubyist.net/magazine/?0041-200Special
[13]: https://bugs.ruby-lang.org/projects/ruby/wiki/200SpecialThanks
