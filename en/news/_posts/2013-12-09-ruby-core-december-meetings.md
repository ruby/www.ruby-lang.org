---
layout: news_post
title: "Ruby-core December Developer Meetings Summary"
author: "zzak"
translator:
date: 2013-12-09 15:26:59 UTC
lang: en
---

Ruby-core met twice last week in Japan to discuss the future plans for release
management and backport maintenance of Ruby.

Season's greetings everyone!

You can watch the recording from Thursday's meeting on
[ustream](http://www.ustream.tv/recorded/41393753), thanks to
[@mrkn](http://twitter.com/mrkn) for the recording!

Although we didn't have a video recording from the meeting on Friday, we
recorded our skype conference and is available on
[soundcloud](https://soundcloud.com/zzak-2/ruby-core-developer-meeting). Thanks
to [@sora_h](http://twitter.com/sora_h) for the recording and moderating skype!

Below I have summarized the meetings for each day and organized them into
agenda items. Each agenda item should have an associated ticket on our [bug
tracker](http://bugs.ruby-lang.org/) that you can follow for more information.
I will be updating these tickets with our conclusion shortly!

## 2013-12-05

Last Thursday several ruby-core committers, including Matz, met to discuss the
future of Ruby. Here's the summary by topic:

### 2.1.0 Release Schedule
[Version 27 on bug tracker](http://bugs.ruby-lang.org/versions/27)

  * We will see RC1 this week (2013-12-8 - 2013-12-14)
  * RC2 is only necessary should a major issue be found on RC1
  * A new branch will be created, and code freeze will be activated
  * All bug fixes must be approved by the release manager ([@nalsh](http://twitter.com/nalsh))
  * 2.1.0 will be released on christmas 2013 (2013-12-25)

### 2.1.0 Maintainer
[misc. #9215](http://bugs.ruby-lang.org/issues/9215)

  * Undecided
  * [@nalsh](http://twitter.com/nalsh) will maintain 2.1.0 for 2 months after release

### Semantic Versioning
[misc. #8835](http://bugs.ruby-lang.org/issues/8835)

Translations of this discussion are available here:

  * [English](https://gist.github.com/sorah/7803201)
  * [Japanese](https://gist.github.com/hsbt/7719305)

To summarize:

  * We accept proposal of [@hsbt](http://twitter.com/hsbt)
  * The following proposal will begin with 2.1.0

#### Version Schema `ruby-{MAJOR}.{MINOR}.{TEENY}`

  * `MAJOR`: increased when incompatible change which can't be released in MINOR
  * "MAJOR is for party", reserved for special events
  * `MINOR`: increased every christmas, may be API incompatible
  * `TEENY`: security or bug fix which maintains API compatibility
  * `PATCH`: commits since last minor release, will remain at p0

`TEENY` may be increased more than 10 (such as `2.1.11`), and will be released
every 2-3 months.

Matz and other attendees were concerned about `TEENY >= 10`.

#### Branches

We will maintain the following branches:

  * trunk
  * `ruby_{MAJOR}_{MINOR}`
  * `ruby_{MAJOR}_{MINOR}` across `TEENY` releases
  * tags will be used for each release

#### API Compatibility

  * Removing API is an incompatible change
  * such as (`STDIO_READ_DATA_PENDING`, etc.) must wait for 2.2.0
  * an incompatible change must increase `MINOR`

#### ABI Compatibility

  * Scheme of `{MAJOR}.{MINOR}.0`
  * Keep ABI compatibility with same `MINOR` release, so `TEENY` is fixed at 0
  * Retain compatibility across `TEENY` releases

We are concerned with changes required for existing tools, such as:

  * svn
  * backport / merger

#### Documentation

We need to announce our plans for removing patch level semantics, in order to
use `{MAJOR}.{MINOR}.{TEENY}`.

### Maintenance Policy for 1.8.7 and 1.9.2
[misc. #9216](http://bugs.ruby-lang.org/issues/9216)

1.8.7 and 1.9.2 will be supported for security fixes until June 2014.

  * [@hone02](http://twitter.com/hone02) and [@_zzak](http://twitter.com/_zzak) will assume maintainership
  * After the 6 month maintenance period, we can add more committers to extend another 6 months.

In the past we have supported vendors who wish to maintain legacy versions. In
2009 the maintenance of Ruby `1.8.6` was transfered to Engine Yard when they
released `1.8.6-p369`.

We were given permission from Matz to release backport versions of Ruby for
security fixes.

  * It should be up to the maintainer
  * Security releases only, even after EOL

We made an important decision on this policy on Friday, please read the summary
for that day in the next major section.

### Maintenance Policy for 1.9.3
[misc. #9217](http://bugs.ruby-lang.org/issues/9217)

  * 1.9.3 maintenance is commissioned by the Ruby Association
  * It will receive security fixes until March 2014
  * Additional 3 month security maintenance period may be supported by [@unak](http://twitter.com/unak)

### Maintenance Policy for Future Versions of Ruby
[misc. #9215](http://bugs.ruby-lang.org/issues/9215)

  * 2.0.0 will received normal maintenance until February 2014 and 1 year of security maintenance
  * Each MINOR release starting with 2.1.0 will receive 2 years normal maintenance and 3 years security support

We want to encourage a more routine process to improve user expectation and
experience.

It's encouraged that each release manager decide on a roadmap for their
version, although an absolute schedule and maintenance plan is difficult.

### Policy Annoucements
[misc. #9219](http://bugs.ruby-lang.org/issues/9219)

The [following pdf](/images/2013-12-05-ruby_maintenance_scheme.pdf) describes
the current maintenance plan for all versions. Thank you
[@mrkn](http://twitter.com/mrkn) for creating this document!

We will offer a conclusive policy document for all versions during the announce
of the 2.1.0 release.

I will publish this document shortly!

### Maintainer Appointment and Discharge
[misc. #9218](http://bugs.ruby-lang.org/issues/9218)

We would like to develop a process for adding or removing branch maintainers,
in order to prevent sudden death of branches.

Should a maintainer become inactive, we can rely on the following proceedures:

  * nobu can help as global maintainer (patch monster)
  * any committer is responsible for contributing to priority maintenance (such as security)
  * we will decide the next maintainer during discussion on mailing list, and request their assignment

Anyone can replace the role of release manager, should they become inactive.

Every issue can escalate to Matz, should he become inactive maybe we need to
replace Matz.. (we should fire Matz!)

Asking to declare an expected maintenace period during appointment was rejected, see below:

[@nagachika](http://twitter.com/nagachika), current maintainer of `2.0.0` made
the following comment:

  > I never publish maintenance period for 2.0.0. I thought I can maintain it
    for 2 years in "normal maintenance mode" and then turn into "security only
    maintenance mode".
    Now I feel a little hard to keep current pace of activity for maintenance
    for 2.0.0.

It was suggested that [@unak](http://twitter.com/unak) may begin maintenance of
2.0.0 in March 2014.

### GC Merits and Documentation
[misc. #8962](http://bugs.ruby-lang.org/issues/8962)

I requested Matz order Koichi-kun to write a document for extension authors, he
approved for the following reasons:

  * Extension authors need a guide to implement Write Barrier
  * Writing extensions using WB is difficult
  * (nobu's children screaming loudly on skype)

However, encouraging the use of WB will cause serious problems. So Koichi will
guide them to write extensions without using WB.

Since we only implement WB internally, an advanced extension author should
refer to the internal implementation of WB usage. Such examples could be Array,
more details on this will follow in the development of this documentation.

Koichi adds, "its ok to be shady".

I will help with authoring this document.

### Error Hiding
[Feature #7688](http://bugs.ruby-lang.org/issues/7688)

We discussed this ticket, and concluded the following statements:

  * The current status has improved in many cases, but it's not perfect
  * Matz is undecided on the best way to improve performance
  * Okay to experiment after 2.1.0 is released

### Various other discussion and events during Thursday

After watching the video I wrote a [rough
summary](https://gist.github.com/zzak/7821769), since most of the discussion
was in English. The following other events took place during the meeting:

  * [@a_matsuda](http://twitter.com/a_matsuda) commits typo patches, he is the typo monster!
  * [Martin Duerst commits too!](https://github.com/ruby/ruby/commit/737c7d8)
  * [@hone02](http://twitter.com/hone02) joined the skype call to discuss his feedback on maintainer appointment and discharge
  * [@a_matsuda](http://twitter.com/a_matsuda) will propose gemifying the stdlib at the next meeting

## 2013-12-06

On Friday, several committers met to discuss the events that took place during
the previous meeting. We made important decisions on the maintenance policy for
backport versions and commercial support.

### Branch Schema for Semantic Versioning `ruby_MAJOR_MINOR`
[misc. #8835](http://bugs.ruby-lang.org/issues/8835)

We discussed a concern with handling security releases given the proposed branching schema.

During the 1.8 series we had a dedicated ruby_1_8 branch with no `TEENY`
version in the name. In this time we had to release a security fix from this
branch, however there were existing unreleased bug fix patches on this branch
causing a regression.

The previous solution was to create a new branch (`ruby_1_8_6`) and begin
maintaining two branches for the 1.8 series.

  * Additional branches may be added to support cherry-picking of security fixes.

We are concerned because security versions may occur more frequently between
MINOR branch changes.

#### SemVer

After reviewing the discussion from the previous meeting we discussed the
concern of `TEENY >= 10`.

  * String comparison bugs exist, such as: `"2.2.2" <= "2.2.10" #=> false`
  * We can fix this by abandoning strings
  * The version number can be anything that acts like String
  * We will postpone this situation

#### Tooling support

Most maintainers use tools from trunk, so they need to remain compatible with
backport branches. Any change in this policy should be documented.

### Maintenance Policy for 1.8.7 and 1.9.2
[misc. #9216](http://bugs.ruby-lang.org/issues/9216)

As discussed, we will commit security patches for 1.8.7 and 1.9.2 until June
2014, however one major decision change was made to this policy:

  * [@hsbt](http://twitter.com/hsbt) and [@shyouhei](http://twitter.com/shyouhei) have rejected backport releases

Reason being, we don't want any new tickets, as an official release will result
in continue responsibility of ruby-core to follow up on maintenance. Our team
resources are already low, and we want to encourage upgrades, not support
outdated versions.

  * If someone requests a release for 1.9.2 we can help them.

We need to write documentation for upgrading to supported versions, this is
strongly needed regardless of any policy changes.

### Maintenance Policy for 1.9.3
[misc. #9217](http://bugs.ruby-lang.org/issues/9217)

We strongly agree on one major point:

  * An official announcement on this issue is critical

### Maintenance Policy for Future Versions of Ruby
[misc. #9215](http://bugs.ruby-lang.org/issues/9215)

We had an extended conversation about the maintenance policy of all Ruby
versions.

#### Priority

  * Security fixes become priority
  * Its maintainer's decision for priority of bug fix and security fix

#### Duration

We decided the following conclusion:

  * 3 years supported for MINOR versions as a team
  * Maintenance is not contractually obligated, but a "best effort"
  * Should a branch become toxic, we will EOL within reasonable time (6-8 months).
  * A shortened EOL is determined based on maintainer activity and team decision
  * The branch maintainer is not committed to the entire 3 year period
  * It's the responsibility of ruby-core as a team to support the version in life cycle

It's important to note: its a team responsibility to maintain a version of
Ruby, and maintenance for more than 2 versions is difficult.

Our maintenance period should be:

  * A minimum of 6 months, and at best 3 years.

Our goal is to avoid a sudden death.

#### On commercial support

[@ayumin](http://twitter.com/ayumin) offered the following statement:

  > Ruby-core doesnt need to maintain old branches, the important point is
    announcing when we decide to give up on branches.

We should specifically define the organization responsible for maintaining a
version. Whether its ruby-core, vendor, or commercial organization, is
unimportant.

It's the responsibility of the business party involved to maintain backwards
compatibility, not ruby-core.

We should encourage commercial support for EOL rubies, such documentation would
be beneficial.

### Wrap-up

That about wraps up the summary of both meetings, thank you to everyone who could attend!

![Ruby-core meeting attendees](/images/2013-12-05-meeting.jpg)

Thanks for everyone who helped make this meeting possible, especially:

  * Cookpad for hosting both meetings on short notice
  * [@sora_h](http://twitter.com/sora_h) for moderating irc, skype, and creating the audio recordings
  * [@mrkn](http://twitter.com/mrkn) for the video recording on Thursday
  * [@lchin](http://twitter.com/lchin) for translation support on Friday
  * Everyone who attended and helped discuss the future of Ruby

ありがとうございます！！

