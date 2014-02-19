require 'rack/jekyll'
require 'rack/rewrite'
require 'rack/protection'

use Rack::CommonLogger

use Rack::Rewrite do
  if ENV["RACK_ENV"] == "production"
    r301 %r{.*}, "https://www.ruby-lang.org$&", scheme: "http", host: "www.ruby-lang.org"
    r301 %r{.*}, "https://staging.ruby-lang.org$&", scheme: "http", host: "staging.ruby-lang.org"
  end

  r302 %r{.*}, "$&/", if: ->(rack_env) {
    rack_env["PATH_INFO"].match(%r{/$}).nil? && File.exist?("_site#{rack_env["PATH_INFO"]}/index.html")
  }

  r302 %r{^/bugreport\.html$}, "http://bugs.ruby-lang.org/"

  r302 %r{^/ja/20030611\.html$}, "/ja/downloads"
  r302 %r{^/(en|ja)/install\.html$}, "/$1/downloads"
  r302 %r{^/ja/install\.cgi(\?.+)$}, "/ja/downloads"

  r302 %r{^/cgi-bin/cvsweb\.cgi/?$}, "http://svn.ruby-lang.org/"

  r302 %r{^/ja/man/archive/ruby-refm-1.8.6-chm.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.8.6-chm.zip"
  r302 %r{^/ja/man/archive/ruby-refm-1.9.0-chm.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-chm.zip"
  r302 %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.tar.bz2$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.tar.bz2"
  r302 %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.tar.gz$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.tar.gz"
  r302 %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.zip"

  # contents inconsistently 2013-05-15
  r302 %r{^/(en|ja)/(LICENSE|license).txt$}, "http://www.ruby-lang.org/en/about/license.txt"
  r302 %r{^/ja/old-man/.*$}, "http://doc.ruby-lang.org/ja/"
  r302 %r{^/ja/man/.*$}, "http://doc.ruby-lang.org/ja/"

  r302 %r{^/zh_TW(.*)$}, "/zh_tw$1"

  r302 %r{^/bg/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/bg/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/de/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/de/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/en/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/en/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/fr/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/fr/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/id/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/id/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/it/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/it/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/pt/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/pt/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/tr/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/tr/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/zh_cn/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/zh_tw/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/zh_tw/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"

  r302 %r{^/pl/spolecznosc/listy-mailingowe(.*)$}, "/pl/community/mailing-lists$1"
  r302 %r{^/pl/spolecznosc/grupy-uzytkownikow(.*)$}, "/pl/community/user-groups$1"
  r302 %r{^/pl/spolecznosc/blogi(.*)$}, "/pl/community/weblogs$1"
  r302 %r{^/pl/spolecznosc(.*)$}, "/pl/community$1"
  r302 %r{^/pl/dokumentacja/ruby-w-20-minut(.*)$}, "/pl/documentation/quickstart$1"
  r302 %r{^/pl/dokumentacja/ruby-a-inne-jezyki-programowania/ruby-a-(.*)$}, "/pl/documentation/ruby-from-other-languages/to-ruby-from-$1"
  r302 %r{^/pl/dokumentacja/ruby-a-inne-jezyki-programowania(.*)$}, "/pl/documentation/ruby-from-other-languages$1"
  r302 %r{^/pl/dokumentacja/udane-wdrozenia(.*)$}, "/pl/documentation/success-stories$1"
  r302 %r{^/pl/dokumentacja(.*)$}, "/pl/documentation$1"

  r302 %r{^/pt/noticias-recentes$}, "/pt/news"
  r302 %r{^/pt/noticias-recentes/(.*)$}, "/pt/news/$1"
  r302 %r{^/pt/feeds/noticias.rss$}, "/pt/feeds/news.rss"
  r302 %r{^/pt/sobre-o-ruby(.*)$}, "/pt/about$1"
  r302 %r{^/pt/comunidade/conferencias-de-ruby(.*)$}, "/pt/community/conferences$1"
  r302 %r{^/pt/comunidade/listas-de-correio/instrucoes-de-subscricao-manual(.*)$}, "/pt/community/mailing-lists/manual-instructions$1"
  r302 %r{^/pt/comunidade/listas-de-correio(.*)$}, "/pt/community/mailing-lists$1"
  r302 %r{^/pt/comunidade/nucleo-de-ruby(.*)$}, "/pt/community/ruby-core$1"
  r302 %r{^/pt/comunidade/grupos-de-utilizadores(.*)$}, "/pt/community/user-groups$1"
  r302 %r{^/pt/comunidade/weblogs(.*)$}, "/pt/community/weblogs$1"
  r302 %r{^/pt/comunidade(.*)$}, "/pt/community$1"
  r302 %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens/para-ruby-a-partir-de-c-e-c-mais-mais(.*)$}, "/pt/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-$1"
  r302 %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens/para-ruby-a-partir-de-(.*)$}, "/pt/documentation/ruby-from-other-languages/to-ruby-from-$1"
  r302 %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens(.*)$}, "/pt/documentation/ruby-from-other-languages$1"
  r302 %r{^/pt/documentacao/historias-de-sucesso(.*)$}, "/pt/documentation/success-stories$1"
  r302 %r{^/pt/documentacao(.*)$}, "/pt/documentation$1"
  r302 %r{^/pt/bibliotecas/top-de-projectos-ruby(.*)$}, "/pt/libraries/top-projects$1"
  r302 %r{^/pt/bibliotecas(.*)$}, "/pt/libraries$1"
end

use Rack::Protection::HttpOrigin
use Rack::Protection::FrameOptions

run Rack::Jekyll.new
