---
layout: page
title: "Гілки підтримки Ruby"
lang: uk
---

На цій сторінці наведено поточний статус підтримки різних гілок Ruby.
{: .summary}

Для додаткової інформації про конкретні релізи дивіться
[сторінку релізів](../releases/).

Це попередній список гілок Ruby і їхнього статусу підтримки.
Показані дати виведені з англомовних публікацій релізів
або оголошень EOL.

Гілки Ruby або серії релізів нижче розподілено за такими фазами:

* **normal maintenance** (bug fix):
  Гілка отримує загальні виправлення помилок і виправлення безпеки.
* **security maintenance** (security fix):
  До цієї гілки повертаються лише виправлення безпеки.
* **eol** (end-of-life):
  Гілка більше не підтримується командою ruby-core і не отримує
  жодних виправлень. Подальших патч-релізів не буде.

{% include branches-timeline.html %}

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

статус: {{ branch.status }}<br>
дата релізу: {{ branch.date }}<br>
звичайна підтримка до: {% if branch.security_maintenance_date %}{{ branch.security_maintenance_date }}{% else %}TBD{% endif %}<br>
EOL: {% if branch.eol_date %}{{ branch.eol_date }}{% else %}{% if branch.expected_eol_date %}{{ branch.expected_eol_date }} (очікується){% else %}TBD{% endif %}{% endif %}

{% endfor %}
