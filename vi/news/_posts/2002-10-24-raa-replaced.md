---
layout: news_post
title: "RAA replaced"
author: "Unknown Author"
lang: vi
---

We www-admin@ruby-lang.org rewrote current [RAA][1] which got a little
old and rickety.

Changes:

* lightweight top page
* iso8859-1 =&gt; UTF-8
* added simple keyword search
* show projects by the specified owner

SOAP and XML-RPC interfaces will be updated, too. Users of RAA SOAP and
XML-RPC interfaces, please tell me if the problem occurred. I changed
wire format a little. See below;

* id and owner\_id element are added to each entry. Those two elements
  contain positive integer.
* For SOAP interface users only: element url, download and email are
  marked as xsd:anyURI type. Those elements will be unmarshalled as a
  URI object at client side, not a String object.

Except SOAP and XML-RPC we are offering a plain XML or RDF file of RAA
information. Those are at http://raa.ruby-lang.org/xml.xml and
http://raa.ruby-lang.org/rdf.xml. You can also get recent information in
RDF format from http://raa.ruby-lang.org/since.mrb

Users of pragdave’s XML/RDF feed interfaces should use above for a
while. Pragdave’s former interfaces are not updated now because of
replacing RAA DB. Bare in mind some changes are made to these
interfaces, too. See below;

* \*.xml files are updated in each 15 minutes, not on the fly.
* Charset encoding scheme was changed from iso-8859-1 to UTF-8.
* XML instance format is changed for user’s convenience.



[1]: http://raa.ruby-lang.org/
