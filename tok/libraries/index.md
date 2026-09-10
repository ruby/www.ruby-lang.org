---
layout: page
title: "namako"
lang: tok
---

sama toki ilo mute, Ruby li kepeken namako mute tan jan ante.
{: .summary}

namako ale (li sama ale) li kama lon nasin **gem** (mi toki e ona
"namako"), poki namako wan anu ilo wan li ken kama jo kepeken ilo li
nimi [**RubyGems**][1].

RubyGems li ilo lawa namako pi Ruby, li pona e pali, e pana tawa jan
ante, en kama jo pi namako (lon nasin ante, ona li sama ilo lawa namako
`apt-get`, taso ona li tawa Ruby taso). Ruby li jo e RubyGems lon open
tan nanpa 1.9 kama; nanpa Ruby pi tenpo pini li wile e sina [kama jo
kepeken luka][2].

namako ante li kama lon poki sitelen (.zip anu .tar.gz) pi **sitelen
open**. nasin kama jo li ken ante ante; poki `README` anu `INSTALL` li
lon mute, li jo e nasin toki.

o lukin e nasin alasa e namako en kama jo e ona tawa kepeken sina.

### alasa e namako

ma suli tawa namako li [**RubyGems.org**][1], poki namako pi jan ale li
ken alasa en kama jo lon ilo sona sina. sina ken alasa e namako lon
lipu RubyGems, anu kepeken nasin pali `gem`.

kepeken `gem search -r`, sina ken alasa lon poki RubyGems. sama ni,
`gem search -r rails` li pana e lipu namako li poka Rails. kepeken
`--local` (`-l`), sina alasa lon namako sina jo pini. tawa kama jo e
namako, o kepeken `gem install [namako]`. tawa lukin e namako sina jo,
o kepeken `gem list`. tawa sona mute pi nasin pali `gem`, o lukin lon
anpa anu o tawa [lipu sona RubyGems][3].

ma ante li lon tawa namako. [**GitHub**][5] li ma suli nanpa wan tawa
sitelen Ruby. mute pi tenpo la, sitelen open pi namako li lon GitHub,
taso ona li kama namako sin lon RubyGems.org.

[**The Ruby Toolbox**][6] li pali li pona e alasa e pali Ruby pi ken ala
esun. ona li jo e poki mute tawa pali suli mute, li jo e sona mute pi
pali (pana sin, pali sitelen) anu poki poka ona, li lukin e pali kepeken
nasin jan li kepeken ona lon RubyGems.org en GitHub. ni li pona e alasa
e namako li pona tawa pakala wan (sama poki ilo lipu, ilo lipu sona,
namako pi pona sitelen).

### toki lili sin pi RubyGems

o lukin e toki lili pi nasin pali `gem`, tawa kepeken sina lon tenpo
suno ale. [lipu sona mute][7] li lon, li toki e ale pi ilo namako ni.

#### alasa e namako lon insa namako ale

nasin pali **search** li ken alasa e namako, kepeken nimi lili. namako
li open kepeken nimi lili sina pana li kama lon lipu. sama ni, tawa
alasa e namako li poka "html":

{% highlight sh %}
$ gem search -r html

*** REMOTE GEMS ***

html-sample (1.0, 1.1)
{% endhighlight %}

sitelen `--remote` / `-r` li toki e ni: mi wile lukin e poki lawa
RubyGems.org (nasin lon open). kepeken `--local` / `-l`, sina alasa lon
namako sina jo pini.

#### kama jo e namako

sina sona e namako sina wile **kama jo**, sama poki pali suli Ruby on
Rails:

{% highlight sh %}
$ gem install rails
{% endhighlight %}

sina ken kama jo e nanpa wan taso, kepeken `--version` / `-v`:

{% highlight sh %}
$ gem install rails --version 5.0
{% endhighlight %}

#### lipu pi namako ale

tawa **lipu** pi namako ale sina jo pini:

{% highlight sh %}
$ gem list
{% endhighlight %}

tawa lipu suli (suli mute!) pi namako ale lon RubyGems.org:

{% highlight sh %}
$ gem list -r
{% endhighlight %}

#### pana pona!

lipu sona li lon insa ilo toki sina:

{% highlight sh %}
$ gem help
{% endhighlight %}

sama ni, `gem help commands` li pona mute, tan ni ona li pana e lipu pi
nasin pali `gem` ale.

#### pali e namako sina

RubyGems.org li jo e [lipu sona mute][3] pi ijo ni. sina ken lukin sin e
[Bundler][9], ilo li pona e lawa e namako sina wile tawa pali wan, li
ken kepeken poka RubyGems.



[1]: https://rubygems.org/
[2]: https://rubygems.org/pages/download/
[3]: http://guides.rubygems.org/
[5]: https://github.com/
[6]: https://www.ruby-toolbox.com/
[7]: http://guides.rubygems.org/command-reference/
[9]: http://bundler.io/
