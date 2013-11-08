require 'rack/jekyll'
require 'rack/rewrite'

use Rack::Rewrite do
  rewrite %r{^/bugreport\.html$}, "http://bugs.ruby-lang.org/"

  rewrite %r{^/ja/20030611\.html$}, "/ja/downloads"
  rewrite %r{^/(en|ja)/install\.html$}, "/$1/downloads"
  rewrite %r{^/ja/install\.cgi$}, "/ja/downloads"

  rewrite %r{^/cgi-bin/cvsweb\.cgi/?$}, "http://svn.ruby-lang.org/"
  rewrite %r{^/admin$}, "https://github.com/ruby/www.ruby-lang.org"

  rewrite %r{^/ja/man/archive/ruby-refm-1.8.6-chm.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.8.6-chm.zip"
  rewrite %r{^/ja/man/archive/ruby-refm-1.9.0-chm.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-chm.zip"
  rewrite %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.tar.bz2$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.tar.bz2"
  rewrite %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.tar.gz$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.tar.gz"
  rewrite %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.zip"

  # contents inconsistently 2013-05-15
  rewrite %r{^/(en|ja)/(LICENSE|license).txt$}, "http://www.ruby-lang.org/en/about/license.txt"
  rewrite %r{^/ja/old-man/.*$}, "http://doc.ruby-lang.org/ja/"
  rewrite %r{^/ja/man/.*$}, "http://doc.ruby-lang.org/ja/"

  rewrite %r{^/zh_TW(.*)$}, "/zh_tw$1"

  rewrite %r{^/bg/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/bg/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/de/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/de/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/en/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/en/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/fr/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/fr/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/id/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/id/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/it/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/it/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/pt/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/pt/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/tr/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/tr/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  rewrite %r{^/zh_tw/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/zh_tw/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"

  rewrite %r{^/pl/spolecznosc/listy-mailingowe(.*)$}, "/pl/community/mailing-lists$1"
  rewrite %r{^/pl/spolecznosc/grupy-uzytkownikow(.*)$}, "/pl/community/user-groups$1"
  rewrite %r{^/pl/spolecznosc/blogi(.*)$}, "/pl/community/weblogs$1"
  rewrite %r{^/pl/spolecznosc(.*)$}, "/pl/community$1"
  rewrite %r{^/pl/dokumentacja/ruby-w-20-minut(.*)$}, "/pl/documentation/quickstart$1"
  rewrite %r{^/pl/dokumentacja/ruby-a-inne-jezyki-programowania/ruby-a-(.*)$}, "/pl/documentation/ruby-from-other-languages/to-ruby-from-$1"
  rewrite %r{^/pl/dokumentacja/ruby-a-inne-jezyki-programowania(.*)$}, "/pl/documentation/ruby-from-other-languages$1"
  rewrite %r{^/pl/dokumentacja/udane-wdrozenia(.*)$}, "/pl/documentation/success-stories$1"
  rewrite %r{^/pl/dokumentacja(.*)$}, "/pl/documentation$1"

  rewrite %r{^/pt/noticias-recentes$}, "/pt/news"
  rewrite %r{^/pt/noticias-recentes/(.*)$}, "/pt/news/$1"
  rewrite %r{^/pt/feeds/noticias.rss$}, "/pt/feeds/news.rss"
  rewrite %r{^/pt/sobre-o-ruby(.*)$}, "/pt/about$1"
  rewrite %r{^/pt/comunidade/conferencias-de-ruby(.*)$}, "/pt/community/conferences$1"
  rewrite %r{^/pt/comunidade/listas-de-correio/instrucoes-de-subscricao-manual(.*)$}, "/pt/community/mailing-lists/manual-instructions$1"
  rewrite %r{^/pt/comunidade/listas-de-correio(.*)$}, "/pt/community/mailing-lists$1"
  rewrite %r{^/pt/comunidade/nucleo-de-ruby(.*)$}, "/pt/community/ruby-core$1"
  rewrite %r{^/pt/comunidade/grupos-de-utilizadores(.*)$}, "/pt/community/user-groups$1"
  rewrite %r{^/pt/comunidade/weblogs(.*)$}, "/pt/community/weblogs$1"
  rewrite %r{^/pt/comunidade(.*)$}, "/pt/community$1"
  rewrite %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens/para-ruby-a-partir-de-c-e-c-mais-mais(.*)$}, "/pt/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-$1"
  rewrite %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens/para-ruby-a-partir-de-(.*)$}, "/pt/documentation/ruby-from-other-languages/to-ruby-from-$1"
  rewrite %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens(.*)$}, "/pt/documentation/ruby-from-other-languages$1"
  rewrite %r{^/pt/documentacao/historias-de-sucesso(.*)$}, "/pt/documentation/success-stories$1"
  rewrite %r{^/pt/documentacao(.*)$}, "/pt/documentation$1"
  rewrite %r{^/pt/bibliotecas/top-de-projectos-ruby(.*)$}, "/pt/libraries/top-projects$1"
  rewrite %r{^/pt/bibliotecas(.*)$}, "/pt/libraries$1"
end

run Rack::Jekyll.new
