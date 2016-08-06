---
layout: page
title: "Ruby Maintenance Branches"
lang: en
---

{% comment %}
In development. Not to be translated yet.
{% endcomment %}

This page lists the current maintenance status of the various Ruby branches.
{: .summary}

For more information about specific releases see the
[Releases page](../releases/).

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

status: {{ branch.status }}<br>
release date: {{ branch.date }}<br>
EOL date: {{ branch.eol_date }}

{% endfor %}
