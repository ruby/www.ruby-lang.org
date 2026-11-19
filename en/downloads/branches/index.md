---
layout: page
title: "Ruby Maintenance Branches"
lang: en
---

This page lists the current maintenance status of the various Ruby branches.
{: .summary}

For more information about specific releases see the
[Releases page](../releases/).

This is a preliminary list of Ruby branches and their maintenance status.
The shown dates are inferred from the English versions of release posts
or EOL announcements.

The Ruby branches or release series are categorized below into
the following phases:

* **normal maintenance** (bug fix):
  Branch receives general bug fixes and security fixes.
* **legacy maintenance** (security fix and selected bug fix):
  Branch receives security fixes and bug fixes that we judge need
  to be backported. Before Ruby 3.3.14 this phase was called
  security maintenance and received only security fixes.
* **eol** (end-of-life):
  Branch is not supported by the ruby-core team any longer and does
  not receive any fixes. No further patch release will be released.

{% include branches-timeline.html %}

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

status: {{ branch.status }}<br>
release date: {{ branch.date }}<br>
normal maintenance until: {% if branch.security_maintenance_date %}{{ branch.security_maintenance_date }}{% else %}TBD{% endif %}<br>
EOL: {% if branch.eol_date %}{{ branch.eol_date }}{% else %}{% if branch.expected_eol_date %}{{ branch.expected_eol_date }} (expected){% else %}TBD{% endif %}{% endif %}

{% endfor %}
