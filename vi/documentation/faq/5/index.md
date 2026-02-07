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
    <strong>5</strong>
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

## Iterator

### Iterator là gì?

Iterator là một phương thức nhận một khối hoặc đối tượng `Proc`. Trong mã
nguồn, khối được đặt ngay sau lời gọi phương thức. Iterator được sử dụng
để tạo ra các cấu trúc điều khiển do người dùng định nghĩa---đặc biệt là
các vòng lặp.

Hãy xem một ví dụ để hiểu cách hoạt động. Iterator thường được sử dụng để
lặp lại cùng một hành động trên mỗi phần tử của một tập hợp, như thế này:

~~~
data = [1, 2, 3]
data.each do |i|
  puts i
end
~~~

Kết quả:

~~~
1
2
3
~~~

Phương thức each của mảng `data` được truyền khối `do ... end`, và thực thi
nó lặp đi lặp lại. Trong mỗi lần gọi, khối được truyền các phần tử liên tiếp
của mảng.

Bạn có thể định nghĩa khối bằng `{ ... }` thay cho `do ... end`.

~~~
data = [1, 2, 3]
data.each { |i|
  puts i
}
~~~

Kết quả:

~~~
1
2
3
~~~

Đoạn mã này có cùng ý nghĩa với ví dụ trước. Tuy nhiên, trong một số trường
hợp, vấn đề ưu tiên khiến `do ... end` và `{ ... }` hoạt động khác nhau.

~~~
foobar a, b do ... end  # foobar is the iterator.
foobar a, b { ... }     # b is the iterator.
~~~

Điều này là vì `{ ... }` liên kết chặt hơn với biểu thức đứng trước so với
khối `do ... end`. Ví dụ đầu tiên tương đương với
`foobar(a, b) do ... end`, trong khi ví dụ thứ hai là `foobar(a, b { ... })`.

### Làm thế nào để truyền một khối cho iterator?

Bạn chỉ cần đặt khối sau lời gọi iterator. Bạn cũng có thể truyền một đối
tượng `Proc` bằng cách đặt `&` trước tên biến hoặc hằng số tham chiếu đến
đối tượng `Proc`.

### Khối được sử dụng như thế nào trong iterator?

{% include warnings/faq-out-of-date.html %}

Có ba cách để thực thi một khối từ phương thức iterator:
(1) cấu trúc điều khiển `yield`; (2) gọi đối số `Proc`
(được tạo từ khối) bằng `call`; và (3) sử dụng `Proc.new` rồi gọi.

Câu lệnh `yield` gọi khối, tùy chọn truyền cho nó một hoặc nhiều đối số.

~~~
def my_iterator
  yield 1, 2
end

my_iterator {|a, b| puts a, b }
~~~

Kết quả:

~~~
1
2
~~~

Nếu định nghĩa phương thức có đối số khối (tham số hình thức cuối cùng có
dấu và (`&`) đặt trước), nó sẽ nhận khối đi kèm, được chuyển đổi thành đối
tượng `Proc`. Đối tượng này có thể được gọi bằng `prc.call(args)`.

~~~
def my_iterator(&b)
  b.call(1, 2)
end

my_iterator {|a, b| puts a, b }
~~~

Kết quả:

~~~
1
2
~~~

`Proc.new` (hoặc các lời gọi tương đương `proc` hay `lambda`), khi được sử
dụng trong định nghĩa iterator, nhận khối được truyền cho phương thức như đối
số của nó và tạo ra một đối tượng thủ tục từ đó.
(`proc` và `lambda` thực chất là từ đồng nghĩa.)

_[Cần cập nhật: `lambda` hoạt động hơi khác một chút và
tạo ra cảnh báo `tried to create Proc object without a block`.]_

~~~
def my_iterator
  Proc.new.call(3, 4)
  proc.call(5, 6)
  lambda.call(7, 8)
end

my_iterator {|a, b| puts a, b }
~~~

Kết quả:

~~~
3
4
5
6
7
8
~~~

Có thể hơi bất ngờ, `Proc.new` và các hàm tương tự không hề tiêu thụ khối
đi kèm phương thức---mỗi lần gọi `Proc.new` tạo ra một đối tượng thủ tục
mới từ cùng một khối.

Bạn có thể kiểm tra xem có khối nào được liên kết với phương thức hay không
bằng cách gọi `block_given?`.

### `Proc.new` không có khối thì sao?

`Proc.new` không có khối không thể tạo ra đối tượng thủ tục và sẽ xảy ra lỗi.
Tuy nhiên, trong định nghĩa phương thức, `Proc.new` không có khối ngụ ý sự
tồn tại của một khối tại thời điểm phương thức được gọi, và do đó sẽ không
xảy ra lỗi.

### Làm thế nào để chạy các iterator song song?

Đây là một phiên bản chỉnh sửa của giải pháp bởi Matz, trong
[\[ruby-talk:5252\]][ruby-talk:5252], sử dụng luồng:

~~~
require "thread"

def combine(*iterators)
  queues = []
  threads = []

  iterators.each do |it|
    queue = SizedQueue.new(1)
    th = Thread.new(it, queue) do |i, q|
           send(i) {|x| q << x }
         end
    queues  << queue
    threads << th
  end

  loop do
    ary = []
    queues.each {|q| ary << q.pop }
    yield ary

    iterators.size.times do |i|
      return if !threads[i].status && queues[i].empty?
    end
  end
end

def it1
  yield 1; yield 2; yield 3
end

def it2
  yield 4; yield 5; yield 6
end

combine(:it1, :it2) do |x|
  # x is [1, 4], then [2, 5], then [3, 6]
end
~~~

[ruby-talk:5252]: https://blade.ruby-lang.org/ruby-talk/5252
