---
layout: page
title: "Unduh Ruby"
lang: id
---

Di sini Anda bisa mendapatkan distribusi Ruby terbaru sesuai pilihan Anda.
Versi stabil saat ini adalah {{ site.data.downloads.stable[0] }}.
Pastikan Anda membaca [Lisensi Ruby][license] terlebih dahulu.
{: .summary}

### Cara Memasang Ruby

Kami memiliki beberapa kakas bantu untuk memasang Ruby pada perangkat berikut:

* Di Linux/UNIX, Anda dapat menggunakan *package management system* dari
  distribusi Linux/UNIX Anda atau kakas pihak ketiga ([rbenv][rbenv] dan [RVM][rvm]).
* Di macOS, Anda dapat menggunakan kakas pihak ketiga ([rbenv][rbenv] dan [RVM][rvm]).
* Di Windows, Anda dapat menggunakan [RubyInstaller][rubyinstaller].

Lihat halaman [Instalasi][installation] untuk detail menggunakan
*package management system* atau kakas bantu pihak ketiga.

Tentu saja, Anda juga dapat memasang Ruby dari kode sumbernya.

### Kompilasi Ruby - Kode Sumber

Memasang dari kode sumber adalah salah satu solusi yang tepat ketika Anda
nyaman dengan perangkat Anda dan mungkin membutuhkan konfigurasi tertentu
sesuai perangkat Anda gunakan. Ini juga termasuk solusi yang baik saat
tidak ada *package* yang sebelumnya telah dibuat di dalam perangkat Anda.

Lihat halaman [Instalasi][installation] untuk detail membangun
Ruby dari kode sumbernya. Jika Anda memiliki masalah kompilasi Ruby, pertimbangkan menggunakan
salah satu kakas bantu pihak ketiga yang telah disebutkan sebelumnya. Itu mungkin membantu Anda.

* **Stable releases:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **Preview releases:**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **Pada fase perawatan keamanan (akan EOL segera!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **Tidak dirawat sama sekali (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Snapshots:**
  * [Stable Snapshot]({{ site.data.downloads.stable_snapshots[0].url.gz }}):
    Ini adalah *tarball* dari *snapshot branch* yang stabil saat ini.
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Ini adalah *tarball* dari apapun yang ada di Git, *nightly*.
    Ini mungkin terdapat *bugs* atau masalah lain, gunakan secara hati-hati!

Untuk informasi lebih lanjut terkait rilis yang spesifik, terutama rilis
sebelumnya atau *preview*, lihat [Release page][releases].
Informasi terkait status perawatan saat ini dari berbagai
*branch* Ruby dapat ditemukan pada [Branches page][branches].

Untuk informasi *repository* Ruby Subversion dan Git, lihat
halaman [Ruby core](/id/community/ruby-core/) kami.

Kode sumber Ruby tersedia dari kumpulan
[Mirror Sites][mirrors] di seluruh dunia.
Coba gunakan salah satu *mirror* yang dekat dengan Anda.



[license]: {{ site.license.url }}
[installation]: /id/documentation/installation/
[releases]: /en/downloads/releases/
[branches]: /en/downloads/branches/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
