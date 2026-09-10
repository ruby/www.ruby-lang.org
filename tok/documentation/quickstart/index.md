---
layout: page
title: "Ruby lon tenpo lili"
lang: tok
---

## o open

lipu sona lili ni li Ruby, li wile tenpo lili taso (mun tenpo 20). mi
pilin e ni: Ruby li lon insa ilo sona sina. (Ruby li lon ala la, o
[kama jo][installation] e ona lon open.)

## Ruby pi toki-pana-toki

Ruby li jo e ilo li ken pana e nanpa pi toki Ruby sina pana. o musi
kepeken sitelen Ruby lon ilo ni — nasin ni li pona mute tawa kama sona
e toki ilo.

o open e IRB (Interactive Ruby).

* sina kepeken **macOS** la, o open e `Terminal`, o sitelen e `irb`, o
  luka e Enter.
* sina kepeken **Linux** la, o open e ilo toki, o sitelen e `irb`, o
  luka e Enter.
* sina kepeken **Windows** la, o open e `Interactive Ruby` tan lipu
  Ruby lon Start Menu sina.

{% highlight irb %}
irb(main):001:0>
{% endhighlight %}

pona, ona li open. tenpo ni la seme?

o sitelen e ni: `"Hello World"`

{% highlight irb %}
irb(main):001:0> "Hello World"
=> "Hello World"
{% endhighlight %}

## Ruby li kute e sina!

ijo seme li kama? mi sitelen ala e toki ilo "Hello World" lili nanpa
wan pi ma ale, la seme? linja tu li nasin pi IRB taso, li toki e nanpa
pi toki open pini. mi wile sitelen e "Hello World" lon lukin la, mi
wile e ijo namako:

{% highlight irb %}
irb(main):002:0> puts "Hello World"
Hello World
=> nil
{% endhighlight %}

`puts` li nasin pali suli tawa sitelen lon lukin, lon Ruby. taso `=>
nil` li seme? ona li nanpa pi toki. `puts` li pana nanpa `nil` lon
tenpo ale — `nil` li nanpa Ruby pi "ijo ala" mute.

## ilo nanpa sina, li ken ala esun!

mi jo e mute tawa kepeken IRB sama ilo nanpa (calculator):

{% highlight irb %}
irb(main):003:0> 3+2
=> 5
{% endhighlight %}

nanpa 3 en nanpa 2. pona lili. nanpa 3 kepeken nanpa 2 lon nasin pi
pana-mute (times) la, seme? sina ken sitelen e ona sin, taso sina ken
luka e **linja sewi** lon leko sina tawa lukin e linja `3+2` sina
sitelen pini. sina lukin e ona la, o luka e linja poka tawa lon poka pi
`+`, o weka e ona, o sitelen e `*`.

{% highlight irb %}
irb(main):004:0> 3*2
=> 6
{% endhighlight %}

kepeken sin, o alasa e nanpa 3 li pana-mute e ona taso (squared):

{% highlight irb %}
irb(main):005:0> 3**2
=> 9
{% endhighlight %}

lon Ruby, `**` li nasin toki pi "wawa tawa". taso sina wile e nasin
ante, sina wile alasa e "square root" pi nanpa la, seme?

{% highlight irb %}
irb(main):006:0> Math.sqrt(9)
=> 3.0
{% endhighlight %}

pona, o awen — ijo pini seme li lon? sina toki e "ona li alasa e square
root pi nanpa 9," sina pona. taso o lukin insa e ijo. lon open, `Math`
li seme?

## poki pali li kama poki e sitelen lon nimi

`Math` li poki pali (module) li lon Ruby lon open, li jo e nasin pali
pi nanpa. poki pali li jo e nasin tu lon Ruby. ni li nasin wan: ona li
kama poki e nasin pali sama lon nimi wan. `Math` li jo sin e nasin pali
sama `sin()` en `tan()`.

lon kama la, sitelen `.` li lon. `.` li seme? `.` li nasin pona tawa
toki e jan li kama jo e toki sina. toki seme? lon ni, toki li
`sqrt(9)`, li toki e ni: o kepeken nasin pali `sqrt` (nimi lili pi
"square root") kepeken nanpa `9`.

nanpa li kama tan nasin pali ni li `3.0`. sina ken lukin e ni: ona li
`3` taso ala. tan ni: mute pi tenpo la, square root pi nanpa li nanpa
lipu ala, tan ni nasin pali li pana nanpa "floating-point" lon tenpo
ale.

mi wile awen e nanpa pi pali ni la, seme? o pana e nanpa tawa poki
nimi:

{% highlight irb %}
irb(main):007:0> a = 3 ** 2
=> 9
irb(main):008:0> b = 4 ** 2
=> 16
irb(main):009:0> Math.sqrt(a+b)
=> 5.0
{% endhighlight %}

ilo nanpa ni li pona mute, taso mi weka lili tan toki "Hello World" li
lipu sona sin ale li wile toki e ona. taso ni li open taso — Ruby li
lon insa poki, li lon insa lipu sona, li ken ale sina wile pali!

[installation]: /tok/documentation/installation/
