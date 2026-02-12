---
layout: page
title: "Lõi Ruby"
lang: vi
---

Bây giờ là thời điểm tuyệt vời để theo dõi sự phát triển của Ruby.
Với sự quan tâm ngày càng tăng mà Ruby nhận được trong những năm qua,
nhu cầu về nhân tài giỏi để giúp nâng cao Ruby và viết tài liệu cho
các phần của nó ngày càng lớn. Vậy, bạn bắt đầu từ đâu?
{: .summary}

Các chủ đề liên quan đến phát triển Ruby được đề cập ở đây là:

* [Sử dụng Git để theo dõi phát triển Ruby](#following-ruby)
* [Cải thiện Ruby, từng bản vá một](#patching-ruby)
* [Lưu ý về các nhánh](#branches-ruby)

### Sử dụng Git để theo dõi phát triển Ruby
{: #following-ruby}

Kho lưu trữ chính hiện tại của mã nguồn Ruby mới nhất là
[git.ruby-lang.org/ruby.git][gitrlo].
Cũng có một [bản sao trên GitHub][7]. Thông thường, xin hãy sử dụng
bản sao này.

Bạn có thể lấy mã nguồn Ruby mới nhất bằng Git.
Từ dòng lệnh của bạn:

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
{% endhighlight %}

Thư mục `ruby` bây giờ sẽ chứa mã nguồn mới nhất cho phiên bản đang
phát triển của Ruby (ruby-trunk).

Xem thêm [Hướng dẫn cho người không có quyền commit để tham gia phát triển][noncommitterhowto].

Nếu bạn có quyền commit, và muốn đẩy thay đổi lên, bạn nên sử dụng
kho lưu trữ chính.

{% highlight sh %}
$ git clone git@git.ruby-lang.org:ruby.git
{% endhighlight %}

### Cải thiện Ruby, từng bản vá một
{: #patching-ruby}

Nhóm phát triển lõi duy trì một [hệ thống theo dõi vấn đề][10] để gửi
bản vá và báo cáo lỗi cho Matz và các thành viên. Các báo cáo này cũng
được gửi đến [hộp thư chung Ruby-Core][mailing-lists] để thảo luận,
vì vậy bạn có thể chắc chắn rằng yêu cầu của bạn sẽ không bị bỏ qua.
Bạn cũng có thể gửi bản vá trực tiếp đến hộp thư chung. Dù bằng cách
nào, bạn được khuyến khích tham gia vào cuộc thảo luận sau đó.

Xin hãy xem [Hướng dẫn viết Patch][writing-patches] để biết một số mẹo
trực tiếp từ Matz về cách làm cho bản vá của bạn được xem xét.

Tóm lại, các bước để tạo bản vá là:

1.  Tải một bản sao mã nguồn Ruby từ GitHub.
    Thông thường bản vá cho sửa lỗi hoặc tính năng mới nên được gửi
    cho nhánh trunk của mã nguồn Ruby.

        $ git clone https://github.com/ruby/ruby.git

    Nếu bạn đang sửa một lỗi chỉ xảy ra ở một nhánh bảo trì cụ thể,
    hãy chuyển sang nhánh tương ứng.

        $ git checkout ruby_X_X

    X_X nên được thay thế bằng phiên bản mà bạn muốn chuyển.

2.  Thêm các cải tiến của bạn vào mã nguồn.

3.  Tạo bản vá.

        $ git diff > ruby-changes.patch

4.  Tạo một ticket trong [hệ thống theo dõi vấn đề][10] hoặc gửi email
    bản vá của bạn đến [hộp thư chung Ruby-Core][mailing-lists] cùng
    với mục ChangeLog mô tả bản vá.

5.  Nếu không có vấn đề gì được nêu ra về bản vá, các committer sẽ
    được chấp thuận để áp dụng nó.

**Xin lưu ý:** các bản vá nên được gửi dưới dạng [unified diff][12].
Để biết thêm về cách các bản vá được hợp nhất, xem [tham khảo diffutils][13].

Thảo luận về phát triển Ruby tập trung tại
[hộp thư chung Ruby-Core][mailing-lists]. Vì vậy, nếu bạn tò mò
liệu bản vá của mình có đáng hay không hoặc muốn khởi động một cuộc
thảo luận về tương lai của Ruby, đừng ngần ngại tham gia. Lưu ý rằng
các cuộc thảo luận lạc đề không được chấp nhận trong danh sách này,
mức độ nhiễu nên rất thấp, các chủ đề nên nhắm đúng mục tiêu, được
suy nghĩ kỹ lưỡng và viết tốt. Vì chúng ta đang giao tiếp với người
tạo ra Ruby, hãy tôn trọng.

Hãy nhớ rằng nhiều nhà phát triển lõi của Ruby sống ở Nhật Bản và,
mặc dù nhiều người nói tiếng Anh rất tốt, có sự chênh lệch múi giờ
đáng kể. Họ cũng có một hệ thống hộp thư chung phát triển bằng tiếng
Nhật song song với các danh sách tiếng Anh. Hãy kiên nhẫn, nếu yêu cầu
của bạn chưa được giải quyết, hãy kiên trì—thử lại sau vài ngày.


### Lưu ý về các nhánh
{: #branches-ruby}

Mã nguồn của Ruby đã được quản lý trong kho lưu trữ Subversion cho đến ngày 22 tháng 4 năm 2019.
Do đó, một số nhánh có thể vẫn được quản lý trên Subversion.
Bạn có thể xem kho lưu trữ SVN.

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][svn-viewvc]

Tuy nhiên, bạn không cần phải quan tâm đến điều này (trừ khi bạn là
người bảo trì nhánh). Bạn có thể chuyển sang các nhánh trong bản sao
Git của mình. Ví dụ, chạy lệnh sau.

{% highlight sh %}
$ git checkout ruby_X_X
{% endhighlight %}

X_X nên được thay thế bằng phiên bản mà bạn muốn chuyển.

Nếu bạn muốn sửa đổi các nhánh, vui lòng mở một vấn đề trong [hệ thống theo dõi vấn đề][10] của chúng tôi.
Xem thêm phần sau.

[gitrlo]: https://git.ruby-lang.org/ruby.git
[mailing-lists]: /vi/community/mailing-lists/
[writing-patches]: /vi/community/ruby-core/writing-patches/
[noncommitterhowto]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[svn-viewvc]: https://git.ruby-lang.org/ruby.git
[7]: https://github.com/ruby/ruby
[10]: https://bugs.ruby-lang.org/
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
