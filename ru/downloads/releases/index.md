---
layout: page
title: "Ruby Releases"
lang: ru
---

This page lists individual Ruby releases.
{: .summary}

For information about the current maintenance status of the various
Ruby branches see the
[Branches page](../branches/).

### Ruby releases by version number

This is a list of Ruby releases.
The shown dates correspond to the publication dates of the
English versions of release posts and may differ from the
actual creation dates of the source tarballs.

<table class="release-list">
<tr>
<th>Release Version</th>
<th>Release Date</th>
<th>Download URL</th>
<th>Release Notes</th>
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
