---
layout: news_post
title: "Vulnerabilidades de segurança no Ruby"
author: "Unknown Author"
lang: pt
---

Algumas vulnerabilidades de segurança no Ruby permitem ataques \"denial
of service (DoS)\" ou execução arbitrária de código.

## Impacto

As seguintes vulnerabilidades permitem ataques de DoS ou execução
arbitrária de código.

* [CVE-2008-2662][1]
* [CVE-2008-2663][2]
* [CVE-2008-2725][3]
* [CVE-2008-2726][4]
* [CVE-2008-2664][5]

## Versões vulneráveis

1.8
: * 1\.8.4 e todas as anteriores
  * 1\.8.5-p230 e todas as anteriores
  * 1\.8.6-p229 e todas as anteriores
  * 1\.8.7-p21 e todas as anteriores

1.9
: * 1\.9.0-1 e todas as anteriores

## Solução

1.8
: Actualizar para a versão 1.8.5-p231, ou 1.8.6-p230, ou 1.8.7-p22.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz&gt;][6]
    (md5sum: e900cf225d55414bffe878f00a85807c)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz&gt;][7]
    (md5sum: 5e8247e39be2dc3c1a755579c340857f)
  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz&gt;][8]
    (md5sum: fc3ede83a98f48d8cb6de2145f680ef2)

1.9
: Actualizar para a versão 1.9.0-2.

  * [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz&gt;][9]
    (md5sum: 2a848b81ed1d6393b88eec8aa6173b75)

Estas versões também corrigem a vulnerabilidade no WEBrick
([CVE-2008-1891][10]).

Note que um pacote binário que corrige este problema poderá já estar
disponível a partir do seu software de gestão de aplicações.

## Créditos

Os créditos vão para Drew Yao da Segurança de Produtos da Apple por dar
a conhecer o problema à equipa de segurança do Ruby

## Alterações

* 2008-06-21 00:29 +09:00 removidos os CVE IDs incorrectos
  (CVE-2008-2727, CVE-2008-2728).



[1]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2662
[2]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2663
[3]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2725
[4]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2726
[5]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-2664
[6]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.5-p231.tar.gz
[7]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.6-p230.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.8/ruby-1.8.7-p22.tar.gz
[9]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.0-2.tar.gz
[10]: http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2008-1891
