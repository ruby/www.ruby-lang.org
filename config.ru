require 'rack/jekyll'
require 'rack/rewrite'
require 'rack/ssl'
require 'rack/protection'

use Rack::CommonLogger

use Rack::Rewrite do
  if ENV["RACK_ENV"] == "production"
    r301 %r{.*}, "https://www.ruby-lang.org$&", scheme: "http", host: "www.ruby-lang.org"
    r301 %r{.*}, "https://staging.ruby-lang.org$&", scheme: "http", host: "staging.ruby-lang.org"
  end

  # enforce trailing slash (/foo -> /foo/) when index.html exists
  r302 %r{.*}, "$&/", if: ->(rack_env) {
    rack_env["PATH_INFO"].match(%r{/$}).nil? && File.exist?("_site#{rack_env["PATH_INFO"]}/index.html")
  }

  # bugreport.html (linked to from Ruby source code)
  r302 %r{^/bugreport\.html$}, "http://bugs.ruby-lang.org/"

  # various redirects
  r302 %r{^/(en|ja)/(LICENSE|license).txt$}, "/en/about/license.txt"
  r302 %r{^/(en|ja)/install\.html$}, "/$1/downloads"

  # URL changes
  r302 %r{^/(en|de|it|ja|ko|pl)/installation(.*)$}, "/$1/documentation/installation$2"
  r302 %r{^/([a-z_]+)/news/2014/09/18/ruby-2\.2\.0-preview1-released(.*)$}, "/$1/news/2014/09/18/ruby-2-2-0-preview1-released$2"
  r302 %r{^/([a-z_]+)/news/2014/08/19/ruby-1\.9\.2-p330-released(.*)$}, "/$1/news/2014/08/19/ruby-1-9-2-p330-released$2"
  r302 %r{^/([a-z_]+)/news/2013/12/21/semantic-versioning-after-2-1-0(.*)$}, "/$1/news/2013/12/21/ruby-version-policy-changes-with-2-1-0$2"
  r302 %r{^/([a-z_]+)/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/$1/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$2"

  # removed resources (some are still linked to from old news posts)
  r302 %r{^/ja/install\.cgi(\?.+)?$}, "/ja/downloads"
  r302 %r{^/ja/20030611\.html$},      "/ja/downloads"

  r302 %r{^/cgi-bin/cvsweb\.cgi(/.*)?$}, "http://svn.ruby-lang.org/"

  r302 %r{^/ja/(man|old-man)/.*$}, "http://doc.ruby-lang.org/ja/"

  r302 %r{^/ja/man/archive/ruby-refm-1.8.6-chm.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.8.6-chm.zip"
  r302 %r{^/ja/man/archive/ruby-refm-1.9.0-chm.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-chm.zip"
  r302 %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.tar.bz2$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.tar.bz2"
  r302 %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.tar.gz$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.tar.gz"
  r302 %r{^/ja/man/archive/ruby-refm-1.9.0-dynamic.zip$}, "ftp://ftp.ruby-lang.org/pub/ruby/doc/ruby-refm-1.9.0-dynamic.zip"

  # legacy URLs of translated sites
  r302 %r{^/zh_TW(.*)$}, "/zh_tw$1"

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
  r302 %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens/para-ruby-a-partir-de-c-e-c-mais-mais(.*)$}, "/pt/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$1"
  r302 %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens/para-ruby-a-partir-de-(.*)$}, "/pt/documentation/ruby-from-other-languages/to-ruby-from-$1"
  r302 %r{^/pt/documentacao/ruby-a-partir-de-outras-linguagens(.*)$}, "/pt/documentation/ruby-from-other-languages$1"
  r302 %r{^/pt/documentacao/historias-de-sucesso(.*)$}, "/pt/documentation/success-stories$1"
  r302 %r{^/pt/documentacao(.*)$}, "/pt/documentation$1"
  r302 %r{^/pt/bibliotecas/top-de-projectos-ruby(.*)$}, "/pt/libraries/top-projects$1"
  r302 %r{^/pt/bibliotecas(.*)$}, "/pt/libraries$1"
end

use Rack::SSL
use Rack::Protection::HttpOrigin
use Rack::Protection::FrameOptions

run Rack::Jekyll.new
