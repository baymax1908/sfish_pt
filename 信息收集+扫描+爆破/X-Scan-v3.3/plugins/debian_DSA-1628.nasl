# This script was automatically generated from the dsa-1628
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(33933);
 script_version("$Revision: 1.3 $");
 script_xref(name: "DSA", value: "1628");
 script_cve_id("CVE-2008-3337");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1628 security update');
 script_set_attribute(attribute: 'description', value:
'Brian Dowling discovered that the PowerDNS authoritative name server
does not respond to DNS queries which contain certain characters,
increasing the risk of successful DNS spoofing (CVE-2008-3337).  This
update changes PowerDNS to respond with SERVFAIL responses instead.
For the stable distribution (etch), this problem has been fixed in version 
2.9.20-8+etch1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2008/dsa-1628');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your pdns package.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:N/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1628] DSA-1628-1 pdns");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1628-1 pdns");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'pdns', release: '4.0', reference: '2.9.20-8+etch1');
deb_check(prefix: 'pdns-backend-geo', release: '4.0', reference: '2.9.20-8+etch1');
deb_check(prefix: 'pdns-backend-ldap', release: '4.0', reference: '2.9.20-8+etch1');
deb_check(prefix: 'pdns-backend-mysql', release: '4.0', reference: '2.9.20-8+etch1');
deb_check(prefix: 'pdns-backend-pgsql', release: '4.0', reference: '2.9.20-8+etch1');
deb_check(prefix: 'pdns-backend-pipe', release: '4.0', reference: '2.9.20-8+etch1');
deb_check(prefix: 'pdns-backend-sqlite', release: '4.0', reference: '2.9.20-8+etch1');
deb_check(prefix: 'pdns-doc', release: '4.0', reference: '2.9.20-8+etch1');
deb_check(prefix: 'pdns-server', release: '4.0', reference: '2.9.20-8+etch1');
if (deb_report_get()) security_warning(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
