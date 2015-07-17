---
layout: news_post
title: "Ruby 1.9.1-p129 já disponível para download"
author: "Filipe Rocha"
lang: pt
---

Ruby 1.9.1-p129 já está disponível para download.

Esta é uma versão de manutenção para o Ruby 1.9.1. Corrige diversos bugs
e duas vulnerabilidades de seguranla. Uma vez que é uma versão que
contém uma correcção de segurança aconselha-se que todos os utilizadores
façam esta actualização.

#### Disponível a partir de

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/ruby-1.9.1-p129.tar.bz2&gt;][1]

      SIZE:   7183891 bytes
      MD5:    6fa62b20f72da471195830dec4eb2013
      SHA256: cb730f035aec0e3ac104d23d27a79aa9625fdeb115dae2295de65355f449ce27

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/ruby-1.9.1-p129.tar.gz&gt;][2]

      SIZE:   9034947 bytes
      MD5:    c71f413514ee6341c627be2957023a5c
      SHA256: 27b7a8ace1d17cec237020ae9355230b53f8c3875f8d942de903e7d58d14253b

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/ruby-1.9.1-p129.zip&gt;][3]

      SIZE:   10299369 bytes
      MD5:    156305e9633758eb60b419fabc33b6e4
      SHA256: 6cbf0eda4ba0afedd8f0bd320e6a14f826149ef517d8bb967149af0558b0743b

#### Vulnerabilidades de Segurança

* DL::Function#call could pass tainted arguments to a C function even if

$SAFE &gt; 0.

* DL::dlopen could open a library with tainted library name even if

$SAFE &gt; 0



[1]: https://cache.ruby-lang.org/pub/ruby/ruby-1.9.1-p129.tar.bz2
[2]: https://cache.ruby-lang.org/pub/ruby/ruby-1.9.1-p129.tar.gz
[3]: https://cache.ruby-lang.org/pub/ruby/ruby-1.9.1-p129.zip
