---
layout: news_post
title: "Ruby 2.7.0 đã được phát hành"
author: "naruse"
translator:
date: 2019-12-25 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phiên bản Ruby 2.7.0 đã được phát hành.

Phiên bản này giới thiệu một số tính năng mới và cải thiện hiệu suất,
đáng chú ý nhất là:

* Pattern Matching
* Cải thiện REPL
* GC nén
* Tách biệt tham số vị trí và tham số từ khóa

## Pattern Matching [Thử nghiệm]

Pattern matching, một tính năng được sử dụng rộng rãi trong các ngôn ngữ lập trình hàm,
được giới thiệu như một tính năng thử nghiệm.
[[Feature #14912]](https://bugs.ruby-lang.org/issues/14912)

Nó có thể duyệt qua một đối tượng cho trước và gán giá trị của nó nếu khớp với một mẫu.

```ruby
require "json"

json = <<END
{
  "name": "Alice",
  "age": 30,
  "children": [{ "name": "Bob", "age": 2 }]
}
END

case JSON.parse(json, symbolize_names: true)
in {name: "Alice", children: [{name: "Bob", age: age}]}
  p age #=> 2
end
```

Để biết thêm chi tiết, vui lòng xem
[Pattern matching - New feature in Ruby 2.7](https://speakerdeck.com/k_tsj/pattern-matching-new-feature-in-ruby-2-dot-7).

## Cải thiện REPL

`irb`, môi trường tương tác đi kèm (REPL; Read-Eval-Print-Loop),
giờ đây hỗ trợ chỉnh sửa đa dòng. Nó được hỗ trợ bởi `reline`,
một thư viện thuần Ruby tương thích với `readline`.
Nó cũng cung cấp tích hợp rdoc. Trong `irb` bạn có thể hiển thị tài liệu tham khảo
cho một lớp, module, hoặc phương thức cho trước.
[[Feature #14683]](https://bugs.ruby-lang.org/issues/14683),
[[Feature #14787]](https://bugs.ruby-lang.org/issues/14787),
[[Feature #14918]](https://bugs.ruby-lang.org/issues/14918)

Ngoài ra, các dòng mã nguồn hiển thị bởi `Binding#irb` và kết quả inspect
cho các đối tượng lớp core giờ đây được tô màu.

<video autoplay="autoplay" controls="controls" muted="muted" width="576" height="259" poster="https://cache.ruby-lang.org/pub/media/irb-reline-screenshot.png">
  <source src="https://cache.ruby-lang.org/pub/media/irb_improved_with_key_take3.mp4" type="video/mp4">
</video>

## GC nén

Phiên bản này giới thiệu GC nén, có thể chống phân mảnh
vùng nhớ bị phân mảnh.

Một số chương trình Ruby đa luồng có thể gây ra phân mảnh bộ nhớ,
dẫn đến sử dụng nhiều bộ nhớ và giảm tốc độ.

Phương thức `GC.compact` được giới thiệu để nén heap.
Hàm này nén các đối tượng còn sống trong heap để ít trang bộ nhớ
hơn được sử dụng, và heap có thể thân thiện hơn với CoW (copy-on-write).
[[Feature #15626]](https://bugs.ruby-lang.org/issues/15626)

## Tách biệt tham số vị trí và tham số từ khóa

Việc chuyển đổi tự động giữa tham số từ khóa và tham số vị trí
đã bị phản đối, và việc chuyển đổi sẽ bị loại bỏ trong Ruby 3.
[[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

Xem bài viết "[Separation of positional and keyword arguments in Ruby 3.0](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/)" để biết chi tiết.
Chỉ các thay đổi được liệt kê như sau.

* Khi một lời gọi phương thức truyền một Hash ở tham số cuối cùng, và khi nó
  không truyền từ khóa nào, và khi phương thức được gọi chấp nhận từ khóa,
  một cảnh báo sẽ được phát ra. Để tiếp tục coi hash như từ khóa,
  thêm toán tử double splat để tránh cảnh báo và đảm bảo
  hành vi đúng trong Ruby 3.

  ```ruby
  def foo(key: 42); end; foo({key: 42})   # warned
  def foo(**kw);    end; foo({key: 42})   # warned
  def foo(key: 42); end; foo(**{key: 42}) # OK
  def foo(**kw);    end; foo(**{key: 42}) # OK
  ```

* Khi một lời gọi phương thức truyền từ khóa cho một phương thức chấp nhận từ khóa,
  nhưng không truyền đủ tham số vị trí bắt buộc, các từ khóa
  được coi như tham số vị trí bắt buộc cuối cùng, và
  một cảnh báo sẽ được phát ra. Truyền tham số dưới dạng hash thay vì từ khóa
  để tránh cảnh báo và đảm bảo hành vi đúng trong Ruby 3.

  ```ruby
  def foo(h, **kw); end; foo(key: 42)      # warned
  def foo(h, key: 42); end; foo(key: 42)   # warned
  def foo(h, **kw); end; foo({key: 42})    # OK
  def foo(h, key: 42); end; foo({key: 42}) # OK
  ```

* Khi một phương thức chấp nhận từ khóa cụ thể nhưng không chấp nhận keyword splat, và
  một hash hoặc keyword splat được truyền cho phương thức bao gồm cả
  khóa Symbol và non-Symbol, hash sẽ tiếp tục được tách ra, và
  một cảnh báo sẽ được phát ra. Bạn sẽ cần cập nhật mã gọi
  để truyền các hash riêng biệt nhằm đảm bảo hành vi đúng trong Ruby 3.

  ```ruby
  def foo(h={}, key: 42); end; foo("key" => 43, key: 42)   # warned
  def foo(h={}, key: 42); end; foo({"key" => 43, key: 42}) # warned
  def foo(h={}, key: 42); end; foo({"key" => 43}, key: 42) # OK
  ```

* Nếu một phương thức không chấp nhận từ khóa, và được gọi với từ khóa,
  các từ khóa vẫn được coi như một hash vị trí, không có cảnh báo.
  Hành vi này sẽ tiếp tục hoạt động trong Ruby 3.

  ```ruby
  def foo(opt={});  end; foo( key: 42 )   # OK
  ```

* Non-symbol được phép làm khóa tham số từ khóa nếu phương thức chấp nhận
  từ khóa tùy ý.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(**kw); p kw; end; foo("str" => 1) #=> {"str"=>1}
  ```

* `**nil` được phép trong định nghĩa phương thức để đánh dấu rõ ràng
  rằng phương thức không chấp nhận từ khóa. Gọi phương thức như vậy với từ khóa
  sẽ dẫn đến ArgumentError.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  def foo(h, **nil); end; foo(key: 1)       # ArgumentError
  def foo(h, **nil); end; foo(**{key: 1})   # ArgumentError
  def foo(h, **nil); end; foo("str" => 1)   # ArgumentError
  def foo(h, **nil); end; foo({key: 1})     # OK
  def foo(h, **nil); end; foo({"str" => 1}) # OK
  ```

* Truyền một keyword splat rỗng cho một phương thức không chấp nhận từ khóa
  sẽ không còn truyền một hash rỗng, trừ khi hash rỗng là cần thiết cho
  một tham số bắt buộc, trong trường hợp đó một cảnh báo sẽ được phát ra.
  Loại bỏ double splat để tiếp tục truyền một hash vị trí.
  [[Feature #14183]](https://bugs.ruby-lang.org/issues/14183)

  ```ruby
  h = {}; def foo(*a) a end; foo(**h) # []
  h = {}; def foo(a) a end; foo(**h)  # {} and warning
  h = {}; def foo(*a) a end; foo(h)   # [{}]
  h = {}; def foo(a) a end; foo(h)    # {}
  ```

Nếu bạn muốn tắt cảnh báo phản đối, vui lòng sử dụng tham số dòng lệnh `-W:no-deprecated` hoặc thêm `Warning[:deprecated] = false` vào mã của bạn.

## Các tính năng mới đáng chú ý khác

* Tham số đánh số được giới thiệu như tham số block mặc định.
  [[Feature #4475]](https://bugs.ruby-lang.org/issues/4475)

* Range không có điểm đầu được giới thiệu ở dạng thử nghiệm. Nó có thể không
  hữu ích như range không có điểm cuối, nhưng sẽ tốt cho mục đích DSL.
  [[Feature #14799]](https://bugs.ruby-lang.org/issues/14799)

  ```ruby
  ary[..3]  # identical to ary[0..3]
  rel.where(sales: ..100)
  ```

* `Enumerable#tally` được thêm vào. Nó đếm số lần xuất hiện của mỗi phần tử.

  ```ruby
  ["a", "b", "c", "b"].tally
  #=> {"a"=>1, "b"=>2, "c"=>1}
  ```

* Gọi phương thức private với `self` tường minh làm receiver
  giờ đây được cho phép.
  [[Feature #11297]](https://bugs.ruby-lang.org/issues/11297),
  [[Feature #16123]](https://bugs.ruby-lang.org/issues/16123)

  ```ruby
  def foo
  end
  private :foo
  self.foo
  ```

* `Enumerator::Lazy#eager` được thêm vào.
  Nó tạo ra một enumerator không lazy từ một enumerator lazy.
  [[Feature #15901]](https://bugs.ruby-lang.org/issues/15901)

  ```ruby
  a = %w(foo bar baz)
  e = a.lazy.map {|x| x.upcase }.map {|x| x + "!" }.eager
  p e.class               #=> Enumerator
  p e.map {|x| x + "?" }  #=> ["FOO!?", "BAR!?", "BAZ!?"]
  ```

## Cải thiện hiệu suất

* JIT [Thử nghiệm]

  * Mã JIT được biên dịch lại thành mã ít tối ưu hơn khi một
    giả định tối ưu hóa bị vô hiệu.

  * Method inlining được thực hiện khi một phương thức được coi là thuần túy.
    Tối ưu hóa này vẫn đang thử nghiệm và nhiều phương thức
    vẫn CHƯA được coi là thuần túy.

  * Giá trị mặc định của `--jit-min-calls` được thay đổi từ 5 thành 10,000.

  * Giá trị mặc định của `--jit-max-cache` được thay đổi từ 1,000 thành 100.

* Chiến lược cache của Fiber được thay đổi và việc tạo fiber được tăng tốc.
  [GH-2224](https://github.com/ruby/ruby/pull/2224)

* `Module#name`, `true.to_s`, `false.to_s`,
  và `nil.to_s` giờ đây luôn trả về một String đã frozen.
  String được trả về luôn giống nhau cho một đối tượng cho trước.
  [Thử nghiệm]
  [[Feature #16150]](https://bugs.ruby-lang.org/issues/16150)

* Hiệu suất của `CGI.escapeHTML` được cải thiện.
  [GH-2226](https://github.com/ruby/ruby/pull/2226)

* Hiệu suất của Monitor và MonitorMixin được cải thiện.
  [[Feature #16255]](https://bugs.ruby-lang.org/issues/16255)

* Cache phương thức theo vị trí gọi, đã có từ khoảng phiên bản 1.9, đã được
  cải thiện: tỷ lệ cache hit tăng từ 89% lên 94%.
  Xem [GH-2583](https://github.com/ruby/ruby/pull/2583)

* RubyVM::InstructionSequence#to_binary tạo binary đã biên dịch. Kích thước binary được giảm. [Feature #16163]

## Các thay đổi đáng chú ý khác kể từ 2.6

* Một số thư viện chuẩn được cập nhật.
  * Bundler 2.1.2
    ([Release note](https://github.com/bundler/bundler/releases/tag/v2.1.2))
  * RubyGems 3.1.2
    * ([Release note for 3.1.0](https://github.com/rubygems/rubygems/releases/tag/v3.1.0))
    * ([Release note for 3.1.1](https://github.com/rubygems/rubygems/releases/tag/v3.1.1))
    * ([Release note for 3.1.2](https://github.com/rubygems/rubygems/releases/tag/v3.1.2))
  * Racc 1.4.15
  * CSV 3.1.2
    ([NEWS](https://github.com/ruby/csv/blob/v3.1.2/NEWS.md))
  * REXML 3.2.3
    ([NEWS](https://github.com/ruby/rexml/blob/v3.2.3/NEWS.md))
  * RSS 0.2.8
    ([NEWS](https://github.com/ruby/rss/blob/v0.2.8/NEWS.md))
  * StringScanner 1.0.3
  * Một số thư viện khác không có phiên bản gốc cũng được cập nhật.

* Các thư viện sau không còn là bundled gems.
  Cài đặt gem tương ứng để sử dụng các tính năng này.
  * CMath (cmath gem)
  * Scanf (scanf gem)
  * Shell (shell gem)
  * Synchronizer (sync gem)
  * ThreadsWait (thwait gem)
  * E2MM (e2mmap gem)

* `profile.rb` đã bị loại bỏ khỏi thư viện chuẩn.

* Chuyển stdlib thành default gems
  * Các default gems sau đã được xuất bản trên rubygems.org
    * benchmark
    * cgi
    * delegate
    * getoptlong
    * net-pop
    * net-smtp
    * open3
    * pstore
    * singleton
  * Các default gems sau chỉ được chuyển tại ruby-core,
    nhưng chưa được xuất bản trên rubygems.org.
    * monitor
    * observer
    * timeout
    * tracer
    * uri
    * yaml

* `Proc.new` và `proc` không có block trong phương thức được gọi với block
   giờ đây sẽ cảnh báo.

* `lambda` không có block trong phương thức được gọi với block sẽ phát sinh ngoại lệ.

* Cập nhật phiên bản Unicode và Emoji từ 11.0.0 lên 12.0.0.
  [[Feature #15321]](https://bugs.ruby-lang.org/issues/15321)

* Cập nhật phiên bản Unicode lên 12.1.0,
  thêm hỗ trợ cho U+32FF SQUARE ERA NAME REIWA.
  [[Feature #15195]](https://bugs.ruby-lang.org/issues/15195)

* `Date.jisx0301`, `Date#jisx0301`, và `Date.parse` hỗ trợ
  niên hiệu Nhật Bản mới.
  [[Feature #15742]](https://bugs.ruby-lang.org/issues/15742)

* Yêu cầu trình biên dịch hỗ trợ C99.
  [[Misc #15347]](https://bugs.ruby-lang.org/issues/15347)
  * Chi tiết về dialect của chúng tôi:
    <https://bugs.ruby-lang.org/projects/ruby-master/wiki/C99>

Xem [NEWS](https://github.com/ruby/ruby/blob/v2_7_0/NEWS)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0)
để biết thêm chi tiết.

{% assign release = site.data.releases | where: "version", "2.7.0" | first %}

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa đi(-)](https://github.com/ruby/ruby/compare/v2_6_0...v2_7_0)
kể từ Ruby 2.6.0!

Chúc mừng Giáng sinh, chúc mừng ngày lễ, và hãy tận hưởng lập trình với Ruby 2.7!

## Tải về

* <{{ release.url.bz2 }}>

      SIZE: {{ release.size.bz2 }}
      SHA1: {{ release.sha1.bz2 }}
      SHA256: {{ release.sha256.bz2 }}
      SHA512: {{ release.sha512.bz2 }}

* <{{ release.url.gz }}>

      SIZE: {{ release.size.gz }}
      SHA1: {{ release.sha1.gz }}
      SHA256: {{ release.sha256.gz }}
      SHA512: {{ release.sha512.gz }}

* <{{ release.url.xz }}>

      SIZE: {{ release.size.xz }}
      SHA1: {{ release.sha1.xz }}
      SHA256: {{ release.sha256.xz }}
      SHA512: {{ release.sha512.xz }}

* <{{ release.url.zip }}>

      SIZE: {{ release.size.zip }}
      SHA1: {{ release.sha1.zip }}
      SHA256: {{ release.sha256.zip }}
      SHA512: {{ release.sha512.zip }}

## Ruby là gì

Ruby được phát triển lần đầu bởi Matz (Yukihiro Matsumoto) vào năm 1993,
và hiện được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng
và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.
