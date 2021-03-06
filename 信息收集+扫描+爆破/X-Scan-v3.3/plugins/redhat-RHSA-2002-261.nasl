#
# (C) Tenable Network Security
#
#
# The text of this plugin is (C) Red Hat Inc.

include("compat.inc");
if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(12336);
 script_version ("$Revision: 1.7 $");
 script_cve_id("CVE-2002-1158", "CVE-2002-1159");

 script_name(english:"RHSA-2002-261: Canna");
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing the patch for the advisory RHSA-2002-261");
 
 script_set_attribute(attribute:"description", value:
'
  The Canna server, used for Japanese character input, has two security
  vulnerabilities including an exploitable buffer overflow that allows a
  local
  user to gain \'bin\' user privileges. Updated packages for Red Hat Linux
  Advanced Server are available.

  [Updated 13 Jan 2003]
  Added fixed packages for the Itanium (IA64) architecture.

  [Updated 06 Feb 2003]
  Added fixed packages for Advanced Workstation 2.1

  Canna is a kana-kanji conversion server which is necessary for Japanese
  language character input.

  A buffer overflow bug in the Canna server up to and including version 3.5b2
  allows a local user to gain the privileges of the user \'bin\' which can
  lead to further exploits. The Common Vulnerabilities and Exposures project
  (cve.mitre.org) has assigned the name CVE-2002-1158 to this issue.

  In addition, it was discovered that request validation was lacking in Canna
  server versions 3.6 and earlier. A malicious remote user could exploit this
  vulnerability to leak information or cause a denial of service attack.
  (CVE-2002-1159)

  Red Hat Linux Advanced Server ships with a Canna package vulnerable
  to these issues; however, the package is normally only installed when
  Japanese language support is selected during installation.

  All users of Canna are advised to upgrade to these errata packages which
  contain a backported security fix and are not vulnerable to this issue.

  Red Hat would like to thank hsj and AIDA Shinra for the responsible
  disclosure of these issues.
');
 script_set_attribute(attribute:"see_also", value: "http://rhn.redhat.com/errata/RHSA-2002-261.html");
 script_set_attribute(attribute:"solution", value: "Get the newest RedHat updates.");
 script_set_attribute(attribute:"cvss_vector", value:"CVSS2#AV:L/AC:L/Au:N/C:C/I:C/A:C");
 script_end_attributes();
 
 script_summary(english: "Check for the version of the Canna packages"); 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2004-2009 Tenable Network Security");
 script_family(english: "Red Hat Local Security Checks"); 
 script_dependencies("ssh_get_info.nasl");
 
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");
if ( rpm_check( reference:"Canna-3.5b2-50.as21.1", release:"RHEL2.1") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"Canna-devel-3.5b2-50.as21.1", release:"RHEL2.1") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
if ( rpm_check( reference:"Canna-libs-3.5b2-50.as21.1", release:"RHEL2.1") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}

exit(0, "Host is not affected");
