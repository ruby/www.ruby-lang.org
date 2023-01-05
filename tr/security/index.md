---
layout: page
title: "Güvenlik"
lang: tr
---

Burada Ruby'nin güvenlik ile ilgili konuları hakkında bilgi bulacaksınız.
{: .summary}

## Güvenlik Açıklarını Bildirme

Ruby programlama dilindeki güvenlik açıkları
[HackerOne'daki ödül programı sayfamız](https://hackerone.com/ruby) yoluyla
bildirilmelidir. Lütfen bir sorun bildirmeden önce programımızın kapsamı
hakkında özel ayrıntıları okuduğunuza emin olun. Geçerli bildirilen problemler
düzeltmelerden sonra yayınlanacaktır.

Websitelerimizden birini etkileyen bir sorun bulduysanız, lütfen bunu
[GitHub aracılığıyla](https://github.com/ruby/www.ruby-lang.org/issues/new)
bildirin.

Belirli bir Ruby gem'ini etkileyen bir sorun bulduysanız,
[RubyGems.org'daki talimatları](http://guides.rubygems.org/security/#reporting-security-vulnerabilities)
takip edin.

Eğer HackerOne dışında güvenlik ekibi ile doğrudan temasa geçmeye ihtiyacınız
varsa, özel bir e-posta listesi olan security@ruby-lang.org'a
([PGP genel anahtarı](/security.asc)) e-posta gönderebilirsiniz.

E-posta listesinin üyeleri Ruby'yi sağlayan kişilerdir (Ruby işleyicileri ve
diğer Ruby gerçeklemelerinin sahipleri, dağıtıcılar, PaaS platformcuları).
Üyeler bireysel kişiler olmalıdır, e-posta listelerine izin verilmez.

## Bilinen sorunlar

_See the [English page](/en/security/) for a complete and up-to-date
list of security vulnerabilities.
The following list only includes the as yet translated
security announcements, it might be incomplete or outdated._

İşte son sorunlar:

{% include security_posts.html %}

Daha fazla bilindik sorun:

* [REXML'de varlık genişlemesi DoS güvenlik açığı (XML bombası,
  CVE-2013-1821)][1]
  22 Şubat 2013'te yayınlanmıştır.
* [JSON'da Hizmet Reddi ve Güvensiz Nesne Oluşturma Güvenlik Açığı
  (CVE-2013-0269)][2]
  22 Şubat 2013'te yayınlanmıştır.
* [rdoc tarafından oluşturulan RDoc belgelendirmesinde XSS sömürüsü
  (CVE-2013-0256)][3]
  6 Şubat 2013'te yayınlanmıştır.
* [Ruby 1.9 için hash seli DoS güvenlik açığı (CVE-2012-5371)][4]
  10 Kasım 2012'de yayınlanmıştır.
* [Geçersiz bir NUL karakteri eklenerek istenmeyen dosya oluşturma
  character (CVE-2012-4522)][5]
  12 Ekim 2012'de yayınlanmıştır.
* [Exception#to\_s / NameError#to\_s hakkında $SAFE kaçırma güvenlik açığı
  (CVE-2012-4464, CVE-2012-4466)][6]
  12 Ekim 2012'de yayınlanmıştır.
* [RubyGems için Güvenlik Düzeltmesi: Uzak depo için SSL sunucusu onaylama
  başarısızlığı][7] 20 Nisan 2012'de yayınlanmıştır.
* [Ruby OpenSSL modülü için Güvenlik Düzeltmesi: TLS BEAST saldırısını
  engellemek için 0/n ayırmaya izin ver][8]
  16 Şubat 2012'de yayınlanmıştır.
* [Ruby'nin Hash algoritması için hizmet reddi saldırısı bulundu
  (CVE-2011-4815)][9]
  28 Aralık 2011'de yayınlanmıştır.
* [İstisna metodları $SAFE'i atlayabilir][10]
  18 Şubat 2011'de yayınlanmıştır.
* [FileUtils, kısayol bağlantısı yarış saldırılarına açık][11]
  18 Şubat 2011'de yayınlanmıştır.
* [WEBrick'te XSS (CVE-2010-0541)][12]
  16 Ağustos 2010'da yayınlanmıştır.
* [ARGF.inplace\_mode='da tampon aşırı çalışması][13]
  2 Temmuz 2010'da yayınlanmıştır.
* [WEBrick'te Kaçış Dizisi Enjeksiyonu güvenlik açığı var][14]
  10 Ocak 2010'da yayınlanmıştır.
* [String'de Heap taşması (CVE-2009-4124)][15]
  7 Aralık 2009'da yayınlanmıştır.
* [BigDecimal'da DoS güvenlik
  açığı](/en/news/2009/06/09/dos-vulnerability-in-bigdecimal/)
  9 Haziran 2009'da yayınlanmıştır.
* [REXML'de DoS güvenlik
  açığı](/en/news/2008/08/23/dos-vulnerability-in-rexml/)
  23 Ağustos 2008'de yayınlanmıştır.
* [Ruby'de birden çok güvenlik
  açığı](/en/news/2008/08/08/multiple-vulnerabilities-in-ruby/)
  8 Ağustos 2008'de yayınlanmıştır.
* [Keyfi kod yürütme güvenlik
  açıkları](/en/news/2008/06/20/arbitrary-code-execution-vulnerabilities/)
  20 Haziran 2008'de yayınlanmıştır.
* [WEBrick'in dosya erişimi güvenlik
  açığı](/en/news/2008/03/03/webrick-file-access-vulnerability/)
  3 Mart 2008'de yayınlanmıştır.
* [Net::HTTPS
  Güvenlik Açığı](/en/news/2007/10/04/net-https-vulnerability/)
  4 Ekim 2007'de yayınlanmıştır.
* [CGI Kütüphanesinde Bir Başka DoS Güvenlik
  Açığı](/en/news/2006/12/04/another-dos-vulnerability-in-cgi-library/)
  4 Aralık 2006'da yayınlanmıştır.
* [CGI Kütüphanesinde DoS Güvenlik Açığı (CVE-2006-5467)](/en/news/2006/11/03/CVE-2006-5467/)
  3 Kasım 2006'da yayınlanmıştır.
* [Güvenli seviye ayarlarında Ruby güvenlik
  açığı](/en/news/2005/10/03/ruby-vulnerability-in-the-safe-level-settings/)
  2 Ekim 2005'te yayınlanmıştır.



[1]: /en/news/2013/02/22/rexml-dos-2013-02-22/
[2]: /en/news/2013/02/22/json-dos-cve-2013-0269/
[3]: /en/news/2013/02/06/rdoc-xss-cve-2013-0256/
[4]: /en/news/2012/11/09/ruby19-hashdos-cve-2012-5371/
[5]: /en/news/2012/10/12/poisoned-NUL-byte-vulnerability/
[6]: /en/news/2012/10/12/cve-2012-4464-cve-2012-4466/
[7]: /en/news/2012/04/20/ruby-1-9-3-p194-is-released/
[8]: /en/news/2012/02/16/security-fix-for-ruby-openssl-module/
[9]: /en/news/2011/12/28/denial-of-service-attack-was-found-for-rubys-hash-algorithm-cve-2011-4815/
[10]: /en/news/2011/02/18/exception-methods-can-bypass-safe/
[11]: /en/news/2011/02/18/fileutils-is-vulnerable-to-symlink-race-attacks/
[12]: /en/news/2010/08/16/xss-in-webrick-cve-2010-0541/
[13]: /en/news/2010/07/02/ruby-1-9-1-p429-is-released/
[14]: /en/news/2010/01/10/webrick-escape-sequence-injection/
[15]: /en/news/2009/12/07/heap-overflow-in-string/
