# This script was automatically generated from the 6-1 Ubuntu Security Notice
# It is released under the Nessus Script Licence.
# Ubuntu Security Notices are (C) 2005 Canonical, Inc.
# USN2nasl Convertor is (C) 2005 Tenable Network Security, Inc.
# See http://www.ubuntulinux.org/usn/
# Ubuntu(R) is a registered trademark of Canonical, Inc.

if (! defined_func("bn_random")) exit(0);
include('compat.inc');

if (description) {
script_id(20678);
script_version("$Revision: 1.5 $");
script_copyright("Ubuntu Security Notice (C) 2009 Canonical, Inc. / NASL script (C) 2009 Tenable Network Security, Inc.");
script_category(ACT_GATHER_INFO);
script_family(english: "Ubuntu Local Security Checks");
script_dependencies("ssh_get_info.nasl");
script_require_keys("Host/Ubuntu", "Host/Ubuntu/release", "Host/Debian/dpkg-l");

script_xref(name: "USN", value: "6-1");
script_summary(english:"postgresql contributed script vulnerability");
script_name(english:"USN6-1 : postgresql contributed script vulnerability");
script_set_attribute(attribute:'synopsis', value: 'These remote packages are missing security patches :
- libecpg-dev 
- libecpg4 
- libpgtcl 
- libpgtcl-dev 
- libpq3 
- postgresql 
- postgresql-client 
- postgresql-contrib 
- postgresql-dev 
- postgresql-doc 
');
script_set_attribute(attribute:'description', value: 'Recently, Trustix Secure Linux discovered a vulnerability in the
postgresql-contrib package. The script "make_oidjoins_check" created
temporary files in an insecure way, which allowed a symlink attack to
create or overwrite arbitrary files with the privileges of the user
invoking the script.');
script_set_attribute(attribute:'solution', value: 'Upgrade to : 
- libecpg-dev-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- libecpg4-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- libpgtcl-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- libpgtcl-dev-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- libpq3-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- postgresql-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- postgresql-client-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- postgresql-contrib-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- postgresql-dev-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
- postgresql-doc-7.4.5-3ubuntu0.1 (Ubuntu 4.10)
');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:N/I:P/A:N');
script_end_attributes();

script_cve_id("CVE-2004-0977");
exit(0);
}

include('ubuntu.inc');

if ( ! get_kb_item('Host/Ubuntu/release') ) exit(1, 'Could not gather the list of packages');

extrarep = NULL;

found = ubuntu_check(osver: "4.10", pkgname: "libecpg-dev", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libecpg-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libecpg-dev-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libecpg4", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libecpg4-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libecpg4-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libpgtcl", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpgtcl-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libpgtcl-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libpgtcl-dev", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpgtcl-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libpgtcl-dev-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "libpq3", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package libpq3-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to libpq3-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postgresql", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postgresql-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postgresql-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postgresql-client", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postgresql-client-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postgresql-client-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postgresql-contrib", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postgresql-contrib-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postgresql-contrib-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postgresql-dev", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postgresql-dev-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postgresql-dev-7.4.5-3ubuntu0.1
');
}
found = ubuntu_check(osver: "4.10", pkgname: "postgresql-doc", pkgver: "7.4.5-3ubuntu0.1");
if (! isnull(found)) {
w++;
extrarep = strcat(extrarep, '
The package postgresql-doc-',found,' is vulnerable in Ubuntu 4.10
Upgrade it to postgresql-doc-7.4.5-3ubuntu0.1
');
}

if (w) { security_note(port: 0, extra: extrarep); }
else exit(0, "Host is not vulnerable");
