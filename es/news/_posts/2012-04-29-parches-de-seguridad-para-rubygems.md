---
layout: news_post
title: "Parches de Seguridad para RubyGems."
author: "Manuel Ramos Caro"
lang: es
---

Se han liberado las versiones 1.9.3-p194 y 1.9.2-p320 de Ruby. Se
incluye un parche de seguridad para RubyGems con objeto de corregir un
fallo de verificación en conexión segura. Adicionalmente se incluyen
multitud de pequeñas correcciones.

Se incluyen dos actualizaciones de seguridad para RubyGems:

* Activación de la verificación de certificados en servidores SSL.
* Se desactiva la redirección desde https a http.

Se recomienda especialmente la actualización a usuarios que utilicen
orígenes https en gemrc.

Debido a esta actualización si se utiliza un servidor personalizado de
RubyGems con encriptación no se podrá realizar una conexión hasta que
los certificados sean globalmente validos.

Para configurar el uso del certificado SSL de RubyGems utilizaremos las
opciones :ssl\_ca\_cert y :ssl\_verify\_mode del fichero gemrc. El
método recomendado es activar a través de la opción :ssl\_ca\_cert el
certificado de autentificación de nuestro servidor o bien el paquete que
lo contenga.

Es posible la desactivación de la verificación de los certificados SSL a
través del uso de valor cero para la opción :ssl\_verify\_mode. Aunque
atendiendo a motivos de seguridad esto no se recomienda.

Para tener información detallada de todos los cambios realizados en
estas versiones se aconseja verificar los cambios realizados:

* Registro de cambios para [1.9.2-p320.][1]
* Registro de cambios para [1.9.3-p194.][2]

## Descargas 1.9.2-p320.

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2&gt;][3]

SIZE:

8981382 bytes

MD5:

b226dfe95d92750ee7163e899b33af00

SHA256:

6777f865cfa21ffdc167fcc4a7da05cb13aab1bd9e59bfcda82c4b32f75e6b51

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz&gt;][4]

SIZE:

11338691 bytes

MD5:

5ef5d9c07af207710bd9c2ad1cef4b42

SHA256:

39a1f046e8756c1885cde42b234bc608196e50feadf1d0f202f7634f4a4b1245

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip&gt;][5]

SIZE:

12730896 bytes

MD5:

0bdfd04bfeb0933c0bdcd00e4ea94c49

SHA256:

83db9c86d5cf20bb91e625c3c9c1da8e61d941e1bc8ff4a1b9ea70c12f2972d3

## Descargas 1.9.3-p194.

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2&gt;][6]

SIZE:

9841223 bytes

MD5:

2278eff4cfed3cbc0653bc73085caa34

SHA256:

a9d1ea9eaea075c60048369a63b35b3b5a06a30aa214a3d990e0bb71212db8fa

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz&gt;][7]

SIZE:

12432239 bytes

MD5:

bc0c715c69da4d1d8bd57069c19f6c0e

SHA256:

46e2fa80be7efed51bd9cdc529d1fe22ebc7567ee0f91db4ab855438cf4bd8bb

* [&lt;URL:https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip&gt;][8]

SIZE:

13898712 bytes

MD5:

77e67b15234e442d4a3dcc450bc70fea

SHA256:

77474cfb92385b3a0b4c346553048bc65bfe68d4f220128329671a0234cb124d



[1]: https://github.com/ruby/ruby/blob//v1_9_3_194/ChangeLog
[2]: https://github.com/ruby/ruby/blob//v1_9_2_320/ChangeLog
[3]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.bz2
[4]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.tar.gz
[5]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.2-p320.zip
[6]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.bz2
[7]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.tar.gz
[8]: https://cache.ruby-lang.org/pub/ruby/1.9/ruby-1.9.3-p194.zip
