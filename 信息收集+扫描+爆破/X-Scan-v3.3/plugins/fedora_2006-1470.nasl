
#
# (C) Tenable Network Security, Inc.
#
# This plugin text was extracted from Fedora Security Advisory 2006-1470
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(24076);
 script_version ("$Revision: 1.4 $");
script_name(english: "Fedora 5 2006-1470: kernel");
 script_set_attribute(attribute: "synopsis", value: 
"The remote host is missing the patch for the advisory FEDORA-2006-1470 (kernel)");
 script_set_attribute(attribute: "description", value: "The kernel package contains the Linux kernel (vmlinuz), the core of any
Linux operating system.  The kernel handles the basic functions
of the operating system:  memory allocation, process allocation, device
input and output, etc.

Update Information:

This update rebases to 2.6.18.6rc2, which fixes the
following security bugs:

bridge: fix possible overflow in get_fdb_entries (CVE-2006-5751)

Bluetooth: Add packet size checks for CAPI messages
(CVE-2006-6106)

In addition, a number of non-security related bugs have been
fixed. Complete changelogs are available at

[8]http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.18.4
[9]http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.18.5
[10]http://www.kernel.org/pub/linux/kernel/v2.6/ChangeLog-2.6.18.6

Additional Fedora specific changes detailed below.
");
 script_set_attribute(attribute: "cvss_vector", value: "CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P");
script_set_attribute(attribute: "solution", value: "Get the newest Fedora Updates");
script_end_attributes();

 script_cve_id("CVE-2006-5751", "CVE-2006-5757", "CVE-2006-6106");
script_summary(english: "Check for the version of the kernel package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security, Inc.");
 script_family(english: "Fedora Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( rpm_check( reference:"kernel-2.6.18-1.2257.fc5", prefix:"kernel-", release:"FC5") )
{
 security_hole(port:0, extra:rpm_report_get());
 exit(0);
}
exit(0, "Host is not affected");
