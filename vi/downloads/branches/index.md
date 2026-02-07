---
layout: page
title: "Các nhánh bảo trì Ruby"
lang: vi
---

Trang này liệt kê tình trạng bảo trì hiện tại của các nhánh Ruby khác nhau.
{: .summary}

Để biết thêm thông tin về các phiên bản cụ thể, xem
[trang Các phiên bản](../releases/).

Đây là danh sách sơ bộ của các nhánh Ruby và tình trạng bảo trì của chúng.
Các ngày hiển thị được suy ra từ các bài đăng phiên bản hoặc thông báo kết
thúc vòng đời bằng tiếng Anh.

Các nhánh hoặc loạt phiên bản Ruby được phân loại dưới đây theo
các giai đoạn sau:

* **bảo trì thường xuyên** (sửa lỗi):
  Nhánh nhận các bản sửa lỗi chung và bản sửa lỗi bảo mật.
* **bảo trì bảo mật** (sửa lỗi bảo mật):
  Chỉ có các bản sửa lỗi bảo mật được backport vào nhánh này.
* **eol** (kết thúc vòng đời):
  Nhánh không còn được nhóm ruby-core hỗ trợ và không nhận bất kỳ bản sửa
  lỗi nào. Sẽ không có bản phát hành bản vá nào nữa.

{% include branches-timeline.html %}

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

trạng thái: {{ branch.status }}<br>
ngày phát hành: {{ branch.date }}<br>
bảo trì thường xuyên đến: {% if branch.security_maintenance_date %}{{ branch.security_maintenance_date }}{% else %}TBD{% endif %}<br>
EOL: {% if branch.eol_date %}{{ branch.eol_date }}{% else %}{% if branch.expected_eol_date %}{{ branch.expected_eol_date }} (dự kiến){% else %}TBD{% endif %}{% endif %}

{% endfor %}
