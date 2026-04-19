---
layout: news_post
title: "Ruby 3.3.0 đã được phát hành"
author: "naruse"
translator:
date: 2023-12-25 00:00:00 +0000
lang: vi
---

{% assign release = site.data.releases | where: "version", "3.3.0" | first %}
Chúng tôi vui mừng thông báo phiên bản Ruby {{ release.version }} đã được phát hành. Ruby 3.3 bổ sung một parser mới có tên Prism, sử dụng Lrama làm trình tạo parser, bổ sung một trình biên dịch JIT thuần Ruby mới có tên RJIT, và nhiều cải thiện hiệu suất đặc biệt là YJIT.

## Prism

* Giới thiệu [parser Prism](https://github.com/ruby/prism) như một default gem
    * Prism là một parser đệ quy giảm dần di động, chịu lỗi tốt và dễ bảo trì cho ngôn ngữ Ruby
* Prism đã sẵn sàng cho sản xuất và được bảo trì tích cực, bạn có thể sử dụng nó thay thế Ripper
    * Có [tài liệu đầy đủ](https://ruby.github.io/prism/) về cách sử dụng Prism
    * Prism vừa là thư viện C sẽ được sử dụng nội bộ bởi CRuby vừa là Ruby gem có thể được sử dụng bởi bất kỳ công cụ nào cần phân tích mã Ruby
    * Các phương thức đáng chú ý trong Prism API là:
        * `Prism.parse(source)` trả về AST như một phần của đối tượng kết quả phân tích
        * `Prism.parse_comments(source)` trả về các comment
        * `Prism.parse_success?(source)` trả về true nếu không có lỗi
* Bạn có thể tạo pull request hoặc issue trực tiếp trên [kho lưu trữ Prism](https://github.com/ruby/prism) nếu bạn quan tâm đến việc đóng góp
* Bạn hiện có thể sử dụng `ruby --parser=prism` hoặc `RUBYOPT="--parser=prism"` để thử nghiệm trình biên dịch Prism. Xin lưu ý rằng cờ này chỉ dùng cho mục đích gỡ lỗi.

## Sử dụng Lrama thay thế Bison

* Thay thế Bison bằng [trình tạo parser LALR Lrama](https://github.com/ruby/lrama) [[Feature #19637]](https://bugs.ruby-lang.org/issues/19637)
  * Nếu bạn quan tâm, vui lòng xem [Tầm nhìn tương lai của Ruby Parser](https://rubykaigi.org/2023/presentations/spikeolaf.html)
  * Parser nội bộ của Lrama được thay thế bằng parser LR được tạo bởi Racc để dễ bảo trì
  * Các quy tắc tham số hóa `(?, *, +)` được hỗ trợ, chúng sẽ được sử dụng trong Ruby parse.y

## YJIT

* Cải thiện hiệu suất lớn so với Ruby 3.2
  * Hỗ trợ cho splat và rest arguments đã được cải thiện.
  * Các thanh ghi được phân bổ cho các thao tác ngăn xếp của máy ảo.
  * Nhiều lời gọi với tham số tùy chọn được biên dịch hơn. Các trình xử lý ngoại lệ cũng được biên dịch.
  * Các loại lời gọi không được hỗ trợ và các vị trí gọi đa hình không còn thoát ra trình thông dịch.
  * Các phương thức cơ bản như Rails `#blank?` và
    [`#present?` chuyên biệt](https://github.com/rails/rails/pull/49909) được inline hóa.
  * `Integer#*`, `Integer#!=`, `String#!=`, `String#getbyte`,
    `Kernel#block_given?`, `Kernel#is_a?`, `Kernel#instance_of?`, và `Module#===`
    được tối ưu hóa đặc biệt.
  * Tốc độ biên dịch hiện nhanh hơn một chút so với Ruby 3.2.
  * Hiện nhanh hơn 3 lần so với trình thông dịch trên Optcarrot!
* Cải thiện đáng kể việc sử dụng bộ nhớ so với Ruby 3.2
    * Metadata cho mã đã biên dịch sử dụng ít bộ nhớ hơn nhiều.
    * `--yjit-call-threshold` tự động được tăng từ 30 lên 120
      khi ứng dụng có hơn 40.000 ISEQ.
    * `--yjit-cold-threshold` được thêm vào để bỏ qua việc biên dịch các ISEQ lạnh.
    * Sinh mã nhỏ gọn hơn trên Arm64.
* Code GC hiện bị tắt theo mặc định
  * `--yjit-exec-mem-size` được coi là giới hạn cứng nơi việc biên dịch mã mới dừng lại.
  * Không có sự sụt giảm đột ngột về hiệu suất do code GC.
    Hành vi copy-on-write tốt hơn trên các máy chủ reforking với
    [Pitchfork](https://github.com/shopify/pitchfork).
  * Bạn vẫn có thể bật code GC nếu muốn với `--yjit-code-gc`
* Thêm `RubyVM::YJIT.enable` cho phép bật YJIT tại thời điểm chạy
  * Bạn có thể khởi động YJIT mà không cần thay đổi tham số dòng lệnh hoặc biến môi trường.
    Rails 7.2 sẽ [bật YJIT theo mặc định](https://github.com/rails/rails/pull/49947)
    sử dụng phương thức này.
  * Điều này cũng có thể được sử dụng để chỉ bật YJIT sau khi ứng dụng của bạn
    đã khởi động xong. `--yjit-disable` có thể được sử dụng nếu bạn muốn dùng các
    tùy chọn YJIT khác trong khi tắt YJIT khi khởi động.
* Nhiều thống kê YJIT hơn có sẵn theo mặc định
  * `yjit_alloc_size` và một số thống kê liên quan đến metadata khác hiện có sẵn theo mặc định.
  * Thống kê `ratio_in_yjit` được tạo bởi `--yjit-stats` hiện có sẵn trong các bản phát hành chính thức,
    không còn cần bản build stats hoặc dev đặc biệt để truy cập hầu hết các thống kê.
* Thêm nhiều khả năng profiling
  * `--yjit-perf` được thêm vào để hỗ trợ profiling với Linux perf.
  * `--yjit-trace-exits` hiện hỗ trợ lấy mẫu với `--yjit-trace-exits-sample-rate=N`
* Kiểm thử kỹ lưỡng hơn và nhiều bản sửa lỗi

## RJIT

* Giới thiệu trình biên dịch JIT thuần Ruby RJIT và thay thế MJIT.
  * RJIT chỉ hỗ trợ kiến trúc x86-64 trên các nền tảng Unix.
  * Không giống như MJIT, nó không yêu cầu trình biên dịch C tại thời điểm chạy.
* RJIT chỉ tồn tại cho mục đích thử nghiệm.
  * Bạn nên tiếp tục sử dụng YJIT trong môi trường sản xuất.
* Nếu bạn quan tâm đến việc phát triển JIT cho Ruby, vui lòng xem [bài thuyết trình của k0kubun vào Ngày 3 của RubyKaigi](https://rubykaigi.org/2023/presentations/k0kubun.html#day3).

## Bộ lập lịch luồng M:N

* Bộ lập lịch luồng M:N đã được giới thiệu. [[Feature #19842]](https://bugs.ruby-lang.org/issues/19842)
  * M luồng Ruby được quản lý bởi N luồng native (luồng hệ điều hành) nên chi phí tạo và quản lý luồng được giảm.
  * Nó có thể phá vỡ tính tương thích C-extension nên bộ lập lịch luồng M:N bị tắt trên Ractor chính theo mặc định.
      * Biến môi trường `RUBY_MN_THREADS=1` bật luồng M:N trên Ractor chính.
      * Luồng M:N luôn được bật trên các Ractor không phải chính.
  * Biến môi trường `RUBY_MAX_CPU=n` đặt số lượng tối đa của `N` (số lượng tối đa luồng native). Giá trị mặc định là 8.
      * Vì chỉ một luồng Ruby trên mỗi Ractor có thể chạy cùng lúc, số lượng luồng native sẽ được sử dụng là giá trị nhỏ hơn giữa số được chỉ định trong `RUBY_MAX_CPU` và số lượng Ractor đang chạy. Vì vậy các ứng dụng đơn Ractor (hầu hết các ứng dụng) sẽ chỉ sử dụng 1 luồng native.
      * Để hỗ trợ các thao tác blocking, nhiều hơn `N` luồng native có thể được sử dụng.

## Cải thiện hiệu suất

* `defined?(@ivar)` được tối ưu hóa với Object Shapes.
* Phân giải tên như `Socket.getaddrinfo` hiện có thể bị gián đoạn (trong các môi trường có sẵn pthreads). [[Feature #19965]](https://bugs.ruby-lang.org/issues/19965)
* Một số cải thiện hiệu suất cho Bộ thu gom rác
  * Các đối tượng trẻ được tham chiếu bởi các đối tượng cũ không còn được
      thăng cấp ngay lập tức lên thế hệ cũ. Điều này giảm đáng kể tần suất
      thu gom GC lớn. [[Feature #19678]](https://bugs.ruby-lang.org/issues/19678)
  * Biến điều chỉnh mới `REMEMBERED_WB_UNPROTECTED_OBJECTS_LIMIT_RATIO` được
      giới thiệu để kiểm soát số lượng đối tượng không được bảo vệ gây kích hoạt
      thu gom GC lớn. Mặc định được đặt thành `0.01` (1%). Điều này giảm đáng kể
      tần suất thu gom GC lớn. [[Feature #19571]](https://bugs.ruby-lang.org/issues/19571)
  * Write Barriers đã được triển khai cho nhiều kiểu lõi thiếu chúng,
      đặc biệt là `Time`, `Enumerator`, `MatchData`, `Method`, `File::Stat`, `BigDecimal`
      và một số kiểu khác. Điều này giảm đáng kể thời gian thu gom GC nhỏ và
      tần suất thu gom GC lớn.
  * Hầu hết các lớp lõi hiện sử dụng Variable Width Allocation, đặc biệt là `Hash`, `Time`,
      `Thread::Backtrace`, `Thread::Backtrace::Location`, `File::Stat`, `Method`.
      Điều này giúp các lớp này phân bổ và giải phóng nhanh hơn, sử dụng ít bộ nhớ hơn và giảm
      phân mảnh heap.
  * Hỗ trợ tham chiếu yếu đã được thêm vào bộ thu gom rác. [[Feature #19783]](https://bugs.ruby-lang.org/issues/19783)


## Các thay đổi đáng chú ý khác kể từ 3.2

### IRB

IRB đã nhận được nhiều cải tiến, bao gồm nhưng không giới hạn:

* Tích hợp `irb:rdbg` nâng cao cung cấp trải nghiệm gỡ lỗi tương đương với `pry-byebug` ([tài liệu](https://github.com/ruby/irb#debugging-with-irb)).
* Hỗ trợ phân trang cho các lệnh `ls`, `show_source` và `show_cmds`.
* Thông tin chính xác và hữu ích hơn được cung cấp bởi các lệnh `ls` và `show_source`.
* Tự động hoàn thành thử nghiệm sử dụng phân tích kiểu ([tài liệu](https://github.com/ruby/irb#type-based-completion)).
* Hiện có thể thay đổi màu phông chữ và kiểu phông chữ trong hộp thoại hoàn thành bằng lớp Reline::Face mới được giới thiệu ([tài liệu](https://github.com/ruby/ruby/blob/master/doc/reline/face.md))

Ngoài ra, IRB cũng đã trải qua quá trình tái cấu trúc rộng rãi và nhận được hàng chục bản sửa lỗi để tạo điều kiện cho các cải tiến trong tương lai.

Để biết thêm cập nhật chi tiết, vui lòng tham khảo [Unveiling the big leap in Ruby 3.3's IRB](https://railsatscale.com/2023-12-19-irb-for-ruby-3-3/).

## Vấn đề tương thích

Lưu ý: Không bao gồm các bản sửa lỗi tính năng.

* Các lời gọi `it` không có tham số trong một block không có tham số thông thường
  đã bị deprecated. `it` sẽ là tham chiếu đến tham số block đầu tiên trong Ruby 3.4.
  [[Feature #18980]](https://bugs.ruby-lang.org/issues/18980)

* `Regexp::new` hiện chỉ chấp nhận tối đa 2 tham số thay vì 3. Điều này đã bị
   deprecated trong Ruby 3.2. [[Bug #18797]](https://bugs.ruby-lang.org/issues/18797)

### Các biến môi trường đã bị loại bỏ

Các phương thức không còn được dùng sau đây đã bị loại bỏ.

* Biến môi trường `RUBY_GC_HEAP_INIT_SLOTS` đã bị deprecated và không có tác dụng. Vui lòng sử dụng các biến môi trường `RUBY_GC_HEAP_{0,1,2,3,4}_INIT_SLOTS` thay thế. [[Feature #19785]](https://bugs.ruby-lang.org/issues/19785)

## Vấn đề tương thích thư viện chuẩn

### `ext/readline` đã ngừng hoạt động

* Chúng tôi có `reline` là bản triển khai thuần Ruby tương thích với API `ext/readline`. Chúng tôi sẽ dựa vào `reline` trong tương lai. Nếu bạn cần sử dụng `ext/readline`, bạn có thể cài đặt `ext/readline` thông qua rubygems.org với `gem install readline-ext`.
* Chúng tôi không còn cần cài đặt các thư viện như `libreadline` hay `libedit`.

## Cập nhật thư viện chuẩn

RubyGems và Bundler cảnh báo nếu người dùng `require` các gem sau đây mà không thêm chúng vào Gemfile hoặc gemspec. Điều này là do chúng sẽ trở thành bundled gem trong phiên bản Ruby tương lai.

Cảnh báo này bị tắt nếu bạn sử dụng gem bootsnap. Chúng tôi khuyến nghị chạy ứng dụng của bạn với biến môi trường `DISABLE_BOOTSNAP=1` ít nhất một lần. Đây là hạn chế của phiên bản này.

Các thư viện mục tiêu là:
  * abbrev
  * base64
  * bigdecimal
  * csv
  * drb
  * getoptlong
  * mutex_m
  * nkf
  * observer
  * racc
  * resolv-replace
  * rinda
  * syslog

Default gem sau đây đã được thêm vào.

* prism 0.19.0

Các default gem sau đây đã được cập nhật.

* RubyGems 3.5.3
* abbrev 0.1.2
* base64 0.2.0
* benchmark 0.3.0
* bigdecimal 3.1.5
* bundler 2.5.3
* cgi 0.4.1
* csv 3.2.8
* date 3.3.4
* delegate 0.3.1
* drb 2.2.0
* english 0.8.0
* erb 4.0.3
* error_highlight 0.6.0
* etc 1.4.3
* fcntl 1.1.0
* fiddle 1.1.2
* fileutils 1.7.2
* find 0.2.0
* getoptlong 0.2.1
* io-console 0.7.1
* io-nonblock 0.3.0
* io-wait 0.3.1
* ipaddr 1.2.6
* irb 1.11.0
* json 2.7.1
* logger 1.6.0
* mutex_m 0.2.0
* net-http 0.4.0
* net-protocol 0.2.2
* nkf 0.1.3
* observer 0.1.2
* open-uri 0.4.1
* open3 0.2.1
* openssl 3.2.0
* optparse 0.4.0
* ostruct 0.6.0
* pathname 0.3.0
* pp 0.5.0
* prettyprint 0.2.0
* pstore 0.1.3
* psych 5.1.2
* rdoc 6.6.2
* readline 0.0.4
* reline 0.4.1
* resolv 0.3.0
* rinda 0.2.0
* securerandom 0.3.1
* set 1.1.0
* shellwords 0.2.0
* singleton 0.2.0
* stringio 3.1.0
* strscan 3.0.7
* syntax_suggest 2.0.0
* syslog 0.1.2
* tempfile 0.2.1
* time 0.3.0
* timeout 0.4.1
* tmpdir 0.2.0
* tsort 0.2.0
* un 0.3.0
* uri 0.13.0
* weakref 0.1.3
* win32ole 1.8.10
* yaml 0.3.0
* zlib 3.1.0

Bundled gem sau đây đã được thăng cấp từ default gem.

* racc 1.7.3

Các bundled gem sau đây đã được cập nhật.

* minitest 5.20.0
* rake 13.1.0
* test-unit 3.6.1
* rexml 3.2.6
* rss 0.3.0
* net-ftp 0.3.3
* net-imap 0.4.9
* net-smtp 0.4.0
* rbs 3.4.0
* typeprof 0.21.9
* debug 1.9.1

Xem các bản phát hành trên GitHub như [Logger](https://github.com/ruby/logger/releases) hoặc
changelog để biết chi tiết về các default gem hoặc bundled gem.

Xem [NEWS](https://github.com/ruby/ruby/blob/{{ release.tag }}/NEWS.md)
hoặc [nhật ký commit](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }})
để biết thêm chi tiết.

Với những thay đổi đó, [{{ release.stats.files_changed }} tệp đã thay đổi, {{ release.stats.insertions }} thêm vào(+), {{ release.stats.deletions }} xóa đi(-)](https://github.com/ruby/ruby/compare/v3_2_0...{{ release.tag }}#file_bucket)
kể từ Ruby 3.2.0!

Chúc mừng Giáng sinh, chúc mừng ngày lễ, và hãy tận hưởng lập trình với Ruby 3.3!

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
và hiện được phát triển dưới dạng Mã nguồn Mở. Nó chạy trên nhiều nền tảng
và được sử dụng trên toàn thế giới, đặc biệt cho phát triển web.
