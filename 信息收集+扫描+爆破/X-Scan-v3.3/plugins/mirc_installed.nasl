#
#  (C) Tenable Network Security, Inc.
#

include("compat.inc");

if (description)
{
  script_id(34470);
  script_version("$Revision: 1.4 $");

  script_name(english:"mIRC Detection");
  script_summary(english:"Checks for mIRC on Windows");
 
 script_set_attribute(attribute:"synopsis", value:
"There is a chat client installed on the remote Windows host." );
 script_set_attribute(attribute:"description", value:
"mIRC, a popular Internet Relay Chat (IRC) client, is installed on the
remote host." );
 script_set_attribute(attribute:"see_also", value:"http://www.mirc.com/" );
 script_set_attribute(attribute:"solution", value:
"Make sure that use of this program is in agreement with your
organization's security policy." );
 script_set_attribute(attribute:"risk_factor", value:"None" );
script_end_attributes();

 
  script_category(ACT_GATHER_INFO);
  script_family(english:"Windows");

  script_copyright(english:"This script is Copyright (C) 2008-2009 Tenable Network Security, Inc.");

  script_dependencies("smb_hotfixes.nasl");
  script_require_keys("SMB/Registry/Enumerated");
  script_require_ports(139, 445);

  exit(0);
}


include("global_settings.inc");
include("smb_func.inc");


if (!get_kb_item("SMB/Registry/Enumerated")) exit(0);


function display_dword (dword, nox)
{
 local_var tmp;

 if (isnull(nox) || (nox == FALSE))
   tmp = "0x";
 else
   tmp = "";

 return string (tmp,
               toupper(
                  hexstr(
                    raw_string(
                               (dword >>> 24) & 0xFF,
                               (dword >>> 16) & 0xFF,
                               (dword >>> 8) & 0xFF,
                               dword & 0xFF
                              )
                        )
                      )
               );
}


# Connect to the appropriate share.
name    =  kb_smb_name();
port    =  kb_smb_transport();
if (!get_port_state(port)) exit(0);
login   =  kb_smb_login();
pass    =  kb_smb_password();
domain  =  kb_smb_domain();

soc = open_sock_tcp(port);
if (!soc) exit(0);

session_init(socket:soc, hostname:name);
rc = NetUseAdd(login:login, password:pass, domain:domain, share:"IPC$");
if (rc != 1) {
  NetUseDel();
  exit(0);
}


# Connect to remote registry.
hklm = RegConnectRegistry(hkey:HKEY_LOCAL_MACHINE);
if (isnull(hklm))
{
  NetUseDel();
  exit(0);
}


# Determine where it's installed.
path = NULL;

key = "SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\mIRC";
key_h = RegOpenKey(handle:hklm, key:key, mode:MAXIMUM_ALLOWED);
if (!isnull(key_h))
{
  item = RegQueryValue(handle:key_h, item:"InstallLocation");
  if (!isnull(item))
  {
    path = item[1];
    path = ereg_replace(pattern:"^(.+)\\$", replace:"\1", string:path);
  }

  RegCloseKey(handle:key_h);
}
RegCloseKey(handle:hklm);
if (isnull(path))
{
  NetUseDel();
  exit(0);
}


# Determine its version from the executable itself.
share = ereg_replace(pattern:"^([A-Za-z]):.*", replace:"\1$", string:path);
exe = ereg_replace(pattern:"^[A-Za-z]:(.*)", replace:"\1\mirc.exe", string:path);
NetUseDel(close:FALSE);

rc = NetUseAdd(login:login, password:pass, domain:domain, share:share);
if (rc != 1)
{
  NetUseDel();
  exit(0);
}

fh = CreateFile(
  file:exe,
  desired_access:GENERIC_READ,
  file_attributes:FILE_ATTRIBUTE_NORMAL,
  share_mode:FILE_SHARE_READ,
  create_disposition:OPEN_EXISTING
);

version = NULL;
version_ui = NULL;

if (!isnull(fh))
{
  ver = GetFileVersion(handle:fh);
  version = string(ver[0], ".", ver[1], ".", ver[2], ".", ver[3]);

  ret = GetFileVersionEx(handle:fh);
  if (!isnull(ret)) children = ret['Children'];
  if (!isnull(children))
  {
    varfileinfo = children['VarFileInfo'];
    if (!isnull(varfileinfo))
    {
      translation = 
        (get_word (blob:varfileinfo['Translation'], pos:0) << 16) +
        get_word (blob:varfileinfo['Translation'], pos:2);
      translation = tolower(display_dword(dword:translation, nox:TRUE));
    }
    stringfileinfo = children['StringFileInfo'];
    if (!isnull(stringfileinfo) && !isnull(translation))
    {
      data = stringfileinfo[translation];
      if (!isnull(data)) version_ui = data['ProductVersion'];
      else
      {
        data = stringfileinfo[toupper(translation)];
        if (!isnull(data)) version_ui = data['ProductVersion'];
      }
    }
  }

  CloseFile(handle:fh);
}
NetUseDel();


# Save and report the version number and installation path.
if (!isnull(version) && !isnull(path))
{
  kb_base = "SMB/mIRC";
  set_kb_item(name:kb_base+"/Path", value:path);
  set_kb_item(name:kb_base+"/Version", value:version);
  if (!isnull(version_ui)) 
  {
    set_kb_item(name:kb_base+"/Version_UI", value:version_ui);
    version_report = version_ui;
  }
  else version_report = version;


  if (report_verbosity)
  {
    report = string(
      "\n",
      "  Version : ", version_report, "\n",
      "  Path    : ", path, "\n"
    );
    security_note(port:port, extra:report);
  }
  else security_note(port);
}
