---
layout: page
title: "Pobierz Rubiego"
lang: pl
---

Tutaj znajdziesz najnowsze dystrybucje języka Ruby. Aktualna stabilna
wersja to {{ site.downloads.stable.version }}. Pamiętaj aby przeczytać
[licencję Rubiego][license].
{: .summary}

### Sposoby instalacji Rubiego

Mamy dostępnych wiele narzędzi dla każdej znaczącej platformy by zainstalować
Rubiego:

* dla maszyn z systemem Linux/UNIX możesz użyć systemowego menedżera pakietów
  lub narzędzi osób trzecich (rbenv lub RVM),
* dla maszyn z systemem OS X możesz użyć narzędzi osób trzecich (rbenv lub RVM),
* dla maszyn z systemem Windows możesz użyć narzędzia RubyInstaller lub pik.

Zobacz stronę [Instalacja](/pl/installation/) po więcej szczegółów dotyczących
systemów zarządzania pakietami lub narzędzi osób trzecich.

Oczywiście możesz zainstalować Rubiego z kodu źródłowego na wszystkich
znaczących platformach.

### Kompilacja Rubiego — Kod źródłowy

Instalowanie z kodów źródłowych jest doskonałym rozwiązaniem gdy dobrze
znasz swój system i gdy potrzebujesz specyficznych ustawień dla swojego
środowiska. Jest to także dobra opcja gdy nie ma dla twojej platformy
innych przygotowanych pakietów.

Zobacz stronę [Instalacja](/pl/installation/) po więcej szczegółów dotyczących
budowania Rubiego ze źródeł. Jeśli masz problem z kompilacją Rubiego rozważ
skorzystanie z narzędzi osób trzecich wspomnianych powyżej. Mogą ci pomóc.

* **Obecny stabilny:**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  md5: {{ site.downloads.stable.md5.gz }}

* **Poprzedni stabilny:**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  md5: {{ site.downloads.previous.md5.gz }}

* **Stary stabilny:**
  [Ruby {{ site.downloads.previous19.version }}][old-gz]<br>
  md5: {{ site.downloads.previous19.md5.gz }}

* **Migawki:**
  * [Stabilna migawka][stable-snapshot-gz]:
    To jest tarball ostatniej migawki stabilnej obecnego stabilnego brancha.
  * [Nocny migawka][nightly-gz]:
    To jest tarball tego co jest w SVN, przygotowany
    w nocy. Może zawierać błędy lub inne problemy, używaj na własne ryzyko!

Aby uzyskać informacje na temat repozytorium Rubiego w Subversion i Git,
zobacz stronę [Ruby Core](/en/community/ruby-core/).

Źródła Rubiego są dostępne na światowych
[stronach lustrzanych][mirrors].
Spróbuj użyć jakiegoś blisko ciebie.



[license]: {{ site.license.url }}
[stable-gz]:   {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[old-gz]:      {{ site.downloads.previous19.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
