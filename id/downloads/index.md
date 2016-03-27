---
layout: page
title: "Unduh Ruby"
lang: id
---

Di sini Anda bisa mendapatkan distribusi Ruby terbaru sesuai pilihan Anda.
Versi stabil saat ini adalah {{ site.downloads.stable[0].version }}.
Pastikan Anda membaca [Lisensi Ruby][license] terlebih dahulu.
{: .summary}

### Cara Memasang Ruby

Kami memiliki beberapa kakas bantu untuk memasang Ruby pada perangkat berikut:

* Di Linux/UNIX, Anda dapat menggunakan *package management system* dari
  distribusi Linux/UNIX Anda atau kakas pihak ketiga (rbenv dan RVM).
* Di OS X, Anda dapat menggunakan kakas pihak ketiga (rbenv dan RVM).
* Di Windows, Anda dapat menggunakan RubyInstaller.

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

* **Stable releases:**{% for release in site.downloads.stable %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.downloads.security_maintenance %}
* **Pada fase perawatan keamanan (akan EOL segera!):**{% for release in site.downloads.security_maintenance %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.downloads.eol %}
* **Tidak dirawat sama sekali (EOL):**{% for release in site.downloads.eol %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **Snapshots:**
  * [Stable Snapshot]({{ site.downloads.stable_snapshot.url.gz }}):
    Ini adalah *tarball* dari *snapshot branch* yang stabil saat ini.
  * [Nightly Snapshot]({{ site.downloads.nightly_snapshot.url.gz }}):
    Ini adalah *tarball* dari apapun yang ada di SVN, *nightly*.
    Ini mungkin terdapat *bugs* atau masalah lain, gunakan secara hati-hati!

Untuk informasi *repository* Ruby Subversion dan Git, lihat
halaman [Ruby core](/id/community/ruby-core/) kami.

Kode sumber Ruby tersedia dari kumpulan
[Mirror Sites][mirrors] di seluruh dunia.
Coba gunakan salah satu *mirror* yang dekat dengan Anda.



[license]: {{ site.license.url }}
[installation]: /id/documentation/installation/
[mirrors]: /en/downloads/mirrors/
