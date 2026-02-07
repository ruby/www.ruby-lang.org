---
layout: news_post
title: "Phân tích sự cố xâm nhập trên helium.ruby-lang.org"
author: "Shugo Maeda"
lang: vi
---

Như đã báo cáo trước đó, helium.ruby-lang.org, một trong những máy chủ
cung cấp các dịch vụ khác nhau liên quan đến phát triển Ruby, đã bị tấn công
bởi người dùng trái phép. Chúng tôi, nhóm quản trị viên ruby-lang.org, báo cáo
phân tích của chúng tôi về vụ xâm nhập này và các biện pháp đối phó đã
thực hiện.

## Tiến trình thời gian của sự cố

Tiến trình thời gian về vụ xâm nhập được hiển thị bên dưới.
Mỗi mốc thời gian đều theo UTC.

    19 May       Thông báo công khai về lỗ hổng CVS
                 (CAN-2004-0396). Chúng tôi tin rằng lỗ hổng
                 này đã được sử dụng trong vụ xâm nhập.
    20 May 02:46 Gói CVS Debian trên máy chủ helium.ruby-lang.org
                 (sau đây gọi là 'helium') được nâng cấp. Tuy nhiên,
                 gói CVS trong môi trường chroot, cung cấp pserver thực tế,
                 đã bị bỏ sót.
    23 May 11:15 Dấu thời gian cũ nhất (được xác nhận) của dấu vết xâm nhập
    27 May 19:03 Mở cửa hậu do kẻ xâm nhập cài đặt
    28 May 09:26 Quản trị viên ruby-lang.org phát hiện dấu vết
                 xâm nhập.
    28 May 09:35 Quản trị viên ngắt kết nối mạng của 'helium'.
    28 May 11:53 Quản trị viên khởi động lại 'helium' và phục hồi dịch vụ
                 danh sách thư.
    29 May 07:28 Thông báo đầu tiên của chúng tôi về vụ xâm nhập.

## Máy chủ và dịch vụ tại thời điểm đó

Các dịch vụ liên quan đến Ruby được cung cấp bởi hai máy chủ sau tại
thời điểm xâm nhập.

helium.ruby-lang.org
: Các dịch vụ sau được cung cấp bởi 'helium'.

  * CVS   (cvs.ruby-lang.org)
  * HTTP  (www.ruby-lang.org/raa.ruby-lang.org)
  * FTP   (ftp.ruby-lang.org)
  * RSYNC (cho các trang mirror)
  * ML    (&lt;ML name&gt;@ruby-lang.org)

hydrogen.ruby-lang.org (sau đây gọi là 'hydrogen')
: Các dịch vụ sau được cung cấp bởi 'hydrogen'.

  * HTTP (www.rubyist.net)
  * NFS  (để xuất /home cho 'helium')

## Chi tiết vụ xâm nhập

Trên 'helium', dịch vụ pserver được cung cấp dưới quyền người dùng anoncvs
trong môi trường chroot. Dịch vụ CVS này được sử dụng cho
phát triển Ruby, và nhiều committer có tài khoản riêng.
Quyền truy cập CVS công khai chỉ đọc được cho phép thông qua tài khoản người dùng
'anonymous'.

Như đã đề cập ở trên, lỗ hổng CVS được thông báo vào ngày 19 tháng 5.
Mặc dù gói CVS Debian của 'helium' đã được nâng cấp vào ngày 20 tháng 5, nhưng
gói CVS trong môi trường chroot đã không được nâng cấp.

Trong hoàn cảnh đó, quản trị viên của 'helium' phát hiện
các tiến trình đáng ngờ của anoncvs vào ngày 28 tháng 5, 09:26 (UTC). Nhiều hơn một
tệp thực thi đáng ngờ đã được phát hiện được cài đặt bởi
kẻ xâm nhập, bao gồm một chương trình tạo cửa hậu lắng nghe trên cổng TCP
#54320. Chương trình cửa hậu này đang chạy tại thời điểm phát hiện
vụ xâm nhập. Thời gian "Tiến trình" đề cập ở trên được
xác định bởi đầu ra của lệnh 'ps', và bởi dấu thời gian của
tệp thực thi xâm nhập. Chúng tôi cần lưu ý rằng tất cả các kết nối
bên ngoài đến cửa hậu đều bị ngăn chặn bởi tính năng lọc gói tin IP
của nhân Linux.

Một lưu ý khác: thông thường, tiến trình pserver tạo một thư mục tạm thời
(/tmp/cvs-serv&lt;Process ID&gt;) cho mỗi phiên và xóa nó khi kết thúc
phiên. Tại thời điểm xâm nhập, nhiều hơn một thư mục tạm thời
bị bỏ lại trong thư mục /tmp của môi trường chroot.
Điều này cho thấy các tiến trình pserver đã kết thúc bất thường, có thể
do cuộc tấn công của kẻ xâm nhập. Trong số các dấu thời gian của các thư mục tạm thời
này, cũ nhất là vào ngày 23 tháng 5, 11:15 (UTC). Thời gian "Tiến trình"
đề cập ở trên được xác định bởi dấu thời gian này. So sánh các dấu
thời gian của các thư mục này với nhật ký phiên pserver, có vẻ
có nhiều kẻ tấn công độc lập đã khai thác
lỗ hổng.

Bằng chứng cho thấy kẻ xâm nhập đã khai thác lỗ hổng CVS
và nhận được quyền người dùng anoncvs trên 'helium'.
Kẻ xâm nhập có thể lấy, sửa đổi và phá hủy tất cả thông tin trong
môi trường chroot.

Bằng chứng về việc chiếm đoạt tài khoản khác, leo thang đặc quyền cục bộ,
hoặc xâm nhập ra ngoài môi trường chroot, cho đến nay,
chưa được tìm thấy.

## Khả năng xâm nhập ra ngoài môi trường chroot

Để kẻ xâm nhập phá vỡ bảo vệ chroot, cần phải có quyền
người dùng đặc quyền.

Tại thời điểm xâm nhập, nhân Linux đang chạy trên 'helium' là
phiên bản 2.4.24. Bản vá cho lỗ hổng (được backport từ nhân
phiên bản 2.4.25) đã được áp dụng. Tuy nhiên, bản vá cho lỗ hổng setsockopt(2)
được sửa trong nhân 2.4.26 chưa được áp dụng.

Mã cho cuộc tấn công DoS khai thác setsockopt(2) lỗ hổng đã được
trình bày, nhưng việc leo thang đặc quyền cục bộ thành công từ điều này
được coi là khó. Có vẻ không thể đạt được leo thang đặc quyền nếu kẻ xâm nhập
không thể lấy được ảnh nhân của môi trường mục tiêu. Trên 'helium',
nhân không phải từ gói nhị phân, mà được xây dựng từ mã nguồn với các bản vá
được áp dụng riêng lẻ. Do đó, khả năng kẻ xâm nhập có thể
đạt được leo thang đặc quyền được coi là rất thấp.

## Phục hồi dịch vụ

Với cuộc điều tra đầu tiên, chúng tôi suy luận rằng vụ xâm nhập
có thể chỉ trong môi trường chroot. Đầu tiên chúng tôi quyết định
phục hồi dịch vụ danh sách thư trên 'helium', vì tác động của việc
tạm dừng dịch vụ thư, từ quan điểm người dùng, được
coi là lớn nhất. Sau khi kiểm tra rằng không có sự thay đổi của
gói nhị phân, và cũng không có cài đặt đáng ngờ trong
các tệp cấu hình, chúng tôi đã phục hồi dịch vụ danh sách thư.

Sau đó chúng tôi bắt đầu công việc xác nhận để phục hồi các dịch vụ khác trên
'helium', nhưng sớm quyết định xây dựng lại hoàn toàn máy chủ
và phục hồi các dịch vụ riêng lẻ sau khi mỗi dịch vụ được kiểm tra. Quyết định
này được đưa ra do khó khăn trong việc kiểm tra số lượng lớn
tệp.

Để phục hồi dịch vụ, chúng tôi cần một máy chủ thay thế cho
'helium'. Chúng tôi quyết định sử dụng 'hydrogen' - máy chủ www.rubyist.net.
'Hydrogen' không cung cấp dịch vụ pserver và không tìm thấy dấu vết xâm nhập
trên máy, nhưng 'hydrogen' cung cấp /home dưới dạng hệ thống tệp NFS
cho 'helium'. Để đảm bảo hydrogen không bị xâm phạm, chúng tôi
đã cài đặt lại hệ điều hành của 'hydrogen', và đặt tên máy chủ là 'lithium'.
Sau đó chúng tôi chuyển dịch vụ danh sách thư từ 'helium' sang 'lithium',
cùng với trang thông báo xâm nhập trên trang web.

Tiếp theo, chúng tôi cài đặt lại hệ điều hành của 'helium', và đặt tên máy chủ là
'beryllium'. Chúng tôi dự định chuyển tất cả các dịch vụ công khai sang 'beryllium' trong
tương lai.

## Máy chủ và dịch vụ hiện tại

Hiện tại, các dịch vụ liên quan đến Ruby được cung cấp bởi hai
máy chủ sau.

lithium.ruby-lang.org
: Các dịch vụ sau được cung cấp bởi lithium.ruby-lang.org.

  * CVS (cho phát triển của committer, không có truy cập công khai)
  * Danh sách thư (dự kiến chuyển sang 'beryllium')

beryllium.ruby-lang.org
: Các dịch vụ sau được cung cấp bởi beryllium.ruby-lang.org.

  * HTTP (www.ruby-lang.org/raa.ruby-lang.org/www.rubyist.net)
  * FTP (ftp.ruby-lang.org)
  * CVS ẩn danh (cvs.ruby-lang.org)

## Xác minh nội dung của mỗi dịch vụ

Sau đây chúng tôi sẽ giải thích kết quả nỗ lực đánh giá
liệu có bất kỳ sự thay đổi hoặc phá hủy dịch vụ nào
bởi kẻ xâm nhập hay không.

### Điều kiện tiên quyết

Bằng chứng cũ nhất về vụ xâm nhập là từ ngày 23 tháng 5, và
đã được xác nhận; vì dấu vết này có thể đã bị kẻ xâm nhập xóa
với quyền người dùng anoncvs, chúng tôi không thể kết luận rằng đây là
ngày đầu tiên xâm nhập. Vì bằng chứng xâm nhập là từ lỗ hổng CVS, và vì không
có lỗ hổng nào khác có thể bị khai thác để xâm nhập vào
'helium' được biết đến, chúng tôi tin rằng kẻ xâm nhập đã lạm dụng lỗ hổng CVS
và từ đó truy cập vào 'helium'.

Việc xác minh sự thay đổi hoặc phá hủy trong các dịch vụ dựa trên
giả định rằng vụ xâm nhập đầu tiên sẽ là sau ngày 19
tháng 5, khi lỗ hổng CVS CAN-2004-0396 được công bố.

### CVS

Vì kẻ xâm nhập được cho là đã nhận được quyền người dùng anoncvs,
chúng tôi nghi ngờ và lo lắng nhất về thiệt hại có thể
đối với CVS trong số tất cả các dịch vụ trên 'helium'.

Tại thời điểm xâm nhập, có bốn kho CVS sau.

/src
: Mã nguồn

/www
: Dữ liệu WWW

/doc
: Tài liệu

/admin
: Tệp quản lý CVS

Trong số này, /www và /doc không cần xác minh, vì nội dung của chúng
đã không được sử dụng. Hơn nữa, chúng tôi quyết định ngừng sử dụng /admin, và
đơn giản bỏ qua nó.

Những gì chúng tôi giải thích sau đây là kết quả xác minh
mã nguồn Ruby và của mỗi module khác trong /src.

### Mã nguồn Ruby

Chúng tôi chia các thay đổi kho CVS có thể thành hai loại:

(1) Thay đổi dữ liệu lịch sử trong các tệp kho CVS trước
    ngày 19 tháng 5

(2) Thay đổi giả mạo các lần gửi thông thường sau ngày 19 tháng 5

Đối với (1), chúng tôi kiểm tra các tệp trong kho CVS bằng nhật ký cvsup
sau ngày 19 tháng 5 được giữ an toàn bên ngoài 'helium'. Chúng tôi xác minh
rằng không có dấu hiệu thay đổi tệp trong kho CVS. Đối với (2), chúng tôi kiểm tra
tất cả nội dung của các lần commit riêng lẻ và xác nhận không có mã độc hại sau
ngày 19 tháng 5. Điều này có nghĩa là không chỉ không có mã độc, mà
chúng tôi đã xác minh từng commit với committer.

Việc xác minh của chúng tôi được hỗ trợ bởi dữ liệu tại URL sau.

* Nhật ký cvsup<br />
  https://www.ruby-lang.org/check-data/cvs/cvsup-log/
* Nội dung các lần commit từ 19 tháng 5 đến 28 tháng 5<br />
  https://www.ruby-lang.org/check-data/cvs/cvs-diff/

Ngoài ra, bên cạnh tài liệu đã đề cập ở trên, chúng tôi đã thực hiện
công việc bổ sung sau:

* Chúng tôi xác nhận không có sự không nhất quán giữa các tệp trong kho
  CVS trên 'helium' và các tệp trên máy chủ an toàn bên ngoài vào ngày 21
  tháng 5.
* Chúng tôi xác nhận không có sự không nhất quán trong các snapshot CVS
  từ 2003-11-02 đến 2004-05-27 (từng ngày) và các snapshot được tạo từ
  kho CVS trên 'helium'.

Chúng tôi kết luận rằng không có sự thay đổi hoặc phá hủy mã
nguồn ruby trong kho CVS.

#### Các module khác ngoài mã nguồn Ruby

Ngoài mã nguồn Ruby, thư mục /src của kho
CVS có các module sau:

  * app
  * lib
  * rough
  * rubicon
  * ruby-parser
  * shim
  * vms
  * pocketruby
  * oniguruma
  * mod_ruby
  * eruby

Đầu tiên, chúng tôi nhận thấy chỉ có các tệp sau bị thay đổi sau ngày 19 tháng 5
bằng cách so sánh ctime của các tệp kho với thời gian của
các tệp được sao chép ra máy chủ bên ngoài bởi CVSup:

  * lib/csv/lib/csv.rb,v
  * lib/csv/tests/csv_ut.rb,v
  * lib/soap4r/lib/wsdl/xmlSchema/parser.rb,v
  * lib/soap4r/lib/wsdl/xmlSchema/complexContent.rb,v
  * lib/soap4r/lib/wsdl/parser.rb,v
  * mod_ruby/lib/apache/eruby-run.rb,v
  * mod_ruby/lib/apache/erb-run.rb,v
  * mod_ruby/ChangeLog,v

Thứ hai, chúng tôi so sánh kho CVS đã sao chép với kho CVS trên
'helium', và xác nhận không có sự không nhất quán giữa chúng,
ngoại trừ các tệp nhị phân trong 'pocketruby'. Vì chúng tôi đã gộp
'wince' vào nhánh chính của ruby, chúng tôi không kiểm tra thêm pocketruby
và đã ngừng cung cấp mã nguồn của nó.

Mỗi tệp bị thay đổi sau ngày 19 tháng 5 được đề cập bên dưới.

lib/csv/lib/csv.rb,v
lib/csv/tests/csv_ut.rb,v
lib/soap4r/lib/wsdl/xmlSchema/parser.rb,v
lib/soap4r/lib/wsdl/xmlSchema/complexContent.rb,v
lib/soap4r/lib/wsdl/parser.rb,v
: Chúng tôi không chắc chắn về các tệp này. lib/csv và lib/soap4r đã được
  gộp với ruby, và các module này chỉ được sử dụng bởi người bảo trì
  của từng module. lib/csv và lib/soap4r đã được gỡ khỏi kho
  CVS, và sẽ được phát triển ở nơi khác.

mod_ruby/lib/apache/eruby-run.rb,v
mod_ruby/lib/apache/erb-run.rb,v
: Tất cả các bản sửa đổi bao gồm các nhánh đã được kiểm tra, và không tìm thấy
  vấn đề nào. Chúng được so sánh với các gói nguồn đã phát hành,
  và đã xác nhận không có sự không nhất quán.

mod_ruby/ChangeLog,v
: Các thay đổi thông thường của tệp ChangeLog là bổ sung nội dung.
  ChangeLog có thể được kiểm tra bằng các phương pháp sau:

  (1) Chúng tôi xác nhận không có vấn đề trong bản sửa đổi đầu tiên.

  (2) Chúng tôi xác nhận không có vấn đề trong bản sửa đổi mới nhất.

  (3) Chúng tôi xác nhận tất cả các bản sửa đổi bao gồm thay đổi, không chỉ
      bổ sung.

  Hơn nữa, chúng tôi so sánh với các gói nguồn đã phát hành, và
  đã xác minh không có sự không nhất quán.

Ngoài ra, việc phát triển mod_ruby và eruby đã chuyển sang
Subversion, nên tên các module CVS đã được đổi thành mod_ruby-old
và eruby-old.

### HTTP (www.ruby-lang.org)

https://www.ruby-lang.org/{ja, en}/ được tạo bởi tDiary. Chúng tôi đã thực hiện
các bước sau để kiểm tra rằng không có vấn đề khi chạy chương trình
CGI tDiary:

  * Xác nhận không có mã đáng ngờ trong các chương trình CGI
  * Xác minh mã trong các phần tử `<script>` được nhúng trong nội dung
  * Xác nhận không có dữ liệu đáng ngờ trong các tệp cấu hình

Hơn nữa, chúng tôi đã kiểm tra nội dung và các URL liên kết, không tìm thấy
vấn đề nào. Nếu phát hiện vấn đề, vui lòng liên hệ
webmaster@ruby-lang.org.

### Tài liệu tham khảo trực tuyến

Tài liệu tham khảo trực tuyến nằm trên RWiki. Đầu tiên chúng tôi phục hồi nội dung vào
ngày 29 tháng 2, sau đó áp dụng các bản vá gửi qua email đến các tài khoản email bên ngoài vào
ngày 29 tháng 2. Sau đó chúng tôi so sánh với nội dung trên 'helium'.

Diff có thể được lấy từ:

    https://www.ruby-lang.org/check-data/ruby-man/man-rd-ja.diff

Sự khác biệt của Base64.rd đến từ dấu xuống dòng được chèn khi nhận
email. trap%3A%3ANilClass.rd.rej bị từ chối vì cùng một bản vá
được áp dụng hai lần. Script diff so sánh các tệp với các tệp từ 61 phút
trước, nên cùng một bản vá được gửi hai lần.

Chúng tôi xác nhận không có tệp nào bị ảnh hưởng bởi vụ xâm nhập.

### RAA

Chúng tôi đã thực hiện xác minh dữ liệu sau.

* Chúng tôi tạo diff hàng ngày của dữ liệu RAA từ 1) bản sao dữ liệu RAA sạch
  được sao lưu vào ngày 27 tháng 3, 2) các bản sao lưu hàng ngày từ 4 tháng 4 đến 28 tháng 5, và 3)
  dữ liệu RAA mới nhất ngày 28 tháng 5.

  2) và 3) nằm trong khu vực được bảo vệ chroot trên máy.
  1) là sạch vì được giữ trong môi trường phát triển.

  * Cập nhật dữ liệu RAA:<br />
    http://raa.ruby-lang.org/announce/soapbox-diff-all-passphrasemask.txt
  * Mục nhập RAA mới:<br />
    http://raa.ruby-lang.org/announce/soapbox-new-passphrasemask.txt

* Chúng tôi xác nhận không có dữ liệu đáng ngờ trong các diff trên.

Có thể kết luận rằng dữ liệu RAA ngày 28 tháng 5 (cùng dữ liệu chúng tôi sử dụng
để khởi động lại dịch vụ RAA) không chứa dữ liệu đáng ngờ.
Do đó chúng tôi quyết định khởi động lại dịch vụ RAA như trạng thái ngày 28 tháng 5. Chúng tôi
không thể đảm bảo rằng các thay đổi trông bình thường bởi kẻ xâm nhập không
tồn tại. Ví dụ, thay đổi của sampleproject vào ngày 18 tháng 5 như
sau;

    == sampleproject
    - updated: Sun May 09 12:35:19 GMT+9:00 2004
    + updated: Mon May 17 13:00:38 GMT+9:00 2004
    - version: 0.0.8
    + version: 0.1.1

Không có dữ liệu nào đáng ngờ, nhưng có khả năng các thay đổi
được thực hiện bởi kẻ xâm nhập. Do đó, chúng tôi yêu cầu mỗi chủ dự án RAA
KIỂM TRA CÁC MỤC NHẬP RAA CỦA HỌ VÀ CẬP NHẬT ĐỂ XÁC NHẬN. Để thực hiện,
hãy làm theo các bước sau:

(1) Mở trang dự án

(2) Kiểm tra thông tin dự án

(3) Đi đến trang "update"

(4) Nhấn nút "submit" (thực hiện điều này ngay cả khi không cần cập nhật --
    bước này là để xác nhận)

Vui lòng liên hệ raa-admin@ruby-lang.org nếu bạn tìm thấy dữ liệu đáng ngờ
trong RAA, hoặc có bất kỳ câu hỏi nào. Cảm ơn sự hợp tác của bạn.

### FTP

Chúng tôi so sánh giá trị md5sum của các tệp trên FTP với các tệp được giữ trên
máy chủ an toàn bên ngoài, và không có sự khác biệt.

Tuy nhiên, chúng tôi không thể kiểm tra các thư mục sau. Do đó,
chúng hiện không được cung cấp.

    /pub/ruby/contrib/
    /pub/ruby/doc/
    /pub/ruby/snapshots/
    /pub/ruby/ML/
    /pub/ruby/shim/

Nếu bạn cần các tệp trong các thư mục này, vui lòng liên hệ
ftpadmin@ruby-lang.org.

### Danh sách thư

Chúng tôi đã kiểm tra các tệp cấu hình của mỗi danh sách thư, và không
tìm thấy vấn đề nào. Tuy nhiên, danh sách thành viên và kho lưu trữ email chưa được
kiểm tra kỹ lưỡng.

Nếu bạn gặp vấn đề, vui lòng liên hệ &lt;ML name&gt;-admin@ruby-lang.org.

Shugo Maeda &lt;shugo@ruby-lang.org&gt;<br />
nhóm quản trị viên ruby-lang.org
