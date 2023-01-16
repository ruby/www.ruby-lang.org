---
layout: page
title: "Ruby Core"
lang: vi
---

Lúc này là thời điểm tuyệt vời để theo dõi sự phát triển của Ruby với sự xuất
hiện của Ruby 2.0.  Với việc số người quan tâm đến Ruby ngày một tăng trong
những năm qua, cộng đồng Ruby đang rất cần những tài năng tham gia để nâng cao
chất lượng tài liệu hướng dẫn cũng như cải thiện ngôn ngữ Ruby.  Vậy, bạn nên
bắt đầu ở đâu?
{: .summary}

Các chủ đề liên quan đến sự phát triển Ruby được đề cập ở đây là:

* [Dùng Subversion để theo dõi sự phát triển của Ruby](#following-ruby)
* [Làm việc với Git](#git-ruby)
* [Cải tiến Ruby theo từng bản vá lỗi](#patching-ruby)
* [Quy tắc cho các nhà phát triển Ruby-core](#coding-standards)

### Dùng Subversion để theo dõi sự phát triển của Ruby
{: #following-ruby}

Để lấy được mã nguồn mới nhất từ kho lưu trữ của [Subversion][1]
là một vấn đề đối với các checkout không xác định. Bạn gõ dòng lệnh sau:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby
{% endhighlight %}

Thư mục `ruby` sẽ chứa toàn bộ mã nguồn của phiên bản mới nhất (theo dạng
cây).  Các bản vá lỗi áp dụng cho từng phần được backported ổn định cho
nhánh {{ site.svn.stable.version }}, {{ site.svn.previous.version }},
{{ site.svn.old.version }} (xem bên dưới).

Nếu bạn muốn theo dõi các bản vá lỗi cho Ruby 2.0.0, bạn cần nhập
`ruby_2_0_0` khi checkout:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_2_0_0
{% endhighlight %}

Nếu bạn muốn theo dõi các bản vá lỗi cho Ruby 1.9.3, bạn cần nhập
`ruby_1_9_3` khi checkout:

{% highlight sh %}
$ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_3
{% endhighlight %}

Câu lệnh trên sẽ checkout Ruby 1.9.3 vào thư mục `ruby_1_9_3`.  Các nhà phát
triển làm việc trên Ruby 1.9.3 dự kiến sẽ chuyển những thay đổi về mã nguồn
gốc, Thường thì 2 phiên bản có nhiều điểm giống nhau, ngoại trừ những cải tiến
được thực hiện bởi Matz và Nobu với ngôn ngữ riêng của mình.

Nếu thích, bạn có thể duyệt qua [kho lưu trữ của Ruby trên Subversion thông
qua web][2].

Để biết thêm thông tin về Subversion, vui lòng xem
[những câu hỏi thường gặp của Subversion][3] và [sách về Subversion][4].
Ngoài ra, bạn có thể tìm quyển [quản lý phiên bản với Subversion][5]
là một quyển sách rất hữu ích.

### Làm việc với Git
{: #git-ruby}

Dành cho những ai thích dùng [Git][6] hơn là Subversion có thể tìm được hướng
dẫn với [the mirror trên GitHub][7], cho cả [những người có quyền commit][8]
và [tất cả những người khác][9].

### Cải tiến Ruby theo từng bản vá lỗi
{: #patching-ruby}

Nhóm phát triển Ruby Core luôn theo dõi [các vấn đề phát sinh (issue
tracker)][10] để gửi các bản vá lỗi và các báo cáo bug cho Matz và các cộng sự
của ông. Các bản báo cáo này cũng được gửi vào
[Hộp thư chung của Ruby-Core][mailing-lists] để thảo luận, do đó đừng lo về việc
yêu cầu của bạn sẽ không được chú ý.  Bạn cũng có thề gửi các bản vá lỗi vào
thẳng hộp thư chung.  Bằng cách này hay cách khác thì bạn cũng được khuyến
khích tham gia vào các cuộc thảo luận.

Bạn có thể xem qua một số [hướng dẫn của Patch Writer’s][11] để tìm thấy một
số mẹo từ Matz, và cách làm thế nào để các bản vá lỗi của bạn được xem xét.

Dưới đây là một số bước để tạo được một bản vá lỗi:

1.  Checkout một bản sao mã nguồn Ruby từ Subversion. Thường thì các bản vá
    lỗi hoặc tính năng mới sẽ được thêm vào nhánh chính của mã nguồn. Thậm chí
    nếu bạn muốn thêm một tính năng cho Ruby 1.9.3, thì nó cần được kiểm tra ở
    nhánh chính trước.

        $ svn co https://svn.ruby-lang.org/repos/ruby/trunk ruby

    Nếu bạn đang sử chữa một lỗi nào đó trong nhánh nào đó thì checkout bản
    sao của nhánh đó ví dụ như `ruby_1_9.3`.

        $ svn co https://svn.ruby-lang.org/repos/ruby/branches/ruby_1_9_3

2.  Thêm các cải tiến cho code.

3.  Tạo bản vá.

        $ svn diff > ruby-changes.patch

4.  Tạo một ticket trong [issue tracker][10] hoặc gửi bản vá của bạn đến
    [hộp thư chung của Ruby-Core][mailing-lists] với ChangeLog
    mô tả nội dung về bản vá đó.

5.  Nếu bản vá không phát sinh thêm lỗi nào thì những người được phép commit
    sẽ duyệt và áp dụng bản vá đó.

**Lưu ý:** Các bản vá được gửi phải có sự [khác biệt thống nhất][12].
Để biết các bản vá được merged như thế nào, xem thêm [the diffutils reference][13].

Các cuộc thảo luận về phát triển Ruby tập trung ở
[hộp thư chung của Ruby-Core][mailing-lists].
Do đó, nếu bạn muốn biết bản vá của mình có đáng giá hay không hoặc bạn chỉ
muốn thảo luận về tương lai của Ruby, đừng ngại cùng thảo luận.  Tất cả các
cuộc thảo luận không liên quan đến Ruby đều không được chấp nhận, các cuộc
thảo luận phải đúng với chủ đề và được diễn đạt tốt bằng văn bản.  Hãy dành sự
tôn kính khi muốn đề cập đến tác giả của Ruby.

Hãy nhớ rằng những người phát triển nên Ruby sống ở Nhật và phần lớn đều giỏi
tiếng Anh thì vẫn khác nhau về múi giờ. Họ cũng sử dụng hộp thư chung tiếng
Anh song song với tiếng Nhật.  Hãy kiên nhẫn và gửi lại yêu cầu của bạn sau
một vài ngày nếu nó vẫn chưa được giải quyết.

### Quy tắc cho các nhà phát triển cốt lõi
{: #coding-standards}

Thông thường, các nhà phát triển Ruby đã rất quen với mã nguồn và
cách phát triển của nhóm. Dưới đây là một số quy tắc chính để kiểm tra
trước khi được checkin vào Subversion:

* Tất cả các check-in đều phải được mô tả trong `ChangeLog`, theo các
  [quy ước GNU][14].  (Nhiều nhà phát triển Ruby core sử dụng chế độ
  `add-log` của Emacs, có thể được truy cập được qua lệnh `C-x 4 a`.)
* Các ngày Check-in đều phải theo chuẩn thời gian của Nhật (UTC+9).
* Các điểm mấu chốt của ChangeLog cũng phải được ghi trong message khi
  commit lên Subversion. Thông điệp này (message) sẽ tự động được gửi
  vào Ruby-CVS sau khi commnit.
* Các tính năng thử nghiệm được sử dụng cho mã nguồn Ruby và các gói mở rộng của nó.
* Vui lòng không sử dụng kiểu chú thích của C++ (`//`),
  mà thay vào đó hãy sử dụng chuẩn của C khi chú thích nhiều dòng (`/* .. */`).

Xem thêm thông tin về [Ruby’s issue tracker][10].



[mailing-lists]: /vi/community/mailing-lists/
[1]: http://subversion.apache.org/
[2]: https://svn.ruby-lang.org/cgi-bin/viewvc.cgi/
[3]: http://subversion.apache.org/faq.html
[4]: http://svnbook.org
[5]: http://www.pragmaticprogrammer.com/titles/svn/
[6]: http://git-scm.com/
[7]: https://github.com/ruby/ruby
[8]: https://github.com/shyouhei/ruby/wiki/committerhowto
[9]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[10]: https://bugs.ruby-lang.org/
[11]: https://blade.ruby-lang.org/ruby-core/25139
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
[14]: http://www.gnu.org/prep/standards/standards.html#Change-Logs
