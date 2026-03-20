---
layout: page
title: "Релізи Ruby"
lang: uk
---

На цій сторінці наведені окремі релізи Ruby.
{: .summary}

Інформацію про поточний статус підтримки різних гілок Ruby дивіться на
[сторінці гілок](../branches/).

### Релізи Ruby за номером версії

Це список релізів Ruby.
Показані дати відповідають датам публікації англомовних
публікацій про релізи й можуть відрізнятися від фактичних
дат створення вихідних tarball-ів.

<table class="release-list">
<tr>
<th>Версія релізу</th>
<th>Дата релізу</th>
<th>URL для завантаження</th>
<th>Нотатки до релізу</th>
</tr>
{% assign releases = site.data.releases | reverse | sort: "date" | reverse %}
{% for release in releases %}
<tr>
<td>Ruby {{ release.version }}</td>
<td>{{ release.date }}</td>
<td><a href="{{ release.url.gz }}">завантажити</a></td>
<td><a href="{{ release.post | localize_post_url: page.lang }}">детальніше...</a></td>
</tr>{% endfor %}
</table>
