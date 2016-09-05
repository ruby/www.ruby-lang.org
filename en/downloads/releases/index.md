---
layout: page
title: "Ruby Releases"
lang: en
---

{% comment %}
In development. Not to be translated yet.
{% endcomment %}

This page lists individual Ruby releases.
{: .summary}

For information about the current maintenance status of the various
Ruby branches see the
[Branches page](../branches/).

### Ruby releases by version number

<table class="release-list">
<tr>
<th>Release Version</th>
<th>Release Date</th>
<th>Release Notes</th>
</tr>
{% for release in site.data.releases %}
<tr>
<td>Ruby {{ release.version }}</td>
<td>{{ release.date }}</td>
<td><a href="{{ release.post }}">more...</a></td>
</tr>{% endfor %}
</table>
