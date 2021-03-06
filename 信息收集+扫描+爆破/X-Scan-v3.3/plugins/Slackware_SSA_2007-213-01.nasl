# This script was automatically generated from the SSA-2007-213-01
# Slackware Security Advisory
# It is released under the Nessus Script Licence.
# Slackware Security Advisories are copyright 1999-2004 Slackware Linux, Inc.
# SSA2nasl Convertor is copyright 2004 Tenable Network Security, Inc.
# See http://www.slackware.com/about/ or http://www.slackware.com/security/
# Slackware(R) is a registered trademark of Slackware Linux, Inc.

if (! defined_func("bn_random")) exit(0);


include("compat.inc");

if (description) {
script_id(25831);
script_version("$Revision: 1.4 $");
script_category(ACT_GATHER_INFO);
script_family(english: "Slackware Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_copyright("This script is Copyright (C) 2007 Tenable Network Security, Inc.");
script_require_keys("Host/Slackware/release", "Host/Slackware/packages");
 script_set_attribute(attribute:"synopsis", value:
"The remote host is missing the SSA-2007-213-01 security update." );
 script_set_attribute(attribute:"description", value:
"New mozilla-firefox packages are available for Slackware 11.0 and 12.0
to fix security issues.

Note that Firefox 1.5.x has reached its EOL (end of life) and is no
longer being updated by mozilla.com.  Users of Firefox 1.5.x are
encouraged to upgrade to Firefox 2.x.  Since we use the official Firefox
binaries, these packages should work equally well on earlier Slackware
systems.

More details about the security issues may be found at this link:
    http://www.mozilla.org/projects/security/known-vulnerabilities.html#firefox" );
 script_set_attribute(attribute:"solution", value:
"Update the packages that are referenced in the security advisory." );
 script_set_attribute(attribute:"risk_factor", value:"High" );
script_end_attributes();


script_xref(name: "SSA", value: "2007-213-01");
script_summary("SSA-2007-213-01 firefox ");
name["english"] = "SSA-2007-213-01 firefox ";
script_name(english:name["english"]);
exit(0);
}

include('slackware.inc');
include('global_settings.inc');

desc="";
if (slackware_check(osver: "11.0", pkgname: "mozilla-firefox", pkgver: "2.0.0.6", pkgnum:  "1", pkgarch: "i686")) {
w++;
if (report_verbosity > 0) desc = strcat(desc, '
The package mozilla-firefox is vulnerable in Slackware 11.0
Upgrade to mozilla-firefox-2.0.0.6-i686-1 or newer.
');
}
if (slackware_check(osver: "12.0", pkgname: "mozilla-firefox", pkgver: "2.0.0.6", pkgnum:  "1", pkgarch: "i686")) {
w++;
if (report_verbosity > 0) desc = strcat(desc, '
The package mozilla-firefox is vulnerable in Slackware 12.0
Upgrade to mozilla-firefox-2.0.0.6-i686-1 or newer.
');
}

if (w) { security_hole(port: 0, extra: desc); }
