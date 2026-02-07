---
layout: page
title: "Download Ruby"
lang: vi
---

Here you can get the latest Ruby distributions in your favorite flavor.
The current stable version is {{ site.data.downloads.stable[0] }}.
Please be sure to read [Ruby’s License][license].
{: .summary}

### Ways of Installing Ruby

We have several tools on each major platform to install Ruby:

* On Linux/UNIX, you can use the package management system of your
  distribution or third-party tools ([rbenv][rbenv] and [RVM][rvm]).
* On macOS machines, you can use third-party tools ([rbenv][rbenv] and [RVM][rvm]).
* On Windows machines, you can use [RubyInstaller][rubyinstaller].

See the [Installation][installation] page for details on using
package management systems or third-party tools.

Of course, you can also install Ruby from source on all major platforms.

### Compiling Ruby — Source Code

Installing from the source code is a great solution for when you are
comfortable enough with your platform and perhaps need specific settings
for your environment. It’s also a good solution in the event that there
are no other premade packages for your platform.

See the [Installation][installation] page for details on building
Ruby from source. If you have an issue compiling Ruby, consider using
one of the third party tools mentioned above. They may help you.

* **Stable releases:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **Preview releases:**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **In security maintenance phase (will EOL soon!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **Not maintained anymore (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Snapshots:**{% for snapshot in site.data.downloads.stable_snapshots %}
  * [Stable Snapshot of {{ snapshot.branch }} branch]({{ snapshot.url.gz }}):
    This is a tarball of the latest snapshot of the current `{{ snapshot.branch }}` branch.{% endfor %}
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    This is a tarball of whatever is in Git, made nightly.
    This may contain bugs or other issues, use at your own risk!

For more information about specific releases, particularly older releases
or previews, see the [Releases page][releases].
Information about the current maintenance status of the various
Ruby branches can be found on the [Branches page][branches].

For information about the Ruby Subversion and Git repositories, see our
[Ruby Core](/en/community/ruby-core/) page.

The Ruby source is available from a worldwide set of
[Mirror Sites][mirrors].
Please try to use a mirror that is near you.



[license]: {{ site.license.url }}
[installation]: /en/documentation/installation/
[releases]: /en/downloads/releases/
[branches]: /en/downloads/branches/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
