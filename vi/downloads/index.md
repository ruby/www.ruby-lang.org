---
layout: page
title: "Tải về Ruby"
lang: vi
---

Bạn có thể lấy về bản phân phối Ruby mới nhất cho hầu hết các nền tảng
tại đây.
Bản ổn định mới nhất là {{ site.downloads.stable.version }}.
Xin tham khảo [giấy phép][license] trước khi dùng.
{: .summary}

### Các phương pháp cài đặt Ruby

Chúng ta có một vài công cụ trên các nền tảng chính để cài đặt Ruby:

* Trên Linux/UNIX bạn có thể dùng hệ thống quản lý gói của bản
  phân phối hoặc các công cụ của bên thứ ba (rbenv và RVM).
* Trên OSX bạn có thể dùng các công cụ của bên thứ ba (rbenv và RVM)
* Trên Windows bạn có thể dùng RubyInstaller.

Xem trang [Cài đặt][installation] để biết thêm chi tiết về
hệ thống quản lý gói hoặc các công cụ của bên thứ ba.

Dĩ nhiên bạn có thể cài đặt Ruby từ gói mã nguồn trên các nền tảng chính.

### Biên dịch Ruby — Mã nguồn

Cài đặt từ mã nguồn là một giải pháp tốt nếu bạn nắm vững nền tảng hệ
thống, hoặc nếu bạn muốn hiệu chỉnh cho phù hợp môi trường. Đây cũng là
giải pháp tốt nếu không có gói đóng sẵn cho nền tảng của bạn.

Xem trang [Cài đặt][installation] để biết thêm chi tiết cách biên dịch
Ruby từ nguồn. Nếu bạn gặp vấn đề biên dịch Ruby, xin hãy xem xét sử
dụng một trong những công cụ của bên thứ ba đã được đề cập ở trên.

* **Bản ổn định hiện hành:**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **Bản ổn định trước đó:**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **Bản ổn định cũ (chuỗi 2.0.0):**
  [Ruby {{ site.downloads.previous20.version }}][previous20-gz]<br>
  sha256: {{ site.downloads.previous20.sha256.gz }}

* **Bản ổn định cũ (chuỗi 1.9.3):**
  [Ruby {{ site.downloads.previous19.version }}][previous19-gz]<br>
  sha256: {{ site.downloads.previous19.sha256.gz }}

* **Snapshots:**
  * [Stable Snapshot][stable-snapshot-gz]:
    Đây là một tarball của snapshot mới nhất của nhánh ổn định hiện hành.
  * [Nightly Snapshot][nightly-gz]:
    Đây là một tarball của mã mới nhất hiện hữu trong SVN. Gói này được tạo
    ra mỗi đêm. Xin lưu ý gói có thể kèm theo lỗi và một số vấn đề khác.

Để biết thêm chi tiết về Ruby Subversion và Git repositories, xem trang
[Ruby Core](/vi/community/ruby-core/).

Mã nguồn Ruby được đăng lên các [Mirror Sites][mirrors] trên thế giới.
Xin hãy sử dụng mirror gần bạn nhất.



[license]: {{ site.license.url }}
[installation]: /vi/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous20-gz]: {{ site.downloads.previous20.url.gz }}
[previous19-gz]: {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
