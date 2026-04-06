---
layout: page
title: "Maintenance des branches de Ruby"
lang: fr
---
Cette page présente l'état actuel de la maintenance des différentes branches de Ruby.
{: .summary}

Pour plus d'informations sur des versions spécifiques, consultez la
[page des versions](../releases/).

Voici une liste préliminaire des branches Ruby et de leur statut de maintenance.
Les dates indiquées sont déduites des versions anglaises des annonces de publication
ou des annonces de fin de vie.

Les branches ou séries de versions Ruby sont classées ci-dessous selon
les phases suivantes :

* **maintenance normale** (correction de bogues) :
  La branche bénéficie de corrections de bogues généraux et de correctifs de sécurité.
* **maintenance de sécurité** (correction de sécurité) :
  Seules les corrections de sécurité sont rétroportées vers cette branche.
* **fin de vie** (_end-of-life_, _eol_) :
  La branche n'est plus prise en charge par l'équipe ruby-core et ne
  bénéficie d'aucune correction. Aucun autre correctif ne sera publié.

{% include branches-timeline.html %}

{% for branch in site.data.branches %}
### Ruby {{ branch.name }}

statut : {{ branch.status }}<br>
date de publication : {{ branch.date }}<br>
maintenance normale jusqu'au : {% if branch.security_maintenance_date %}{{ branch.security_maintenance_date }}{% else %}à déterminer{% endif %}<br>
EOL : {% if branch.eol_date %}{{ branch.eol_date }}{% else %}{% if branch.expected_eol_date %}{{ branch.expected_eol_date }} (prévue){% else %}à déterminer{% endif %}{% endif %}

{% endfor %}