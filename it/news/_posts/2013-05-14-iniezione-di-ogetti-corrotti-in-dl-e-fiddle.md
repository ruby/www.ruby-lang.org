---
layout: news_post
title: "Inyección de objetos corruptos con DL y Fiddle en Ruby"
author: "mx"
translator: "David Padilla"
date: 2013-05-14 13:00:00 UTC
lang: es
---

Esiste una vulnerabilità in DL e Fiddle in Ruby, in cui è possibile utilizzare
catene corrotti en una chiamata di sistema, indipendentemente dal livello di $SAFE.
Esso è stato assegnato l'identificatore CVE per la vulnerabilità CVE-2013-2065.

## Impatto

Funzioni native esposte in Ruby con DL o Fiddle non convalidare i valori degli oggetti
che passano. Questo potrebbe causare che oggetti corrotti sono accettati come ingresso
invece di sollevare un'eccezione di classe SecurityError.

Esempio di codice vulnerabile con DL:

{% highlight ruby %}
def my_function(user_input)
  handle    = DL.dlopen(nil)
  sys_cfunc = DL::CFunc.new(handle['system'], DL::TYPE_INT, 'system')
  sys       = DL::Function.new(sys_cfunc, [DL::TYPE_VOIDP])
  sys.call user_input
end

$SAFE = 1
my_function "uname -rs".taint
{% endhighlight %}

Esempio di codice vulnerabile con Fiddle:

{% highlight ruby %}
def my_function(user_input)
  handle    = DL.dlopen(nil)
  sys = Fiddle::Function.new(handle['system'],
                             [Fiddle::TYPE_VOIDP], Fiddle::TYPE_INT)
  sys.call user_input
end

$SAFE = 1
my_function "uname -rs".taint
{% endhighlight %}

Tutti gli utenti che utilizzano una versione affetta devono aggiornare alla
versione più recente o di utilizzare una delle soluzioni proposte immediatamente.

Nota: tutto questo non impedisce lo spostamento di memoria utilizzando i valori
numerici e puntatore. I numeri non sono corruttibili, quindi se si passa un spostamento
di memoria numerica compensato questo non può essere convalidato. Esempio:

{% highlight ruby %}
def my_function(input)
  handle    = DL.dlopen(nil)
  sys = Fiddle::Function.new(handle['system'],
                             [Fiddle::TYPE_VOIDP], Fiddle::TYPE_INT)
  sys.call input
end

$SAFE = 1
user_input = "uname -rs".taint
my_function DL::CPtr[user_input].to_i
{% endhighlight %}

In questo caso, ciò che sta accadendo è l'indirizzo di memoria dell'oggetto che non può
essere convalidata da DL / Fiddle. In questo caso, è necessario convalidare l'oggetto
prima di passare l'indirizzo di memoria:

{% highlight ruby %}
user_input = "uname -rs".taint
raise if $SAFE >= 1 && user_input.tainted?
my_function DL::CPtr[user_input].to_i
{% endhighlight %}

## Soluzioni alternative

Se per qualche motivo non è possibile aggiornare la versione di Ruby, è possibile
utilizzare questa patch come soluzione alternativa:

{% highlight ruby %}
class Fiddle::Function
  alias :old_call :call
  def call(*args)
    if $SAFE >= 1 && args.any? { |x| x.tainted? }
      raise SecurityError, "tainted parameter not allowed"
    end
    old_call(*args)
  end
end
{% endhighlight %}

## Versioni soggette alla vulnerabilità

* Tutte le versioni di Ruby 1.9 precedenti alla versione a p-426
* Tutte le versioni di Ruby 2.0 precedenti alla versione a p-195
* Prima della revisione 40728

Ruby 1.8 versioni non sono soggette alla vulnerabilità

## Credits

Grazie a Vin Ondruch por aver segnalato questo problema.

## Cronologia

* Publicado per la prima volta il giorno 2013-05-14 alle ore 13:00:00 (UTC)
