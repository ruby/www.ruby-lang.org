---
layout: page
title: "Câu hỏi thường gặp về Ruby"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Content">Content</a>
    <span class="separator"> | </span>
    <strong>1</strong>
    <span class="separator"> | </span>
    <a href="../2/" title="Part 2">2</a>
    <span class="separator"> | </span>
    <a href="../3/" title="Part 3">3</a>
    <span class="separator"> | </span>
    <a href="../4/" title="Part 4">4</a>
    <span class="separator"> | </span>
    <a href="../5/" title="Part 5">5</a>
    <span class="separator"> | </span>
    <a href="../6/" title="Part 6">6</a>
    <span class="separator"> | </span>
    <a href="../7/" title="Part 7">7</a>
    <span class="separator"> | </span>
    <a href="../8/" title="Part 8">8</a>
    <span class="separator"> | </span>
    <a href="../9/" title="Part 9">9</a>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

{% include faq-notice.md %}

## Câu hỏi chung

### Ruby là gì?

Ruby là một ngôn ngữ lập trình hướng đối tượng đơn giản và mạnh mẽ, được tạo ra bởi
Yukihiro Matsumoto (người sử dụng biệt danh "Matz" trong tài liệu này và trên các
danh sách gửi thư).

Giống như Perl, Ruby rất giỏi trong việc xử lý văn bản. Giống như Smalltalk, mọi thứ
trong Ruby đều là đối tượng, và Ruby có block, iterator, meta-class cùng nhiều
tính năng hay khác.

Bạn có thể sử dụng Ruby để viết server, thử nghiệm với prototype, và cho các
công việc lập trình hàng ngày. Là một ngôn ngữ hướng đối tượng hoàn chỉnh,
Ruby có khả năng mở rộng tốt.

Các tính năng của Ruby:

* Cú pháp đơn giản,
* Các tính năng OO cơ bản (lớp, phương thức, đối tượng, v.v.),
* Các tính năng OO đặc biệt (mixin, phương thức singleton, đổi tên, v.v.),
* Nạp chồng toán tử,
* Xử lý ngoại lệ,
* Iterator và closure,
* Bộ thu gom rác,
* Nạp động (tùy thuộc vào kiến trúc),
* Tính di động cao (chạy trên nhiều hệ Unix, Windows, DOS, macOS, OS/2,
  Amiga, v.v.).

### Cho tôi xem một đoạn mã Ruby!

Hãy định nghĩa một lớp gọi là `Person`, với tên và tuổi. Chúng ta sẽ kiểm tra
mã bằng cách tạo vài người và xem thông tin của họ.

~~~
class Person
  attr_accessor :name, :age

  def initialize(name, age)
    @name = name
    @age  = age.to_i
  end

  def inspect
    "#{name} (#{age})"
  end
end

p1 = Person.new("Elmo", 4)
p2 = Person.new("Zoe", 7)

p1  # => Elmo (4)
p2  # => Zoe (7)
~~~

Bây giờ hãy tạo một mảng các người bằng cách đọc tên và tuổi của họ từ một
tệp `ages` chứa các dòng như sau:

~~~
Bert:    8
Cookie: 11
Elmo:    4
Ernie:   8
Zoe:     7
~~~

Đoạn mã sử dụng biểu thức chính quy để phân tích các dòng liên tiếp từ tệp
đầu vào, tạo một đối tượng `Person` mới cho mỗi kết quả khớp và đẩy nó vào
cuối mảng `people`.

~~~
people = Array.new

File.foreach("ages") do |line|
  people << Person.new($1, $2) if line =~ /(.*):\s+(\d+)/
end

people  # => [Bert (8), Cookie (11), Elmo (4), Ernie (8), Zoe (7)]
~~~

Bây giờ, hãy sắp xếp kết quả theo tuổi của từng người. Có nhiều cách để
làm điều này. Chúng ta có thể định nghĩa một block sắp xếp, cho Ruby biết
cách so sánh hai người:

~~~
sorted = people.sort {|a, b| a.age <=> b.age }
sorted  # => [Elmo (4), Zoe (7), Bert (8), Ernie (8), Cookie (11)]
~~~

Một cách khác là thay đổi phương thức so sánh cho lớp `Person`:

~~~
class Person
  def <=>(other)
    age <=> other.age
  end
end
people.sort  # => [Elmo (4), Zoe (7), Bert (8), Ernie (8), Cookie (11)]
~~~

### Tại sao có tên "Ruby"?

Chịu ảnh hưởng từ Perl, Matz muốn dùng tên một loại đá quý cho ngôn ngữ mới
của mình, nên ông đặt tên Ruby theo đá quý tượng trưng cho tháng sinh nhật của
một đồng nghiệp.

Sau đó, ông nhận ra rằng Ruby đứng ngay sau Perl trong nhiều trường hợp.
Trong các đá quý theo tháng sinh, pearl (ngọc trai) là tháng Sáu, ruby (hồng ngọc)
là tháng Bảy. Khi đo kích cỡ phông chữ, pearl là 5pt, ruby là 5.5pt. Ông nghĩ
Ruby là một cái tên hay cho một ngôn ngữ lập trình mới hơn (và hy vọng là tốt hơn)
so với Perl.

(Dựa trên lời giải thích của Matz trong [\[ruby-talk:00394\]][ruby-talk:00394]
vào ngày 11 tháng 6 năm 1999.)

[ruby-talk:00394]: https://blade.ruby-lang.org/ruby-talk/394

### Lịch sử của Ruby là gì?

Sau đây là tóm tắt một bài đăng của Matz trong
[\[ruby-talk:00382\]][ruby-talk:00382] vào ngày 4 tháng 6 năm 1999.
(Ngày sinh của Ruby đã được sửa lại trong
[\[ruby-list:15977\]][ruby-list:15977].)

> Ruby ra đời vào ngày 24 tháng 2 năm 1993. Tôi đang nói chuyện với đồng nghiệp
> về khả năng của một ngôn ngữ kịch bản hướng đối tượng. Tôi biết Perl
> (Perl4, không phải Perl5), nhưng tôi không thực sự thích nó, vì nó có mùi vị
> của một ngôn ngữ đồ chơi (và vẫn vậy). Ngôn ngữ kịch bản hướng đối tượng có vẻ
> rất hứa hẹn.

> Lúc đó tôi biết Python. Nhưng tôi không thích nó, vì tôi không nghĩ nó là một
> ngôn ngữ hướng đối tượng thực sự---các tính năng OO có vẻ như được gắn thêm vào
> ngôn ngữ. Là một người đam mê ngôn ngữ và fan OO suốt 15 năm, tôi thực sự muốn
> một ngôn ngữ kịch bản hướng đối tượng thực thụ, dễ sử dụng. Tôi đã tìm kiếm,
> nhưng không tìm thấy.

> Vì vậy, tôi quyết định tự tạo ra nó. Phải mất vài tháng để trình thông dịch
> chạy được. Tôi đưa vào đó các tính năng mà tôi thích có trong ngôn ngữ của mình,
> như iterator, xử lý ngoại lệ, thu gom rác.

> Sau đó, tôi tổ chức lại các tính năng của Perl thành một thư viện lớp, và
> triển khai chúng. Tôi đã đăng Ruby 0.95 lên các nhóm tin trong nước Nhật Bản
> vào tháng 12 năm 1995.

> Kể từ đó, các danh sách gửi thư rất sôi nổi đã được thiết lập và
> các trang web được hình thành.

[ruby-talk:00382]: https://blade.ruby-lang.org/ruby-talk/382
[ruby-list:15977]: https://blade.ruby-lang.org/ruby-list/15977

### Trang chủ Ruby ở đâu?

Trang chủ chính thức của Ruby là [www.ruby-lang.org](https://www.ruby-lang.org).
Ngoài phiên bản tiếng Anh và tiếng Nhật, còn có các bản dịch
sang nhiều ngôn ngữ khác.

Các điểm khởi đầu tốt để tìm thông tin về Ruby là các trang
[Tài liệu](/vi/documentation/) và [Cộng đồng](/vi/community/).

### Có nhóm tin Ruby không?

comp.lang.ruby được thành lập vào tháng 5 năm 2000 (nhờ nỗ lực của
[Conrad Schneiker](mailto:schneiker@jump.net)).

### Có danh sách gửi thư Ruby không?

Có nhiều danh sách gửi thư thảo luận về Ruby. Xem trang
[Danh sách gửi thư](/vi/community/mailing-lists/)
để biết thêm thông tin.

Bạn có thể tìm kiếm kho lưu trữ danh sách gửi thư tại
[https://ml.ruby-lang.org/archives/list/ruby-talk@ml.ruby-lang.org/](https://ml.ruby-lang.org/archives/list/ruby-talk@ml.ruby-lang.org/).
(Đây là URL cho danh sách ruby-talk, hãy thay đổi tương ứng cho các danh sách khác).

### Làm thế nào để phân luồng danh sách gửi thư trong mutt?

{% include warnings/faq-out-of-date.html %}

Đối với một số danh sách gửi thư Ruby, phần mềm danh sách gửi thư thêm tiền tố
vào dòng chủ đề, ví dụ `ruby-core:1234`. Điều này có thể làm rối việc phân luồng
trong một số ứng dụng đọc thư.

Trong mutt, bạn có thể làm cho việc phân luồng hoạt động bằng cách thiết lập biến
sau đây.

~~~
# reply regexp, to support MLs like ruby-talk.
set reply_regexp="^(\[[a-z0-9:-]+\][[:space:]]*)?(re([\[0-9\]+])*|aw):[[:space:]]*"
~~~

### Cái nào đúng, "Ruby" hay "ruby"?

Về mặt chính thức, ngôn ngữ được gọi là "Ruby". Trên hầu hết các hệ thống, nó
được gọi bằng lệnh `ruby`. Bạn có thể dùng "ruby" thay cho "Ruby".

Xin đừng dùng "RUBY" làm tên ngôn ngữ.

Ban đầu, hay theo lịch sử, nó được gọi là "ruby".

### Có sách nào về Ruby không?

{% include warnings/faq-out-of-date.html %}

* Programming Ruby: The Pragmatic Programmer's Guide,
  (the Pickaxe Book) của David Thomas và Andrew Hunt: ISBN 0-20171-089-7,
  Addison-Wesley, tháng 10 năm 2000.

* Một cuốn sách tham khảo Ruby bằng tiếng Nhật của Matz và cộng sự, được xuất bản
  bởi ASCII, có sẵn tại Nhật Bản (ISBN 4-7561-3254-5). Bản dịch tiếng Anh,
  "The Ruby Programming Language", có sẵn từ O'Reilly & Associates
  (ISBN 978-0596516178).

* Một cuốn "Ruby Pocket Reference" bằng tiếng Nhật được xuất bản bởi O'Reilly Japan
  (ISBN 4-87311-023-8). Hãy cho O'Reilly tại Mỹ biết nếu bạn muốn thấy bản dịch.

* Ngoài ra, "Mastering Regular Expressions" của Jeffrey Friedl,
  (the Hip Owl Book): ISBN 1-56592-257-3 từ O'Reilly & Associates,
  là tài liệu tham khảo bao quát nghệ thuật và cách triển khai biểu thức
  chính quy trong nhiều ngôn ngữ lập trình. Phần lớn nội dung rất liên quan
  đến biểu thức chính quy trong Ruby.

### Trình soạn thảo nào hỗ trợ Ruby?

{% include warnings/faq-out-of-date.html %}

* [Emacs](http://www.gnu.org/software/emacs/emacs.html)
  hoặc [XEmacs](http://www.xemacs.org/): `ruby-mode.el` được cung cấp kèm trong bản
  phân phối Ruby. Với một số phiên bản XEmacs, bạn có thể cần thêm
  `(load "font-lock")` vào tệp `.emacs` để cho phép `ruby-mode.el` nhận diện
  gói tô sáng cú pháp mà bạn đang sử dụng.
* [Vim](http://www.vim.org/): Vim 5.7 trở lên có sẵn tệp cú pháp Ruby trong gói
  runtime. Với các phiên bản trước đó, tệp cú pháp cho Ruby có tại
  [http://www.xs4all.nl/~hipster/lib/ruby/ruby.vim](http://www.xs4all.nl/~hipster/lib/ruby/ruby.vim).
* [Jedit](http://jedit.sourceforge.net/): Trình soạn thảo di động viết bằng Java,
  có hỗ trợ Ruby.
* [Nedit](http://www.nedit.org): Eric Santonacci đã viết hỗ trợ Ruby cho
  Nedit, có tại
  [ftp://ftp.talc.fr/pub/ruby/ruby.nedit-0.1.tar.gz](ftp://ftp.talc.fr/pub/ruby/ruby.nedit-0.1.tar.gz).
* Barry Shultz đã viết tệp định nghĩa Ruby cho TextPad, có tại
  [https://www.textpad.com/add-ons/synn2t.html](https://www.textpad.com/add-ons/synn2t.html).

### Làm thế nào để chú thích mã Ruby bằng kết quả của nó?

{% include warnings/faq-out-of-date.html %}

Mọi người thường chú thích mã Ruby bằng cách hiển thị kết quả thực thi của mỗi
câu lệnh dưới dạng comment gắn với câu lệnh đó. Ví dụ, trong đoạn mã
sau đây, chúng ta cho thấy phép gán tạo ra chuỗi "Billy Bob",
và sau đó là kết quả trích xuất một số chuỗi con.

~~~
str = "Billy" + " Bob"           # => "Billy Bob"
str[0,1] + str[2,1] + str[-2,2]  # => "Blob"
~~~

Người dùng Emacs và vim có thể tích hợp điều này vào môi trường soạn thảo của họ,
rất hữu ích nếu bạn muốn gửi email cho người khác kèm mã Ruby có chú thích. Sau khi
cài đặt `xmp`, người dùng Emacs có thể thêm đoạn sau vào tệp `.emacs`:

~~~
(defun ruby-xmp-region (reg-start reg-end)
  "Pipe the region through Ruby's xmp utility and replace the region with
   the result."
  (interactive "r")
  (shell-command-on-region reg-start reg-end
                           "ruby -r xmp -n -e 'xmp($_, \"%l\t\t# %r\n\")'"
                           t))
(global-set-key [(meta f10)] 'ruby-xmp-region)
~~~

Người dùng Vim có thể sử dụng mapping sau (cảm ơn hipster):

~~~
map <M-F10> :!ruby -r xmp -n -e 'xmp($_, "\%l\t\t\# \%r\n")'<CR>
~~~

Trong cả hai trường hợp, hãy chọn một vùng mã và nhấn Meta-F10 để chú thích nó.

### Tôi không hiểu Ruby dù đã đọc tài liệu hướng dẫn!

{% include warnings/faq-out-of-date.html %}

Cú pháp của Ruby khá ổn định kể từ Ruby 1.0, nhưng các tính năng mới được
thêm vào thỉnh thoảng. Vì vậy, sách và tài liệu trực tuyến có thể bị lạc hậu.

Nếu bạn gặp vấn đề, hãy thoải mái hỏi trên danh sách gửi thư
(xem [trang Danh sách gửi thư](/vi/community/mailing-lists/)).
Thông thường bạn sẽ nhận được câu trả lời kịp thời từ chính Matz,
tác giả của ngôn ngữ, từ các chuyên gia khác, và từ những người đã giải quyết
các vấn đề tương tự như của bạn.

Xin hãy kèm theo kết quả của `ruby -v` cùng với mã nguồn gặp vấn đề.

Nếu bạn gặp vấn đề khi sử dụng [`irb`](../10/#irb),
hãy lưu ý rằng nó có một số hạn chế.
Hãy thử chạy script bằng `irb --single-irb`, hoặc trực tiếp bằng
lệnh `ruby`.

Có thể đã có các câu hỏi tương tự trên danh sách gửi thư, và đọc qua các email
gần đây là phép lịch sự trên mạng (RFC1855:3.1.1, 3.1.2) trước khi hỏi.
Nhưng hãy cứ hỏi trên danh sách, và câu trả lời chính xác sẽ sớm đến.
