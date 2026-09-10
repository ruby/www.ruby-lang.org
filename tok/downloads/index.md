---
layout: page
title: "kama jo e Ruby"
lang: tok
---

lon ni sina ken kama jo e Ruby sin nanpa lon nasin sina olin. nanpa
awen pi tenpo ni li {{ site.data.downloads.stable[0] }}. o lukin e
[lawa kepeken Ruby][license].
{: .summary}

### nasin kama jo e Ruby

mi jo e ilo mute tawa ma ilo suli ale, tawa kama jo e Ruby:

* lon Linux/UNIX, sina ken kepeken ilo lawa namako pi ilo sona sina,
  anu ilo jan ante ([rbenv][rbenv] en [RVM][rvm]).
* lon macOS, sina ken kepeken ilo jan ante ([rbenv][rbenv] en
  [RVM][rvm]).
* lon Windows, sina ken kepeken [RubyInstaller][rubyinstaller].

o lukin e lipu [kama jo][installation] tawa sona mute pi kepeken ilo
lawa namako anu ilo jan ante.

sina ken pana sin, kama jo e Ruby tan sitelen open (source code) lon ma
ilo ale.

### pali e Ruby tan sitelen open

kama jo tan sitelen open li pona la sina sona mute e ilo sona sina,
anu sina wile e nasin namako tawa ma sina. ona li pona sin lon tenpo
ilo sina jo ala e poki kama jo pona.

o lukin e lipu [kama jo][installation] tawa sona mute pi pali Ruby tan
sitelen open. sina jo e pakala lon pali Ruby la, o alasa kepeken ilo
jan ante li toki lon sewi. ona li ken pana pona.

* **nanpa awen (stable):**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **nanpa lukin-open (preview):**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **lon tenpo awen pona taso (kama pini lon tenpo lili!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **kama pini pona (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **sitelen open pi tenpo ni (Snapshots):**{% for snapshot in site.data.downloads.stable_snapshots %}
  * [Stable Snapshot pi lipu {{ snapshot.branch }}]({{ snapshot.url.gz }}):
    ni li poki sitelen pi tenpo pini nanpa wan, tan lipu `{{ snapshot.branch }}` pi tenpo ni.{% endfor %}
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    ni li poki sitelen tan Git, li kama sin lon tenpo pimeja ale.
    ona li ken jo e pakala, o kepeken kepeken lawa sina!

tawa sona mute pi nanpa sin, e nanpa pini, e nanpa lukin-open, o lukin
e [lipu Releases][releases] (toki Inglisi). sona pi tenpo awen pi lipu
Ruby mute li lon [lipu Branches][branches] (toki Inglisi).

tawa sona pi poki sitelen Ruby (Subversion en Git), o lukin e lipu
[Ruby Core](/en/community/ruby-core/) (toki Inglisi).

sitelen open pi Ruby li lon [ma Mirror Sites][mirrors] (toki Inglisi)
pi ma ale. o alasa kepeken mirror li lon poka sina.



[license]: {{ site.license.url }}
[installation]: /tok/documentation/installation/
[releases]: /en/downloads/releases/
[branches]: /en/downloads/branches/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
