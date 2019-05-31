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

This is a preliminary list of Ruby branches and their maintenance status.
The shown dates are inferred from the English versions of release posts
or EOL announcements.

The Ruby branches or release series are categorized below into
the following phases:

* **normal maintenance** (bug fix):
  Branch receives general bug fixes and security fixes.
* **security maintenance** (security fix):
  Only security fixes are backported to this branch.
* **eol** (end-of-life):
  Branch is not supported by the ruby-core team any longer and does
  not receive any fixes. No further patch release will be released.
* **preview**:
  Only previews or release candidates have been released for
  this branch so far.

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

status: {{ branch.status }}<br>
release date: {{ branch.date }}{% if branch.eol_date %}<br>
EOL date: {{ branch.eol_date }}
{% endif %}

{% endfor %}
