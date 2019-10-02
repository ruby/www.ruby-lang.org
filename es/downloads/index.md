---
layout: page
title: "Descarga Ruby"
lang: es
---

{% include out-of-date.html %}

Aquí puedes obtener las últimas distribuciones de Ruby en tu sabor
favorito. La versión estable actual es {{ site.data.downloads.stable[0] }}.
Por favor asegúrate de leer la [licencia de Ruby][license].
{: .summary}

### Formas de instalar Ruby

Tenemos herramientas para instalar Ruby para las plataformas más importantes.

* En Linux/Unix, puedes utilizar el sistema de gestión de paquetes de tu
  distribución o herramientas de terceros ([rbenv][rbenv] y [RVM][rvm]).
* En computadoras con sistema operativo macOS, puedes utilizar herramientas de terceros ([rbenv][rbenv] y [RVM][rvm]).
* En computadoras con sistema operativo Windows, puedes utilizar [RubyInstaller][rubyinstaller].

Consulta la página de [Instalación][installation] para obtener detalles de como usar
sistemas de gestión de paquetes de tu distribución o herramientas de terceros.

### Compilando Ruby — Código fuente

Instalar desde el código fuente es una buena solución para cuando te sientes
confiado con tu plataforma y hasta puedas necesitar configuraciones
específicas para tu entorno. También es una buena solución en el caso de
que no existan paquetes disponibles.

Consulta la página de [Instalación][installation] para obtener detalles de como compilar
Ruby desde el código fuente. Si tienes algún problema compilando Ruby, considera
usar una de las herramientas de terceros en la siguiente sección. Pueden servirte
de ayuda.

* **Estable actual:**
  Ruby {{ site.data.downloads.stable[0] }}

* **Snapshots:**
  * [Stable Snapshot]({{ site.data.downloads.stable_snapshot.url.gz }}):
    Este es el tarball del último snapshot del branch de la versión actual estable.
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    Este es el tarball de lo que exista en Git, hecho diariamente.
    Puede contener errores, ¡úsalo bajo tu responsabilidad!

Para información sobre los repositorios de Subversion y Git, consulta
nuestra página [Ruby core](/en/community/ruby-core/) (en inglés).

El código fuente de Ruby está disponible desde un conjunto
de [mirror sites][mirrors] a lo largo del mundo.
Intenta usar el mirror site que te quede más cerca.



[license]: {{ site.license.url }}
[installation]: /es/documentation/installation/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
