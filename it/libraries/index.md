---
layout: page
title: "Librerie"
lang: it
---

Una miriade di fantastiche e utili librerie per Ruby ti aspettano là
fuori, molte delle quali disponibili per la tua convenienza tramite file
*gem*. Altre librerie sono rilasciate come directory di codice sorgente
compresse (.zip o .tar.gz). Diamo un’occhiata a come fare per trovare
queste librerie e installarle per il tuo uso e consumo.

### Trovare le librerie
{: #finding-libraries}

[**RubyForge**][1] è il posto più comune dove trovare delle librerie per
Ruby. Un buon punto di partenza per iniziare la ricerca è la [software
map][2], che elenca tutte le librerie per argomento (se ti ritroverai a
creare le tue librerie, puoi [registrare][3] il tuo progetto su
RubyForge per ricevere accesso ai repository Subversion, spazio web e
liste di discussione).

Il [**Ruby Application Archive**][4] (o RAA) è una directory di tutto
ciò che riguarda Ruby, categorizzata per funzionalità- Attualmente, la
categoria [Database][5] ha il maggior numero di elementi, uno in più di
[Net.][6]. [HTML][7] e [XML][8] sono tra le altre categorie più
popolari. Ci sono anche 4 elementi nella categoria [Fisica][9] entries.

### Usare RubyGems
{: #using-rubygems}

Sebbene il programma di installazione di Ruby per Windows includa
RubyGems, molti sistemi operativi no. Dai un’occhiata a [Installare
RubyGems](#installing-rubygems) di seguito, se i comandi descritti in
questa sezione non funzionano sul tuo computer.

#### Cercare le gemme

Il comando **search** può essere usato per cercare delle gemme con un
creto nome. Per cercare la parola “html” nel nome di una gemma, fai
così:

    
     $ gem search html --remote
    
     *** REMOTE GEMS ***
    
     html-sample (1.0, 1.1)
        A sample Ruby gem, just to illustrate how RubyGems works.

(*Il flag `--remote` flag indica che cerchiamo tra le gemme ufficiali su
RubyForge.*)

#### Installare una gemma

Una volta che conosci il nome della gemma che ti serve, la puoi
installare con il comando **install**\:

    
     $ gem install html-sample

Puoi anche installare solamente una determinata versione della libreria
specificando il flag `--version`.

    
     $ gem install html-sample --version 1.0

#### Elencare tutte le gemme

Per una lista completa di tutte le gemme presenti su RubyForge, usa il
comando **list**\:

    
     $ gem list --remote

Per una lista di tutte le gemme installate localmente, non specificare
il flag `--remote`.

    
     $ gem list

Per maggiori informazioni su RubyGems, vedi [**il manuale
ufficiale**][10], che contiene anche esempi su come usare le gemme nei
tuoi programmi in Ruby.

### Installare RubyGems
{: #installing-rubygems}

Per installare RubyGems, scarica RubyGems 0.9.0 da [questa pagina][11].
Estrai l’archivio ed esegui `setup.rb`. Su alcuni sistemi operativi,
potrebbe essere necessario eseguirlo come utente root.

Per esempio, su Linux:

    
    $ tar xzvf rubygems-0.9.0.tar.gz
    $ cd rubygems-0.9.0
    $ su -
    # ruby setup.rb

Se hai bisogno di ulteriori informazioni su come installare Ruby, dai
un’occhiata al [**capitolo sul’installazione**][12] nel manuale di
RubyGems.



[1]: http://rubyforge.org/ 
[2]: http://rubyforge.org/softwaremap/trove_list.php 
[3]: http://rubyforge.org/register 
[4]: http://raa.ruby-lang.org/ 
[5]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Database 
[6]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Net 
[7]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=HTML 
[8]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=XML 
[9]: http://raa.ruby-lang.org/cat.rhtml?category_major=Library;category_minor=Physics 
[10]: http://rubygems.org/read/chapter/1 
[11]: http://rubyforge.org/frs/?group_id=126 
[12]: http://rubygems.org/read/chapter/3 
