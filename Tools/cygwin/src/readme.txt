    Welcome to Cygwin-Lite! 
    Copyright (C) 2001 Joshua Daniel Franklin

    This is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

The files in this directory are the ``source'' for Cygwin-Lite,
which is a packaged miniature version of the full cygwin environment
available, with full source, from http://www.cygwin.com

The following is a short description of each file:
bash.nsi	Install script for the Nullsoft NSIS Installer,
		Free software from http://www.nullsoft.com/free
		If you want to rebuild Cygwin-Lite, install the full 
		Cygwin-Lite package, copy makensis.exe 
		from the NSIS Installer to / , then execute:
		  	./makensis.exe src/bash.nsi
bash95/NT.pif	See setup.*
bashrc		Configuration file copied by setup.sh to /etc/bashrc, which is
		loaded each time bash.bat runs (rc == run commands).
		/etc/bashrc is very important to Cygwin-Lite since it reduces
 		the number of files needed (alias gunzip='gzip -d'). 
		I chose to use /etc/bashrc since it is less common than 
		/etc/profile and therefore less likely to already exist in a 
		Cygwin installation; note ~/.bashrc can still be used
buildleft.plx	A perl script to build the HTML left frame for the User's Guide
		this is the only perl script since perl could not be included
		(let me know if you get perl on a floppy! or gcc...)
convert.sh	Converts all man pages in current directory to HTML 
		(read its documentation for more details); you'll need 
		man2html.exe from the cygwin man package or a real GNU system :)
cygwin.ico	Icon used by bash.nsi for the self-executable
cygwin-mounts.nsi
		Install script to change the Cygwin mounts in the Windows 
		registry; MIGHT make a Cygwin installation work
		after installing Cygwin-Lite (see bash.nsi for compiling)
dirlisting	Formatted package/file list for buildleft.plx (format is simple)
disabled.bmp	Bitmap for the installer (read bash.nsi)
enabled.bmp	Another bitmap for the installer
gpl.txt		The full text of the GNU General Public Licence
notice.txt	Copyright notice
nsislister.sh	Shell script; lists files in nsi format (read it for more info)
readme.txt	This file
setup.*		Three files used in Cygwin-Lite's configuration; they produce
		bash.bat (using bash.nsi) and bash.pif using bash95.pif 
		(for win95/98/me) or bashNT.pif (for winNT/2k)
