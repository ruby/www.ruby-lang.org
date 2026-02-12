---
layout: news_post
title: "Cambio en las configuraciones por defecto de ext/openssl"
author: "usa"
translator: "David Padilla"
date: 2014-10-27 12:00:00 +0000
tags: security
lang: es
---

En Ruby 2.1.4, Ruby 2.0.0-p594 y Ruby 1.9.3-p550 cambiamos la configuración
por defecto de ext/openssl.
Con este cambio las opciones inseguras de SSL/TLS ahora están desabilitadas,
y por esto puede darse la posibilidad de tener problemas con las conexiones
de SSL.

## Detalles

OpenSSL implementa protocolos y cifrados que son considerados inseguros al dia
de hoy por circunstancias históricas. Un ejemplo es la vulnerabilidad POODLE
([CVE-2014-3566](http://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2014-3566)),
utilizar OpenSSL con este tipo de vulnerabilidades no garantiza la seguridad
de la comunicación en tu red.
Basados en la discusión del [Bug #9424](https://bugs.ruby-lang.org/issues/9424),
hemos decidido deshabilitar esas opciones inseguras de SSL/TLS por defecto.
Si necesitas cancelar este cambio (mostrado abajo) aplica el parche
inverso para revertirlo.

2.1.4
: [r48098](https://git.ruby-lang.org/ruby.git)

2.0.0-p594
: [r48110](https://git.ruby-lang.org/ruby.git)

1.9.3-p550
: [r48121](https://git.ruby-lang.org/ruby.git)

Pero recuerda, si cancelas este cambio corres el riesgo de comprometer la seguridad
de la comunicación en tu red.

### Librerías empaquetadas de Ruby

Este cambio se refleja en net/http, net/imap y net/pop.
Debido a que DRb y WEBrick reciben la configuración por separado, este cambio no
los afecta.

### Rutinas que usan ext/openssl directamente

Este cambio se refleja cuando un objeto `OpenSSL::SSL::SSLContext` es instanciado
y se llama al método `set_params` de esa instacia.

En particular código como:

{% highlight ruby %}
ctx = OpenSSL::SSL::SSLContext.new
ctx.set_params  # Si quieres cambiar algunas opciones como el modo de verificacion, el almacenamiento del certificado, puedes enviar esos parametros en un hash
ssl = OpenSSL::SSL::SSLSocket.new(socket, ctx)
{% endhighlight %}

Si utilizas ext/openssl como cliente, asumimos que no debe haber
problema con este cambio.
Pero si utilizas ext/openssl como servidor y aplicas este cambio, es posible
que algunos clientes viejos (Internet Explorer 6 en Windows XP, navegadores
en teléfonos celulares viejos, etc.) no puedan conectarse al servidor.

La decisión de habilitar o no este cambio es tuya, considera las consecuencias.

## Solución Alterna

Si por alguna razón no puedes actualizar Ruby pero tienes que manejar las
opciones inseguras de SSL/TLS, aplica a tu código el siguiente parche:

{% highlight ruby %}
module OpenSSL
  module SSL
    class SSLContext
      remove_const(:DEFAULT_PARAMS)
      DEFAULT_PARAMS = {
        :ssl_version => "SSLv23",
        :verify_mode => OpenSSL::SSL::VERIFY_PEER,
        :ciphers => %w{
          ECDHE-ECDSA-AES128-GCM-SHA256
          ECDHE-RSA-AES128-GCM-SHA256
          ECDHE-ECDSA-AES256-GCM-SHA384
          ECDHE-RSA-AES256-GCM-SHA384
          DHE-RSA-AES128-GCM-SHA256
          DHE-DSS-AES128-GCM-SHA256
          DHE-RSA-AES256-GCM-SHA384
          DHE-DSS-AES256-GCM-SHA384
          ECDHE-ECDSA-AES128-SHA256
          ECDHE-RSA-AES128-SHA256
          ECDHE-ECDSA-AES128-SHA
          ECDHE-RSA-AES128-SHA
          ECDHE-ECDSA-AES256-SHA384
          ECDHE-RSA-AES256-SHA384
          ECDHE-ECDSA-AES256-SHA
          ECDHE-RSA-AES256-SHA
          DHE-RSA-AES128-SHA256
          DHE-RSA-AES256-SHA256
          DHE-RSA-AES128-SHA
          DHE-RSA-AES256-SHA
          DHE-DSS-AES128-SHA256
          DHE-DSS-AES256-SHA256
          DHE-DSS-AES128-SHA
          DHE-DSS-AES256-SHA
          AES128-GCM-SHA256
          AES256-GCM-SHA384
          AES128-SHA256
          AES256-SHA256
          AES128-SHA
          AES256-SHA
          ECDHE-ECDSA-RC4-SHA
          ECDHE-RSA-RC4-SHA
          RC4-SHA
        }.join(":"),
        :options => -> {
          opts = OpenSSL::SSL::OP_ALL
          opts &= ~OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS if defined?(OpenSSL::SSL::OP_DONT_INSERT_EMPTY_FRAGMENTS)
          opts |= OpenSSL::SSL::OP_NO_COMPRESSION if defined?(OpenSSL::SSL::OP_NO_COMPRESSION)
          opts |= OpenSSL::SSL::OP_NO_SSLv2 if defined?(OpenSSL::SSL::OP_NO_SSLv2)
          opts |= OpenSSL::SSL::OP_NO_SSLv3 if defined?(OpenSSL::SSL::OP_NO_SSLv3)
          opts
        }.call
      }
    end
  end
end
{% endhighlight %}

## Versiones afectadas por este cambio

* Ruby 1.9.3 patchlevel 550 y posteriores
* Ruby 2.0.0 patchlevel 594 y posteriores
* Ruby 2.1.4 y posteriores
* revisión 48097 y posteriores

## Historia

* Publicado originalmente 2014-10-27 12:00:00 (UTC)
