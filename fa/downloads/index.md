---
layout: page
title: "دانلود روبی"
lang: fa
---

در اینجا شما می‌توانید آخرین توزیع روبی را در طعم مورد علاقه خود دریافت کنید.
نسخه پایدار فعلی {{ site.data.downloads.stable[0] }} است.
لطفا حتما [مجوز روبی][license] را بخوانید.
{: .summary}

### راه‌های نصب روبی

ما برای نصب روبی چندین ابزار در هر پلتفرم اصلی داریم:

* برای لینوکس/یونیکس، می‌توانید از سیستم‌های مدیریت بسته یا ابزار‌های شخص ثالث ([rbenv][rbenv] و [RVM][rvm]) استفاده کنید.
* برای سیستم‌عامل‌های macOS، شما می‌توانید از ابزارهای شخص ثالث ([rbenv][rbenv] و [RVM][rvm]) استفاده کنید.
* برای سیستم‌عامل‌های ویندوز، شما می‌توانید از [RubyInstaller][rubyinstaller] استفاده کنید.

برای اطلاعات بیشتر در مورد استفاده از سیستم‌‌های مدیریت بسته یا ابزارهای شخص ثالث، صفحه [نصب و راه‌اندازی][installation] را ببینید.

البته، شما می‌توانید روبی را از منبع در همه سیستم‌عامل‌ها نصب کنید.

### کامپایل روبی - سورس کد

نصب از روی سورس کد، یک راه حل عالی برای زمانی است که شما به اندازه کافی با پلتفرم خود راحت هستید و شاید هم محیط شما به تنظیمات خاصی نیاز دارد. همچنین راه حل خوبی برای وقتی است که شما هیچ پکیج از پیش ساخته شده‌ای برای پلتفرم خود ندارید.

برای اطلاعات بیشتر درباره کامپایل روبی از سورس کد، صفحه [نصب و راه‌اندازی][installation]  را ببینید. اگر مشکلی در کامپایل روبی دارید، از یکی از ابزارهای شخص‌ثالث بالا استفاده کنید. آن‌ها ممکن است به شما کمک کنند.

* **انتشارهای پایدار:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **انتشارهای پیش‌نمایش:**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **در مرحله نگهداری امنیتی (به زودی EOL!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **دیگر نگهداری نمی‌شود (EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **اسنپ‌شات‌ها:**
  * [اسنپ‌شات‌ پایدار]({{ site.data.downloads.stable_snapshot.url.gz }}):
    این یک فایل از آخرین اسنپ‌شات‌ شاخه پایدار فعلی است.
  * [اسنپ‌شات‌ شبانه]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    This is a tarball of whatever is in SVN, made nightly.
    This may contain bugs or other issues, use at your own risk!

For more information about specific releases, particularly older releases
or previews, see the [Releases page][releases].
Information about the current maintenance status of the various
Ruby branches can be found on the [Branches page][branches].

For information about the Ruby Subversion and Git repositories, see our
[Ruby Core](/fa/community/ruby-core/) page.

The Ruby source is available from a worldwide set of
[Mirror Sites][mirrors].
Please try to use a mirror that is near you.



[license]: {{ site.license.url }}
[installation]: /fa/documentation/installation/
[releases]: /fa/downloads/releases/
[branches]: /fa/downloads/branches/
[mirrors]: /fa/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
