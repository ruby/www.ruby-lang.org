---
layout: news_post
title: "Entitätsexpansion-DoS-Schwachstelle in REXML (XML-Bombe, CVE-2013-1821)"
author: "Quintus"
date: 2013-02-23 09:14:24 +0000
lang: de
---

Unkontrollierte Expansion von Entitäten in REXML kann zu einer
DoS-Verwundbareit führen. Dieser Verwundbarkeit wurde die CVE-Nummer
CVE-2013-1821 zugewiesen. Wir empfehlen stark, Ruby zu aktualisieren.

### Details

Beim Lesen von Textknoten aus einem XML-Dokument kann der REXML-Parser
dazu gebracht werden, extrem große String-Objekte zu allokieren, die den
gesamten Arbeitsspeicher eines Rechners verbrauchen und somit für eine
Denial-of-Service-Attacke genutzt werden können.

Betroffener Code sieht so aus:

{% highlight ruby %}
document = REXML::Document.new some_xml_doc
document.root.text
{% endhighlight %}

Wenn die #text-Methode aufgerufen wird, werden die Entitäten expandiert.
Ein Angreifer kann so mithilfe eines verhältnismäßig kleinen
XML-Dokuments erreichen, dass bei der Expansion der Entitäten extreme
Mengen an Arbeitsspeicher auf dem Zielsystem verbraucht werden.

Beachten Sie, dass dieser Angriff dem „Billion Laughs“-Angriff ähnlich
ist, sich aber dennoch von diesem unterscheidet. Er ist auch mit Pythons
*CVE-2013-1664* verwandt.

Alle Nutzer eines betroffenen Release sind angehalten, entweder umgehend
zu aktualisieren oder den folgenden Workaround anzuwenden.

### Workaround

Wenn Sie Ruby nicht aktualisieren können, benutzen Sie diesen
Monkeypatch als Notlösung:

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

Der Monkeypatch begrenzt die Größe der Entitätsersetzungen auf 10.000
pro Knoten; REXML besitzt bereits eine Standardbegrenzung auf 10.000
Entitätsersetzungen pro Dokument, sodass die durch Entitätsersetzung
maximal erzeugbare Menge an Text sich um etwa 98 Megabyte bewegen wird.

### Betroffene Versionen

* Alle Versionen von Ruby 1.9 vor 1.9.3-p392
* Alle Versionen von Ruby 2 vor 2.0.0-p0
* Alle Trunk-Revisionen vor Revision 39384

### Danksagung

Vielen Dank an Ben Murphy für das Melden dieses Problems.

### Verlauf

* CVE-Nummer ergänzt am 2013-03-11 07:45:00 (UTC)
* Erstmals veröffentlicht am 2013-02-22 12:00:00 (UTC)
