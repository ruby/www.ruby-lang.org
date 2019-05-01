---
layout: news_post
title: "Vulnérabilité de type Déni de service par expansion des entités dans REXML (bombe XML, CVE-2013-1821)"
author: "Bruno Michel"
date: 2013-02-23 14:03:15 +0000
lang: fr
---

L\'expansion d\'entités XML sans restriction peut conduire à un déni de
service dans REXML. Cette vulnérabilité a reçu l\'assignation CVE-2013-1821.
Nous recommandons fortement de mettre à jour Ruby.

## Détails

Lors de la lecture de nœuds texte au sein d\'un document XML, le parseur
REXML peut être forcé à allouer des chaînes de caractères extrêmement
larges, ce qui peut consommer toute la mémoire de la machine, entraînant
un déni de service.

Le code concerné ressemble à ceci :

{% highlight ruby %}
document = REXML::Document.new some_xml_doc
document.root.text
{% endhighlight %}

Quand la méthode \`text\` est appelée, les entités sont étendues. Un
attaquant peut envoyer un document XML relativement petit qui, lors de
cette étape, consommera d\'énormes quantités de mémoire sur le système
cible.

Veuillez noter que cette attaque est similaire, bien que différente, à
celle de l\'attaque Billion Laughs. C\'est aussi en rapport avec le
CVE-2013-1664 de Python.

Tous les utilisateurs d\'une version concernée sont incités à mettre à
jour Ruby ou utiliser l\'un des contournements ci-dessous immédiatement.

## Contournements

Si vous ne pouvez pas mettre à jour Ruby, utiliser ce monkey patch comme
contournement :

{% highlight ruby %}
class REXML::Document
  @@entity_expansion_text_limit = 10_240

  def self.entity_expansion_text_limit=( val )
    @@entity_expansion_text_limit = val
  end

  def self.entity_expansion_text_limit
    @@entity_expansion_text_limit
  end
end

class REXML::Text
  def self.unnormalize(string, doctype=nil, filter=nil, illegal=nil)
    sum = 0
    string.gsub( /\r\n?/, "\n" ).gsub( REFERENCE ) {
      s = self.expand($&, doctype, filter)
      if sum + s.bytesize > REXML::Document.entity_expansion_text_limit
        raise "entity expansion has grown too large"
      else
        sum += s.bytesize
      end
      s
    }
  end

  def self.expand(ref, doctype, filter)
    if ref[1] == ?#
      if ref[2] == ?x
        [ref[3...-1].to_i(16)].pack('U*')
      else
        [ref[2...-1].to_i].pack('U*')
      end
    elsif ref == '&amp;'
      '&'
    elsif filter and filter.include?( ref[1...-1] )
      ref
    elsif doctype
      doctype.entity( ref[1...-1] ) or ref
    else
      entity_value = DocType::DEFAULT_ENTITIES[ ref[1...-1] ]
      entity_value ? entity_value.value : ref
    end
  end
end
{% endhighlight %}

Ce monkey patch limitera la taille des remplacements d\'entités à 10k
par nœud. REXML n\'autorise déjà que 10000 remplacements d\'entités par
document (valeur par défaut). Ainsi la quantité maximale de mémoire pour
le texte généré par les remplacements d\'entités ne sera au maximum que
d\'environ 98 Mo.

## Les versions de Ruby concernées

* Toutes les versions de Ruby 1.9 antérieures à la version 1.9.3
  patchlevel 392
* Toutes les versions de Ruby 2.0 antérieures à la version 2.0.0
  patchlevel 0
* Toutes les versions trunk avant la révision 39384

## Crédits

Merci à Ben Murphy pour avoir remonté cette vulnérabilité.

## Historique

* Publié initialement à 2013-02-22 12:00:00 (UTC)
