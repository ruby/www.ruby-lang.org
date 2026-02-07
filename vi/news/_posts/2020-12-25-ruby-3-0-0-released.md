---
layout: news_post
title: "Phát hành Ruby 3.0.0"
author: "naruse"
translator:
date: 2020-12-25 00:00:00 +0000
lang: vi
---

Chúng tôi vui mừng thông báo phát hành Ruby 3.0.0. Từ năm 2015, chúng tôi đã nỗ lực phát triển Ruby 3, với mục tiêu về hiệu năng, đồng thời và kiểu dữ liệu. Đặc biệt về hiệu năng, Matz đã tuyên bố "Ruby3 sẽ nhanh gấp 3 lần Ruby2" hay còn gọi là [Ruby 3x3](https://blog.heroku.com/ruby-3-by-3).

{% assign release = site.data.releases | where: "version", "3.0.0" | first %}

<img src='https://cache.ruby-lang.org/pub/media/ruby3x3.png' alt='Optcarrot 3000 frames' width='100%' />

Với [benchmark Optcarrot](https://github.com/mame/optcarrot), đo hiệu năng đơn luồng dựa trên khối lượng công việc mô phỏng trò chơi NES, Ruby đã đạt hiệu năng nhanh gấp 3 lần so với Ruby 2.0! <details>Các phép đo được thực hiện trong môi trường được ghi chú tại [benchmark-driver.github.io/hardware.html](https://benchmark-driver.github.io/hardware.html). [Commit 8c510e4095](https://github.com/ruby/ruby/commit/8c510e4095) được sử dụng làm Ruby 3.0. Tốc độ có thể không nhanh gấp 3 lần tùy thuộc vào môi trường hoặc benchmark của bạn.</details>

Ruby 3.0.0 đạt được các mục tiêu đó thông qua
* Hiệu năng
  * MJIT
* Đồng thời
  * Ractor
  * Fiber Scheduler
* Kiểu dữ liệu (Phân tích tĩnh)
  * RBS
  * TypeProf

Với cải thiện hiệu năng ở trên, Ruby 3.0 giới thiệu một số tính năng mới được mô tả dưới đây.

## Hiệu năng

> Khi tôi lần đầu tuyên bố "Ruby3x3" trong bài phát biểu chính tại hội nghị, nhiều người kể cả thành viên đội ngũ core đã cảm thấy "Matz nói khoác". Thực tế, tôi cũng cảm thấy vậy. Nhưng chúng tôi đã làm được. Tôi vinh dự khi thấy đội ngũ core thực sự đã hoàn thành việc làm cho Ruby3.0 nhanh gấp ba lần Ruby2.0 (trong một số benchmark). -- Matz

### MJIT

Nhiều cải tiến đã được thực hiện trong MJIT. Xem NEWS để biết chi tiết.

Tính đến Ruby 3.0, JIT được cho là cải thiện hiệu năng trong các khối lượng công việc giới hạn, chẳng hạn như trò chơi ([Optcarrot](https://benchmark-driver.github.io/benchmarks/optcarrot/commits.html#chart-1)), AI ([Rubykon](https://benchmark-driver.github.io/benchmarks/rubykon/commits.html)), hoặc bất kỳ ứng dụng nào dành phần lớn thời gian để gọi một vài phương thức nhiều lần.

Mặc dù Ruby 3.0 [đã giảm đáng kể kích thước mã JIT-ed](https://twitter.com/k0kubun/status/1256142302608650244), nó vẫn chưa sẵn sàng để tối ưu hóa các khối lượng công việc như Rails, vốn thường dành thời gian cho rất nhiều phương thức và do đó bị ảnh hưởng bởi i-cache miss bị trầm trọng hóa bởi JIT. Hãy đón chờ Ruby 3.1 để có thêm cải tiến về vấn đề này.

## Đồng thời / Song song

> Đây là thời đại đa nhân. Đồng thời là rất quan trọng. Với Ractor, cùng với Async Fiber, Ruby sẽ trở thành ngôn ngữ đồng thời thực sự. --- Matz

### Ractor (thử nghiệm)

Ractor là một abstraction đồng thời theo mô hình Actor, được thiết kế để cung cấp tính năng thực thi song song mà không lo ngại về an toàn luồng.

Bạn có thể tạo nhiều ractor và chạy chúng song song. Ractor cho phép bạn tạo các chương trình song song an toàn luồng vì các ractor không thể chia sẻ các đối tượng thông thường. Giao tiếp giữa các ractor được hỗ trợ thông qua trao đổi tin nhắn.

Để giới hạn việc chia sẻ đối tượng, Ractor đưa ra một số hạn chế đối với cú pháp Ruby (không có nhiều Ractor thì không có hạn chế).

Đặc tả và triển khai chưa hoàn thiện và có thể thay đổi trong tương lai, vì vậy tính năng này được đánh dấu là thử nghiệm và hiển thị cảnh báo "tính năng thử nghiệm" khi `Ractor.new` đầu tiên được gọi.

Chương trình nhỏ sau đo thời gian thực thi của hàm benchmark nổi tiếng tak ([Tak (function) - Wikipedia](https://en.wikipedia.org/wiki/Tak_(function))), bằng cách thực thi nó 4 lần tuần tự hoặc 4 lần song song với ractor.

``` ruby
def tarai(x, y, z) =
  x <= y ? y : tarai(tarai(x-1, y, z),
                     tarai(y-1, z, x),
                     tarai(z-1, x, y))
require 'benchmark'
Benchmark.bm do |x|
  # sequential version
  x.report('seq'){ 4.times{ tarai(14, 7, 0) } }

  # parallel version
  x.report('par'){
    4.times.map do
      Ractor.new { tarai(14, 7, 0) }
    end.each(&:take)
  }
end
```

```
Benchmark result:
          user     system      total        real
seq  64.560736   0.001101  64.561837 ( 64.562194)
par  66.422010   0.015999  66.438009 ( 16.685797)
```

Kết quả được đo trên Ubuntu 20.04, Intel(R) Core(TM) i7-6700 (4 lõi, 8 luồng phần cứng). Cho thấy phiên bản song song nhanh gấp 3.87 lần so với phiên bản tuần tự.

Xem [doc/ractor.md](https://docs.ruby-lang.org/en/3.0/ractor_md.html) để biết thêm chi tiết.

### Fiber Scheduler

`Fiber#scheduler` được giới thiệu để chặn các thao tác blocking. Điều này cho phép đồng thời nhẹ mà không cần thay đổi mã hiện tại. Xem ["Don't Wait For Me, Scalable Concurrency for Ruby 3"](https://www.youtube.com/watch?v=Y29SSOS4UOc) để có cái nhìn tổng quan về cách hoạt động.

Các lớp/phương thức hiện đang được hỗ trợ:

- `Mutex#lock`, `Mutex#unlock`, `Mutex#sleep`
- `ConditionVariable#wait`
- `Queue#pop`, `SizedQueue#push`
- `Thread#join`
- `Kernel#sleep`
- `Process.wait`
- `IO#wait`, `IO#read`, `IO#write`, và các phương thức liên quan (ví dụ: `#wait_readable`, `#gets`, `#puts`, v.v.).
- `IO#select` *không được hỗ trợ*.

Chương trình ví dụ này sẽ thực hiện nhiều request HTTP đồng thời:

``` ruby
require 'async'
require 'net/http'
require 'uri'

Async do
  ["ruby", "rails", "async"].each do |topic|
    Async do
      Net::HTTP.get(URI "https://www.google.com/search?q=#{topic}")
    end
  end
end
```

Nó sử dụng [async](https://github.com/socketry/async) cung cấp vòng lặp sự kiện. Vòng lặp sự kiện này sử dụng các hook `Fiber#scheduler` để làm `Net::HTTP` non-blocking. Các gem khác có thể sử dụng giao diện này để cung cấp thực thi non-blocking cho Ruby, và các gem đó có thể tương thích với các triển khai khác của Ruby (ví dụ: JRuby, TruffleRuby) hỗ trợ cùng các hook non-blocking.

## Phân tích tĩnh

> Thập niên 2010 là thời đại của các ngôn ngữ lập trình kiểu tĩnh. Ruby tìm kiếm tương lai với kiểm tra kiểu tĩnh, mà không cần khai báo kiểu, sử dụng diễn giải trừu tượng. RBS & TypeProf là bước đầu tiên hướng tới tương lai. Sẽ còn nhiều bước tiếp theo. --- Matz

### RBS

RBS là một ngôn ngữ để mô tả kiểu dữ liệu của chương trình Ruby.

Các công cụ kiểm tra kiểu bao gồm TypeProf và các công cụ khác hỗ trợ RBS sẽ hiểu chương trình Ruby tốt hơn nhiều với các định nghĩa RBS.

Bạn có thể viết định nghĩa cho các lớp và module: các phương thức được định nghĩa trong lớp, biến instance và kiểu dữ liệu của chúng, cũng như các quan hệ kế thừa/mix-in.

Mục tiêu của RBS là hỗ trợ các mẫu thường thấy trong chương trình Ruby và cho phép viết các kiểu nâng cao bao gồm kiểu union, nạp chồng phương thức và generic. RBS cũng hỗ trợ duck typing với _kiểu interface_.

Ruby 3.0 đi kèm với gem `rbs`, cho phép phân tích và xử lý các định nghĩa kiểu được viết bằng RBS.
Dưới đây là một ví dụ nhỏ về RBS với các định nghĩa lớp, module và hằng số.

``` rbs
module ChatApp
  VERSION: String
  class Channel
    attr_reader name: String
    attr_reader messages: Array[Message]
    attr_reader users: Array[User | Bot]              # `|` means union types, `User` or `Bot`.
    def initialize: (String) -> void
    def post: (String, from: User | Bot) -> Message   # Method overloading is supported.
            | (File, from: User | Bot) -> Message
  end
end
```

Xem [README của gem rbs](https://github.com/ruby/rbs) để biết thêm chi tiết.

### TypeProf

TypeProf là một công cụ phân tích kiểu được đi kèm trong gói Ruby.

Hiện tại, TypeProf hoạt động như một loại suy luận kiểu.

Nó đọc mã Ruby thuần (không có chú thích kiểu), phân tích các phương thức được định nghĩa và cách chúng được sử dụng, và tạo ra một bản mẫu chữ ký kiểu ở định dạng RBS.

Đây là một demo đơn giản về TypeProf.

Đầu vào mẫu:

``` ruby
# test.rb
class User
  def initialize(name:, age:)
    @name, @age = name, age
  end
  attr_reader :name, :age
end
User.new(name: "John", age: 20)
```

Đầu ra mẫu:

```
$ typeprof test.rb
# Classes
class User
  attr_reader name : String
  attr_reader age : Integer
  def initialize : (name: String, age: Integer) -> [String, Integer]
end
```

Bạn có thể chạy TypeProf bằng cách lưu đầu vào thành "test.rb" và gọi lệnh "typeprof test.rb".

Bạn cũng có thể [thử TypeProf trực tuyến](https://mame.github.io/typeprof-playground/#rb=%23+test.rb%0Aclass+User%0A++def+initialize%28name%3A%2C+age%3A%29%0A++++%40name%2C+%40age+%3D+name%2C+age%0A++end%0A++%0A++attr_reader+%3Aname%2C+%3Aage%0Aend%0A%0AUser.new%28name%3A+%22John%22%2C+age%3A+20%29&rbs=). (Nó chạy TypeProf ở phía máy chủ, xin lỗi nếu không hoạt động!)

Xem [tài liệu TypeProf](https://github.com/ruby/typeprof/blob/master/doc/doc.md) và [demo](https://github.com/ruby/typeprof/blob/master/doc/demo.md) để biết chi tiết.

TypeProf đang trong giai đoạn thử nghiệm và chưa hoàn thiện; chỉ một tập con của ngôn ngữ Ruby được hỗ trợ, và khả năng phát hiện lỗi kiểu còn hạn chế. Nhưng nó đang phát triển nhanh chóng để cải thiện phạm vi hỗ trợ các tính năng ngôn ngữ, hiệu suất phân tích và tính dễ sử dụng. Mọi phản hồi đều được hoan nghênh.

## Các tính năng mới đáng chú ý khác

* Khớp mẫu một dòng được thiết kế lại. (thử nghiệm)

    * `=>` đã được thêm vào. Nó có thể được sử dụng như phép gán hướng phải.

      ```ruby
      0 => a
      p a #=> 0

      {b: 0, c: 1} => {b:}
      p b #=> 0
      ```

    * `in` được thay đổi để trả về `true` hoặc `false`.

      ```ruby
      # version 3.0
      0 in 1 #=> false

      # version 2.7
      0 in 1 #=> raise NoMatchingPatternError
      ```

* Mẫu tìm kiếm (find pattern) đã được thêm vào. (thử nghiệm)

  ``` ruby
  case ["a", 1, "b", "c", 2, "d", "e", "f", 3]
  in [*pre, String => x, String => y, *post]
    p pre  #=> ["a", 1]
    p x    #=> "b"
    p y    #=> "c"
    p post #=> [2, "d", "e", "f", 3]
  end
  ```

* Định nghĩa phương thức không kết thúc đã được thêm vào.

  ``` ruby
  def square(x) = x * x
  ```

* `Hash#except` giờ đã có sẵn.

  ``` ruby
  h = { a: 1, b: 2, c: 3 }
  p h.except(:a) #=> {:b=>2, :c=>3}
  ```

* Memory view đã được thêm như một tính năng thử nghiệm

    * Đây là một bộ C-API mới để trao đổi vùng bộ nhớ thô, chẳng hạn như mảng số hoặc ảnh bitmap, giữa các thư viện mở rộng. Các thư viện mở rộng cũng có thể chia sẻ metadata của vùng bộ nhớ bao gồm hình dạng, định dạng phần tử, v.v. Sử dụng những loại metadata này, các thư viện mở rộng có thể chia sẻ ngay cả mảng đa chiều một cách phù hợp. Tính năng này được thiết kế tham khảo từ buffer protocol của Python.

## Cải thiện hiệu năng

* Dán mã dài vào IRB nhanh hơn 53 lần so với phiên bản đi kèm Ruby 2.7.0. Ví dụ, thời gian cần thiết để dán [mã mẫu này](https://gist.github.com/aycabta/30ab96334275bced5796f118c9220b0b) giảm từ 11.7 giây xuống 0.22 giây.


<video autoplay="autoplay" controls="controls" muted="muted" width="764" height="510" poster="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.png">
  <source src="https://cache.ruby-lang.org/pub/media/ruby-3.0-irb-highspeed.mp4" type="video/mp4">
</video>


* Lệnh `measure` đã được thêm vào IRB. Nó cho phép đo thời gian thực thi đơn giản.

  ```
  irb(main):001:0> 3
  => 3
  irb(main):002:0> measure
  TIME is added.
  => nil
  irb(main):003:0> 3
  processing time: 0.000058s
  => 3
  irb(main):004:0> measure :off
  => nil
  irb(main):005:0> 3
  => 3
  ```

## Các thay đổi đáng chú ý khác kể từ 2.7

* Tham số từ khóa được tách riêng khỏi các tham số khác.
  * Về nguyên tắc, mã hiển thị cảnh báo trên Ruby 2.7 sẽ không hoạt động. Xem [tài liệu này](https://www.ruby-lang.org/en/news/2019/12/12/separation-of-positional-and-keyword-arguments-in-ruby-3-0/) để biết chi tiết.
  * Ngoài ra, chuyển tiếp tham số giờ đã hỗ trợ tham số đứng đầu.

    ``` ruby
    def method_missing(meth, ...)
      send(:"do_#{ meth }", ...)
    end
    ```

* Khớp mẫu (`case`/`in`) không còn là thử nghiệm.
  * Xem [tài liệu khớp mẫu](https://docs.ruby-lang.org/en/3.0/syntax/pattern_matching_rdoc.html) để biết chi tiết.
* Tính năng `$SAFE` đã bị loại bỏ hoàn toàn; giờ nó là một biến toàn cục bình thường.
* Thứ tự backtrace đã bị đảo ngược ở Ruby 2.5; thay đổi này đã được hoàn tác. Giờ backtrace hoạt động như Ruby 2.4: thông báo lỗi và số dòng nơi ngoại lệ xảy ra được in trước, và các hàm gọi được in sau.
* Một số thư viện chuẩn đã được cập nhật.
  * RubyGems 3.2.3
  * Bundler 2.2.3
  * IRB 1.3.0
  * Reline 0.2.0
  * Psych 3.3.0
  * JSON 2.5.1
  * BigDecimal 3.0.0
  * CSV 3.1.9
  * Date 3.1.0
  * Digest 3.0.0
  * Fiddle 1.0.6
  * StringIO 3.0.0
  * StringScanner 3.0.0
  * v.v.
* Các thư viện sau không còn là bundled gem hoặc thư viện chuẩn.
  Cài đặt các gem tương ứng để sử dụng các tính năng này.
  * sdbm
  * webrick
  * net-telnet
  * xmlrpc
* Các default gem sau giờ là bundled gem.
  * rexml
  * rss
* Các tệp stdlib sau giờ là default gem và được xuất bản trên rubygems.org.
  * English
  * abbrev
  * base64
  * drb
  * debug
  * erb
  * find
  * net-ftp
  * net-http
  * net-imap
  * net-protocol
  * open-uri
  * optparse
  * pp
  * prettyprint
  * resolv-replace
  * resolv
  * rinda
  * set
  * securerandom
  * shellwords
  * tempfile
  * tmpdir
  * time
  * tsort
  * un
  * weakref
  * digest
  * io-nonblock
  * io-wait
  * nkf
  * pathname
  * syslog
  * win32ole

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa bỏ(-)](https://github.com/ruby/ruby/compare/v2_7_0...{{ release.tag }}#file_bucket)
kể từ Ruby 2.7.0!

> Ruby3.0 là một cột mốc. Ngôn ngữ đã tiến hóa, giữ được tính tương thích. Nhưng đây không phải là kết thúc. Ruby sẽ tiếp tục phát triển, và trở nên tuyệt vời hơn nữa. Hãy đón chờ! --- Matz

Chúc Giáng sinh vui vẻ, Kỳ nghỉ hạnh phúc, và hãy tận hưởng lập trình với Ruby 3.0!

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

Ruby được phát triển lần đầu bởi Matz (Yukihiro Matsumoto) vào năm 1993
và hiện được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng
và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.
