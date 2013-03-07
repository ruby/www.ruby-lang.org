---
layout: page
title: "Report"
lang: en
---


    -----BEGIN PGP SIGNED MESSAGE-----
    Hash: SHA1

    = Incident Analysis of the intrusion on helium.ruby-lang.org May 2004

    Thu, 22 Jul 2004

    As already reported, helium.ruby-lang.org, which is one of the servers
    that provided various services relevant to Ruby development, was cracked
    by an unauthorized user.  We, the ruby-lang.org administrators, are
    reporting our analysis of this intrusion and the countermeasures we've
    taken.

    == Time-line of the incident

    The time progression about the intrusion is shown below.  Each time is in 
    UTC.

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

    == Machines and services of the time

    Ruby-related services were offered by the following two machines at the
    time of intrusion.

    : helium.ruby-lang.org

      The following services were provided by 'helium'.
      * CVS   (cvs.ruby-lang.org)
      * HTTP  (www.ruby-lang.org/raa.ruby-lang.org)
      * FTP   (ftp.ruby-lang.org)
      * RSYNC (for mirror sites)
      * ML    (@ruby-lang.org)

    : hydrogen.ruby-lang.org (hereafter called 'hydrogen')

      The following services were provided by 'hydrogen'.
      * HTTP (www.rubyist.net)
      * NFS  (to export /home to 'helium')

    == Details of intrusion

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
    (/tmp/cvs-serv) for each session and deletes it at the end
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

    == The possibility of intrusion outside of the chroot environment

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

    == Restoration of services

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

    == Machines and services at present

    At present, Ruby-related services are offered by the following two
    machines.

    : lithium.ruby-lang.org

      The following services are provided by lithium.ruby-lang.org.
      * CVS (for committers development, no public access)
      * Mailing list (the move to 'beryllium' is planned)

    : beryllium.ruby-lang.org

      The following services are provided by beryllium.ruby-lang.org.
      * HTTP (www.ruby-lang.org/raa.ruby-lang.org/www.rubyist.net)
      * FTP (ftp.ruby-lang.org)
      * Anonymous CVS (cvs.ruby-lang.org)

    == Verification of the contents of each service

    We will hereafter explain the results of our efforts to evaluate
    whether there was any alteration or destruction of services 
    by the intruders.

    === Precondition

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

    === CVS

    Since the intruders are supposed to have gained anoncvs user
    permissions, we were most suspicious and anxious about possible damage
    to CVS among all of the services on 'helium'.

    At the time of intrusion, there was the following four CVS repositories.

    : /src
      Source code
    : /www
      Data of WWW
    : /doc
      Document
    : /admin
      The management file for CVS

    Among these, /www and /doc needed no verification, since their contents
    were already unused.  Moreover, we decided to suspend use of /admin, and
    simply dropped it.

    What we explain hereafter are the results of verification of the
    source code of Ruby and of each other module included in /src.

    === The source code of Ruby

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

    * Log of cvsup

    * Contents of the commits from 19 May to 28 May


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

    ==== Modules other than the source code of Ruby

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

    : lib/csv/lib/csv.rb,v
    : lib/csv/tests/csv_ut.rb,v
    : lib/soap4r/lib/wsdl/xmlSchema/parser.rb,v
    : lib/soap4r/lib/wsdl/xmlSchema/complexContent.rb,v
    : lib/soap4r/lib/wsdl/parser.rb,v

        We are unsure about these files. lib/csv and lib/soap4r are already
        merged with ruby, and these modules are only used by the maintainers
        of each.  lib/csv and lib/soap4r have been removed from the CVS
        repository, and will be developed elsewhere.

    : mod_ruby/lib/apache/eruby-run.rb,v
    : mod_ruby/lib/apache/erb-run.rb,v

        All revisions including branches had been checked, and no problems
        were found. They were each compared with the released source
        packages, and it has been confirmed that there are no
        inconsistencies.

    : mod_ruby/ChangeLog,v

        Usual changes of a ChangeLog file are additions of the content(s).
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

    === HTTP(www.ruby-lang.org)

    http://www.ruby-lang.org/{ja, en}/ is generated by tDiary.  We performed
    the following in order to check that there are no problems executing the
    tDiary CGI program:

      * Confirmation of the absence of suspicious code in the CGI programs
      * Verification of code in 

