#!/bin/bash
# usage: ./nsislister.sh > listfile
# lists files in the current directory tree (recusively) in the format
# required by the NSIS Installer (www.nullsoft.com/free); include listfile
# directly after the "SetOutPath $INSTDIR" line in your .nsi file
#
#    Copyright (C) 2001 Joshua Daniel Franklin
#
#    This is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#

nsisLister() 
{
for i in * ; do
	if [ -f $i ]; then		#only grab files first; skip dirs
	echo "File $LISTPATH\\$i"
	fi
done
for i in * ; do
	if [ -d $i ]; then
		LISTPATH=$LISTPATH\\$i	
		echo "SetOutPath \$INSTDIR\\$LISTPATH"
		cd $i
		nsisLister $()
		cd ..
	fi	
done
}

#remove comment if you want to grap config files (.bashrc, etc)
#shopt -s dotglob		

#do root dir first to get right format 
LISTPATH=""
for i in * ; do
	if [ -f $i ]; then		
	echo "File $i"
	fi
done
for i in * ; do
	if [ -d $i ]; then
		LISTPATH=$i	
		echo "SetOutPath \$INSTDIR\\$LISTPATH"
		cd $i
		nsisLister $()
		cd ..
	fi	
done
unset LISTPATH	
