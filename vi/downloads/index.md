---
layout: page
title: "Tải về Ruby"
lang: vi
---

Tại đây bạn có thể tải về các bản phân phối Ruby mới nhất theo cách bạn thích.
Phiên bản ổn định hiện tại là {{ site.data.downloads.stable[0] }}.
Vui lòng đọc [Giấy phép của Ruby][license].
{: .summary}

### Các cách cài đặt Ruby

Chúng tôi có nhiều công cụ trên mỗi nền tảng chính để cài đặt Ruby:

* Trên Linux/UNIX, bạn có thể sử dụng hệ thống quản lý gói của bản phân
  phối hoặc các công cụ bên thứ ba ([rbenv][rbenv] và [RVM][rvm]).
* Trên máy macOS, bạn có thể sử dụng các công cụ bên thứ ba ([rbenv][rbenv] và [RVM][rvm]).
* Trên máy Windows, bạn có thể sử dụng [RubyInstaller][rubyinstaller].

Xem trang [Cài đặt][installation] để biết chi tiết về cách sử dụng
hệ thống quản lý gói hoặc công cụ bên thứ ba.

Tất nhiên, bạn cũng có thể cài đặt Ruby từ mã nguồn trên tất cả các nền tảng chính.

### Biên dịch Ruby — Mã nguồn

Cài đặt từ mã nguồn là một giải pháp tuyệt vời khi bạn đủ quen thuộc với
nền tảng của mình và có thể cần các cài đặt cụ thể cho môi trường của bạn.
Đây cũng là giải pháp tốt trong trường hợp không có sẵn các gói cài đặt
cho nền tảng của bạn.

Xem trang [Cài đặt][installation] để biết chi tiết về cách xây dựng
Ruby từ mã nguồn. Nếu bạn gặp vấn đề khi biên dịch Ruby, hãy xem xét
sử dụng một trong các công cụ bên thứ ba được đề cập ở trên. Chúng có thể
giúp ích cho bạn.

* **Bản phát hành ổn định:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **Bản xem trước:**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **Trong giai đoạn bảo trì bảo mật (sắp kết thúc vòng đời!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **Không còn được bảo trì (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Bản chụp nhanh:**{% for snapshot in site.data.downloads.stable_snapshots %}
  * [Bản chụp ổn định của nhánh {{ snapshot.branch }}]({{ snapshot.url.gz }}):
    Đây là tarball của bản chụp mới nhất từ nhánh `{{ snapshot.branch }}` hiện tại.{% endfor %}
  * [Bản chụp hàng đêm]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Đây là tarball của những gì có trong Git, được tạo hàng đêm.
    Bản này có thể chứa lỗi hoặc vấn đề khác, sử dụng theo rủi ro của bạn!

Để biết thêm thông tin về các phiên bản cụ thể, đặc biệt là các phiên bản
cũ hơn hoặc bản xem trước, xem [trang Các phiên bản][releases].
Thông tin về tình trạng bảo trì hiện tại của các nhánh Ruby có thể được
tìm thấy trên [trang Các nhánh][branches].

Để biết thông tin về kho Subversion và Git của Ruby, xem trang
[Ruby Core](/vi/community/ruby-core/).

Mã nguồn Ruby có sẵn từ một tập hợp các [máy chủ nhân bản][mirrors]
trên toàn thế giới. Vui lòng thử sử dụng máy chủ nhân bản gần bạn nhất.



[license]: {{ site.license.url }}
[installation]: /vi/documentation/installation/
[releases]: /vi/downloads/releases/
[branches]: /vi/downloads/branches/
[mirrors]: /vi/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
