---
layout: page
title: "Ruby 다운로드"
lang: ko
---

자신이 선호하는 방식으로 최신 Ruby 배포판을 설치할 수 있습니다.
현재 안정 버전은 {{ site.data.downloads.stable[0] }}입니다.
[Ruby 라이선스][license]를 읽어 보세요.
{: .summary}

### Ruby를 설치하는 방법

각 주요 플랫폼에서 Ruby를 설치할 수 있는 몇 가지 도구가 있습니다.

* Linux/UNIX에서는 시스템에 포함된 패키지 관리 시스템이나
  서드파티 도구([rbenv][rbenv]나 [RVM][rvm])를 사용할 수 있습니다.
* macOS에서는 서드파티 도구([rbenv][rbenv]나 [RVM][rvm])를 사용할 수 있습니다.
* Windows에서는 [RubyInstaller][rubyinstaller]를 사용할 수 있습니다.

패키지 관리 시스템이나 서드파티 도구에 대한 좀 더 자세한
설명은 [설치][installation] 페이지를 보세요.

물론, 주요 플랫폼에서 소스 코드로부터 설치할 수도 있습니다.

### Ruby 컴파일하기 - 소스 코드

사용 중인 플랫폼에 충분히 익숙하고, 자신의 환경을 위한 특별한 설정이
필요한 경우, 소스 코드로 설치하면 좋습니다.
플랫폼에 미리 만들어진 패키지가 없을 때에도 좋은 해결책이 되죠.

Ruby를 소스에서 빌드하려면 [설치][installation] 페이지에서
자세한 내용을 참고하세요. Ruby를 컴파일하는 데 문제가 있다면,
위에서 소개한 서드파티 도구 중 하나를 이용해 보세요. 도움이 될 것입니다.

* **안정 릴리스:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.preview %}
* **프리뷰 릴리스:**{% for version in site.data.downloads.preview %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.security_maintenance %}
* **보안 유지보수 단계(곧 EOL 예정!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **더 이상 유지보수 없음(EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [Ruby {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **스냅숏:**{% for snapshot in site.data.downloads.stable_snapshots %}
  * [{{ snapshot.branch }} 브랜치의 안정 스냅숏]({{ snapshot.url.gz }}):
    `{{ snapshot.branch }}` 브랜치의 최신 스냅숏을 tarball로 압축한 것입니다.{% endfor %}
  * [나이틀리 스냅숏]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    나이틀리로 제작된 Git 상의 모든 것을 tarball로 압축한 것입니다.
    본 스냅숏은 버그 혹은 기타 이슈를 포함하고 있을 수 있으니 주의하여
    사용하세요!

특정 릴리스(특히 오래된 것이나 프리뷰 버전의 경우)에 대한 자세한 정보는
[릴리스 페이지][releases]에서 볼 수 있습니다.
여러 Ruby 브랜치의 현 유지보수 상태에 대해서는 [브랜치 페이지][branches]에서
볼 수 있습니다.

Ruby 서브버전과 Git 저장소에 대한 정보는, [Ruby 코어](/ko/community/ruby-core/)
페이지를 읽어 보세요.

Ruby 소스는 전세계의 [미러 사이트][mirrors]에서 사용할 수 있습니다.
자신과 가까운 곳의 미러를 이용해 주세요.



[license]: {{ site.license.url }}
[installation]: /ko/documentation/installation/
[releases]: /ko/downloads/releases/
[branches]: /ko/downloads/branches/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
