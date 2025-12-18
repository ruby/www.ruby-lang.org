---
layout: page
title: "Pobierz Rubiego"
lang: pl
---

{% include warnings/out_of_date.html %}

Tutaj znajdziesz najnowsze dystrybucje języka Ruby. Aktualna stabilna
wersja to {{ site.data.downloads.stable[0] }}. Pamiętaj aby przeczytać
[licencję Rubiego][license].
{: .summary}

### Sposoby instalacji Rubiego

Mamy dostępnych wiele narzędzi dla każdej znaczącej platformy by zainstalować
Rubiego:

* dla maszyn z systemem Linux/UNIX możesz użyć systemowego menedżera pakietów
  lub narzędzi osób trzecich ([rbenv][rbenv] lub [RVM][RVM]),
* dla maszyn z systemem macOS możesz użyć narzędzi osób trzecich ([rbenv][rbenv] lub [RVM][rvm]),
* dla maszyn z systemem Windows możesz użyć narzędzia [RubyInstaller][rubyinstaller].

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
  Ruby {{ site.data.downloads.stable[0] }}

* **Migawki:**
  * [Stabilna migawka]({{ site.data.downloads.stable_snapshots[0].url.gz }}):
    To jest tarball ostatniej migawki stabilnej obecnego stabilnego brancha.
  * [Nocna migawka]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    To jest tarball tego co jest w Git, przygotowany
    w nocy. Może zawierać błędy lub inne problemy, używaj na własne ryzyko!

Aby uzyskać informacje na temat repozytorium Rubiego w Subversion i Git,
zobacz stronę [Ruby Core](/en/community/ruby-core/).

Źródła Rubiego są dostępne na światowych
[stronach lustrzanych][mirrors].
Spróbuj użyć jakiegoś blisko ciebie.



[license]: {{ site.license.url }}
[installation]: /pl/documentation/installation/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
