
#
# (C) Tenable Network Security
#
# The text description of this plugin is (C) Novell, Inc.
#

include("compat.inc");

if ( ! defined_func("bn_random") ) exit(0);

if(description)
{
 script_id(41580);
 script_version ("$Revision: 1.1 $");
 script_name(english: "SuSE Security Update:  Security update for postgresql-pl (postgresql-pl-6208)");
 script_set_attribute(attribute: "synopsis", value: 
"The remote SuSE system is missing the security patch postgresql-pl-6208");
 script_set_attribute(attribute: "description", value: "Due to tight package dependencies postgresql-pl has to be
updated to match the recently released postgresql packages.
");
 script_set_attribute(attribute: "risk_factor", value: "High");
script_set_attribute(attribute: "solution", value: "Install the security patch postgresql-pl-6208");
script_end_attributes();

script_summary(english: "Check for the postgresql-pl-6208 package");
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2009 Tenable Network Security");
 script_family(english: "SuSE Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/SuSE/rpm-list");
 exit(0);
}

include("rpm.inc");

if ( ! get_kb_item("Host/SuSE/rpm-list") ) exit(1, "Could not gather the list of packages");

if ( rpm_check( reference:"postgresql-pl-8.1.17-0.4", release:"SLES10") )
{
	security_hole(port:0, extra:rpm_report_get());
	exit(0);
}
# END OF TEST
exit(0,"Host is not affected");
