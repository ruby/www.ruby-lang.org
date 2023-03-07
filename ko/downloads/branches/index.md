---
layout: page
title: "Ruby 유지보수 브랜치"
lang: ko
---

이 페이지는 여러 Ruby 브랜치의 현재 유지보수 상태를 나열합니다.
{: .summary}

특정 릴리스에 대한 자세한 내용은 [릴리스 페이지](../releases/)를 참조하십시오.

이것은 Ruby 브랜치 와 유지보수 상태의 예비 목록입니다.
표시된 날짜는 영어 버전의 릴리스 게시물 또는 EOL 발표에서 유추됩니다.

Ruby 브랜치 또는 릴리스 시리즈는 밑에 나열된 단계로 분류됩니다.

* **일반 유지보수**(버그 수정):
  이 브랜치는 일반 버그 수정 및 보안 수정을 받습니다.
* **보안 유지보수**(보안 수정):
  보안 수정 사항만 이 브랜치에 백포트됩니다.
* **eol** (end-of-life 수명 종료):
  Branch는 더 이상 ruby-core 팀에서 지원하지 않으며
  어떠한 수정 사항도 받지 않습니다. 

{% include branches-timeline.html %}

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

상태: {{ branch.status }}<br>
릴리스 날짜: {{ branch.date }}<br>
일반 유지보수 종료: {% if branch.security_maintenance_date %}{{ branch.security_maintenance_date }}{% else %}TBD{% endif %}<br>
EOL: {% if branch.eol_date %}{{ branch.eol_date }}{% else %}{% if branch.expected_eol_date %}{{ branch.expected_eol_date }} (expected){% else %}TBD{% endif %}{% endif %}

{% endfor %}
