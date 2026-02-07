---
layout: page
title: "Câu hỏi thường gặp về Ruby"
lang: vi

header: |
  <div class="multi-page">
    <a href="../" title="Content">Content</a>
    <span class="separator"> | </span>
    <a href="../1/" title="Part 1">1</a>
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
    <strong>9</strong>
    <span class="separator"> | </span>
    <a href="../10/" title="Part 10">10</a>
    <span class="separator"> | </span>
    <a href="../11/" title="Part 11">11</a>
  </div>
  <h1>Official Ruby FAQ</h1>

---

{% include faq-notice.md %}

## Thư viện tích hợp sẵn

### `instance_methods(false)` trả về gì?

Phương thức `instance_methods` trả về một mảng chứa tên của các phương thức
instance trong lớp hoặc module nhận. Điều này bao gồm cả các phương thức
trong các lớp cha và trong các module đã được trộn vào.

`instance_methods(false)` hoặc `instance_methods(nil)` chỉ trả về tên
của những phương thức được định nghĩa trực tiếp trong receiver.

### Seed của số ngẫu nhiên hoạt động như thế nào?

Nếu `rand` được gọi mà không có lời gọi `srand` trước đó,
bộ sinh số giả ngẫu nhiên của Ruby sử dụng một seed ngẫu nhiên mà
trong đó có sử dụng nguồn entropy do hệ điều hành cung cấp,
nếu có sẵn.
Các lần chạy liên tiếp của một chương trình không sử dụng `srand` sẽ tạo ra
các chuỗi số ngẫu nhiên khác nhau.

Cho mục đích kiểm thử, bạn có thể có hành vi dự đoán được với cùng
chuỗi số mỗi lần chạy chương trình bằng cách gọi `srand`
với một seed cố định.

### Tôi đọc một tệp và thay đổi nó, nhưng tệp trên đĩa không thay đổi.

~~~
File.open("example", "r+").readlines.each_with_index do |line, i|
  line[0,0] = "#{i+1}: "
end
~~~

Chương trình này _không_ thêm số dòng vào tệp `example`. Nó đọc
nội dung của tệp, và với mỗi dòng đọc được thì thêm số dòng vào đầu,
nhưng dữ liệu không bao giờ được ghi lại. Đoạn mã dưới đây _có_ cập nhật
tệp (mặc dù hơi nguy hiểm, vì nó không tạo bản sao lưu trước khi bắt đầu
cập nhật):

~~~
File.open("example", "r+") do |f|
  lines = f.readlines
  lines.each_with_index {|line, i| line[0,0] = "#{i+1}: " }
  f.rewind
  f.puts lines
end
~~~

### Làm thế nào để xử lý một tệp và cập nhật nội dung của nó?

Sử dụng tùy chọn dòng lệnh `-i`, hoặc biến tích hợp `$-i`, bạn có thể đọc
một tệp và thay thế nó.

Đoạn mã trong câu hỏi trước, thêm số dòng vào một tệp,
có lẽ nên được viết theo cách này:

~~~
$ ruby -i -ne 'print "#$.: #$_"' example
~~~

Nếu bạn muốn giữ lại tệp gốc, sử dụng `-i.bak` để tạo bản sao lưu.

### Tôi đã ghi một tệp, sao chép nó, nhưng phần cuối của bản sao bị mất.

Đoạn mã này sẽ không hoạt động đúng:

~~~
require "fileutils"

File.open("file", "w").puts "This is a file."
FileUtils.cp("file", "newfile")
~~~

Vì I/O được đệm, `file` đang được sao chép trước khi nội dung của nó được
ghi xuống đĩa. `newfile` có thể sẽ trống. Tuy nhiên, khi chương trình
kết thúc, bộ đệm được xả, và file có nội dung như mong đợi.

Vấn đề không xảy ra nếu bạn đảm bảo rằng `file` được đóng trước
khi sao chép:

~~~
require "fileutils"

File.open("file", "w") {|f| f.puts "This is a file." }
FileUtils.cp("file", "newfile")
~~~

### Làm thế nào để lấy số dòng trong tệp đầu vào hiện tại?

Khi bạn đọc từ một tệp, Ruby tăng bộ đếm số dòng trong biến toàn cục
`$.`. Giá trị này cũng có thể được lấy thông qua thuộc tính `lineno` của
đối tượng `File`.

Hằng số đặc biệt `ARGF` là một đối tượng giống tệp có thể được sử dụng để
đọc tất cả các tệp đầu vào được chỉ định trên dòng lệnh (hoặc đầu vào tiêu
chuẩn nếu không có tệp nào). `ARGF` được sử dụng ngầm bởi đoạn mã như:

~~~
while gets
  print $_
end
~~~

Trong trường hợp này, `$.` sẽ là số dòng tích lũy trên tất cả
các tệp đầu vào. Để lấy số dòng trong tệp hiện tại, sử dụng

~~~
ARGF.file.lineno
~~~

Bạn cũng có thể lấy tên tệp hiện tại bằng `ARGF.file.path`.

### Làm thế nào để sử dụng `less` để hiển thị đầu ra của chương trình?

Tôi đã thử cách sau, nhưng không có gì xuất hiện:

~~~
open("|less", "w").puts "abc"
~~~

Đó là vì chương trình kết thúc ngay lập tức, và `less` không bao giờ có cơ
hội nhìn thấy những gì bạn đã ghi vào nó, chứ đừng nói đến việc hiển thị nó.
Hãy đảm bảo rằng IO được đóng đúng cách và nó sẽ đợi cho đến khi `less`
kết thúc.

~~~
open("|less", "w") {|f| f.puts "abc" }
~~~

### Điều gì xảy ra với đối tượng `File` không còn được tham chiếu?

Đối tượng `File` không còn được tham chiếu sẽ đủ điều kiện để
thu gom rác. Tệp sẽ được đóng tự động khi đối tượng `File` được
thu gom rác.

### Tôi cảm thấy không yên tâm nếu không đóng tệp.

Có ít nhất bốn cách tốt để đảm bảo rằng bạn đóng tệp:

~~~
# (1)
f = File.open("file")
begin
  f.each {|line| print line }
ensure
  f.close
end

# (2)
File.open("file") do |f|
  f.each {|line| print line }
end

# (3)
File.foreach("file") {|line| print line }

# (4)
File.readlines("file").each {|line| print line }
~~~

### Làm thế nào để sắp xếp tệp theo thời gian chỉnh sửa?

~~~
Dir.glob("*").sort {|a, b| File.mtime(b) <=> File.mtime(a) }
~~~

Mặc dù cách này hoạt động (trả về danh sách theo thứ tự thời gian ngược),
nó không hiệu quả lắm, vì nó lấy thời gian chỉnh sửa của tệp từ
hệ điều hành mỗi lần so sánh.

Hiệu quả hơn có thể đạt được với một chút phức tạp hơn:

~~~
Dir.glob("*").map {|f| [File.mtime(f), f] }.
  sort {|a, b| b[0] <=> a[0] }.map(&:last)
~~~

### Làm thế nào để đếm tần suất từ trong một tệp?

~~~
freq = Hash.new(0)
File.read("example").scan(/\w+/) {|word| freq[word] += 1 }
freq.keys.sort.each {|word| puts "#{word}: #{freq[word]}" }
~~~

Kết quả:

~~~
and: 1
is: 3
line: 3
one: 1
this: 3
three: 1
two: 1
~~~

### Làm thế nào để sắp xếp chuỗi theo thứ tự bảng chữ cái?

Nếu bạn muốn chuỗi được sắp xếp 'AAA', 'BBB', ..., 'ZZZ', 'aaa', 'bbb',
thì phép so sánh tích hợp sẽ hoạt động tốt.

Nếu bạn muốn sắp xếp không phân biệt chữ hoa chữ thường, so sánh phiên bản
chữ thường của các chuỗi trong khối sort:

~~~
array = %w( z bB Bb bb Aa BB aA AA aa a A )
array.sort {|a, b| a.downcase <=> b.downcase }
  # => ["a", "A", "Aa", "aA", "AA", "aa", "bB", "Bb", "bb", "BB", "z"]
~~~

Nếu bạn muốn sắp xếp sao cho các chữ 'A' và 'a' đứng cạnh nhau, nhưng 'a'
được coi là lớn hơn 'A' (nên 'Aa' đứng sau 'AA' nhưng trước 'AB'), sử dụng:

~~~
array.sort {|a, b| (a.downcase <=> b.downcase).nonzero? || a <=> b }
  # => ["A", "a", "AA", "Aa", "aA", "aa", "BB", "Bb", "bB", "bb", "z"]
~~~

### Làm thế nào để mở rộng tab thành khoảng trắng?
{: #tab-expansion}

Nếu `a` chứa chuỗi cần mở rộng, bạn có thể sử dụng một trong các cách:

~~~
1 while a.sub!(/(^[^\t]*)\t(\t*)/){$1+" "*(8-$1.size%8+8*$2.size)}
# or
1 while a.sub!(/\t(\t*)/){" "*(8-$~.begin(0)%8+8*$1.size)}
# or
a.gsub!(/([^\t]{8})|([^\t]*)\t/n){[$+].pack("A8")}
~~~

### Làm thế nào để thoát dấu gạch chéo ngược trong biểu thức chính quy?

`Regexp.quote('\\')` thoát một dấu gạch chéo ngược.

Nó trở nên phức tạp hơn nếu bạn sử dụng `sub` và `gsub`. Giả sử bạn viết
`gsub(/\\/, '\\\\')`, hy vọng thay thế mỗi dấu gạch chéo ngược bằng hai.
Đối số thứ hai được chuyển đổi thành `'\\'` trong quá trình phân tích cú pháp.
Khi phép thay thế xảy ra, bộ xử lý biểu thức chính quy chuyển đổi nó thành
`'\'`, nên hiệu quả thực tế là thay thế mỗi dấu gạch chéo ngược đơn bằng
một dấu gạch chéo ngược đơn khác. Bạn cần viết `gsub(/\\/, '\\\\\\')`!

Tuy nhiên, sử dụng thực tế là `\&` chứa chuỗi khớp, bạn cũng có thể
viết `gsub(/\\/, '\&\&')`.

Nếu bạn sử dụng dạng block của `gsub`, tức là `gsub(/\\/) { '\\\\' }`,
chuỗi thay thế chỉ được phân tích một lần (trong bước phân tích cú pháp) và
kết quả đúng như bạn mong muốn.

### Sự khác biệt giữa `sub` và `sub!` là gì?

Trong `sub`, một bản sao của receiver được tạo ra, thực hiện thay thế,
và trả về.

Trong `sub!`, receiver bị thay đổi và trả về nếu tìm thấy bất kỳ kết quả
khớp nào. Nếu không, `nil` được trả về.

Các phương thức như `sub!`, thay đổi thuộc tính của receiver,
được gọi là [phương thức hủy](../7/#destructive-method).
Thông thường, nếu có hai phương thức tương tự và một trong số đó là phương
thức hủy, phương thức hủy sẽ có hậu tố `!`.

~~~
def foo(str)
  str.sub(/foo/, "baz")
end

obj = "foo"
foo(obj)  # => "baz"
obj       # => "foo"

def foo(str)
  str.sub!(/foo/, "baz")
end

foo(obj)  # => "baz"
obj       # => "baz"
~~~

### `\Z` khớp ở đâu?

`\Z` khớp ngay trước `\n` (dòng mới) cuối cùng nếu chuỗi kết thúc
bằng `\n`, nếu không thì nó khớp ở cuối chuỗi.

### Sự khác biệt giữa `thread` và `fork` là gì?

{% include warnings/faq-out-of-date.html %}

Các thread của Ruby được triển khai bên trong trình thông dịch, trong khi
`fork` gọi hệ điều hành để tạo một tiến trình con thực thi riêng biệt.

Thread và fork có các đặc điểm sau:

* `fork` chậm, `thread` thì không.
* `fork` không chia sẻ không gian bộ nhớ.
* `thread` không gây ra thrashing.
* `thread` hoạt động trên DOS.
* Khi `thread` rơi vào deadlock, toàn bộ tiến trình dừng lại.
* `fork` có thể tận dụng các khoảng tạm dừng khi chờ I/O hoàn tất,
  `thread` thì không (ít nhất là không có sự hỗ trợ thêm).

Bạn có lẽ không nên trộn lẫn `fork` và `thread`.

### Làm thế nào để sử dụng `Marshal`?

`Marshal` được sử dụng để lưu trữ một đối tượng vào tệp hoặc chuỗi,
và sau đó khôi phục lại nó. Đối tượng có thể được lưu trữ bằng:

~~~
Marshal.dump( obj [, io ] [, lev] )
~~~

`io` là một đối tượng `IO` có thể ghi, `lev` chỉ định mức độ mà các đối
tượng được tham chiếu và lưu trữ. Nếu `lev` mức tham chiếu được thực hiện
và vẫn còn tham chiếu đối tượng, thì `dump` chỉ lưu trữ tham chiếu,
không phải đối tượng được tham chiếu. Điều này không tốt, vì các đối tượng
được tham chiếu này không thể được khôi phục lại sau đó.

Nếu `io` bị bỏ qua, các đối tượng đã marshal hóa được trả về dưới dạng
chuỗi.

Bạn có thể tải lại đối tượng bằng:

~~~
obj = Marshal.load(io)
# or
obj = Marshal.load(str)
~~~

trong đó `io` là đối tượng `IO` có thể đọc, `str` là chuỗi đã dump.

### Làm thế nào để sử dụng `trap`?

`trap` liên kết các khối mã với các sự kiện bên ngoài (tín hiệu).

~~~
trap("PIPE") { raise "SIGPIPE" }
~~~
