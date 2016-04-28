---
layout: page
title: "Tải về Ruby"
lang: vi
---

Bạn có thể lấy về bản phân phối Ruby mới nhất cho hầu hết các nền tảng
tại đây.
Bản ổn định mới nhất là {{ site.downloads.stable[0].version }}.
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

Dĩ nhiên bạn có thể cài đặt Ruby từ gói mã nguồn trên các nền tảng
chính.

### Biên dịch Ruby — Mã nguồn

Cài đặt từ mã nguồn là một giải pháp tốt nếu bạn nắm vững nền tảng hệ
thống, hoặc nếu bạn muốn hiệu chỉnh cho phù hợp môi trường. Đây cũng là
giải pháp tốt nếu không có gói đóng sẵn cho nền tảng của bạn.

Xem trang [Cài đặt][installation] để biết thêm chi tiết cách biên dịch
Ruby từ nguồn. Nếu bạn gặp vấn đề biên dịch Ruby, xin hãy xem xét sử
dụng một trong những công cụ của bên thứ ba đã được đề cập ở trên.

* **Bản ổn định:**{% for release in site.downloads.stable %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.downloads.security_maintenance %}
* **Trong giai đoạn duy trì bảo mật (sẽ sớm EOL!):**{% for release in site.downloads.security_maintenance %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.downloads.eol %}
* **Không còn duy trì nữa (EOL):**{% for release in site.downloads.eol %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Snapshots:**
  * [Stable Snapshot]({{ site.downloads.stable_snapshot.url.gz }}):
    Đây là một tarball của snapshot mới nhất của nhánh ổn định hiện hành.
  * [Nightly Snapshot]({{ site.downloads.nightly_snapshot.url.gz }}):
    Đây là một tarball của mã mới nhất hiện hữu trong SVN. Gói này được
    tạo ra mỗi đêm. Xin lưu ý gói có thể kèm theo lỗi và một số vấn đề
    khác.

Để biết thêm chi tiết về Ruby Subversion và Git repositories, xem trang
[Ruby Core](/vi/community/ruby-core/).

Mã nguồn Ruby được đăng lên các [Mirror Sites][mirrors] trên thế giới.
Xin hãy sử dụng mirror gần bạn nhất.



[license]: {{ site.license.url }}
[installation]: /vi/documentation/installation/
[mirrors]: /en/downloads/mirrors/
