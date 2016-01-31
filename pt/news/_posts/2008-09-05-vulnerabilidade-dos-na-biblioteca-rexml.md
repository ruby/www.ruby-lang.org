---
layout: news_post
title: "Vulnerabilidade DoS na biblioteca REXML"
author: "Unknown Author"
lang: pt
---

Existe uma vulnerabilidade DoS na biblioteca REXML incluída na
biblioteca standard do Ruby. Uma técnica de ataque conhecida como “XML
entity explosion” poderá ser utilizada para terminar remotamente
qualquer aplicação que faça parse de XML com a biblioteca REXML.

A maioria das aplicações rails estarão vulneráveis, uma vez que o Rails
faz parse de XML com REXML, por omissão.

## Impacto

Um ataque deste tipo pode ser repetido pedindo uma análise de um
documento XML contendo entidades aninhadas recursivas pela biblioteca
REXML. Veja-se o exemplo:

{% highlight xml %}
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE member [
  <!ENTITY a "&b;&b;&b;&b;&b;&b;&b;&b;&b;&b;">
  <!ENTITY b "&c;&c;&c;&c;&c;&c;&c;&c;&c;&c;">
  <!ENTITY c "&d;&d;&d;&d;&d;&d;&d;&d;&d;&d;">
  <!ENTITY d "&e;&e;&e;&e;&e;&e;&e;&e;&e;&e;">
  <!ENTITY e "&f;&f;&f;&f;&f;&f;&f;&f;&f;&f;">
  <!ENTITY f "&g;&g;&g;&g;&g;&g;&g;&g;&g;&g;">
  <!ENTITY g "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx">
]>
<member>
&a;
</member>
{% endhighlight %}

## Versões vulneráveis

### Versões 1.8

* 1\.8.6-p287 e todas as anteriores
* 1\.8.7-p72 e todas as anteriores

### Versões 1.9

* Todas

## Solução

Faça download do seguinte *patch* para corrigir o problema.

* [https://www.ruby-lang.org/security/20080823rexml/rexml-expansion-fix.rb][1]

Depois adicione a linha na aplicação para carregar
rexml-expansion-fix.rb antes de utilizar REXML.

{% highlight ruby %}
require "rexml-expansion-fix"
...
doc = REXML::Document.new(str)
...
{% endhighlight %}

para aplicações em Rails, copie o ficheiro rexml-expansion-fix.rb para a directoria RAILS\_ROOT/lib/, por exemplo, e adicione a linha seguinte no ficheiro config/environment.rb.

{% highlight ruby %}
require "rexml-expansion-fix"
{% endhighlight %}

Se a sua aplicação utiliza Rails 2.1 ou posterior, basta copiar o
ficheiro rexml-expansion-fix.rb para a directoria
RAILS\_ROOT/config/initializers para que este seja automaticamente
inicializado.

Por omissão, a expansão de entidades XML é de 10000. Poderá alterar este
valor mudando REXML::Document.entity\_expansion\_limit.

{% highlight ruby %}
REXML::Document.entity_expansion_limit = 1000
{% endhighlight %}

Esta correcção estará disponível também como uma gema e utilizada por
versões futuras de Rails, mas aconselham-se medidas de correcção
imediatas.

## Créditos

Créditos para Luka Treiber and Mitja Kolsek da ACROS Security por
informar as Equipas de Segurança de Ruby e Ruby on Rails.

Créditos para Michael Koziarski da Rails Core Team por criar a correcção
para a vulnerabilidade



[1]: {{ site.url }}/security/20080823rexml/rexml-expansion-fix.rb
