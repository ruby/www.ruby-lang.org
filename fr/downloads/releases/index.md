---
layout: page
title: "Versions de Ruby"
lang: fr
---
Cette page liste les publications de version de Ruby.
{: .summary}

Pour plus d'informations sur l'état actuel de la maintenance des différentes
branches de Ruby, consultez la
[page Branches](../branches/).

### Publications de Ruby par numéro de version

Voici une liste des versions de Ruby.
Les dates indiquées correspondent aux dates de publication des
articles annonçant la sortie en anglais et peuvent différer des
dates de création réelles des archives source.

<table class="release-list">
<tr>
<th>Version</th>
<th>Date de publication</th>
<th>URL de téléchargement</th>
<th>Note de version</th>
</tr>
{% assign releases = site.data.releases | reverse | sort: "date" | reverse %}
{% for release in releases %}
<tr>
<td>Ruby {{ release.version }}</td>
<td>{{ release.date }}</td>
<td><a href="{{ release.url.gz }}">download</a></td>
<td><a href="{{ release.post }}">détails ...</a></td>
</tr>{% endfor %}
</table>