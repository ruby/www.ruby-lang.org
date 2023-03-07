---
layout: page
title: "Ruby Releases"
lang: ko
---

이 페이지에는 개별 Ruby 릴리스가 나열되어 있습니다.
{: .summary}

여러 Ruby 브랜치의 현재 유지보수 상태에 대한 정보는
[브랜치 페이지](../branches/)를 참조하세요.

### 버전 번호별 Ruby 릴리스

Ruby 릴리스 목록입니다.
표시된 날짜는 릴리스 게시물의 영어 버전 게시 날짜에 해당하며 소스 tarball의 실제
생성 날짜와 다를 수 있습니다.

<table class="release-list">
<tr>
<th>출시 버전</th>
<th>출시일</th>
<th>다운로드 URL</th>
<th>릴리스 노트</th>
</tr>
{% assign releases = site.data.releases | reverse | sort: "date" | reverse %}
{% for release in releases %}
<tr>
<td>Ruby {{ release.version }}</td>
<td>{{ release.date }}</td>
<td><a href="{{ release.url.gz }}">download</a></td>
<td><a href="{{ release.post }}">more...</a></td>
</tr>{% endfor %}
</table>
