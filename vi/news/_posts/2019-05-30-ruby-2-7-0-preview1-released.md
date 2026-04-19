---
layout: news_post
title: "Ruby 2.7.0-preview1 Đã Phát Hành"
author: "naruse"
translator:
date: 2019-05-30 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 2.7.0-preview1.

Một phiên bản preview được phát hành để thu thập phản hồi cho bản phát hành cuối cùng dự kiến vào tháng 12. Nó giới thiệu một số tính năng mới và cải thiện hiệu suất, đáng chú ý nhất là:

* Compaction GC
* Pattern Matching
* Cải thiện REPL

## Compaction GC

Bản phát hành này giới thiệu Compaction GC có khả năng chống phân mảnh vùng nhớ bị phân mảnh.

Một số chương trình Ruby đa luồng có thể gây ra phân mảnh bộ nhớ, dẫn đến sử dụng bộ nhớ cao và giảm tốc độ.

Phương thức `GC.compact` được giới thiệu để nén heap. Hàm này nén các đối tượng đang sống trong heap để ít trang nhớ hơn được sử dụng, và heap có thể thân thiện hơn với CoW. [#15626](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Thử nghiệm]

Pattern matching, tính năng được sử dụng rộng rãi trong các ngôn ngữ lập trình hàm, được giới thiệu như một tính năng thử nghiệm. [#14912](https://bugs.ruby-lang.org/issues/14912)
Nó có thể duyệt qua một đối tượng cho trước và gán giá trị của nó nếu khớp với một pattern.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

Để biết thêm chi tiết, vui lòng xem [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Cải thiện REPL

`irb`, môi trường tương tác đi kèm (REPL; Read-Eval-Print-Loop), giờ đây hỗ trợ chỉnh sửa đa dòng. Nó được hỗ trợ bởi `reline`, một triển khai thuần Ruby tương thích với `readline`.
Nó cũng cung cấp tích hợp rdoc. Trong `irb` bạn có thể hiển thị tài liệu tham khảo cho một class, module hoặc method cho trước.  [#14683](https://bugs.ruby-lang.org/issues/14683), [#14787](https://bugs.ruby-lang.org/issues/14787), [#14918](https://bugs.ruby-lang.org/issues/14918)
Ngoài ra, các dòng mã nguồn hiển thị tại `binding.irb` và kết quả inspect cho các đối tượng core-class giờ đây được tô màu.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Các tính năng mới đáng chú ý khác

* Toán tử tham chiếu phương thức, <code>.:</code>, được giới thiệu như một tính năng thử nghiệm.  [#12125]( https://bugs.ruby-lang.org/issues/12125), [#13581]( https://bugs.ruby-lang.org/issues/13581)

* Tham số được đánh số như tham số block mặc định được giới thiệu như một tính năng thử nghiệm.  [#4475](https://bugs.ruby-lang.org/issues/4475)

* Range không có điểm đầu được giới thiệu một cách thử nghiệm. Nó có thể không hữu ích
  bằng range không có điểm cuối, nhưng sẽ tốt cho mục đích DSL. [#14799](https://bugs.ruby-lang.org/issues/14799)

      ary[..3]  # identical to ary[0..3]
      rel.where(sales: ..100)

* `Enumerable#tally` được thêm vào. Nó đếm số lần xuất hiện của mỗi phần tử.

      ["a", "b", "c", "b"].tally
      #=> {"a"=>1, "b"=>2, "c"=>1}

## Cải thiện hiệu suất

* JIT [Thử nghiệm]

  * Mã JIT được biên dịch lại thành mã ít tối ưu hơn khi một giả định tối ưu hóa bị vô hiệu.

  * Method inlining được thực hiện khi một phương thức được coi là thuần túy. Tối ưu hóa này vẫn đang thử nghiệm và nhiều phương thức vẫn CHƯA được coi là thuần túy.

  * Giá trị mặc định của `--jit-min-calls` được thay đổi từ 5 sang 10.000

  * Giá trị mặc định của `--jit-max-cache` được thay đổi từ 1.000 sang 100

## Các thay đổi đáng chú ý khác kể từ 2.6

* `Proc.new` và `proc` không có block trong một phương thức được gọi với block giờ đây sẽ cảnh báo.

* `lambda` không có block trong một phương thức được gọi với block sẽ báo lỗi.

* Cập nhật phiên bản Unicode và Emoji từ 11.0.0 lên 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Cập nhật phiên bản Unicode lên 12.1.0, thêm hỗ trợ cho U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, và `Date.parse` tạm thời hỗ trợ niên hiệu Nhật Bản mới như một phần mở rộng không chính thức, cho đến khi JIS X 0301 mới được ban hành.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Yêu cầu trình biên dịch hỗ trợ C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Chi tiết về dialect của chúng tôi: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview1/NEWS) hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) để biết thêm chi tiết.

Với những thay đổi đó, [1727 tệp đã thay đổi, 76022 thêm(+), 60286 xóa(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview1) kể từ Ruby 2.6.0!

Hãy tận hưởng lập trình với Ruby 2.7!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.gz>

      SIZE:   16021286 bytes
      SHA1:   2fbecf42b03a9d4391b81de42caec7fa497747cf
      SHA256: c44500af4a4a0c78a0b4d891272523f28e21176cf9bc1cc108977c5f270eaec2
      SHA512: f731bc9002edd3a61a4955e4cc46a75b5ab687a19c7964f02d3b5b07423d2360d25d7be5df340e884ca9945e3954e68e5eb11b209b65b3a687c71a1abc24b91f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.zip>

      SIZE:   20283343 bytes
      SHA1:   7488346fa8e58203a38158752d03c8be6b1da65b
      SHA256: fdf25573e72e1769b51b8d541d0e1a894a5394dbfdf1b08215aa093079cca64c
      SHA512: b3b1f59dce94c242ef88a4e68381a4c3a6f90ba0af699083e5a1a00b0fb1dce580f057dad25571fe789ac9aa95aa6e9c071ebb330328dc822217ac9ea9fbeb3f

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.bz2>

      SIZE:   14038296 bytes
      SHA1:   f7e70cbc2604c53a9e818a2fc59cd0e2d6c859fa
      SHA256: d45b4a1712ec5c03a35e85e33bcb57c7426b856d35e4f04f7975ae3944d09952
      SHA512: a36b241fc1eccba121bb7c2cc5675b11609e0153e25a3a8961b67270c05414b1aa669ce5d4a5ebe4c6b2328ea2b8f8635fbba046b70de103320b3fdcb3d51248

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview1.tar.xz>

      SIZE:   11442988 bytes
      SHA1:   45e467debc194847a9e3afefb20b11e6dc28ea31
      SHA256: 8c546df3345398b3edc9d0ab097846f033783d33762889fd0f3dc8bb465c3354
      SHA512: d416e90bfa3e49cc0675c4c13243c8ec319b7a0836add1bd16bd7662d09eaf46656d26e772ef3b097e10779896e643edd8a6e4f885147e3235257736adfdf3b5

## Ruby là gì

Ruby được phát triển lần đầu bởi Matz (Yukihiro Matsumoto) vào năm 1993, và hiện được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.
