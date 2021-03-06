#
# (C) Tenable Network Security, Inc.
#



include("compat.inc");

if(description)
{
 script_id(17996);
 script_version("$Revision: 1.5 $");
 script_cve_id("CVE-2005-1004");
 script_bugtraq_id(13002);
 script_xref(name:"OSVDB", value:"15271");

 script_name(english:"ProfitCode PayProCart usrdetails.php sgnuptype Parameter XSS");
 
 script_set_attribute(attribute:"synopsis", value:
"The remote host has an application that is affected by a 
cross-site scripting vulnerability." );
 script_set_attribute(attribute:"description", value:
"The remote host is running PayProCart, a shopping cart 
software written in PHP. The remote version of this software
contains an input validation flaw in the file 
'usrdetails.php' which may allow an attacker to use the remote
host to perform a cross site scripting attack." );
 script_set_attribute(attribute:"solution", value:
"Upgrade to the newest version of this software." );
 script_set_attribute(attribute:"cvss_vector", value: "CVSS2#AV:N/AC:M/Au:N/C:P/I:N/A:N" );

script_end_attributes();

 script_summary(english:"Checks PayProCart");
 script_category(ACT_GATHER_INFO);
 script_copyright(english:"This script is Copyright (C) 2005-2009 Tenable Network Security, Inc.");
 script_family(english:"CGI abuses : XSS");
 script_dependencie("http_version.nasl");
 script_require_ports("Services/www", 80);
 script_exclude_keys("Settings/disable_cgi_scanning");
 exit(0);
}

# Check starts here

include("global_settings.inc");
include("misc_func.inc");
include("http.inc");

port = get_http_port(default:80);

if ( ! can_host_php(port:port) ) exit(1, "The remote Web Server does not support PHP.");

foreach dir (make_list( cgi_dirs()))
{
 res = http_send_recv3(port:port, method:"GET", item:dir + "/usrdetails.php?sgnuptype=csaleID<script>nessus</script>");
 if (isnull(res)) exit(1,"Null response to usrdetails.php request.");

 if('<input type="hidden" name="sgnuptype" value="csaleID<script>nessus</script>' >< res[2] )
  {
   security_warning(port);
   set_kb_item(name: 'www/'+port+'/XSS', value: TRUE);
   exit(0);
  }
}
