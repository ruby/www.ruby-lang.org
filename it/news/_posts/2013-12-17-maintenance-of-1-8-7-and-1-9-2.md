---
layout: news_post
title: "Estensione della manutenzione di sicurezza per Ruby 1.8.7 e 1.9.2"
author: "zzak"
translator: "Alessandro Lepore"
date: 2013-12-17 20:49:03 +0000
lang: it
---

Con effetto immediato le versioni 1.8.7 e 1.9.2 riceveranno supporto per patch
di sicurezza fino a Giugno 2014.

* Terence Lee ([@hone02](https://twitter.com/hone02))
  e Zachary Scott ([@_zzak](https://twitter.com/_zzak))
  si prenderanno carico della cosa.
* Dopo un periodo di manutenzione di 6 mesi potremmo aggiungere
  altri committers per estendere di altri 6 mesi.

Questa estensione di manutenzione è resa possibile da [Heroku][heroku],
vedere il loro blog post [A Patch in Time: Securing Ruby][securing-ruby]
per maggiori informazioni.

### Segnalazione problemi

Durante questo ulteriore periodo di manutenzione applicheremo _solamente_
patch di sicurezza al repository del codice per [1.8.7][source-187]
e [1.9.2][source-192].

Prendiamo la sicurezza molto seriamente, se trovate una vulnerabilità per favore
segnalatela immediatamente a security@ruby-lang.org. Questa mailing list è
privata e i problemi segnalati verranno pubblicati solo dopo che un fix sarà
stato rilasciato.

Si veda [ruby-lang.org/it/security][security-it] per maggiori informazioni.

### Sul Release Management

Come detto sopra applicheremo solo security patches e incrementeremo
il patch level.

Non rilasceremo versioni patchate di 1.8.7 o 1.9.2 su ruby-lang.org.
Tuttavia siete liberi di creare dei binari dal codice sorgente.

La motivazione è che non vogliamo nuovi tickets, come release ufficiale seguire
la manutenzione risulterebbe di responsabilità di ruby-core. Le risorse del
nostro team sono già poche e vogliamo incoraggiare gli upgrade, non supportare
versioni obsolete.

### Perché resuscitare 1.8.7?

Potreste ricordare un annuncio di circa 6 mesi fa che
[ritirava 1.8.7][sunset-187-en].

Mentre ruby-core non riprenderà la manutenzione di 1.8.7 o 1.9.2, Terence e
Zachary supporteranno queste versioni per manutenzioni di sicurezza come parte
di una sponsorizzazione aziendale.

In passato abbiamo supportato vendors che volevano mantenere versioni legacy.
Nel 2009 la manutenzione di Ruby 1.8.6 era stata trasferita a Engine Yard
quando rilasciarono la 1.8.6-p369.

### Parole di incoraggiamento

Vorremmo cogliere questa occasione per incoraggiare ad aggiornarvi il prima
possibile ad una versione supportata di Ruby. Molti membri di ruby-core hanno
speso innumerevoli ore per migliorare le performance e le features di Ruby
nelle versioni 2.0+ e vogliamo che possiate sfruttarle.

Grazie per il vostro continuo supporto e continuiamo a rendere Ruby migliore!


[heroku]:        http://heroku.com/
[securing-ruby]: https://blog.heroku.com/archives/2013/12/5/a_patch_in_time_securing_ruby/
[source-187]:    https://bugs.ruby-lang.org/projects/ruby-187/repository
[source-192]:    https://bugs.ruby-lang.org/projects/ruby-192/repository
[security-it]:   https://www.ruby-lang.org/it/security/
[sunset-187-en]: https://www.ruby-lang.org/en/news/2013/06/30/we-retire-1-8-7/
