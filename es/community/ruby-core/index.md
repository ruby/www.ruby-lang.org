---
layout: page
title: "Ruby Core"
lang: es
---

Ahora es un momento fantástico para seguir el desarrollo de Ruby.
Con la mayor atención que Ruby ha recibido en los últimos años,
existe una creciente necesidad de buenos talentos para ayudar a mejorar Ruby
y documentar sus partes. Entonces, ¿por dónde empezar?
{: .summary}

Los temas relacionados con el desarrollo de Ruby que se tratan aquí son:

* [Usando Git para rastrear el desarrollo de Ruby](#following-ruby)
* [Mejorando Ruby, Parche por Parche](#patching-ruby)
* [Nota sobre las ramas](#branches-ruby)

### Usando Git para rastrear el desarrollo de Ruby
{: #following-ruby}

El repositorio principal actual del último código fuente de Ruby es
[git.ruby-lang.org/ruby.git][gitrlo].
También existe un repositorio [espejo en GitHub][7]. En lo general, usa el
repositorio espejo, por favor.

Puedes obtener el último código fuente de Ruby usando Git.
Desde tu línea de comandos:

{% highlight sh %}
$ git clone https://github.com/ruby/ruby.git
{% endhighlight %}

El directorio `ruby` ahora contendrá el último código fuente
para la versión de desarrollo de Ruby (ruby-trunk).

Vease también [Cómo unirse a nuestro desarrollo como no contribuyente de código fuente][noncommitterhowto].

Si tienes permisos de contribución al código fuente y deseas empujar cambios,
deberías usar el repositorio principal.

{% highlight sh %}
$ git clone git@git.ruby-lang.org:ruby.git
{% endhighlight %}

### Mejorando Ruby, Parche por Parche
{: #patching-ruby}

El equipo central mantiene un [rastreador de problemas][10] para enviar parches e
informes de errores a Matz y al grupo. Estos informes también se envían a
la [lista de distribución de Ruby-Core][mailing-lists] para discusión,
así que puedes estar seguro que tu petición no pasará desapercibida.
También puedes enviar tus parches directamente a la lista de
distribución. De cualquier manera, te invitamos a formar parte de las
discusiones siguientes.

Consulta la [Guía del redactor de Parches][writing-patches] para obtener algunos consejos,
directamente de Matz, sobre cómo hacer que tus parches sean considerados.

En resumen, los pasos para crear un parche son:

1.  Consulta una copia del código fuente de Ruby de GitHub.
    Por lo general, los parches para la corrección de errores
    o las nuevas funciones deben enviarse al tronco de la fuente de Ruby.

        $ git clone https://github.com/ruby/ruby.git

    Si estás solucionando un error que es específico de una sola rama de mantenimiento,
    revisa una copia de la rama respectiva.

        $ git checkout ruby_X_X

    X_X debe ser reemplazado por la versión que desees revisar.

2.  Agrega tus mejoras al código.

3.  Crea un parche.

        $ git diff > ruby-changes.patch

4.  Crea un ticket en el [rastreador de problemas][10] o envía tu parche
    a la [lista de distribución de Ruby-Core][mailing-lists] con un registro de ChangeLog
    describiendo tu parche.

5.  Si no surgen problemas sobre el parche, los contribuyentes darán
    la aprobación para aplicarlo.

**Por favor ten en cuenta:** los parches deben enviarse como una [diferencia unificada][12].
Para obtener más información sobre cómo se fusionan los parches, consulta [la referencia de diffutils][13].

La discusión sobre el desarrollo de Ruby converge en la
[Lista de distribución de Ruby-Core][mailing-lists]. Entonces, si tienes curiosidad
sobre si tu parche vale la pena o si deseas iniciar una discusión
sobre el futuro de Ruby, no dudes en subir a bordo.
Ten presente que las discusiones fuera de tema no se toleran en esta lista,
el nivel de ruido debe ser muy bajo, los temas deben ser puntuales, bien concebidos y
bien escritos. Ya que nos dirigimos al creador de Ruby, tengamos un poco de reverencia.

Ten en cuenta que muchos de los desarrolladores principales de Ruby viven en Japón y, aunque muchos
hablan muy bien inglés, hay una diferencia de zona horaria significativa.
También tienen un cuerpo completo de listas de desarrollo japonesas sucediendo
junto a las contrapartes inglesas. Se paciente,
si tu petición no se resuelve, se persistente, inténtalo de nuevo unos días más tarde.


### Nota sobre las ramas
{: #branches-ruby}

El código fuente de Ruby se había gestionado en el repositorio de Subversion hasta el 22 de abril de 2019.
Por lo tanto, algunas ramas aún pueden administrarse bajo Subversion.
Puedes ver el repositorio de SVN.

* [&lt;URL:https://git.ruby-lang.org/ruby.git&gt;][svn-viewvc]

Sin embargo, no tienes que preocuparte por eso (a menos que seas un mantenedor de rama).
Puedes consultar las ramas en tu copia de trabajo de Git.
Por ejemplo, ejecuta el siguiente comando.

{% highlight sh %}
$ git checkout ruby_X_X
{% endhighlight %}

X_X debe ser reemplazado por la versión que desees revisar.

Si deseas modificar las ramas, por favor, abre una incidencia en nuestro [rastreador de problemas][10].
Ver también la siguiente sección.

[gitrlo]: https://git.ruby-lang.org/ruby.git
[mailing-lists]: /es/community/mailing-lists/
[writing-patches]: /es/community/ruby-core/writing-patches/
[noncommitterhowto]: https://github.com/shyouhei/ruby/wiki/noncommitterhowto
[svn-viewvc]: https://git.ruby-lang.org/ruby.git
[7]: https://github.com/ruby/ruby
[10]: https://bugs.ruby-lang.org/
[12]: http://www.gnu.org/software/diffutils/manual/html_node/Unified-Format.html
[13]: http://www.gnu.org/software/diffutils/manual/html_node/Merging-with-patch.html#Merging%20with%20patch
