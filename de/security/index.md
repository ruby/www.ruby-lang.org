---
layout: page
title: "Sicherheit"
lang: de
---

Hier finden Sie Informationen zu Sicherheitsproblemen in Ruby.
{: .summary}

## Sicherheitslücken melden

Sicherheitslücken sollten per E-Mail an
security@ruby-lang.org ([öffentlicher PGP-Schlüssel](/security.asc))
gemeldet werden, einer nicht öffentlichen Mailingliste.
Gemeldete Probleme werden veröffentlicht, nachdem sie behoben wurden.

Mitglieder der Mailingliste sind Personen, die Ruby zur Verfügung
stellen (Ruby-Committer und Entwickler anderer Ruby-Implementierungen,
Distributoren, PaaS-Plattformen).

## Bekannte Schwachstellen

_See the [English page](/en/security/) for a complete and up-to-date
list of security vulnerabilities.
The following list only includes the as yet translated
security announcements, it might be incomplete or outdated._

Hier eine Liste kürzlich bekannt gewordener Probleme:

{% include security_posts.html %}

Weitere bekannte Probleme:

* [Entitätsexpansion-DoS-Schwachstelle in REXML (XML-Bombe,
  CVE-2013-1821)][1]
  veröffentlicht am 22. Feb. 2013.
* [Denial-of-Service- und Objekterstellungs-Sicherheitslücken in JSON
  (CVE-2013-0269)][2]
  veröffentlicht am 22. Feb. 2013.
* [XSS-Exploit für RDoc-Dokumentation (CVE-2013-0256)][3]
  veröffentlicht am 6. Feb. 2013.
* [Hash-Flooding-DoS-Sicherheitsleck in Ruby 1.9 (CVE-2012-5371)][4]
  veröffentlicht am 10. Nov. 2012.
* [Durch ungültiges NUL-Zeichen werden unabsichtlich Dateien
  erzeugt (CVE-2012-4522)][5]
  veröffentlicht am 12. Okt. 2012.
* [Sicherheitslücke in Exception#to_s / NameError#to_s (CVE-2012-4464,
  CVE-2012-4466) ermöglicht Umgehung von $SAFE][6]
  veröffentlicht am 12. Okt. 2012.
* [Sicherheitsfix für RubyGems: SSL-Server-Verifikation für entfernte
  Repositories][7]
  veröffentlicht am 20. Apr. 2012.
* [Sicherheitsfix für Rubys OpenSSL-Modul: Erlaube "0/n splitting" als
  Gegenmaßnahme für den TLS-BEAST-Angriff][8]
  veröffentlicht am 16. Feb. 2012.
* [Denial-of-Service-Attacke für Rubys Hash-Algorithmus gefunden
  (CVE-2011-4815)][9]
  veröffentlicht am 28. Dez. 2011.
* [Exception-Methoden können $SAFE umgehen][10]
  veröffentlicht am 18. Feb. 2011.
* [Sicherheitslücke in FileUtils durch Race-Conditions in Symlinks][11]
  veröffentlicht am 18. Feb. 2011.
* [XSS in WEBrick (CVE-2010-0541)][12]
  veröffentlicht am 16. Aug. 2010.
* [Buffer-Overflow in ARGF.inplace\_mode=][13]
  veröffentlicht am 2. Juli 2010.
* [WEBrick "Escapesequence Injection" Schwachstelle][14]
  veröffentlicht am 10. Jan. 2010.
* [Heap overflow in String (CVE-2009-4124)][15]
  veröffentlicht am 7. Dez. 2009.
* [DoS Schwachstelle in
  BigDecimal](/de/news/2009/06/13/dos-schwachstelle-in-bigdecimal/)
  veröffentlicht am 9. Juni 2009.
* [DoS vulnerability in
  REXML](/en/news/2008/08/23/dos-vulnerability-in-rexml/)
  veröffentlicht am 23. Aug. 2008.
* [Multiple vulnerabilities in
  Ruby](/en/news/2008/08/08/multiple-vulnerabilities-in-ruby/)
  veröffentlicht am 8. Aug. 2008.
* [Arbitrary code execution
  vulnerabilities](/en/news/2008/06/20/arbitrary-code-execution-vulnerabilities/)
  veröffentlicht am 20. Juni 2008.
* [File access vulnerability of
  WEBrick](/en/news/2008/03/03/webrick-file-access-vulnerability/)
  veröffentlicht am 3. März 2008.
* [Net::HTTPS Sicherheitslücke](/de/news/2007/10/04/net-https-sicherheitslcke/)
  veröffentlicht am 4. Okt. 2007.
* [Eine weitere DoS Sicherheitslücke in der
  CGI Bibliothek](/de/news/2006/12/04/another-dos-vulnerability-in-cgi-library/)
  veröffentlicht am 4. Dez. 2006.
* [DoS Sicherheitslücke in
  CGI Bibliothek (CVE-2006-5467)](/de/news/2006/11/09/dos-sicherheitslcke-in-cgi-bibliothek/)
  veröffentlicht am 3. Nov. 2006.
* [Ruby vulnerability in the safe level
  settings](/de/news/2005/10/03/ruby-vulnerability-in-the-safe-level-settings/)
  veröffentlicht am 2. Okt. 2005.



[1]: /de/news/2013/02/23/rexml-bombe/
[2]: /de/news/2013/02/23/denial-of-service-cve-2013-0269/
[3]: /de/news/2013/02/07/xss-exploit-fr-rdoc-dokumentation/
[4]: /de/news/2012/11/09/hash-flooding-dos-sicherheitsleck-in-ruby-1-9-cve-2012-5371/
[5]: /de/news/2012/10/12/durch-ungltiges-nul-zeichen-werden-unabsichtlich-dateien-erzeugt/
[6]: /de/news/2012/10/12/sicherheitsluecke-in-exception-ermoeglicht-umgehung-von-safe-mode/
[7]: /de/news/2012/04/20/ruby-1-9-3-p194-verffentlicht/
[8]: /de/news/2012/02/16/security-fix-for-ruby-openssl-module/
[9]: /de/news/2012/01/04/denial-of-service-attacke-fr-rubys-hash-algorithmus-gefunden-cve-2011-4815/
[10]: /de/news/2011/02/18/exception-methoden-knnen-safe-umgehen/
[11]: /de/news/2011/02/18/sicherheitslcke-in-fileutils-durch-race-conditions-in-symlinks/
[12]: /de/news/2010/08/24/xss-in-webrick-cve-2010-0541/
[13]: /de/news/2010/07/02/ruby-1-9-1-p429-verffentlicht/
[14]: /de/news/2010/01/10/webrick-escapesequence-injection-schwachstelle/
[15]: /de/news/2009/12/07/heap-overflow-in-string/
