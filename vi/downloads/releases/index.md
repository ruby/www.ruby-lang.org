---
layout: page
title: "Các phiên bản Ruby"
lang: vi
---

Trang này liệt kê các phiên bản Ruby riêng lẻ.
{: .summary}

Để biết thông tin về tình trạng bảo trì hiện tại của các nhánh Ruby,
xem [trang Các nhánh](../branches/).

### Các phiên bản Ruby theo số phiên bản

Đây là danh sách các phiên bản Ruby đã phát hành.
Các ngày hiển thị tương ứng với ngày công bố của các bài đăng
phiên bản tiếng Anh và có thể khác với ngày tạo thực tế của
các tarball mã nguồn.

<table class="release-list">
<tr>
<th>Phiên bản</th>
<th>Ngày phát hành</th>
<th>Đường dẫn tải về</th>
<th>Ghi chú phát hành</th>
</tr>
{% assign releases = site.data.releases | reverse | sort: "date" | reverse %}
{% for release in releases %}
<tr>
<td>Ruby {{ release.version }}</td>
<td>{{ release.date }}</td>
<td><a href="{{ release.url.gz }}">tải về</a></td>
<td><a href="{{ release.post }}">xem thêm...</a></td>
</tr>{% endfor %}
</table>
