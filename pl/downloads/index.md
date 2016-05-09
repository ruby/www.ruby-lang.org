---
layout: page
title: "Pobierz Rubiego"
lang: pl
---

Tutaj znajdziesz najnowsze dystrybucje języka Ruby. Aktualna stabilna
wersja to {{ site.downloads.stable[0].version }}. Pamiętaj aby przeczytać
[licencję Rubiego][license].
{: .summary}

### Sposoby instalacji Rubiego

Mamy dostępnych wiele narzędzi dla każdej znaczącej platformy by zainstalować
Rubiego:

* dla maszyn z systemem Linux/UNIX możesz użyć systemowego menedżera pakietów
  lub narzędzi osób trzecich (rbenv lub RVM),
* dla maszyn z systemem OS X możesz użyć narzędzi osób trzecich (rbenv lub RVM),
* dla maszyn z systemem Windows możesz użyć narzędzia RubyInstaller.

Zobacz stronę [Instalacja][installation] po więcej szczegółów dotyczących
systemów zarządzania pakietami lub narzędzi osób trzecich.

Oczywiście możesz zainstalować Rubiego z kodu źródłowego na wszystkich
znaczących platformach.

### Kompilacja Rubiego — Kod źródłowy

Instalowanie z kodów źródłowych jest doskonałym rozwiązaniem gdy dobrze
znasz swój system i gdy potrzebujesz specyficznych ustawień dla swojego
środowiska. Jest to także dobra opcja gdy nie ma dla twojej platformy
innych przygotowanych pakietów.

Zobacz stronę [Instalacja][installation] po więcej szczegółów dotyczących
budowania Rubiego ze źródeł. Jeśli masz problem z kompilacją Rubiego rozważ
skorzystanie z narzędzi osób trzecich wspomnianych powyżej. Mogą ci pomóc.

* **Obecny stabilny:**
  [Ruby {{ site.downloads.stable[0].version }}]({{ site.downloads.stable[0].url.gz }})<br>
  sha256: {{ site.downloads.stable[0].sha256.gz }}

* **Poprzedni stabilny:**
  [Ruby {{ site.downloads.stable[1].version }}]({{ site.downloads.stable[1].url.gz }})<br>
  sha256: {{ site.downloads.stable[1].sha256.gz }}

* **Stary stabilny:**
  [Ruby {{ site.downloads.stable[2].version }}]({{ site.downloads.stable[2].url.gz }})<br>
  sha256: {{ site.downloads.stable[2].sha256.gz }}

* **Migawki:**
  * [Stabilna migawka]({{ site.downloads.stable_snapshot.url.gz }}):
    To jest tarball ostatniej migawki stabilnej obecnego stabilnego brancha.
  * [Nocna migawka]({{ site.downloads.nightly_snapshot.url.gz }}):
    To jest tarball tego co jest w SVN, przygotowany
    w nocy. Może zawierać błędy lub inne problemy, używaj na własne ryzyko!

Aby uzyskać informacje na temat repozytorium Rubiego w Subversion i Git,
zobacz stronę [Ruby Core](/en/community/ruby-core/).

Źródła Rubiego są dostępne na światowych
[stronach lustrzanych][mirrors].
Spróbuj użyć jakiegoś blisko ciebie.



[license]: {{ site.license.url }}
[installation]: /pl/documentation/installation/
[mirrors]: /en/downloads/mirrors/
