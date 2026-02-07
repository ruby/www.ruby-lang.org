---
layout: news_post
title: "Incident Analysis of the intrusion on helium.ruby-lang.org"
author: "Shugo Maeda"
lang: vi
---

As already reported, helium.ruby-lang.org, which is one of the servers
that provided various services relevant to Ruby development, was cracked
by an unauthorized user.  We, the ruby-lang.org administrators, are
reporting our analysis of this intrusion and the countermeasures we've
taken.

## Time-line of the incident

The time progression about the intrusion is shown below.
Each time is in UTC.

    19 May       The public disclosure of a vulnerability of CVS
                 (CAN-2004-0396) is announced.  We believe that this
                 vulnerability was used in this intrusion.
    20 May 02:46 The Debian CVS package of the host helium.ruby-lang.org
                 (hereafter called 'helium') is upgraded. However, the
                 chrooted CVS package, which provided the actual pserver,
                 is overlooked.
    23 May 11:15 Oldest (corroborated) time stamp of the trace of intrusion
    27 May 19:03 Opening of the back-door installed by the invader
    28 May 09:26 A ruby-lang.org administrator discovers a trace of the
                 intrusion.
    28 May 09:35 Administrator disconnects 'helium' from network.
    28 May 11:53 Administrator reboots 'helium' and resumes mailing list
                 services.
    29 May 07:28 Our first announcement about this intrusion.

## Machines and services of the time

Ruby-related services were offered by the following two machines at the
time of intrusion.

helium.ruby-lang.org
: The following services were provided by 'helium'.

  * CVS   (cvs.ruby-lang.org)
  * HTTP  (www.ruby-lang.org/raa.ruby-lang.org)
  * FTP   (ftp.ruby-lang.org)
  * RSYNC (for mirror sites)
  * ML    (&lt;ML name&gt;@ruby-lang.org)

hydrogen.ruby-lang.org (hereafter called 'hydrogen')
: The following services were provided by 'hydrogen'.

  * HTTP (www.rubyist.net)
  * NFS  (to export /home to 'helium')

## Details of intrusion

On 'helium', the pserver service was offered under anoncvs user
permissions in a chroot environment.  This CVS service was used for
development of Ruby, and multiple committers had their own accounts.
Public read-only CVS access was allowed via the 'anonymous' user
account.

As mentioned above, the vulnerability of CVS was announced on 19 May.
Although the Debian CVS package of 'helium' was upgraded on 20 May, the
CVS package of the chroot environment was not upgraded.

Under these circumstances, an administrator of 'helium' discovered
dubious processes of anoncvs on 28 May, 09:26 (UTC).  More than one
suspicious, executable files were discovered to have been installed  by
intruder(s), including a program creating a back-door listening on TCP
port #54320.  This back-door program was running at the time of the
discovery of the intrusion.  The "Time-line" time mentioned above was
determined by the output of the 'ps' command, and by the time stamp of
the intrusive executable file.  We should note here that all external
connections to the back-door were prevented by the Linux kernel's IP
packet filtering feature.

Another note: usually, the pserver process creates a temporary directory
(/tmp/cvs-serv&lt;Process ID&gt;) for each session and deletes it at the end
of the session.  At the time of the intrusion, more than one temporary
directories were left in the /tmp directory of the chroot environment.
This suggests that pserver processes were terminated abnormally, perhaps
by the attack of the intruder(s).  Of the time stamps of these temporary
directories, the oldest is of 23 May, 11:15 (UTC).  The "Time-line" time
mentioned above was determined by this time stamp.  Comparing time
stamps of these directories with the pserver session log, it appears
that there were multiple, independent crackers who attacked the
vulnerability.

This evidence indicates that intruder(s) were exploiting the CVS
vulnerability and received anoncvs user permission on 'helium'.
Intruder(s) could acquire, alter and destroy all information within the
chroot environment.

Evidence such as the seizing of other accounts, local privilege
escalation, or intrusion to outside of the chroot environment has, to
date, not been found.

## The possibility of intrusion outside of the chroot environment

In order for intruders to break chroot protection, promotion to a
privilege user is required.

At the time of the intrusion, the Linux kernel running on 'helium' was
version 2.4.24.  The patch for the vulnerability (backported from kernel
version 2.4.25) had been applied.  However, the patch for setsockopt(2)
vulnerability fixed in kernel 2.4.26 had not been applied.

Code for a DoS attack exploiting a vulnerable setsockopt(2) has been
exhibited, but it is considered difficult to successfully achieve a
local privilege escalation from this.  It appears to be impossible to
achieve privilege escalation if the intruder is unable to get the kernel
image of the target environment.  On 'helium', the kernel was not from a
binary package, but was built from source code with individually applied
patches.  Therefore, the possibility that the intruder was able to
achieve privilege promotion is considered minimal.

## Restoration of services

With the first investigation, we inferred that the intrusion was
probably only within the chroot environment.  At first we decided to
resume the mailing list service on 'helium', because the impact of a
suspension of mail service, from the users' point of view, was
considered the largest.  After checking that there was no alteration of
the binary package, and also that there was no suspicious settings in
the configuration files, we restored the mailing list service.

We then began the confirmation work for resuming other services on
'helium', but soon decided instead to thoroughly reconstruct the machine
and resume services individually after each was checked.  This decision
was made because of the difficulty of inspecting the large number of
files.

To restore the service, we needed a machine used as substitute for
'helium'.  We decided to use 'hydrogen' which hosted www.rubyist.net.
'Hydrogen' did not offer pserver service and no trace of intrusion was
found on the machine, but 'hydrogen' provided /home as NFS-mounted
filesystem to 'helium'.  To ensure that hydrogen was not compromised, we
re-installed the OS of 'hydrogen', and set the host name to 'lithium'.
Then we moved the mailing list service from 'helium' to 'lithium',
together with the intrusion announcement page of the web site.

Next, we re-installed OS of 'helium', and set the host name to
'beryllium'.  We plan to migrate all public services to 'beryllium' in
the future.

## Machines and services at present

At present, Ruby-related services are offered by the following two
machines.

lithium.ruby-lang.org
: The following services are provided by lithium.ruby-lang.org.

  * CVS (for committers development, no public access)
  * Mailing list (the move to 'beryllium' is planned)

beryllium.ruby-lang.org
: The following services are provided by beryllium.ruby-lang.org.

  * HTTP (www.ruby-lang.org/raa.ruby-lang.org/www.rubyist.net)
  * FTP (ftp.ruby-lang.org)
  * Anonymous CVS (cvs.ruby-lang.org)

## Verification of the contents of each service

We will hereafter explain the results of our efforts to evaluate
whether there was any alteration or destruction of services
by the intruders.

### Precondition

The oldest evidence that we have of the intrusion is from 23 May, and
this has been corroborated; since this trace could have been deleted by
the intruder(s) with anoncvs user permission, we were not able to
conclude that this was the first day of the intrusion.  Since the
evidence of the intrusion was from the CVS vulnerability, and since no
other vulnerability which could have been exploited for intrusion into
'helium' is known, we are confident that the intruder(s) abused the CVS
vulnerability and thereby gained access to 'helium'.

Our verification of alteration or destruction in the services was based
on the assumption that the first intrusion would prove to be after 19
May, when the CVS vulnerability CAN-2004-0396 was publicly announced.

### CVS

Since the intruders are supposed to have gained anoncvs user
permissions, we were most suspicious and anxious about possible damage
to CVS among all of the services on 'helium'.

At the time of intrusion, there was the following four CVS repositories.

/src
: Source code

/www
: Data of WWW

/doc
: Document

/admin
: The management file for CVS

Among these, /www and /doc needed no verification, since their contents
were already unused.  Moreover, we decided to suspend use of /admin, and
simply dropped it.

What we explain hereafter are the results of verification of the
source code of Ruby and of each other module included in /src.

### The source code of Ruby

We split possible CVS repository alternations into two categories:

(1) Alteration of historical data in files in the CVS repository prior
    to 19 May

(2) Alteration which camouflaged the regular submissions after 19 May

For (1), we checked files in the CVS repository by the log of cvsup
after 19 May which were kept securely outside of 'helium'.  We verified
that there has been no sign of alteration of files in the CVS
repository.  For (2), we checked all contents of the commits
individually and confirmed the absence of any malicious code after 19
May.  This means that not only is there no malicious code, but also that
we verified each commit with the committer.

Our verification was supported by data in the following URL.

* Log of cvsup<br />
  https://www.ruby-lang.org/check-data/cvs/cvsup-log/
* Contents of the commits from 19 May to 28 May<br />
  https://www.ruby-lang.org/check-data/cvs/cvs-diff/

Moreover, in addition to the above-mentioned material, we did the
following supplemental work:

* We confirmed there was no inconsistency between files in the CVS
  repository on 'helium' and files in an exterior, secure server on 21
  May.
* We confirmed there was no inconsistency within the CVS snapshots
  from 2003-11-02 to 2004-05-27 (day by day) and snapshots created from
  the CVS repository on 'helium'.

We concluded that there was no alteration or destruction of the source
code of ruby in the CVS repository.

#### Modules other than the source code of Ruby

In addition to the source code of Ruby, the /src directory of the CVS
repository has the following modules:

  * app
  * lib
  * rough
  * rubicon
  * ruby-parser
  * shim
  * vms
  * pocketruby
  * oniguruma
  * mod_ruby
  * eruby

First, we found that only the following files were changed after 19 May
by comparing the ctime of the files of the repository with the times of
the files copied to the external server by CVSup:

  * lib/csv/lib/csv.rb,v
  * lib/csv/tests/csv_ut.rb,v
  * lib/soap4r/lib/wsdl/xmlSchema/parser.rb,v
  * lib/soap4r/lib/wsdl/xmlSchema/complexContent.rb,v
  * lib/soap4r/lib/wsdl/parser.rb,v
  * mod_ruby/lib/apache/eruby-run.rb,v
  * mod_ruby/lib/apache/erb-run.rb,v
  * mod_ruby/ChangeLog,v

Second, we compared the copied CVS repository with the CVS repository on
'helium', and we confirmed that there was no inconsistency among them,
except for binary files in 'pocketruby'.  Since we had already merged
'wince' in ruby's main branch, we did not do further check on pocketruby
and have ceased offering its source code.

Each of the files which were changed after 19 May are mentioned below.

lib/csv/lib/csv.rb,v
lib/csv/tests/csv_ut.rb,v
lib/soap4r/lib/wsdl/xmlSchema/parser.rb,v
lib/soap4r/lib/wsdl/xmlSchema/complexContent.rb,v
lib/soap4r/lib/wsdl/parser.rb,v
: We are unsure about these files. lib/csv and lib/soap4r are already
  merged with ruby, and these modules are only used by the maintainers
  of each.  lib/csv and lib/soap4r have been removed from the CVS
  repository, and will be developed elsewhere.

mod_ruby/lib/apache/eruby-run.rb,v
mod_ruby/lib/apache/erb-run.rb,v
: All revisions including branches had been checked, and no problems
  were found. They were each compared with the released source
  packages, and it has been confirmed that there are no
  inconsistencies.

mod_ruby/ChangeLog,v
: Usual changes of a ChangeLog file are additions of the content(s).
  The ChangeLog can be checked with the following methods:

  (1) We confirmed that there is no problem in the first revision.

  (2) We confirmed that there is no problem in the newest revision.

  (3) We confirmed all revisions which include changes, not only
      additions.

  Moreover, we compared it with the released source packages, and it
  has been verified that there are no inconsistencies.

In addition, the development of mod_ruby and eruby has moved to
Subversion, so those CVS module names have been changed to mod_ruby-old
and eruby-old.

### HTTP (www.ruby-lang.org)

https://www.ruby-lang.org/{ja, en}/ is generated by tDiary.  We performed
the following in order to check that there are no problems executing the
tDiary CGI program:

  * Confirmation of the absence of suspicious code in the CGI programs
  * Verification of code in `<script>` elements embedded in the contents
  * Confirmation of the absence of suspicious data in the configuration files

Moreover, we checked the contents and linked URLs, but no problem is
found. If any problems are found, please contact to
webmaster@ruby-lang.org.

### On-line reference manual

On-line reference manual was on RWiki. We first restored the contents on
29 Feb, then applied the patches mailed to external e-mail accounts on
29 Feb. Then we compared it with the contents on 'helium'.

The diff can be obtained from:

    https://www.ruby-lang.org/check-data/ruby-man/man-rd-ja.diff

The difference of Base64.rd comes from new-lines inserted when receiving
the mail. trap%3A%3ANilClass.rd.rej was rejected, because the same patch
applied twice. The diff script compared files with files from 61 minutes
prior, so the same patch sent twice.

We confirmed none of them were affected by the intrusion.

### RAA

We did the following data verification.

* We made a daily diff of RAA data from 1) the clean RAA data copy
  backed up on 27 Mar, 2) daily backups from 4 Apr to 28 May, and 3) the
  latest RAA data of 28 May.

  2) and 3) are located in a chroot protected area on the machine.
  1) is clean because it is kept in a development environment.

  * RAA data update:<br />
    http://raa.ruby-lang.org/announce/soapbox-diff-all-passphrasemask.txt
  * RAA new entry:<br />
    http://raa.ruby-lang.org/announce/soapbox-new-passphrasemask.txt

* We confirmed the absence of suspicious data in the above diffs.

It can be concluded that the RAA data of 28 May (the same data we use
for RAA service restart) does not include any suspicious data.
We therefore decided to restart the RAA service as it was on 28 May.  We
cannot offer assurances that normal-looking changes by the intruder do not
exist.  For example, the change of sampleproject on 18 May is as
follows;

    == sampleproject
    - updated: Sun May 09 12:35:19 GMT+9:00 2004
    + updated: Mon May 17 13:00:38 GMT+9:00 2004
    - version: 0.0.8
    + version: 0.1.1

None of this data is suspect, but it is possible that the changes were
made by the intruder.  Therefore, we request that each RAA project owner
CHECK THEIR RAA ENTRIES AND UPDATE THEM FOR CONFIRMATION.  To do this,
take the following steps:

(1) Open the project page

(2) Check the project information

(3) Go to the "update" page

(4) Press the "submit" button (do this even if no update is needed --
    this step is for confirmation)

Please contact raa-admin@ruby-lang.org if you find any suspicious data
in RAA, or you have any question. Thank you for your cooperation.

### FTP

We compared md5sum values of files on FTP with the files kept in the
exterior, secure server, and there were no differences.

However, we could not check the following directories.  Consequently,
they are not currently provided.

    /pub/ruby/contrib/
    /pub/ruby/doc/
    /pub/ruby/snapshots/
    /pub/ruby/ML/
    /pub/ruby/shim/

If you need files in these directories, please contact
ftpadmin@ruby-lang.org.

### Mailing list

We investigated the configuration files of each mailing list, and found
no issues. However, member lists and mail archives have not been
thoroughly checked.

If you have any problems, please contact to &lt;ML name&gt;-admin@ruby-lang.org.

Shugo Maeda &lt;shugo@ruby-lang.org&gt;<br />
ruby-lang.org administrators' group
