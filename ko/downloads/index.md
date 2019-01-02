---
layout: page
title: "루비 다운로드"
lang: ko
---

자신이 선호하는 방식으로 최신 루비 배포판을 설치할 수 있습니다.
현재 안정 버전은 {{ site.data.downloads.stable[0] }}입니다.
[루비 라이센스][license]를 읽어 보십시오.
{: .summary}

### 루비를 설치하는 방법

각 주요 플랫폼에서 루비를 설치할 수 있는 몇 가지 도구들이 있습니다.

* Linux/UNIX에서는 시스템에 포함된 패키지 관리 시스템이나
  서드파티 도구([rbenv][rbenv]나 [RVM][rvm])를 사용할 수 있습니다.
* macOS에서는 서드파티 도구([rbenv][rbenv]나 [RVM][rvm])를 사용할 수 있습니다.
* Windows에서는 [RubyInstaller][rubyinstaller]를 사용할 수 있습니다.

패키지 관리 시스템이나 서드파티 도구에 대한 좀 더 자세한
설명은 [설치][installation] 페이지를 보세요.

물론, 주요 플랫폼에서 소스 코드로부터 설치할 수도 있습니다.

### 루비 컴파일하기 - 소스 코드

소스 코드로 설치하기는 당신이 자신의 플랫폼에 충분히 익숙하고
자신의 환경을 위한 특별한 설정이 필요할 때 훌륭한 솔루션입니다.
또한 이 방법은 자신의 플랫폼을 위해 미리 만들어진 패키지가
없을 때에도 좋은 솔루션입니다.

루비를 소스에서 빌드하는 하시려면 [설치][installation] 페이지에서
자세한 내용을 보실 수 있습니다. 루비를 컴파일하는데 문제가 있다면,
밑에서 소개하는 서드파티 도구 중 하나를 이용해볼 것을 고려해 보십시오.
도움이 될 것입니다.

* **안정 릴리스:**{% for version in site.data.downloads.stable %}{% assign release = site.data.releases | where: "version", version | first %}
  * [루비 {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}

{% if site.data.downloads.security_maintenance %}
* **보안 유지보수 단계(곧 EOL 예정!):**{% for version in site.data.downloads.security_maintenance %}{% assign release = site.data.releases | where: "version", version | first %}
  * [루비 {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

{% if site.data.downloads.eol %}
* **더 이상 유지보수 없음(EOL):**{% for version in site.data.downloads.eol %}{% assign release = site.data.releases | where: "version", version | first %}
  * [루비 {{ release.version }}]({{ release.url.gz }})<br>
    sha256: {{ release.sha256.gz }}{% endfor %}
{% endif %}

* **스냅숏:**
  * [Stable Snapshot]({{ site.data.downloads.stable_snapshot.url.gz }}):
    안정 브랜치의 최신 스냅숏을 tarball로 압축한 것.
  * [Nightly Snapshot]({{ site.data.downloads.nightly_snapshot.url.gz }}):
    나이틀리로 제작된 SVN 상의 모든 것을 tarball로 압축한 것.
    본 스냅숏은 버그 혹은 기타 이슈를 포함하고 있을 수 있으니 주의하여 사용하십시오!

루비 서브버전과 Git 저장소에 대한 정보는, [루비 코어](/ko/community/ruby-core/) 페이지를 읽어 보십시오.

루비 소스는 전세계의 [미러 사이트][mirrors]에서 사용하실 수 있습니다.
자신과 가까운 곳의 미러를 이용해 주십시오.



[license]: {{ site.license.url }}
[installation]: /ko/documentation/installation/
[mirrors]: /en/downloads/mirrors/
[rvm]: http://rvm.io/
[rbenv]: https://github.com/rbenv/rbenv
[rubyinstaller]: https://rubyinstaller.org/
