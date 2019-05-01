---
layout: news_post
title: "Versioning semantico a partire da Ruby 2.1.0"
author: "zzak"
translator: "Alessandro Lepore"
date: 2013-12-21 2:00:00 +0000
lang: it
---

Abbiamo deciso di passare ad una policy di [Versioning Semantico](http://semver.org/)
a partire dal rilascio di Ruby 2.1.0.

Per fornire uno schema di versioning meglio definito e utilizzato per Ruby
abbiamo deciso di cambiare gradualmente verso la policy seguente.

## Modifiche alla Policy

La policy è basata sulla proposta del system administrator di ruby-lang.org
Hiroshi Shibata ([@hsbt](https://twitter.com/hsbt)).

### Version Schema

* `MAJOR`: incrementato nel caso di modifiche incompatibili che non possono
essere rilasciate in MINOR.
  * Riservata ad eventi speciali.
* `MINOR`: incrementato ogni Natale, l'API potrebbe essere incompatibile.
* `TEENY`: security o bug fix che mantengono la compatibilità API.
  * Può superare 10 (come `2.1.11`) e sarà rilasciato ogni 2-3 mesi.
* `PATCH`: numero di commits dall'ultima `MINOR` release (sarà riportato a 0 al
rilascio della `MINOR`).

### Branching Schema

Manterremo i seguenti branches:

* trunk
* `ruby_{MAJOR}_{MINOR}`

Il branch `ruby_{MAJOR}_{MINOR}` sarà mantenuto tra le release `TEENY`.
Useremo dei tags per ogni release.

### Compatibilità API

Le seguenti caratteristiche possono essere marcate come modifica incompatibile,
richiedendo un incremento nella versione `MINOR`:

* Rimozione di features api C-level.
* Modifiche o aggiunte non retrocompatibili.

### Compatibilità ABI

L'ABI si atterrà al seguente schema: `{MAJOR}.{MINOR}.0`

Faremo il possibile per mantenere la compatibilità ABI nelle release con lo
stesso livello `MINOR`, così che `TEENY` resterà fisso a 0.

## Riferimenti

Per documentarsi meglio su questa proposta si prega di vedere i seguenti link:

* [Introducing a semantic versioning scheme and branching policy](https://bugs.ruby-lang.org/issues/8835)
* [Proposta accettata in Inglese](https://gist.github.com/sorah/7803201)
* [Proposta accettata in Giapponese](https://gist.github.com/hsbt/7719305)

## Grazie!

Vorrei ringraziare personalmente tutti quelli che hanno contribuito a questa
discussione. Ogni passo che facciamo ci porta ad un Ruby più stabile ed
efficace.
