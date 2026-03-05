---
layout: page
title: "Релизы Ruby"
lang: ru
---

На этой странице перечислены отдельные релизы Ruby.
{: .summary}

Информацию о текущем статусе поддержки различных
веток Ruby смотрите на
[странице веток](../branches/).

### Релизы Ruby по номеру версии

Это список релизов Ruby.
Указанные даты соответствуют датам публикации
английских версий постов о релизах и могут отличаться от
фактических дат создания архивов с исходным кодом.

<table class="release-list">
<tr>
<th>Версия релиза</th>
<th>Дата релиза</th>
<th>Ссылка для скачивания</th>
<th>Заметки о релизе</th>
</tr>
{% assign releases = site.data.releases | reverse | sort: "date" | reverse %}
{% for release in releases %}
<tr>
<td>Ruby {{ release.version }}</td>
<td>{{ release.date }}</td>
<td><a href="{{ release.url.gz }}">скачать</a></td>
<td><a href="{{ release.post | localize_post_url: page.lang }}">подробнее...</a></td>
</tr>{% endfor %}
</table>
