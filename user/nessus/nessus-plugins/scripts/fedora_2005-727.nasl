#
# (C) Tenable Network Security
#
# This plugin text is was extracted from the Fedora Security Advisory
#


if ( ! defined_func("bn_random") ) exit(0);
if(description)
{
 script_id(19465);
 script_version ("$Revision: 1.2 $");
 script_cve_id("CVE-2005-2471");
 
 name["english"] = "Fedora Core 3 2005-727: netpbm";
 
 script_name(english:name["english"]);
 
 desc["english"] = "
The remote host is missing the patch for the advisory FEDORA-2005-727 (netpbm).

The netpbm package contains a library of functions that support
programs for handling various graphics file formats, including .pbm
(portable bitmaps), .pgm (portable graymaps), .pnm (portable anymaps),
.ppm (portable pixmaps), and others.

Update Information:

pstopnm in netpbm does not properly use the '-dSAFER' option
when calling Ghostscript to convert a PostScript file into a
(1) PBM, (2) PGM, or (3) PNM file, which allows external
user-complicit attackers to execute arbitrary commands.



Solution : http://www.fedoranews.org/blog/index.php?p=847
Risk factor : High";



 script_description(english:desc["english"]);
 
 summary["english"] = "Check for the version of the netpbm package";
 script_summary(english:summary["english"]);
 
 script_category(ACT_GATHER_INFO);
 
 script_copyright(english:"This script is Copyright (C) 2005 Tenable Network Security");
 family["english"] = "Fedora Local Security Checks";
 script_family(english:family["english"]);
 
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/RedHat/rpm-list");
 exit(0);
}

include("rpm.inc");
if ( rpm_check( reference:"netpbm-10.28-1.FC3.2", release:"FC3") )
{
 security_hole(0);
 exit(0);
}
if ( rpm_check( reference:"netpbm-devel-10.28-1.FC3.2", release:"FC3") )
{
 security_hole(0);
 exit(0);
}
if ( rpm_check( reference:"netpbm-progs-10.28-1.FC3.2", release:"FC3") )
{
 security_hole(0);
 exit(0);
}
if ( rpm_check( reference:"netpbm-debuginfo-10.28-1.FC3.2", release:"FC3") )
{
 security_hole(0);
 exit(0);
}
if ( rpm_exists(rpm:"netpbm-", release:"FC3") )
{
 set_kb_item(name:"CVE-2005-2471", value:TRUE);
}
