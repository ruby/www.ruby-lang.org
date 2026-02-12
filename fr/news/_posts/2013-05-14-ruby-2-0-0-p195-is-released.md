---
layout: news_post
title: "Sortie de Ruby 2.0.0-p195"
author: "nagachika"
translator: "Jean-Denis Vauguet"
date: 2013-05-14 13:00:01 +0000
lang: fr
---

Ruby 2.0.0-p195 vient de sortir. Il s'agit du premier niveau de patch pour Ruby
2, depuis la sortie de la version 2.0.0.

Cette release contient un
[correctif de sécurité pour Ruby DL / Fiddle](/fr/news/2013/05/14/taint-bypass-dl-fiddle-cve-2013-2065/)
ainsi que de nombreuses corrections de bugs et des optimisations. On trouvera
également quelques corrections sur la documentation.

Pour plus de détails, consultez les [tickets](https://bugs.ruby-lang.org/projects/ruby-200/issues?set_filter=1&status_id=5)
et le [ChangeLog](https://git.ruby-lang.org/ruby.git/plain/ChangeLog?id=refs/tags/v2_0_0_195) associés.
Les principales corrections de bugs sont listées ci-dessous.

## Téléchargement

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.bz2](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.bz2)

      SIZE:   10807456 bytes
      MD5:    2f54faea6ee1ca500632ec3c0cb59cb6
      SHA256: 0be32aef7a7ab6e3708cc1d65cd3e0a99fa801597194bbedd5799c11d652eb5b

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.tar.gz)

      SIZE:   13641558 bytes
      MD5:    0672e5af309ae99d1703d0e96eff8ea5
      SHA256: a2fe8d44eac3c27d191ca2d0ee2d871f9aed873c74491b2a8df229bfdc4e5a93

* [https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.zip](https://cache.ruby-lang.org/pub/ruby/2.0/ruby-2.0.0-p195.zip)

      SIZE:   15092199 bytes
      MD5:    924fe4bea72b1b258655211998631791
      SHA256: 81a4dc6cc09e491d417a51e5983c4584eff849e2a186ec3affdbe5bc15cd7db5

## À propos de cette release

Merci à tous les contributeurs.

## Changements importants

### Core - prepend

      #7841 Module#prepend now detect cyclic prepend.
      #7843 removing prepended methods causes exceptions.
      #8357 Module#prepend breaks Module's comparison operators.
      #7983 Module#prepend can't override Fixnum's operator methods.
      #8005 methods made private/protected after definition become uncallable on prepended class.
      #8025 Module#included_modules include classes when prepended.

### Core - keyword arguments

      #7922 unnamed keyword rest argument cause SyntaxError.
      #7942 support define method only receive keyword arguments without paren.
      #8008 fix a bug in super with keyword arguments.
      #8236 fix a treatment of rest arguments and keyword arguments through `super'.
      #8260 non-symbol key should not treated as keyword arguments.

### Core - refinements

      #7925 fix a bug of refinements with a method call super in a block.

### Core - GC

      #8092 improve accuracy of GC.stat[:heap_live_num]
      #8146 avoid unnecessary heap growth.
      #8145 fix unlimited memory growth with large values of RUBY_FREE_MIN.

### Core - Regexp

      #7972 Regexp POSIX space class is location sensitive.
      #7974 Regexp case-insensitive group doesn't work.
      #8023 Regexp lookbehind assertion fails with /m mode enabled
      #8001 Regexp \Z matches where it shouldn't

### Core - other

      #8063 fix a potential memory violation and avoid abort on the environment _FORTIFY_SOURCE=2 (ex. Ubuntu).
      #8175 ARGF#skip doesn't work as documented.
      #8069 File.expand_path('something', '~') now support home path on Windows.
      #8220 fix a Segmentation fault when defined? ().
      #8367 fix a regression in defined?(super).
      #8283 Dir.glob doesn't recurse hidden directories.
      #8165 fix a bug of multiple require with non-ascii file path.
      #8290 fix an incompatible String#inspect behavior with NUL character.
      #8360 fix a Segmentation fault of Thread#join(Float::INFINITY) on some platforms.

### RubyGems

      Bundled RubyGems version is updated to 2.0.2+
      #7698 fix an rubygems' incompatibility about installation of extension libraries.
      #8019 fix a bug of gem list --remote doesn't work.

### Libraries

      #7911 File.fnmatch with US-ASCII pattern and UTF-8 path raise an exception.
      #8240 fix a bug about OpenSSL::SSL::SSLSocket breaks other connections or files on GC.
      #8183 CGI.unescapeHTML can't decode Numeric Character References with uppercase (&#Xnnnn).

### Build/Platform specific

      #7830 fix build failure with compiler warning.
      #7950 fix a build failure on mswin/VC with --with-static-linked-ext.
