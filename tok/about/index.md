---
layout: page
title: "Ruby li seme"
lang: tok
---

sina pilin wile e ni: Ruby li kama suli tan seme? jan olin Ruby li toki e
ona li toki ilo pi lukin pona, li toki ilo pi sitelen pona. taso jan li
toki sin e ni: ona li ilo pona pali. ni li lon tan seme?
{: .summary}

### wile pona pi jan pi open Ruby

Ruby li toki ilo pi nasin insa pona. jan pi open ona, [jan Yukihiro
"Matz" Matsumoto][matz], li kepeken e ijo pona tan toki ilo ante ona li
olin (Perl, Smalltalk, Eiffel, Ada, en Lisp), li pali e toki ilo sin li
jo e nasin luka-pali (imperative) en nasin pali-taso (functional), tu li
lon poki wan.

jan Matz li toki mute e ni: "mi wile e Ruby li sama nasin lon, mi wile
ala e ona li nasin pona lili taso." nasin ni li sama nasin lon.

kepeken wile ni, ona li toki e:

> Ruby li lukin pona lili, taso ona li ijo pi mute suli lon insa, sama
> sijelo mi jan.<sup>[1](#fn1)</sup>

### Ruby li kama suli

tan tenpo pi pana lon ma ale (1995), Ruby li kama tawa jan pali mute lon
ma ale. lon sike 2006, Ruby li kama sona pi jan mute. kulupu jan Ruby li
kama lon ma suli mute, tenpo kulupu Ruby li jo e jan mute, ken ala jo e
poki sin.

Ruby-Talk, [lipu toki](/tok/community/mailing-lists/) suli nanpa wan pi
toki Ruby, li jo e toki 200 lon tenpo suno lon sike 2006. nanpa ni li
kama lili lon sike kama, tan ni kulupu li kama suli, li kama poki lili
mute.

Ruby li lon anpa nanpa 10 lon mute lipu nanpa li lukin e nasin kama suli
pi toki ilo ale (sama [TIOBE index][tiobe]). mute pi kama suli ni li tan
kama pona pi poki ilo [Ruby on Rails][ror].

Ruby li [ken ala esun]({{ site.license.url }}). ona li ken ala esun taso;
sina ken kepeken, sina ken pana sin, sina ken ante, sina ken pana tawa
jan ante.

### ale li ijo

lon open, jan Matz li lukin e toki ilo ante li alasa e nasin sitelen
pona. ona li toki e ni: "mi wile e toki ilo pi wawa mute tan Perl, taso
mi wile e toki ilo li kepeken poki (object) mute tan
Python.<sup>[2](#fn2)</sup>"

lon Ruby, ale li ijo. sona ale e sitelen ale li ken jo e nasin ona e
pali ona. lon toki ilo pi kepeken poki, nasin li nimi *poki nimi lon
poki* (instance variables), pali li nimi *nasin pali* (methods). nasin
Ruby pi "ale li ijo" li ken lukin pona lon sitelen lili ni: ona li pana
e pali tawa nanpa.

{% highlight ruby %}
5.times { print "mi olin e Ruby -- ona li pona mute!" }
{% endhighlight %}

lon toki ilo mute, nanpa en ijo lili ante li ijo ala. Ruby li kepeken
nasin Smalltalk, li pana e nasin pali en poki nimi tawa nasin ale ona.
ni li pona e kepeken Ruby, tan ni lawa pi poki li sama lon ale Ruby.

### Ruby li ken ante

jan li lukin e Ruby li toki ilo pi ken ante mute, tan ni ona li ken ante
e ale ona kepeken wile jan. poki open pi Ruby li ken weka, li ken sin.
sina ken pana e ijo sin. Ruby li wile ala pana e lawa suli tawa jan
pali.

sama ni: nasin pana (`+`) li nasin pali pi pana namako. taso sina wile
e nimi lon `plus`, sina ken pana e nasin pali sin ni tawa poki `Numeric`
pi Ruby.

{% highlight ruby %}
class Numeric
  def plus(x)
    self.+(x)
  end
end

y = 5.plus 6
# y li nanpa 11 lon tenpo ni
{% endhighlight %}

nasin pana pi Ruby li nasin pali lon insa; sina ken ante e ona.

### block: ijo pona pi ken mute

block pi Ruby li ijo pona ante pi ken mute. jan pali li ken pana e
closure tawa nasin pali, li toki e nasin ni li wile pali seme. closure
ni li nimi *block*, li kama ijo pona nanpa wan tawa jan sin li kama tan
toki ilo ante sama PHP anu Visual Basic.

block li kama tan nasin toki ilo pali-taso (functional). jan Matz li
toki e ni: "lon closure pi Ruby, mi wile pana e lawa tawa nasin
Lisp.<sup>[3](#fn3)</sup>"

{% highlight ruby %}
search_engines =
  %w[Google Yahoo MSN].map do |engine|
    "http://www." + engine.downcase + ".com"
  end
{% endhighlight %}

lon sitelen pi anpa ni, block li lon insa pi `do ... end`. nasin pali
`map` li pana e block tawa lipu nimi. nasin pali mute ante pi Ruby li
awen open, li wile e ni: jan pali li sitelen e block sin li toki e ni,
nasin pali li wile pali seme.

### Ruby en poki pali (module)

Ruby li jo e nasin mama wan taso (single inheritance), kepeken wile
jan pi open. taso Ruby li sona e poki pali (nimi *module*, sama
Categories lon Objective-C). poki pali li kulupu pi nasin pali.

poki (class) li ken jo e poki pali (mixin), li kama jo e nasin pali ale
ona, li wile ala sin pali. sama ni: poki li jo e nasin pali `each` la
ona li ken jo e poki pali `Enumerable`, li kama jo e nasin pali mute li
kepeken `each` tawa nasin sike (loop).

{% highlight ruby %}
class MyArray
  include Enumerable
end
{% endhighlight %}

jan Ruby li lukin e nasin ni li pona mute tawa nasin mama mute (multiple
inheritance), tan ni nasin mama mute li ijo pi mute suli, li ken lawa
jan mute.

### nasin lukin pi sitelen Ruby

Ruby li kepeken sitelen lili taso, li wile e nimi Inglisi, taso ona li
kepeken sitelen lili namako tawa nasin pona. Ruby li wile ala e toki
open pi poki nimi. ona li kepeken nasin nimi pona tawa ni: poki nimi li
lon ma seme.

* `var` li ken poki nimi lon ma lili (local variable).
* `@var` li poki nimi pi poki (instance variable).
* `$var` li poki nimi pi ma ale (global variable).

sitelen lili ni li pona e lukin, tan ni jan pali li ken sona lili e
nasin poki nimi. ona li weka e wile pana e `self.` lon poki nimi ale.

### ijo ante li lon

Ruby li jo e ijo ante mute, sama ni:

* Ruby li jo e nasin pona pi pakala (exception handling), sama Java anu
  Python, li pona e pali tawa pakala.

* Ruby li jo e ilo weka pi ijo pakala (garbage collector) pona tawa ijo
  Ruby ale. sina wile ala awen e nanpa poki lon poki pali namako. jan
  Matz li toki e ni: "ni li pona mute tawa sijelo sina."

* pali sitelen C lon poki pali Ruby li pona lili tan Perl anu Python,
  kepeken nasin sitelen pona tawa kama toki Ruby tan C. sina ken pana
  Ruby lon ilo ante li kepeken ona sama toki ilo lili. ilo SWIG li ken
  kepeken.

* Ruby li ken kama jo e poki pali namako lon tenpo pali, sina jo e ilo
  sona li ken.

* Ruby li jo e nasin nasin-sama (threading) li ken lon ilo sona ale,
  taso ilo sona li jo ala e nasin ni. nasin ni li lon lon ilo sona ale
  Ruby li ken lon, taso lon MS-DOS!

* Ruby li ken kepeken lon ilo sona mute: mama pali li lon GNU/Linux,
  taso ona li ken lon UNIX mute, macOS, Windows, DOS, BeOS, OS/2, e ijo
  ante.

### nasin pali ante pi Ruby

Ruby, sama toki ilo, li jo e nasin pali ante mute. lipu ni li toki lon
nasin pali nanpa wan (kulupu li toki e ona **MRI** — "Matz's Ruby
Interpreter" — anu **CRuby** tan ni ona li sitelen lon C), taso nasin
pali ante li lon. ona li pona lon tenpo namako, li pana e poki tawa toki
ilo ante, anu li jo e ijo namako li MRI li jo ala e ona.

lipu nimi:

* [JRuby][jruby] li Ruby lon JVM (Java Virtual Machine), kepeken ilo JIT
  pona, ilo weka pi ijo pakala, nasin nasin-sama, kulupu ilo, en poki
  namako mute pi JVM.
* [Rubinius][rubinius] li "Ruby li sitelen kepeken Ruby". ona li pali
  lon LLVM, li jo e ilo sona (virtual machine) pona li toki ilo ante li
  ken pali lon ona.
* [TruffleRuby][truffleruby] li nasin pali Ruby pi wawa suli lon
  GraalVM.
* [mruby][mruby] li nasin pali lili pi toki Ruby li ken pana lon poki
  ilo ante. jan Matz taso li lawa e pali ona.
* [IronRuby][ironruby] li nasin pali li "kama wan pona tawa .NET
  Framework".
* [MagLev][maglev] li "nasin pali Ruby pi wawa awen, li jo e nasin awen
  sona (object persistence) en poki sona pi kulupu (distributed shared
  cache)".
* [Cardinal][cardinal] li "ilo ante pi Ruby tawa [Parrot][parrot]
  Virtual Machine" (Perl 6).

tawa lipu suli, o lukin [Awesome Rubies][awesome-rubies].

### lipu open

<sup>1</sup> jan Matz, lon lipu toki Ruby-Talk, [tenpo suno 12 pi mun 5,
sike 2000][blade].
{: #fn1}

<sup>2</sup> jan Matz, lon [toki kama sona tan jan pi open
Ruby][linuxdevcenter], tenpo suno 29 pi mun 11, sike 2001.
{: #fn2}

<sup>3</sup> jan Matz, lon [Blocks and Closures in Ruby][artima], tenpo
suno 22 pi mun 12, sike 2003.
{: #fn3}



[matz]: http://www.rubyist.net/~matz/
[blade]: https://blade.ruby-lang.org/ruby-talk/2773
[ror]: http://rubyonrails.org/
[linuxdevcenter]: http://www.linuxdevcenter.com/pub/a/linux/2001/11/29/ruby.html
[artima]: http://www.artima.com/intv/closures2.html
[tiobe]: http://www.tiobe.com/index.php/content/paperinfo/tpci/index.html
[jruby]: http://jruby.org
[rubinius]: https://rubinius.com
[truffleruby]: https://github.com/oracle/truffleruby
[mruby]: http://www.mruby.org/
[ironruby]: http://www.ironruby.net
[maglev]: http://maglev.github.io
[cardinal]: https://github.com/parrot/cardinal
[parrot]: http://parrot.org
[awesome-rubies]: https://github.com/planetruby/awesome-rubies
