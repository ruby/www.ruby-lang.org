---
layout: page
title: "Ruby in Venti Minuti"
lang: it

header: |
  <div class="multi-page">
    <a href="../" title="Parte 1">1</a>
    <span class="separator"> | </span>
    <a href="../2/" title="Parte 2">2</a>
    <span class="separator"> | </span>
    <strong>3</strong>
    <span class="separator"> | </span>
    <a href="../4/" title="Parte 4">4</a>
  </div>
  <h1>Ruby in Venti Minuti</h1>

---

Bene, creiamo il nostro oggetto PersonaCordiale e usiamolo:

{% highlight irb %}
irb(main):035:0> p = PersonaCordiale.new("Mario")
=> #<PersonaCordiale:0x16cac @nome="Mario">
irb(main):036:0> p.saluta
Ciao Mario!
=> nil
irb(main):037:0> p.congeda
Arrivederci Mario, a presto.
=> nil
{% endhighlight %}

Una volta che l’oggetto `p` è stato creato, ricorda che il nome è Mario.
Ma cosa succede se vogliamo accedere direttamente al nome?

{% highlight irb %}
irb(main):038:0> p.@nome
SyntaxError: compile error
(irb):52: syntax error
        from (irb):52
{% endhighlight %}

Nulla, non si può.

## Ispezionare i contenuti di un oggetto

Le variabili di istanza sono nascoste dentro l’oggetto. Ma non sono così
nascoste: puoi vederle ogni volta che ispezioni l’oggetto e ci sono
altri modi per raggiungerle, ma Ruby ha un approccio molto orientati
agli oggetti per accedere ai dati nascosti.

Quindi quanti metodi esistono per il l’oggetto PersonaCordiale?

{% highlight irb %}
irb(main):039:0> PersonaCordiale.instance_methods
=> ["method", "send", "object_id", "singleton_methods",
    "__send__", "equal?", "taint", "frozen?",
    "instance_variable_get", "kind_of?", "to_a",
    "instance_eval", "type", "protected_methods", "extend",
    "eql?", "display", "instance_variable_set", "hash",
    "is_a?", "to_s", "class", "tainted?", "private_methods",
    "untaint", "saluta", "id", "inspect", "==", "===",
    "clone", "public_methods", "respond_to?", "freeze",
    "congeda", "__id__", "=~", "methods", "nil?", "dup",
    "instance_variables", "instance_of?"]
{% endhighlight %}

Ci sono moltissimi metodi! Eppure ne avevamo definiti solo due: cosa sta
succedendo? Questi sono tutti i metodi per il nostro oggetto
PersonaCordiale, una lista **completa** che include anche quelli della
superclasse. Ma se volessimo vedere solo quelli che abbiamo creato noi?
Dobbiamo dirgli di non elencare il metodi della sua classe genitore
(super classe) passandogli come parametro `false`.

{% highlight irb %}
irb(main):040:0> PersonaCordiale.instance_methods(false)
=> ["saluta", "congeda"]
{% endhighlight %}

Ah, ora va meglio! Vediamo a quali metodi risponde la nostra classe:

{% highlight irb %}
irb(main):041:0> p.respond_to?("name")
=> false
irb(main):042:0> p.respond_to?("saluta")
=> true
irb(main):043:0> p.respond_to?("to_s")
=> true
{% endhighlight %}

Bene, la nostra classe conosce `saluta` e `to_s` (che significa
convertire “qualcosa” in una stringa, un metodo definito di default per
ogni oggetto), ma non conosce `name`.

## Alterare una classe: non è mai troppo tardi!

E se volessimo vedere o cambiare il nome? Ruby fornisce un modo semplice
per permetterci di accedere alle variabili di un oggetto.

{% highlight irb %}
irb(main):044:0> class PersonaCordiale
irb(main):045:1>   attr_accessor :nome
irb(main):046:1> end
=> [:nome, :nome=]
{% endhighlight %}

In Ruby, puoi aprire una classe e modificarla. I cambiamenti vengono
aggiunti a tutti gli oggetti che crei e sempre disponibili per gli
oggetti esistenti della classe. Quindi creiamo un nuovo oggetto e
“giochiamo” con la sua proprietà `nome`.

{% highlight irb %}
irb(main):047:0> p = PersonaCordiale.new("Luigi")
=> #<PersonaCordiale:0x3c9b0 @nome="Luigi">
irb(main):048:0> p.respond_to?("nome")
=> true
irb(main):049:0> p.respond_to?("nome=")
=> true
irb(main):050:0> p.saluta
Ciao Luigi!
=> nil
irb(main):051:0> p.nome="Francesca"
=> "Francesca"
irb(main):052:0> p
=> #<PersonaCordiale:0x3c9b0 @name="Francesca">
irb(main):053:0> p.nome
=> "Francesca"
irb(main):054:0> p.saluta
Ciao Francesca!
=> nil
{% endhighlight %}

Usando `attr_accessor` definiamo due nuovi metodi, `nome` per ricevere
il valore e `nome=` per settarlo.

## Salutare tutti e tutto, L’AmicoDiTutti non trascura nessuno!

Questa PersonaCordiale può salutare solo una persona alla volta. Cosa
succederebbe se avessimo un amico di tutti che può salutare il mondo,
una persona o un intero elenco di persone?

Scriviamo questa volta in un file piuttosto che nell’inteprete
interattivo di Ruby IRB.

Per chiudere IRB, scrivi “quit”, “exit” o semplicemnte premi Control-D.

{% highlight ruby %}
#!/usr/bin/env ruby

class AmicoDiTutti
  attr_accessor :nomi

  # Crea l'oggetto
  def initialize(nomi = "Mondo")
    @nomi = nomi
  end

  # Saluta tutti
  def saluta
    if @nomi.nil?
      puts "..."
    elsif @nomi.respond_to?("each")
      # @nomi è una lista di qualche tipo, allora iteriamo!
      @nomi.each do |nome|
        puts "Ciao #{nome}!"
      end
    else
      puts "Ciao #{@nomi}!"
    end
  end

  # Congeda tutti
  def congeda
    if @nomi.nil?
      puts "..."
    elsif @nomi.respond_to?("join")
      # Unisci gli elementi della lista con delle virgole
      puts "Arrivederci #{@nomi.join(", ")}. A presto!"
    else
      puts "Arrivederci #{@nomi}. A presto!"
    end
  end

end


if __FILE__ == $0
  adt = AmicoDiTutti.new
  adt.saluta
  adt.congeda

  # Cambia @nomi in "Paolo"
  adt.nomi = "Paolo"
  adt.saluta
  adt.congeda

  # Cambia @nomi in una lista di nome
  adt.nomi = ["Fabio", "Davide", "Raul",
    "Giorgia", "Federica"]
  adt.saluta
  adt.congeda

  # Cambia @nomi in nil
  adt.nomi = nil
  adt.saluta
  adt.congeda
end
{% endhighlight %}

Salva questo file come “ri20min.rb” ed eseguilo così “ruby ri20min.rb”
Verrà mostrato qualcosa di simile:

    Ciao Mondo!
    Arrivederci Mondo. A presto!
    Ciao Paolo!
    Arrivederci Paolo. A presto!
    Ciao Fabio!
    Ciao Davide!
    Ciao Raul!
    Ciao Giorgia!
    Ciao Federica!
    Arrivederci Fabio, Davide, Raul, Giorgia, Federica. A presto!
    ...
    ...
{: .code}

Ci sono moltissime cose nuove in questo esempio che [possono assumere un
significato più profondo](../4/).
