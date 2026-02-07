---
layout: news_post
title: "Ruby 2.7.0-preview2 đã được phát hành"
author: "naruse"
translator:
date: 2019-10-22 12:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phiên bản Ruby 2.7.0-preview2 đã được phát hành.

Phiên bản preview được phát hành để thu thập phản hồi cho phiên bản chính thức dự kiến phát hành vào tháng 12. Phiên bản này giới thiệu một số tính năng mới và cải thiện hiệu suất, đáng chú ý nhất là:

* GC nén
* Pattern Matching
* Cải thiện REPL
* Tách biệt tham số vị trí và tham số từ khóa

## GC nén

Phiên bản này giới thiệu GC nén, có thể chống phân mảnh vùng nhớ bị phân mảnh.

Một số chương trình Ruby đa luồng có thể gây ra phân mảnh bộ nhớ, dẫn đến việc sử dụng bộ nhớ cao và tốc độ giảm.

Phương thức `GC.compact` được giới thiệu để nén heap. Hàm này nén các đối tượng còn sống trong heap để có thể sử dụng ít trang hơn, và heap có thể thân thiện hơn với CoW. [[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## Pattern Matching [Thử nghiệm]

Pattern Matching, tính năng được sử dụng rộng rãi trong các ngôn ngữ lập trình hàm, được giới thiệu như một tính năng thử nghiệm. [[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)
Nó có thể duyệt qua một đối tượng cho trước và gán giá trị của nó nếu khớp với một mẫu.

```ruby
case JSON.parse('{...}', symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age
  ...
end
```

Để biết thêm chi tiết, vui lòng xem [Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Cải thiện REPL

`irb`, môi trường tương tác đi kèm (REPL; Read-Eval-Print-Loop), giờ đã hỗ trợ chỉnh sửa đa dòng. Nó được cung cấp bởi `reline`, một triển khai thuần Ruby tương thích với `readline`.
Nó cũng cung cấp tích hợp rdoc. Trong `irb` bạn có thể hiển thị tài liệu tham khảo cho một lớp, module, hoặc phương thức cho trước.  [[Feature #14683]](https://bugs.ruby-lang.org/issues/14683), [[Feature #14787]](https://bugs.ruby-lang.org/issues/14787), [[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)
Ngoài ra, các dòng mã nguồn hiển thị tại `binding.irb` và kết quả inspect cho các đối tượng lớp cốt lõi giờ đã được tô màu.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take2.mp4" type="video/mp4">
</video>

## Tách biệt tham số vị trí và tham số từ khóa

Việc chuyển đổi tự động giữa tham số từ khóa và tham số vị trí
đã bị deprecated, và việc chuyển đổi sẽ bị loại bỏ trong Ruby 3.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

* Khi một lời gọi phương thức truyền một Hash ở tham số cuối cùng, và khi nó
  không truyền từ khóa nào, và khi phương thức được gọi chấp nhận từ khóa, một
  cảnh báo sẽ được đưa ra. Để tiếp tục xử lý như từ khóa, thêm toán tử
  double splat để tránh cảnh báo và đảm bảo hành vi đúng trong
  Ruby 3.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* Khi một lời gọi phương thức truyền từ khóa cho một phương thức chấp nhận từ khóa,
  nhưng nó không truyền đủ tham số vị trí bắt buộc, các từ khóa
  được xử lý như một tham số vị trí bắt buộc cuối cùng, và một
  cảnh báo sẽ được đưa ra. Truyền tham số dưới dạng hash thay vì từ khóa
  để tránh cảnh báo và đảm bảo hành vi đúng trong Ruby 3.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* Khi một phương thức chấp nhận các từ khóa cụ thể nhưng không chấp nhận keyword splat, và
  một hash hoặc keywords splat được truyền cho phương thức bao gồm cả
  khóa Symbol và không phải Symbol, hash sẽ tiếp tục được tách ra, và
  một cảnh báo sẽ được đưa ra. Bạn sẽ cần cập nhật mã gọi
  để truyền các hash riêng biệt nhằm đảm bảo hành vi đúng trong Ruby 3.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* Nếu một phương thức không chấp nhận từ khóa, và được gọi với từ khóa,
  các từ khóa vẫn được xử lý như một hash vị trí, không có cảnh báo.
  Hành vi này sẽ tiếp tục hoạt động trong Ruby 3.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* Các ký tự không phải symbol được cho phép làm khóa tham số từ khóa nếu phương thức chấp nhận
  từ khóa tùy ý.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* <code>**nil</code> được cho phép trong định nghĩa phương thức để đánh dấu rõ ràng
  rằng phương thức không chấp nhận từ khóa. Gọi phương thức như vậy với từ khóa
  sẽ dẫn đến ArgumentError.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* Truyền một keyword splat rỗng cho một phương thức không chấp nhận từ khóa
  không còn truyền một hash rỗng nữa, trừ khi hash rỗng là cần thiết cho
  một tham số bắt buộc, trong trường hợp đó một cảnh báo sẽ được đưa ra. Loại bỏ
  double splat để tiếp tục truyền một hash vị trí.  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

## Các tính năng mới đáng chú ý khác

* Toán tử tham chiếu phương thức, <code>.:</code>, được giới thiệu như một tính năng thử nghiệm.  [[Feature #12125]](https://bugs.ruby-lang.org/issues/12125), [[Feature #13581]]( https://bugs.ruby-lang.org/issues/13581)

* Tham số đánh số làm tham số block mặc định được giới thiệu như một tính năng thử nghiệm.  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* Range không có điểm đầu được giới thiệu dưới dạng thử nghiệm. Nó có thể không hữu ích
  bằng range không có điểm cuối, nhưng sẽ tốt cho mục đích DSL. [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` được thêm vào. Nó đếm số lần xuất hiện của mỗi phần tử.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Gọi phương thức private trên `self` giờ đã được cho phép.  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297) [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` được thêm vào. Nó tạo ra một enumerator không lazy
  từ một lazy enumerator.  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Cải thiện hiệu suất

* JIT [Thử nghiệm]

  * Mã JIT được biên dịch lại thành mã ít tối ưu hơn khi một giả định tối ưu hóa bị vô hiệu.

  * Method inlining được thực hiện khi một phương thức được coi là thuần túy. Tối ưu hóa này vẫn đang thử nghiệm và nhiều phương thức chưa được coi là thuần túy.

  * Giá trị mặc định của `--jit-min-calls` được thay đổi từ 5 thành 10.000

  * Giá trị mặc định của `--jit-max-cache` được thay đổi từ 1.000 thành 100

* `Symbol#to_s`, `Module#name`, `true.to_s`, `false.to_s` và `nil.to_s` giờ luôn trả về một String đóng băng. String được trả về luôn giống nhau cho một đối tượng cho trước. [Thử nghiệm]  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* Hiệu suất của `CGI.escapeHTML` đã được cải thiện. [GH-2226](https://github.com/ruby/ruby/pull/2226)

## Các thay đổi đáng chú ý khác kể từ 2.6

* Một số thư viện chuẩn đã được cập nhật.
  * Bundler 2.1.0.pre.1
  * RubyGems 3.1.0.pre.1
  * CSV 3.1.2 ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * Racc 1.4.15
  * REXML 3.2.3 ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8 ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Một số thư viện khác không có phiên bản gốc cũng đã được cập nhật.

* `Proc.new` và `proc` không có block trong một phương thức được gọi với block giờ sẽ đưa ra cảnh báo.

* `lambda` không có block trong một phương thức được gọi với block sẽ báo lỗi.

* Cập nhật phiên bản Unicode và Emoji từ 11.0.0 lên 12.0.0.  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Cập nhật phiên bản Unicode lên 12.1.0, thêm hỗ trợ cho U+32FF SQUARE ERA NAME REIWA.  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, và `Date.parse` hỗ trợ niên hiệu mới của Nhật Bản.  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Yêu cầu trình biên dịch hỗ trợ C99 [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Chi tiết về phương ngữ của chúng tôi: <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_7_0_preview2/NEWS) hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) để biết thêm chi tiết.

Với những thay đổi đó, [3670 tệp đã thay đổi, 201242 dòng thêm(+), 88066 dòng xóa(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0_preview2) kể từ Ruby 2.6.0!

Hãy tận hưởng lập trình với Ruby 2.7!

## Tải về

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.bz2>

      SIZE:   14555229 bytes
      SHA1:   7d9eed71115acfc8851747517904c1c6809872a9
      SHA256: 417c84346ba84d664a13833c94c6d9f888c89bb9bee9adf469580441eaede30b
      SHA512: 7066ececebbbba4b2933ba1a4f70cdef373169910802259a3e52b4fc144ba298f3cffda4be5fe8a7be8ef769ed43076fa046a9ac2c13bb733475b9852112c6f0

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.gz>

      SIZE:   16622499 bytes
      SHA1:   5e998eb37ef54e650c0206184d56f506359d5477
      SHA256: bda4b8dc340fad425c8099400fe3ef8e7393837d7e6e1bfae41843d1d938ebc4
      SHA512: dbf05d6ddab59062f507342b25b8c21670b02bdd49e77bda947870607f4bf9049e5e7ddfde6bbce2e1749ca92568da9be3e5f30601b1eb450f10d8add952239a

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.tar.xz>

      SIZE:   11874200 bytes
      SHA1:   4356e1726027795a5c6b08572bb37bcb5a8c55d6
      SHA256: fa39f088331f6d505154aa9d025aab177fdffedfbbabccd900b8c02e745bc077
      SHA512: a057a186d85fcdf123abd69d584ef3adb20ad4397521e14306395d34102c3d818fe2d34a6476db01effcde479da9a77076cbb6d30bca40f1471ce3f5d3a995a9

* <https://cache.ruby-lang.org/pub/ruby/2.7/ruby-2.7.0-preview2.zip>

      SIZE:   20576618 bytes
      SHA1:   891b70ec76e9e776774a49b3ce24832a944422b3
      SHA256: 81a240bead4438b064cb4cde562b483b82ec8e414bac057a6df43df5a247545c
      SHA512: 1a8d4503374d31abf43182e2af6902ea6e5295f55d539415c8268b1d6a0fa83a975648c225ae986e687d5283dc2d180cf1e608841485506e4b0ac5efc154949a

## Ruby là gì

Ruby được phát triển đầu tiên bởi Matz (Yukihiro Matsumoto) vào năm 1993, và hiện được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.
