#!/bin/perl
# This script produces a HTML sidebar for indexing HTML manpages
# It assumes the following input file format:
#	one entry per line
#	headings begin with [a-z] as the first letter of a line
#	indexed entries are x.exe and come after a space or tab
# Example:
# ^ash
# ^	sh.exe
# ^bash 
# ^	bash.exe
#
#    Copyright (C) 2001 Joshua Daniel Franklin
#
#    This is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#

$infile="dirlisting";

# make a nice header
print("<HTML>\n<HEAD>\n\t<TITLE>Cygwin-Lite Sidebar</TITLE>\n</HEAD>\n\n");
print("<BODY aLink=red bgColor=white link=#0000EE text=black vLink=#551A8B>\n");
print("<TABLE align=left border=1 cellPadding=8 cellSpacing=0>\n");
print("<TBODY><TR><TD bgColor=#EEEEEE vAlign=top>\n");
print("\t<TABLE border=0 cellPadding=3 cellSpacing=0 width=\"100\%\">\n");
print("\t<TBODY>\n");
print("\n\t<!-- index section \n");
print("\t<TR><TD colSpan=2>\n");
print("\t\t<A HREF=\"index.html\" target=\"right\">Index</A>\n\t</TD></TR>\n");

# convert from the input file to nice HTML
open(IN,$infile);
while (<IN>)
  {
  if (/^[a-z]/)
    {
    chomp $_;
    print("\n\t<!-- ",$_ ," section \n");
    print("\t<TR><TD colSpan=2>",$_,"</TD></TR>\n");
    }
  else
    { 
    chomp $_;
    s/[\t| ]*//;  #remove leading whitespace
    s/\.exe//;    # pesky extensions
    s/vim/vi/;    # and a messy little fix
    print("\t<TR><TD><TT>&nbsp;</TT></TD><TD><SMALL>\n");
    print("\t\t<A HREF=\"",$_,".html\" target=\"right\">",$_,"</A>\n");
    print("\t<\/SMALL><\/TD><\/TR>\n");
    }
  }

# finish off the HTML doc  
print("\n\t</TBODY></TABLE>\n");
print("</TD></TR></TBODY>\n");
print("</TABLE></BODY>\n</HTML>\n");
