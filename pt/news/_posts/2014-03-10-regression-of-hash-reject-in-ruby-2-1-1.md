---
layout: news_post
title: "Regressão em Hash#reject no Ruby 2.1.1"
author: "sorah"
translator: "diogoandre"
date: 2014-03-10 14:00:00 +0000
lang: pt
---

No Ruby 2.1.0 ou anterior, o método `reject` em qualquer classe que herda
`Hash` retorna um objeto de sua própria classe.
Mas no Ruby 2.1.1, esse comportamento mudou acidentalmente para sempre retornar
um objeto Hash simples, não da classe herdada.

{% highlight ruby %}
class SubHash < Hash
end

p Hash.new.reject { }.class
#=> 2.1.0: Hash, 2.1.1: Hash
p SubHash.new.reject { }.class
#=> 2.1.0: SubHash, 2.1.1: Hash
{% endhighlight %}

(Para ser preciso, estados extra como variáveis de instância, etc. também
não são copiadas.)

Ruby 2.1.1 não deveria incluir tais mudanças de comportamento, porque com o
lançamento do Ruby 2.1.0 nós [mudamos a política de versionamento](https://www.ruby-lang.org/pt/news/2013/12/21/ruby-version-policy-changes-with-2-1-0/),
então o Ruby 2.1.1 é um lançamento do nível patch e não deveria quebrar a
compatibilidade retroativa.

Essa regressão poderia potencialmente afetar muitas bibliotecas, dois desses
casos são o `HashWithIndifferentAccess` e `OrderedHash` no Rails.
Eles estão quebrados: [Rails' issue #14188](https://github.com/rails/rails/issues/14188).

Esse comportamento será revertido para o comportamento da 2.1.0 no Ruby 2.1.2,
mas esse será o comportamento esperado no Ruby 2.2.0:
[Funcionalidade #9223](https://bugs.ruby-lang.org/issues/9223).
Então recomendamos que corrija o seu código para esperar essa mudança de
comportamento.

Esse acidente foi causado por um commit de backport perdido.
Para mais detalhes, veja [http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211](http://blog.sorah.jp/2014/03/10/hash-reject-regression-in-ruby211).

Desculpe por qualquer inconveniencia, e obrigado pelo seu suporte.
