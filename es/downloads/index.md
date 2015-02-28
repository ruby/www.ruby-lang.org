---
layout: page
title: "Descarga Ruby"
lang: es
---

Aquí puedes obtener las últimas distribuciones de Ruby en tu sabor
favorito. La versión estable actual es {{ site.downloads.stable.version }}.
Por favor asegúrate de leer la [licencia de Ruby][license].
{: .summary}

### Formas de instalar Ruby

Tenemos herramientas para instalar Ruby para las plataformas más importantes.

* En Linux/Unix, puedes utilizar el sistema de gestión de paquetes de tu
  distribución o herramientas de terceros (rbenv y RVM).
* En computadoras con sistema operativo OS X, puedes utilizar herramientas de terceros (rbenv y RVM).
* En computadoras con sistema operativo Windows, puedes utilizar RubyInstaller.

Chequea la página de [Instalación][installation] para obtener detalles de como usar
sistemas de gestión de paquetes de tu distribución o herramientas de terceros.

### Compilando Ruby — Código fuente

Instalar desde el código fuente es una buena solución para cuando te sientes
confiado con tu plataforma y hasta puedas necesitar configuraciones
específicas para tu entorno. También es una buena solución en el caso de
que no existan paquetes disponibles.

Chequea la página de [Instalación][installation] para obtener detalles de cómo compilar
Ruby desde el código fuente. Si tienes algún problema compilando Ruby, considera
usar una de las herramientas de terceros en la siguiente sección. Pueden servirte
de ayuda.

* **Estable actual:**
  [Ruby {{ site.downloads.stable.version }}][stable-gz]<br>
  sha256: {{ site.downloads.stable.sha256.gz }}

* **Estable previo:**
  [Ruby {{ site.downloads.previous.version }}][previous-gz]<br>
  sha256: {{ site.downloads.previous.sha256.gz }}

* **Estable viejo (serie 2.0.0):**
  [Ruby {{ site.downloads.previous20.version }}][previous20-gz]<br>
  sha256: {{ site.downloads.previous20.sha256.gz }}

* **Snapshots:**
  * [Stable Snapshot][stable-snapshot-gz]:
    Este es el tarball del último snapshot del branch de la actual versión estable.
  * [Nightly Snapshot][nightly-gz]:
    Este es el tarball de lo que exista en SVN, hecho diariamente.
    Puede contener errores, ¡úsalo bajo tu responsabilidad!

Para información sobre los repositorios de Subversion y Git, consulta
nuestra página [Ruby core](/es/community/ruby-core/).

El código fuente de Ruby está disponible desde un conjunto
de [mirror sites][mirrors] a lo largo del mundo.
Intenta usar el mirror site más cerca tuyo.



[license]: {{ site.license.url }}
[installation]: /es/documentation/installation/
[stable-gz]: {{ site.downloads.stable.url.gz }}
[previous-gz]: {{ site.downloads.previous.url.gz }}
[previous20-gz]: {{ site.downloads.previous20.url.gz }}
[stable-snapshot-gz]: {{ site.downloads.stable_snapshot.url.gz }}
[nightly-gz]: {{ site.downloads.nightly_snapshot.url.gz }}
[mirrors]: /en/downloads/mirrors/
