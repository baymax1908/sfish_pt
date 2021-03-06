# This script was automatically generated from the 855-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(42408);
script_version("$Revision: 1.1 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "855-1");
script_summary(english:"libhtml-parser-perl vulnerability");
script_name(english:"USN855-1 : libhtml-parser-perl vulnerability");
script_set_attribute(attribute:'synopsis', value: 'The remote package "libhtml-parser-perl" is missing a security patch.');
script_set_attribute(attribute:'description', value: 'Mark Martinec discovered that HTML::Parser incorrectly handled strings
with incomplete entities. An attacker could send specially crafted input to
applications that use HTML::Parser and cause a denial of service.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- libhtml-parser-perl-3.61-1ubuntu0.1 (Ubuntu 9.10)
');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:N/I:N/A:P');
script_end_attributes();

script_cve_id("CVE-2009-3627");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "9.10", pkgname: "libhtml-parser-perl", pkgver: "3.61-1ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libhtml-parser-perl-',found,' is vulnerable in Ubuntu 9.10
Upgrade it to libhtml-parser-perl-3.61-1ubuntu0.1
');
}

if (w) { security_warning(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
