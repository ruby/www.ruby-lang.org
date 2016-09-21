require 'lanyon'
require 'rack/rewrite'
require 'rack/ssl'
require 'rack/protection'
require 'yaml'

use Rack::CommonLogger

use Rack::Rewrite do

  # bugreport.html (linked to from Ruby source code)
  r302 %r{^/bugreport\.html$}, "https://bugs.ruby-lang.org/"

  # various redirects
  r302 %r{^/(en|ja)/(LICENSE|license).txt$}, "/en/about/license.txt"
  r302 %r{^/(en|ja)/install\.html$}, "/$1/downloads"

  # URL changes
  r302 %r{^/(en|fr)/news/2016/08/31/confoo-cfp(.*)$}, "/$1/news/2015/08/31/confoo-cfp$2"
  r302 %r{^/(en|de|it|ja|ko|pl)/installation(.*)$}, "/$1/documentation/installation$2"
  r302 %r{^/([a-z_]+)/news/2014/09/18/ruby-2\.2\.0-preview1-released(.*)$}, "/$1/news/2014/09/18/ruby-2-2-0-preview1-released$2"
  r302 %r{^/([a-z_]+)/news/2014/08/19/ruby-1\.9\.2-p330-released(.*)$}, "/$1/news/2014/08/19/ruby-1-9-2-p330-released$2"
  r302 %r{^/([a-z_]+)/news/2013/12/21/semantic-versioning-after-2-1-0(.*)$}, "/$1/news/2013/12/21/ruby-version-policy-changes-with-2-1-0$2"
  r302 %r{^/([a-z_]+)/documentation/ruby-from-other-languages/to-ruby-from-c-and-c-(.*)$}, "/$1/documentation/ruby-from-other-languages/to-ruby-from-c-and-cpp$2"

  # URL changes with Jekyll 3, May 2016
  r302 %r{^/(en|id)/news/2012/02/16/security-fix-for-ruby-openssl-module-allow-0n-splitting-as-a-prevention-for-the-tls-beast-attack-(.*)$}, "/$1/news/2012/02/16/security-fix-for-ruby-openssl-module$2"
  r302 %r{^/(de)/news/2012/02/16/sicherheitsfix-fr-rubys-openssl-modul-erlaube-0n-splitting-als-gegenmanahme-fr-den-tls-beast-angriff(.*)$}, "/$1/news/2012/02/16/security-fix-for-ruby-openssl-module$2"
  r302 %r{^/(en|it)/news/(201./../..)/fukuoka-ruby-award-2011-competition---grand-prize-12000(.*)$}, "/$1/news/$2/fukuoka-ruby-award-2011$3"
  r302 %r{^/(en|id|it)/news/(201./../..)/2013-fukuoka-ruby-award-competitionentries-to-be-judged-by-matz(.*)$}, "/$1/news/$2/fukuoka-ruby-award-2013$3"
  r302 %r{^/(en)/news/2011/10/12/upcoming-ruby-programming-competitions-with-matz---grand-prize---1000000-jpy(.*)$}, "/$1/news/2011/10/12/programming-competitions-with-matz$2"
  r302 %r{^/(de)/news/2011/10/13/anstehende-ruby-programmierwettbewerbe-mit-matz---groer-preis-1-000-000-(.*)$}, "/$1/news/2011/10/12/programming-competitions-with-matz$2"
  r302 %r{^/(en|de|ko)/news/2003/01/31/raasuccversion--230(.*)$}, "/$1/news/2003/01/31/raa-2-3-0$2"
  r302 %r{^/(en|de|ko)/news/2002/12/07/my20021207-raasuccversion--210(.*)$}, "/$1/news/2002/12/07/raa-2-1-0$2"
  r302 %r{^/(en|ko)/news/2002/12/11/ruby-hacking-guide-is-out-though-(.*)$}, "/$1/news/2002/12/11/ruby-hacking-guide$2"
  r302 %r{^/(de)/news/2002/12/11/ruby-hacking-guide-ist-da-obwohl-(.*)$}, "/$1/news/2002/12/11/ruby-hacking-guide$2"
  r302 %r{^/(pl)/news/2012/10/22/rupy-2012---pita-edycja-konferencji-niebawem(.*)$}, "/$1/news/2012/10/22/rupy-2012$2"
  r302 %r{^/(ko)/news/2008/06/12/-1-8-7-(.*)$}, "/$1/news/2008/06/12/ruby-1-8-7$2"
  r302 %r{^/(ko)/news/2007/09/10/-4-(.*)$}, "/$1/news/2007/09/10/ruby-kr-seminar-4$2"
  r302 %r{^/(ko)/news/2006/11/10/-2006-11-25(.*)$}, "/$1/news/2006/11/10/meeting-2006-11-25$2"
  r302 %r{^/(bg|es|ja|ko|zh_cn|zh_tw)/news/(.*)-(|/|/index\.html)$}, "/$1/news/$2$3"

  # removed resources (some are still linked to from old news posts)
  r302 %r{^/ja/install\.cgi(\?.+)?$}, "/ja/downloads"
  r302 %r{^/ja/20030611\.html$},      "/ja/downloads"

  r302 %r{^/cgi-bin/cvsweb\.cgi(/.*)?$}, "http://svn.ruby-lang.org/"

  r302 %r{^/ja/(man|old-man)/.*$}, "https://docs.ruby-lang.org/ja/"

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

if ENV["RACK_ENV"] == "production"
  use Rack::SSL
end

use Rack::Protection::HttpOrigin
use Rack::Protection::FrameOptions

run Lanyon.application(:skip_build => true)
