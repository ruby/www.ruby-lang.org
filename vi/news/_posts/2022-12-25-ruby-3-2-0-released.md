---
layout: news_post
title: "Ruby 3.2.0 đã được phát hành"
author: "naruse"
translator:
date: 2022-12-25 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.2.0" | first %}

Chúng tôi vui mừng thông báo phiên bản Ruby {{ release.version }} đã được phát hành. Ruby 3.2 bổ sung nhiều tính năng và cải thiện hiệu suất.


## Hỗ trợ WebAssembly dựa trên WASI

Đây là bản port ban đầu của hỗ trợ WebAssembly dựa trên WASI. Điều này cho phép tệp nhị phân CRuby có thể chạy trên trình duyệt Web, môi trường Serverless Edge, hoặc các loại trình nhúng WebAssembly/WASI khác. Hiện tại bản port này vượt qua các bộ kiểm thử cơ bản và bootstrap mà không sử dụng Thread API.

![](https://i.imgur.com/opCgKy2.png)

### Bối cảnh

[WebAssembly (Wasm)](https://webassembly.org/) ban đầu được giới thiệu để chạy chương trình một cách an toàn và nhanh chóng trong trình duyệt web. Nhưng mục tiêu của nó - chạy chương trình hiệu quả với tính bảo mật trên nhiều môi trường khác nhau - không chỉ cần thiết cho web mà còn cho các ứng dụng nói chung.

[WASI (The WebAssembly System Interface)](https://wasi.dev/) được thiết kế cho các trường hợp sử dụng như vậy. Mặc dù các ứng dụng như vậy cần giao tiếp với hệ điều hành, WebAssembly chạy trên máy ảo mà không có giao diện hệ thống. WASI chuẩn hóa điều đó.

Hỗ trợ WebAssembly/WASI trong Ruby nhằm tận dụng các dự án này. Nó cho phép các lập trình viên Ruby viết ứng dụng chạy trên các nền tảng đầy hứa hẹn như vậy.

### Trường hợp sử dụng

Hỗ trợ này khuyến khích các lập trình viên sử dụng CRuby trong môi trường WebAssembly. Một ví dụ trường hợp sử dụng là hỗ trợ CRuby của [TryRuby playground](https://try.ruby-lang.org/playground/). Bây giờ bạn có thể thử CRuby gốc trong trình duyệt web của mình.

### Các điểm kỹ thuật

WASI và WebAssembly hiện tại vẫn thiếu một số tính năng để triển khai Fiber, exception, và GC vì nó vẫn đang phát triển, và cũng vì lý do bảo mật. Vì vậy CRuby lấp đầy khoảng trống bằng cách sử dụng Asyncify, một kỹ thuật chuyển đổi nhị phân để điều khiển thực thi trong userland.

Ngoài ra, chúng tôi đã xây dựng [một VFS trên WASI](https://github.com/kateinoigakukun/wasi-vfs/wiki/Getting-Started-with-CRuby) để có thể dễ dàng đóng gói ứng dụng Ruby vào một tệp .wasm duy nhất. Điều này giúp việc phân phối ứng dụng Ruby dễ dàng hơn một chút.

### Liên kết liên quan

* [Add WASI based WebAssembly support #5407](https://github.com/ruby/ruby/pull/5407)
* [An Update on WebAssembly/WASI Support in Ruby](https://itnext.io/final-report-webassembly-wasi-support-in-ruby-4aface7d90c9)


## YJIT sẵn sàng cho sản xuất

![](https://i.imgur.com/X9ulfac.png)

* YJIT không còn là thử nghiệm
    * Đã được kiểm thử trên khối lượng công việc sản xuất trong hơn một năm và được chứng minh là khá ổn định.
* YJIT bây giờ hỗ trợ cả CPU x86-64 và arm64/aarch64 trên Linux, MacOS, BSD và các nền tảng UNIX khác.
    * Bản phát hành này mang đến hỗ trợ cho Apple M1/M2, AWS Graviton, Raspberry Pi 4 và nhiều hơn nữa.
* Xây dựng YJIT bây giờ yêu cầu Rust 1.58.0+. [[Feature #18481]]
    * Để đảm bảo CRuby được xây dựng với YJIT, vui lòng cài đặt `rustc` >= 1.58.0
      trước khi chạy script `./configure`.
    * Vui lòng liên hệ với nhóm YJIT nếu bạn gặp bất kỳ vấn đề nào.
* Bản phát hành YJIT 3.2 nhanh hơn 3.1, và có khoảng 1/3 chi phí bộ nhớ.
  * Nhìn chung YJIT nhanh hơn 41% (trung bình hình học) so với trình thông dịch Ruby trên [yjit-bench](https://github.com/Shopify/yjit-bench).
  * Bộ nhớ vật lý cho mã JIT được cấp phát lười. Không giống như Ruby 3.1,
    RSS của một tiến trình Ruby được giảm thiểu vì các trang bộ nhớ ảo
    được cấp phát bởi `--yjit-exec-mem-size` sẽ không được ánh xạ tới các trang
    bộ nhớ vật lý cho đến khi thực sự được sử dụng bởi mã JIT.
  * Giới thiệu Code GC giải phóng tất cả các trang mã khi mức tiêu thụ bộ nhớ
    bởi mã JIT đạt `--yjit-exec-mem-size`.
  * `RubyVM::YJIT.runtime_stats` trả về các chỉ số Code GC ngoài các
    khóa `inline_code_size` và `outlined_code_size` hiện có:
    `code_gc_count`, `live_page_count`, `freed_page_count`, và `freed_code_size`.
* Hầu hết các thống kê được tạo bởi `RubyVM::YJIT.runtime_stats` bây giờ có sẵn trong các bản build phát hành.
    * Chỉ cần chạy ruby với `--yjit-stats` để tính toán và hiển thị thống kê (phát sinh một chút chi phí thời gian chạy).
* YJIT bây giờ được tối ưu hóa để tận dụng object shapes. [[Feature #18776]]
* Tận dụng invalidation hằng số chi tiết hơn để vô hiệu hóa ít mã hơn khi định nghĩa hằng số mới. [[Feature #18589]]
* Giá trị mặc định `--yjit-exec-mem-size` được thay đổi thành 64 (MiB).
* Giá trị mặc định `--yjit-call-threshold` được thay đổi thành 30.

## Cải thiện Regexp chống ReDoS

Như đã biết, việc khớp Regexp có thể mất thời gian dài bất ngờ. Nếu mã của bạn cố gắng khớp một Regexp có thể không hiệu quả với đầu vào không đáng tin cậy, kẻ tấn công có thể khai thác điều này để tấn công từ chối dịch vụ hiệu quả (còn gọi là Regular expression DoS, hay ReDoS).

Chúng tôi đã giới thiệu hai cải tiến giúp giảm thiểu đáng kể ReDoS.

### Cải thiện thuật toán khớp Regexp

Kể từ Ruby 3.2, thuật toán khớp của Regexp đã được cải thiện đáng kể bằng kỹ thuật memoization.

```
# This match takes 10 sec. in Ruby 3.1, and 0.003 sec. in Ruby 3.2

/^a*b?a*$/ =~ "a" * 50000 + "x"
```

![](https://cache.ruby-lang.org/pub/media/ruby320_regex_1.png)
![](https://cache.ruby-lang.org/pub/media/ruby320_regex_2.png)

Thuật toán khớp cải tiến cho phép hầu hết các phép khớp Regexp (khoảng 90% trong các thử nghiệm của chúng tôi) hoàn thành trong thời gian tuyến tính.

Tối ưu hóa này có thể tiêu tốn bộ nhớ tỷ lệ với độ dài đầu vào cho mỗi lần khớp. Chúng tôi không mong đợi có vấn đề thực tế nào phát sinh vì việc cấp phát bộ nhớ này thường bị trì hoãn, và một phép khớp Regexp bình thường nên tiêu tốn tối đa gấp 10 lần bộ nhớ so với độ dài đầu vào. Nếu bạn hết bộ nhớ khi khớp Regexp trong ứng dụng thực tế, vui lòng báo cáo.

Đề xuất gốc tại <https://bugs.ruby-lang.org/issues/19104>

### Thời gian chờ Regexp

Tối ưu hóa trên không thể áp dụng cho một số loại biểu thức chính quy, chẳng hạn như những biểu thức bao gồm các tính năng nâng cao (ví dụ: back-references hoặc look-around), hoặc với số lần lặp cố định rất lớn. Như một biện pháp dự phòng, tính năng thời gian chờ cho phép khớp Regexp cũng được giới thiệu.

```ruby
Regexp.timeout = 1.0

/^a*b?a*()\1$/ =~ "a" * 50000 + "x"
#=> Regexp::TimeoutError is raised in one second
```

Lưu ý rằng `Regexp.timeout` là cấu hình toàn cục. Nếu bạn muốn sử dụng các cài đặt thời gian chờ khác nhau cho một số Regexp đặc biệt, bạn có thể sử dụng từ khóa `timeout` cho `Regexp.new`.

```ruby
Regexp.timeout = 1.0

# This regexp has no timeout
long_time_re = Regexp.new('^a*b?a*()\1$', timeout: Float::INFINITY)

long_time_re =~ "a" * 50000 + "x" # never interrupted
```

Đề xuất gốc tại <https://bugs.ruby-lang.org/issues/17837>.

## Các tính năng mới đáng chú ý khác

### SyntaxSuggest

* Tính năng của `syntax_suggest` (trước đây là `dead_end`) được tích hợp vào Ruby. Điều này giúp bạn tìm vị trí lỗi như thiếu hoặc thừa `end`, để bạn có thể quay lại làm việc nhanh hơn, chẳng hạn như trong ví dụ sau:

  ```
  Unmatched `end', missing keyword (`do', `def`, `if`, etc.) ?

    1  class Dog
  > 2    defbark
  > 3    end
    4  end
  ```

  [[Feature #18159]]


### ErrorHighlight

* Bây giờ nó chỉ ra (các) đối số liên quan cho TypeError và ArgumentError

```
test.rb:2:in `+': nil can't be coerced into Integer (TypeError)

sum = ary[0] + ary[1]
               ^^^^^^
```

### Ngôn ngữ

* Các tham số rest và keyword rest ẩn danh bây giờ có thể được truyền dưới dạng
  đối số, thay vì chỉ được sử dụng trong tham số phương thức.
  [[Feature #18351]]

    ```ruby
    def foo(*)
      bar(*)
    end
    def baz(**)
      quux(**)
    end
    ```

* Một proc chấp nhận một đối số vị trí đơn và từ khóa sẽ
  không còn tự động tách nữa. [[Bug #18633]]

  ```ruby
  proc{|a, **k| a}.call([1, 2])
  # Ruby 3.1 and before
  # => 1
  # Ruby 3.2 and after
  # => [1, 2]
  ```

* Thứ tự đánh giá gán hằng số cho các hằng số được đặt trên đối tượng
  tường minh đã được làm nhất quán với thứ tự đánh giá gán thuộc tính đơn.
  Với mã này:

    ```ruby
    foo::BAR = baz
    ```

  `foo` bây giờ được gọi trước `baz`. Tương tự, đối với nhiều phép gán
  cho hằng số, thứ tự đánh giá từ trái sang phải được sử dụng. Với mã này:

    ```ruby
      foo1::BAR1, foo2::BAR2 = baz1, baz2
    ```

  Thứ tự đánh giá sau đây bây giờ được sử dụng:

  1. `foo1`
  2. `foo2`
  3. `baz1`
  4. `baz2`

  [[Bug #15928]]

* Find pattern không còn là thử nghiệm nữa.
  [[Feature #18585]]

* Các phương thức nhận tham số rest (như `*args`) và muốn ủy quyền từ khóa
  đối số thông qua `foo(*args)` bây giờ phải được đánh dấu bằng `ruby2_keywords`
  (nếu chưa). Nói cách khác, tất cả các phương thức muốn ủy quyền
  từ khóa đối số thông qua `*args` bây giờ phải được đánh dấu bằng `ruby2_keywords`,
  không có ngoại lệ. Điều này sẽ giúp dễ dàng chuyển đổi sang các cách ủy quyền khác
  khi một thư viện có thể yêu cầu Ruby 3+. Trước đây, cờ `ruby2_keywords`
  được giữ nếu phương thức nhận sử dụng `*args`, nhưng đây là lỗi và sự
  không nhất quán. Một kỹ thuật tốt để tìm `ruby2_keywords` có thể bị thiếu
  là chạy bộ kiểm thử, tìm phương thức cuối cùng phải
  nhận từ khóa đối số cho mỗi nơi bộ kiểm thử thất bại, và sử dụng `puts nil, caller, nil` ở đó. Sau đó kiểm tra rằng mỗi
  phương thức/block trên chuỗi gọi phải ủy quyền từ khóa được đánh dấu chính xác
  bằng `ruby2_keywords`. [[Bug #18625]] [[Bug #16466]]

    ```ruby
    def target(**kw)
    end

    # Accidentally worked without ruby2_keywords in Ruby 2.7-3.1, ruby2_keywords
    # needed in 3.2+. Just like (*args, **kwargs) or (...) would be needed on
    # both #foo and #bar when migrating away from ruby2_keywords.
    ruby2_keywords def bar(*args)
      target(*args)
    end

    ruby2_keywords def foo(*args)
      bar(*args)
    end

    foo(k: 1)
    ```

## Cải thiện hiệu suất

### MJIT

* Trình biên dịch MJIT được triển khai lại bằng Ruby dưới dạng `ruby_vm/mjit/compiler`.
* Trình biên dịch MJIT được thực thi trong một tiến trình được fork thay vì
  thực hiện trong một luồng native gọi là MJIT worker. [[Feature #18968]]
    * Kết quả là, Microsoft Visual Studio (MSWIN) không còn được hỗ trợ.
* MinGW không còn được hỗ trợ. [[Feature #18824]]
* Đổi tên `--mjit-min-calls` thành `--mjit-call-threshold`.
* Thay đổi giá trị mặc định `--mjit-max-cache` từ 10000 về 100.

### PubGrub

* Bundler 2.4 bây giờ sử dụng bộ giải [PubGrub](https://github.com/jhawthorn/pub_grub) thay vì [Molinillo](https://github.com/CocoaPods/Molinillo).

  * PubGrub là thuật toán giải quyết thế hệ tiếp theo được sử dụng bởi trình quản lý gói `pub` cho ngôn ngữ lập trình Dart.
  * Bạn có thể nhận được kết quả giải quyết khác nhau sau thay đổi này. Vui lòng báo cáo các trường hợp như vậy tại [RubyGems/Bundler issues](https://github.com/rubygems/rubygems/issues)

* RubyGems vẫn sử dụng bộ giải Molinillo trong Ruby 3.2. Chúng tôi dự định thay thế nó bằng PubGrub trong tương lai.

## Các thay đổi đáng chú ý khác kể từ 3.1

* Data
    * Lớp core mới để biểu diễn đối tượng giá trị bất biến đơn giản. Lớp này
      tương tự như Struct và chia sẻ một phần triển khai, nhưng có
      API gọn gàng và nghiêm ngặt hơn. [[Feature #16122]]

        ```ruby
        Measure = Data.define(:amount, :unit)
        distance = Measure.new(100, 'km')            #=> #<data Measure amount=100, unit="km">
        weight = Measure.new(amount: 50, unit: 'kg') #=> #<data Measure amount=50, unit="kg">
        weight.with(amount: 40)                      #=> #<data Measure amount=40, unit="kg">
        weight.amount                                #=> 50
        weight.amount = 40                           #=> NoMethodError: undefined method `amount='
        ```

* Hash
    * `Hash#shift` bây giờ luôn trả về nil nếu hash
      trống, thay vì trả về giá trị mặc định hoặc
      gọi proc mặc định. [[Bug #16908]]

* MatchData
    * `MatchData#byteoffset` đã được thêm vào. [[Feature #13110]]

* Module
    * `Module.used_refinements` đã được thêm vào. [[Feature #14332]]
    * `Module#refinements` đã được thêm vào. [[Feature #12737]]
    * `Module#const_added` đã được thêm vào. [[Feature #17881]]

* Proc
    * `Proc#dup` trả về một instance của lớp con. [[Bug #17545]]
    * `Proc#parameters` bây giờ chấp nhận từ khóa lambda. [[Feature #15357]]

* Refinement
    * `Refinement#refined_class` đã được thêm vào. [[Feature #12737]]

* RubyVM::AbstractSyntaxTree
    * Thêm tùy chọn `error_tolerant` cho `parse`, `parse_file` và `of`. [[Feature #19013]]
      Với tùy chọn này
        1. SyntaxError được bỏ qua
        2. AST được trả về cho đầu vào không hợp lệ
        3. `end` được bổ sung khi parser đến cuối đầu vào nhưng `end` không đủ
        4. `end` được coi là từ khóa dựa trên thụt lề

        ```ruby
        # Without error_tolerant option
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY)
        def m
          a = 10
          if
        end
        RUBY
        # => <internal:ast>:33:in `parse': syntax error, unexpected `end' (SyntaxError)

        # With error_tolerant option
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        def m
          a = 10
          if
        end
        RUBY
        p root # => #<RubyVM::AbstractSyntaxTree::Node:SCOPE@1:0-4:3>

        # `end` is treated as keyword based on indent
        root = RubyVM::AbstractSyntaxTree.parse(<<~RUBY, error_tolerant: true)
        module Z
          class Foo
            foo.
          end

          def bar
          end
        end
        RUBY
        p root.children[-1].children[-1].children[-1].children[-2..-1]
        # => [#<RubyVM::AbstractSyntaxTree::Node:CLASS@2:2-4:5>, #<RubyVM::AbstractSyntaxTree::Node:DEFN@6:2-7:5>]
        ```

    * Thêm tùy chọn `keep_tokens` cho `parse`, `parse_file` và `of`. [[Feature #19070]]

        ```ruby
        root = RubyVM::AbstractSyntaxTree.parse("x = 1 + 2", keep_tokens: true)
        root.tokens # => [[0, :tIDENTIFIER, "x", [1, 0, 1, 1]], [1, :tSP, " ", [1, 1, 1, 2]], ...]
        root.tokens.map{_1[2]}.join # => "x = 1 + 2"
        ```

* Set
    * Set bây giờ có sẵn dưới dạng lớp tích hợp mà không cần `require "set"`. [[Feature #16989]]
      Hiện tại nó được tự động tải thông qua hằng số `Set` hoặc lệnh gọi `Enumerable#to_set`.

* String
    * `String#byteindex` và `String#byterindex` đã được thêm vào. [[Feature #13110]]
    * Cập nhật Unicode lên phiên bản 15.0.0 và Emoji phiên bản 15.0. [[Feature #18639]]
      (cũng áp dụng cho Regexp)
    * `String#bytesplice` đã được thêm vào.  [[Feature #18598]]

* Struct
    * Lớp Struct cũng có thể được khởi tạo bằng đối số từ khóa
      mà không cần `keyword_init: true` trên `Struct.new` [[Feature #16806]]

        ```ruby
        Post = Struct.new(:id, :name)
        Post.new(1, "hello") #=> #<struct Post id=1, name="hello">
        # From Ruby 3.2, the following code also works without keyword_init: true.
        Post.new(id: 1, name: "hello") #=> #<struct Post id=1, name="hello">
        ```

## Vấn đề tương thích

Lưu ý: Không bao gồm các sửa lỗi tính năng.

### Các hằng số đã bị loại bỏ

Các hằng số không còn được dùng sau đây đã bị loại bỏ.

* `Fixnum` và `Bignum` [[Feature #12005]]
* `Random::DEFAULT` [[Feature #17351]]
* `Struct::Group`
* `Struct::Passwd`

### Các phương thức đã bị loại bỏ

Các phương thức không còn được dùng sau đây đã bị loại bỏ.

* `Dir.exists?` [[Feature #17391]]
* `File.exists?` [[Feature #17391]]
* `Kernel#=~` [[Feature #15231]]
* `Kernel#taint`, `Kernel#untaint`, `Kernel#tainted?`
  [[Feature #16131]]
* `Kernel#trust`, `Kernel#untrust`, `Kernel#untrusted?`
  [[Feature #16131]]

## Vấn đề tương thích thư viện chuẩn

### Không còn đi kèm mã nguồn bên thứ ba

* Chúng tôi không còn đi kèm mã nguồn bên thứ ba như `libyaml`, `libffi`.

    * Mã nguồn libyaml đã bị loại bỏ khỏi psych. Bạn có thể cần cài đặt `libyaml-dev` trên nền tảng Ubuntu/Debian. Tên gói khác nhau cho mỗi nền tảng.

    * Mã nguồn libffi đi kèm cũng bị loại bỏ khỏi `fiddle`

* Psych và fiddle hỗ trợ build tĩnh với các phiên bản cụ thể của mã nguồn libyaml và libffi. Bạn có thể build psych với libyaml-0.2.5 như sau:

    ```bash
    $ ./configure --with-libyaml-source-dir=/path/to/libyaml-0.2.5
    ```

    Và bạn có thể build fiddle với libffi-3.4.4 như sau:

    ```bash
    $ ./configure --with-libffi-source-dir=/path/to/libffi-3.4.4
    ```

  [[Feature #18571]]

## Cập nhật C API

### Các C API đã cập nhật

Các API sau đã được cập nhật.

* Cập nhật PRNG
  * `rb_random_interface_t` đã được cập nhật và gắn phiên bản.
    Các thư viện mở rộng sử dụng giao diện này và được xây dựng cho các phiên bản cũ hơn.
    Cũng cần định nghĩa hàm `init_int32`.

### Các C API đã bị loại bỏ

Các API không còn được dùng sau đây đã bị loại bỏ.

* Biến `rb_cData`.
* Các hàm "taintedness" và "trustedness". [[Feature #16131]]

## Cập nhật thư viện chuẩn

* Bundler

    * Thêm hỗ trợ --ext=rust cho bundle gem để tạo các gem đơn giản với phần mở rộng Rust.
      [[GH-rubygems-6149]]
    * Tăng tốc độ clone kho git [[GH-rubygems-4475]]

* RubyGems

    * Thêm hỗ trợ mswin cho cargo builder. [[GH-rubygems-6167]]

* ERB

    * `ERB::Util.html_escape` được làm nhanh hơn `CGI.escapeHTML`.
        * Nó không còn cấp phát đối tượng String khi không có ký tự nào cần escape.
        * Nó bỏ qua việc gọi phương thức `#to_s` khi đối số đã là String.
        * `ERB::Escape.html_escape` được thêm dưới dạng alias cho `ERB::Util.html_escape`,
          cái mà không bị monkey-patch bởi Rails.

* IRB

    * Các lệnh tích hợp debug.gem đã được thêm: `debug`, `break`, `catch`,
      `next`, `delete`, `step`, `continue`, `finish`, `backtrace`, `info`
        * Chúng hoạt động ngay cả khi bạn không có `gem "debug"` trong Gemfile.
        * Xem thêm: [What's new in Ruby 3.2's IRB?](https://st0012.dev/whats-new-in-ruby-3-2-irb)
    * Nhiều lệnh và tính năng giống Pry hơn đã được thêm.
        * `edit` và `show_cmds` (giống `help` của Pry) được thêm vào.
        * `ls` nhận tùy chọn `-g` hoặc `-G` để lọc đầu ra.
        * `show_source` được alias từ `$` và chấp nhận đầu vào không có dấu ngoặc kép.
        * `whereami` được alias từ `@`.

*   Các gem mặc định sau đã được cập nhật.

    * RubyGems 3.4.1
    * abbrev 0.1.1
    * benchmark 0.2.1
    * bigdecimal 3.1.3
    * bundler 2.4.1
    * cgi 0.3.6
    * csv 3.2.6
    * date 3.3.3
    * delegate 0.3.0
    * did_you_mean 1.6.3
    * digest 3.1.1
    * drb 2.1.1
    * english 0.7.2
    * erb 4.0.2
    * error_highlight 0.5.1
    * etc 1.4.2
    * fcntl 1.0.2
    * fiddle 1.1.1
    * fileutils 1.7.0
    * forwardable 1.3.3
    * getoptlong 0.2.0
    * io-console 0.6.0
    * io-nonblock 0.2.0
    * io-wait 0.3.0
    * ipaddr 1.2.5
    * irb 1.6.2
    * json 2.6.3
    * logger 1.5.3
    * mutex_m 0.1.2
    * net-http 0.3.2
    * net-protocol 0.2.1
    * nkf 0.1.2
    * open-uri 0.3.0
    * open3 0.1.2
    * openssl 3.1.0
    * optparse 0.3.1
    * ostruct 0.5.5
    * pathname 0.2.1
    * pp 0.4.0
    * pstore 0.1.2
    * psych 5.0.1
    * racc 1.6.2
    * rdoc 6.5.0
    * readline-ext 0.1.5
    * reline 0.3.2
    * resolv 0.2.2
    * resolv-replace 0.1.1
    * securerandom 0.2.2
    * set 1.0.3
    * stringio 3.0.4
    * strscan 3.0.5
    * syntax_suggest 1.0.2
    * syslog 0.1.1
    * tempfile 0.1.3
    * time 0.2.1
    * timeout 0.3.1
    * tmpdir 0.1.3
    * tsort 0.1.1
    * un 0.2.1
    * uri 0.12.0
    * weakref 0.1.2
    * win32ole 1.8.9
    * yaml 0.2.1
    * zlib 3.0.0

*   Các gem đi kèm sau đã được cập nhật.

    * minitest 5.16.3
    * power_assert 2.0.3
    * test-unit 3.5.7
    * net-ftp 0.2.0
    * net-imap 0.3.3
    * net-pop 0.1.2
    * net-smtp 0.3.3
    * rbs 2.8.2
    * typeprof 0.21.3
    * debug 1.7.1

Xem các bản phát hành GitHub như [GitHub Releases của logger](https://github.com/ruby/logger/releases) hoặc nhật ký thay đổi để biết chi tiết về các gem mặc định hoặc gem đi kèm.

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa bỏ(-)](https://github.com/ruby/ruby/compare/v3_1_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.1.0!

Chúc mừng Giáng sinh, chúc mừng ngày lễ, và hãy tận hưởng lập trình với Ruby 3.2!

## Tải về

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
và hiện tại được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng
và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.

[Feature #12005]:     https://bugs.ruby-lang.org/issues/12005
[Feature #12084]:     https://bugs.ruby-lang.org/issues/12084
[Feature #12655]:     https://bugs.ruby-lang.org/issues/12655
[Feature #12737]:     https://bugs.ruby-lang.org/issues/12737
[Feature #13110]:     https://bugs.ruby-lang.org/issues/13110
[Feature #14332]:     https://bugs.ruby-lang.org/issues/14332
[Feature #15231]:     https://bugs.ruby-lang.org/issues/15231
[Feature #15357]:     https://bugs.ruby-lang.org/issues/15357
[Bug #15928]:         https://bugs.ruby-lang.org/issues/15928
[Feature #16122]:     https://bugs.ruby-lang.org/issues/16122
[Feature #16131]:     https://bugs.ruby-lang.org/issues/16131
[Bug #16466]:         https://bugs.ruby-lang.org/issues/16466
[Feature #16663]:     https://bugs.ruby-lang.org/issues/16663
[Feature #16806]:     https://bugs.ruby-lang.org/issues/16806
[Bug #16889]:         https://bugs.ruby-lang.org/issues/16889
[Bug #16908]:         https://bugs.ruby-lang.org/issues/16908
[Feature #16989]:     https://bugs.ruby-lang.org/issues/16989
[Feature #17351]:     https://bugs.ruby-lang.org/issues/17351
[Feature #17391]:     https://bugs.ruby-lang.org/issues/17391
[Bug #17545]:         https://bugs.ruby-lang.org/issues/17545
[Bug #17767]:         https://bugs.ruby-lang.org/issues/17767
[Feature #17837]:     https://bugs.ruby-lang.org/issues/17837
[Feature #17881]:     https://bugs.ruby-lang.org/issues/17881
[Feature #18033]:     https://bugs.ruby-lang.org/issues/18033
[Feature #18159]:     https://bugs.ruby-lang.org/issues/18159
[Feature #18239]:     https://bugs.ruby-lang.org/issues/18239#note-17
[Feature #18351]:     https://bugs.ruby-lang.org/issues/18351
[Feature #18367]:     https://bugs.ruby-lang.org/issues/18367
[Bug #18435]:         https://bugs.ruby-lang.org/issues/18435
[Feature #18462]:     https://bugs.ruby-lang.org/issues/18462
[Feature #18481]:     https://bugs.ruby-lang.org/issues/18481
[Bug #18487]:         https://bugs.ruby-lang.org/issues/18487
[Feature #18564]:     https://bugs.ruby-lang.org/issues/18564
[Feature #18571]:     https://bugs.ruby-lang.org/issues/18571
[Feature #18585]:     https://bugs.ruby-lang.org/issues/18585
[Feature #18589]:     https://bugs.ruby-lang.org/issues/18589
[Feature #18595]:     https://bugs.ruby-lang.org/issues/18595
[Feature #18598]:     https://bugs.ruby-lang.org/issues/18598
[Bug #18625]:         https://bugs.ruby-lang.org/issues/18625
[Feature #18630]:     https://bugs.ruby-lang.org/issues/18630
[Bug #18633]:         https://bugs.ruby-lang.org/issues/18633
[Feature #18639]:     https://bugs.ruby-lang.org/issues/18639
[Feature #18685]:     https://bugs.ruby-lang.org/issues/18685
[Bug #18729]:         https://bugs.ruby-lang.org/issues/18729
[Bug #18751]:         https://bugs.ruby-lang.org/issues/18751
[Feature #18774]:     https://bugs.ruby-lang.org/issues/18774
[Feature #18776]:     https://bugs.ruby-lang.org/issues/18776
[Bug #18782]:         https://bugs.ruby-lang.org/issues/18782
[Feature #18788]:     https://bugs.ruby-lang.org/issues/18788
[Feature #18798]:     https://bugs.ruby-lang.org/issues/18798
[Feature #18809]:     https://bugs.ruby-lang.org/issues/18809
[Feature #18821]:     https://bugs.ruby-lang.org/issues/18821
[Feature #18822]:     https://bugs.ruby-lang.org/issues/18822
[Feature #18824]:     https://bugs.ruby-lang.org/issues/18824
[Feature #18832]:     https://bugs.ruby-lang.org/issues/18832
[Feature #18875]:     https://bugs.ruby-lang.org/issues/18875
[Feature #18925]:     https://bugs.ruby-lang.org/issues/18925
[Feature #18944]:     https://bugs.ruby-lang.org/issues/18944
[Feature #18949]:     https://bugs.ruby-lang.org/issues/18949
[Feature #18968]:     https://bugs.ruby-lang.org/issues/18968
[Feature #19008]:     https://bugs.ruby-lang.org/issues/19008
[Feature #19013]:     https://bugs.ruby-lang.org/issues/19013
[Feature #19026]:     https://bugs.ruby-lang.org/issues/19026
[Feature #19036]:     https://bugs.ruby-lang.org/issues/19036
[Feature #19060]:     https://bugs.ruby-lang.org/issues/19060
[Feature #19070]:     https://bugs.ruby-lang.org/issues/19070
[Feature #19071]:     https://bugs.ruby-lang.org/issues/19071
[Feature #19078]:     https://bugs.ruby-lang.org/issues/19078
[Bug #19087]:         https://bugs.ruby-lang.org/issues/19087
[Bug #19100]:         https://bugs.ruby-lang.org/issues/19100
[Feature #19104]:     https://bugs.ruby-lang.org/issues/19104
[Feature #19135]:     https://bugs.ruby-lang.org/issues/19135
[Feature #19138]:     https://bugs.ruby-lang.org/issues/19138
[Feature #19194]:     https://bugs.ruby-lang.org/issues/19194
[Molinillo]:          https://github.com/CocoaPods/Molinillo
[PubGrub]:            https://github.com/jhawthorn/pub_grub
[GH-net-protocol-14]: https://github.com/ruby/net-protocol/pull/14
[GH-pathname-20]:     https://github.com/ruby/pathname/pull/20
[GH-6791]:            https://github.com/ruby/ruby/pull/6791
[GH-6868]:            https://github.com/ruby/ruby/pull/6868
[GH-rubygems-4475]:   https://github.com/rubygems/rubygems/pull/4475
[GH-rubygems-6149]:   https://github.com/rubygems/rubygems/pull/6149
[GH-rubygems-6167]:   https://github.com/rubygems/rubygems/pull/6167
[sec-156615]:         https://hackerone.com/reports/156615
[CVE-2021-33621]:     https://www.ruby-lang.org/en/news/2022/11/22/http-response-splitting-in-cgi-cve-2021-33621/
[wasm/README.md]:     https://github.com/ruby/ruby/blob/master/wasm/README.md
[ruby.wasm]:          https://github.com/ruby/ruby.wasm
