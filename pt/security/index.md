---
layout: page
title: "Segurança"
lang: pt
---

Aqui você encontrará informações sobre problemas de segurança do Ruby.
{: .summary}

## Reportando Vulnerabilidades de Segurança

Vulnerabilidades de segurança devem ser reportadas por e-mail
para o endereço security@ruby-lang.org ([a chave pública PGP](/security.asc)),
que é uma lista de e-mails privada. Os problemas reportados serão
publicados após as correções.

Os membros da lista de e-mails são pessoas que mantém o Ruby
(committers do Ruby e autores de outras implementações do Ruby,
distribuidores, e plataformas PaaS). Os membros precisam ser
pessoas individuais, outras listas de e-mail não são permitidas.

## Problemas conhecidos

Estes são os problemas recentes:

{% include security_posts.html %}

Outros problemas conhecidos:

* [Vulnerabilidade de DoS de Entity expansion no REXML (XML bomb,
  CVE-2013-1821)][1]
  publicado em 22 de Fev. de 2013.
* [Vulnerabilidade de Denial of Service e Unsafe Object Creation no JSON
  (CVE-2013-0269)][2]
  publicado em 22 de Fev. de 2013.
* [Exploit de XSS da documentação RDoc gerada pelo rdoc
  (CVE-2013-0256)][3]
  publicado em 6 de Fev. de 2013.
* [Vulnerabilidade DoS de Hash-flooding no ruby 1.9 (CVE-2012-5371)][4]
  publicado em 10 de Nov. de 2012.
* [Criação não-intencional de arquivos causada pela inserção ilegal
  do caractere NUL (CVE-2012-4522)][5]
  publicado em 12 de Out. de 2012.
* [Vulnerabilidade de escaping de $SAFE em Exception#to\_s / NameError#to\_s
  (CVE-2012-4464, CVE-2012-4466)][6]
  publicado em 12 de Out. de 2012.
* [Correção de segurança para o RubyGems: falha na verificação de SSL
  do servidor para repositórios remotos][7] publicado em 20 de Abr. de 2012.
* [Correção de segurança para o módulo OpenSSL do Ruby: Permitir
  o splitting de 0/n como umna prevenção a ataques TLS BEAST][8]
  publicado em 16 de Fev. de 2012.
* [Encontrado ataque de Denial of service para o algoritmo de hash do Ruby
  (CVE-2011-4815)][9]
  publicado em 28 de Dez. de 2011.
* [Métodos de exceção podem ignorar $SAFE][10]
  publicado em 18 de Fev. de 2011.
* [FileUtils está vulnerável a ataques symlink][11]
  publicado em 18 de Fev. de 2011.
* [XSS no WEBrick (CVE-2010-0541)][12]
  publicado em 16 de Ago. de 2010.
* [Buffer over-run em ARGF.inplace\_mode=][13]
  publicado em 2 de Jul. de 2010.
* [WEBrick tem uma vulnerabilidade de Escape Sequence Injection][14]
  publicado em 10 Jan, 2010.
* [Heap overflow em String (CVE-2009-4124)][15]
  publicado em 7 de Dez. de 2009.
* [Vulnerabilidade DoS no
  BigDecimal](/en/news/2009/06/09/dos-vulnerability-in-bigdecimal/)
  publicado em 9 de Jun. de 2009.
* [Vulnerabilidade DoS no
  REXML](/en/news/2008/08/23/dos-vulnerability-in-rexml/)
  publicado em 23 de Ago. de 2008.
* [Várias vulnerabilidades no
  Ruby](/en/news/2008/08/08/multiple-vulnerabilities-in-ruby/)
  publicado em 8 de Ago. de 2008.
* [Vulnerabilidades de execução de código
  arbitrário](/en/news/2008/06/20/arbitrary-code-execution-vulnerabilities/)
  publicado em 20 de Jun. de 2008.
* [Vulnerabilidade de acesso a arquivos
  no WEBrick](/en/news/2008/03/03/webrick-file-access-vulnerability/)
  publicado em 3 de Mar. de 2008.
* [Vulnerabilidade no Net::HTTPS](/en/news/2007/10/04/net-https-vulnerability/)
  publicado em 4 de Out. de 2007.
* [Outra vulnerabilidade de DoS na biblioteca
  CGI](/en/news/2006/12/04/another-dos-vulnerability-in-cgi-library/)
  publicado em 4 de Dez. de 2006.
* [Vulnerabilidade de DoS na biblioteca CGI
  (CVE-2006-5467)](/en/news/2006/11/03/CVE-2006-5467/)
  publicado em 3 de Nov. de 2006.
* [Vulnerabilidade  do Ruby nas configurações de
  safe level](/en/news/2005/10/03/ruby-vulnerability-in-the-safe-level-settings/)
  publicado em 2 de Out. de 2005.



[1]: /en/news/2013/02/22/rexml-dos-2013-02-22/
[2]: /en/news/2013/02/22/json-dos-cve-2013-0269/
[3]: /en/news/2013/02/06/rdoc-xss-cve-2013-0256/
[4]: /en/news/2012/11/09/ruby19-hashdos-cve-2012-5371/
[5]: /en/news/2012/10/12/poisoned-NUL-byte-vulnerability/
[6]: /en/news/2012/10/12/cve-2012-4464-cve-2012-4466/
[7]: /en/news/2012/04/20/ruby-1-9-3-p194-is-released/
[8]: /en/news/2012/02/16/security-fix-for-ruby-openssl-module-allow-0n-splitting-as-a-prevention-for-the-tls-beast-attack-/
[9]: /en/news/2011/12/28/denial-of-service-attack-was-found-for-rubys-hash-algorithm-cve-2011-4815/
[10]: /en/news/2011/02/18/exception-methods-can-bypass-safe/
[11]: /en/news/2011/02/18/fileutils-is-vulnerable-to-symlink-race-attacks/
[12]: /en/news/2010/08/16/xss-in-webrick-cve-2010-0541/
[13]: /en/news/2010/07/02/ruby-1-9-1-p429-is-released/
[14]: /en/news/2010/01/10/webrick-escape-sequence-injection/
[15]: /en/news/2009/12/07/heap-overflow-in-string/
